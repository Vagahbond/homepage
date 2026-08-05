import {
	layoutNextRichInlineLineRange,
	materializeRichInlineLineRange,
	prepareRichInline,
	type PreparedRichInline,
	type RichInlineCursor
} from '@chenglou/pretext/rich-inline';

export type InlineStyle = {
	bold: boolean;
	italic: boolean;
	underline: boolean;
	strike: boolean;
	code: boolean;
	marker: boolean;
	href?: string;
};

export type FlowItem = { text: string; style: InlineStyle };

export type FlowBlockKind = 'paragraph' | 'heading' | 'quote' | 'listitem';

export type FlowBlock = {
	kind: FlowBlockKind;
	level: number;
	gapBefore: number;
	items: FlowItem[];
};

export type Interval = { left: number; right: number };

export type Rect = { x: number; y: number; width: number; height: number };

export type FlowSpan = {
	text: string;
	x: number;
	y: number;
	fontSize: number;
	lineHeight: number;
	kind: FlowBlockKind;
	style: InlineStyle;
};

export type FlowDecoration = { x: number; y: number; height: number };

export type FlowLayout = { spans: FlowSpan[]; decorations: FlowDecoration[]; height: number };

export type PreparedBlock = {
	block: FlowBlock;
	prepared: PreparedRichInline;
	fontSize: number;
	lineHeight: number;
	indent: number;
	gapBefore: number;
};

export type AlphaMask = { rows: Array<Interval | null>; aspect: number };

type LexicalNode = {
	type: string;
	text?: string;
	format?: number | string;
	tag?: string;
	listType?: string;
	value?: number;
	checked?: boolean;
	url?: string;
	fields?: { url?: string };
	children?: LexicalNode[];
};

const TEXT_FORMAT = { bold: 1, italic: 2, strike: 4, underline: 8, code: 16 };

const HEADING_SCALE: Record<number, number> = { 1: 2, 2: 1.5, 3: 1.17, 4: 1, 5: 0.83, 6: 0.67 };

const plainStyle: InlineStyle = {
	bold: false,
	italic: false,
	underline: false,
	strike: false,
	code: false,
	marker: false
};

export function lexicalToBlocks(value: { root?: LexicalNode } | null | undefined): FlowBlock[] {
	const blocks: FlowBlock[] = [];

	const pushInline = (
		node: LexicalNode,
		kind: FlowBlockKind,
		level: number,
		gapBefore: number,
		leading: FlowItem[] = []
	) => {
		let items: FlowItem[] = [...leading];
		let gap = gapBefore;
		const flush = () => {
			if (items.some((item) => !item.style.marker && item.text.trim().length > 0)) {
				blocks.push({ kind, level, gapBefore: gap, items });
			}
			items = [];
			gap = 0;
		};

		const walk = (children: LexicalNode[] | undefined, style: InlineStyle) => {
			for (const child of children ?? []) {
				if (child.type === 'text' && child.text) {
					const format = typeof child.format === 'number' ? child.format : 0;
					items.push({
						text: child.text,
						style: {
							...style,
							bold: style.bold || (format & TEXT_FORMAT.bold) !== 0,
							italic: style.italic || (format & TEXT_FORMAT.italic) !== 0,
							strike: style.strike || (format & TEXT_FORMAT.strike) !== 0,
							underline: style.underline || (format & TEXT_FORMAT.underline) !== 0,
							code: style.code || (format & TEXT_FORMAT.code) !== 0
						}
					});
				} else if (child.type === 'linebreak') {
					flush();
				} else if (child.type === 'tab') {
					items.push({ text: '    ', style });
				} else if (child.type === 'link' || child.type === 'autolink') {
					const href = child.fields?.url ?? child.url;
					walk(child.children, { ...style, href: href || undefined });
				} else if (child.children) {
					walk(child.children, style);
				}
			}
		};

		walk(node.children, { ...plainStyle, bold: kind === 'heading', italic: kind === 'quote' });
		flush();
	};

	const visitList = (list: LexicalNode, depth: number) => {
		const ordered = list.listType === 'number' || list.tag === 'ol';
		const checklist = list.listType === 'check';
		(list.children ?? []).forEach((item, index) => {
			const inline = (item.children ?? []).filter((child) => child.type !== 'list');
			const nested = (item.children ?? []).filter((child) => child.type === 'list');
			if (inline.length > 0) {
				const marker = checklist
					? item.checked
						? '[x] '
						: '[ ] '
					: ordered
						? `${item.value ?? index + 1}. `
						: '• ';
				pushInline(
					{ ...item, children: inline },
					'listitem',
					depth,
					index === 0 && depth === 0 ? 1 : 0,
					[{ text: marker, style: { ...plainStyle, marker: true } }]
				);
			}
			nested.forEach((child) => visitList(child, depth + 1));
		});
	};

	for (const node of value?.root?.children ?? []) {
		switch (node.type) {
			case 'heading':
				pushInline(node, 'heading', Number(node.tag?.slice(1)) || 2, 1);
				break;
			case 'quote':
				pushInline(node, 'quote', 0, 1);
				break;
			case 'list':
				visitList(node, 0);
				break;
			default:
				pushInline(node, 'paragraph', 0, 1);
		}
	}

	return blocks;
}

export function fontFor(style: InlineStyle, fontSize: number, fontFamily: string): string {
	return `${style.italic ? 'italic ' : ''}${style.bold ? 'bold ' : ''}${fontSize}px ${fontFamily}`;
}

export function prepareBlocks(
	blocks: FlowBlock[],
	baseFontSize: number,
	fontFamily: string,
	lineHeightRatio: number
): PreparedBlock[] {
	return blocks.map((block) => {
		const scale = block.kind === 'heading' ? (HEADING_SCALE[block.level] ?? 1) : 1;
		const fontSize = Math.round(baseFontSize * scale * 100) / 100;
		const indent =
			block.kind === 'quote'
				? baseFontSize * 2
				: block.kind === 'listitem'
					? baseFontSize * 1.5 * (block.level + 1)
					: 0;
		return {
			block,
			fontSize,
			lineHeight: Math.round(fontSize * lineHeightRatio),
			indent,
			gapBefore: block.gapBefore * baseFontSize,
			prepared: prepareRichInline(
				block.items.map((item) => ({
					text: item.text,
					font: fontFor(item.style, fontSize, fontFamily),
					break: item.style.marker ? 'never' : 'normal'
				}))
			)
		};
	});
}

function carveSlots(base: Interval, blocked: Interval | null, minWidth: number): Interval[] {
	if (blocked === null || blocked.right <= base.left || blocked.left >= base.right) {
		return [base];
	}
	const slots: Interval[] = [];
	if (blocked.left > base.left) slots.push({ left: base.left, right: blocked.left });
	if (blocked.right < base.right) slots.push({ left: blocked.right, right: base.right });
	return slots.filter((slot) => slot.right - slot.left >= minWidth);
}

export function layoutFlow(
	blocks: PreparedBlock[],
	width: number,
	obstacle: (top: number, bottom: number) => Interval | null,
	minSlotWidth: number
): FlowLayout {
	const spans: FlowSpan[] = [];
	const decorations: FlowDecoration[] = [];
	let y = 0;

	blocks.forEach((entry, blockIndex) => {
		if (blockIndex > 0) y += entry.gapBefore;
		const base = { left: entry.indent, right: Math.max(entry.indent + 1, width) };
		const canAvoid = base.right - base.left >= minSlotWidth;
		const startY = y;
		let cursor: RichInlineCursor | undefined = undefined;
		let finished = false;

		for (let row = 0; !finished && row < 5000; row++) {
			const blocked = canAvoid ? obstacle(y, y + entry.lineHeight) : null;
			const slots = carveSlots(base, blocked, minSlotWidth);
			let placed = false;

			for (const slot of slots) {
				const range = layoutNextRichInlineLineRange(entry.prepared, slot.right - slot.left, cursor);
				if (range === null) {
					finished = true;
					break;
				}
				const line = materializeRichInlineLineRange(entry.prepared, range);
				let x = slot.left;
				for (const fragment of line.fragments) {
					x += fragment.gapBefore;
					spans.push({
						text: fragment.text,
						x,
						y,
						fontSize: entry.fontSize,
						lineHeight: entry.lineHeight,
						kind: entry.block.kind,
						style: entry.block.items[fragment.itemIndex].style
					});
					x += fragment.occupiedWidth;
				}
				cursor = range.end;
				placed = true;
			}

			if (!finished || placed) y += entry.lineHeight;
		}

		if (entry.block.kind === 'quote') {
			decorations.push({ x: entry.indent / 2, y: startY, height: y - startY });
		}
	});

	return { spans, decorations, height: y };
}

export async function loadAlphaMask(src: string, threshold = 16): Promise<AlphaMask> {
	const image = new Image();
	image.src = src;
	await image.decode();

	const width = image.naturalWidth;
	const height = image.naturalHeight;
	const canvas = document.createElement('canvas');
	canvas.width = width;
	canvas.height = height;
	const context = canvas.getContext('2d', { willReadFrequently: true });
	if (context === null) throw new Error('2d context unavailable');
	context.drawImage(image, 0, 0);
	const { data } = context.getImageData(0, 0, width, height);

	const rows: Array<Interval | null> = [];
	for (let row = 0; row < height; row++) {
		let left = -1;
		let right = -1;
		for (let column = 0; column < width; column++) {
			if (data[(row * width + column) * 4 + 3] < threshold) continue;
			if (left === -1) left = column;
			right = column + 1;
		}
		rows.push(left === -1 ? null : { left: left / width, right: right / width });
	}

	return { rows, aspect: width / height };
}

export function maskIntervalForBand(
	mask: AlphaMask,
	rect: Rect,
	flipped: boolean,
	top: number,
	bottom: number,
	padding: number
): Interval | null {
	const rowCount = mask.rows.length;
	const first = Math.max(0, Math.floor(((top - padding - rect.y) / rect.height) * rowCount));
	const last = Math.min(
		rowCount - 1,
		Math.ceil(((bottom + padding - rect.y) / rect.height) * rowCount)
	);
	let left = Infinity;
	let right = -Infinity;

	for (let row = first; row <= last; row++) {
		const interval = mask.rows[row];
		if (!interval) continue;
		const rowLeft = flipped ? 1 - interval.right : interval.left;
		const rowRight = flipped ? 1 - interval.left : interval.right;
		if (rowLeft < left) left = rowLeft;
		if (rowRight > right) right = rowRight;
	}

	if (!Number.isFinite(left)) return null;
	return {
		left: rect.x + left * rect.width - padding,
		right: rect.x + right * rect.width + padding
	};
}
