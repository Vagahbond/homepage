<script lang="ts">
	import { onMount, untrack } from 'svelte';
	import RichText from '$lib/components/richText.svelte';
	import {
		layoutFlow,
		lexicalToBlocks,
		loadAlphaMask,
		maskIntervalForBand,
		prepareBlocks,
		type AlphaMask,
		type FlowDecoration,
		type FlowSpan,
		type PreparedBlock
	} from '$lib/utils/textFlow';

	const { value, src = '/snail.png' } = $props();

	const LINE_HEIGHT_RATIO = 1.5;
	const FOLLOW_SPEED = 5;

	let container: HTMLDivElement;
	let ready = $state(false);
	let spans = $state.raw<FlowSpan[]>([]);
	let decorations = $state.raw<FlowDecoration[]>([]);
	let flowHeight = $state(0);
	let fontSize = $state(16);
	let snail = $state.raw({ x: 0, y: 0, width: 0, height: 0, flipped: false, tilt: 0 });
	let applyValue: ((next: typeof value) => void) | null = null;

	$effect(() => {
		const next = value;
		untrack(() => applyValue?.(next));
	});

	onMount(() => {
		let disposed = false;
		let frame = 0;
		let lastTime = 0;
		let mask: AlphaMask | null = null;
		let prepared: PreparedBlock[] = [];
		let preparedKey = '';
		let width = 0;
		let height = 0;
		let pointer: { x: number; y: number } | null = null;
		const position = { x: 0, y: 0 };
		const target = { x: 0, y: 0 };
		let blocks = lexicalToBlocks(value);
		const reducedMotion = window.matchMedia('(prefers-reduced-motion: reduce)');

		const measureFont = () => {
			const style = getComputedStyle(container);
			const specified = parseFloat(style.fontSize);
			const probe = document.createElement('span');
			probe.textContent = 'x'.repeat(100);
			probe.style.cssText =
				'position:absolute;visibility:hidden;white-space:pre;backdrop-filter:none';
			probe.style.fontFamily = style.fontFamily;
			probe.style.fontSize = style.fontSize;
			probe.style.fontSizeAdjust = style.fontSizeAdjust;
			document.body.appendChild(probe);
			const rendered = probe.getBoundingClientRect().width;
			probe.remove();
			const context = document.createElement('canvas').getContext('2d');
			if (context === null) return { size: specified, family: style.fontFamily };
			context.font = `${specified}px ${style.fontFamily}`;
			const measured = context.measureText(probe.textContent).width;
			const size = measured > 0 ? specified * (rendered / measured) : specified;
			return { size: Math.round(size * 100) / 100, family: style.fontFamily };
		};

		const relayout = () => {
			if (!mask) return;
			const rect = { x: position.x, y: position.y, width: snail.width, height: snail.height };
			const padding = fontSize * 0.75;
			const result = layoutFlow(
				prepared,
				width,
				(top, bottom) => maskIntervalForBand(mask!, rect, snail.flipped, top, bottom, padding),
				fontSize * 4
			);
			spans = result.spans;
			decorations = result.decorations;
			flowHeight = result.height;
		};

		const measure = () => {
			if (!mask) return;
			width = container.clientWidth;
			height = container.clientHeight;
			const font = measureFont();
			const key = `${font.size}|${font.family}`;
			if (key !== preparedKey) {
				preparedKey = key;
				fontSize = font.size;
				prepared = prepareBlocks(blocks, font.size, font.family, LINE_HEIGHT_RATIO);
			}
			const snailWidth = Math.min(240, Math.max(110, width * 0.1));
			snail = { ...snail, width: snailWidth, height: snailWidth / mask.aspect };
		};

		const updateTarget = () => {
			if (!pointer) return;
			const rect = container.getBoundingClientRect();
			target.x = Math.min(
				Math.max(pointer.x - rect.left - snail.width / 2, -snail.width / 2),
				width - snail.width / 2
			);
			target.y = Math.max(pointer.y - rect.top - snail.height / 2, -snail.height / 2);
			schedule();
		};

		const tick = (now: number) => {
			frame = 0;
			const dt = lastTime ? Math.min(0.05, (now - lastTime) / 1000) : 1 / 60;
			lastTime = now;
			const ease = reducedMotion.matches ? 1 : 1 - Math.exp(-dt * FOLLOW_SPEED);
			const deltaX = (target.x - position.x) * ease;
			const deltaY = (target.y - position.y) * ease;

			const newX = position.x + deltaX;
			if (newX > 0 && width - newX > snail.width) position.x += deltaX;
			else if (newX > width) position.x = width - snail.width;

			const newY = position.y + deltaY;
			if (newY > 0 && height - newY > snail.height) position.y += deltaY;
			else if (newY > height) position.y = height - snail.height;

			const velocity = deltaX / dt;
			let flipped = snail.flipped;
			if (velocity > 60) flipped = true;
			else if (velocity < -60) flipped = false;
			const tilt = Math.max(-22, Math.min(22, (deltaY / dt) * 0.03));
			snail = { ...snail, x: position.x, y: position.y, flipped, tilt: flipped ? tilt : -tilt };
			relayout();

			if (Math.hypot(target.x - position.x, target.y - position.y) > 0.3) {
				frame = requestAnimationFrame(tick);
			} else {
				lastTime = 0;
				snail = { ...snail, tilt: 0 };
			}
		};

		const schedule = () => {
			if (frame === 0 && ready) frame = requestAnimationFrame(tick);
		};

		const onPointer = (event: PointerEvent) => {
			pointer = { x: event.clientX, y: event.clientY };
			updateTarget();
		};

		applyValue = (next) => {
			blocks = lexicalToBlocks(next);
			preparedKey = '';
			measure();
			relayout();
		};

		const resizeObserver = new ResizeObserver(() => {
			measure();
			relayout();
			updateTarget();
		});

		(async () => {
			await document.fonts.ready;
			mask = await loadAlphaMask(src);
			if (disposed) return;
			measure();
			position.x = target.x = Math.max(0, width - snail.width - fontSize * 2);
			position.y = target.y = fontSize;
			snail = { ...snail, x: position.x, y: position.y };
			relayout();
			ready = true;
			resizeObserver.observe(container);
		})();

		const scroller = container.closest('.rich-text') ?? window;
		window.addEventListener('pointermove', onPointer);
		window.addEventListener('pointerdown', onPointer);
		scroller.addEventListener('scroll', updateTarget, { passive: true });

		return () => {
			disposed = true;
			applyValue = null;
			cancelAnimationFrame(frame);
			resizeObserver.disconnect();
			window.removeEventListener('pointermove', onPointer);
			window.removeEventListener('pointerdown', onPointer);
			scroller.removeEventListener('scroll', updateTarget);
		};
	});
</script>

<div class="snail-text" bind:this={container}>
	<div class="source" class:visually-hidden={ready}>
		<RichText {value} />
	</div>

	{#if ready}
		<div class="flow" aria-hidden="true" style:height="{flowHeight}px">
			{#each decorations as decoration, index (index)}
				<div
					class="quote-bar"
					style:transform="translate({decoration.x}px, {decoration.y}px)"
					style:height="{decoration.height}px"
				></div>
			{/each}

			{#each spans as span, index (index)}
				<svelte:element
					this={span.style.href ? 'a' : 'div'}
					href={span.style.href}
					tabindex={span.style.href ? -1 : undefined}
					class="fragment {span.kind}"
					class:bold={span.style.bold}
					class:italic={span.style.italic}
					class:underline={span.style.underline || span.style.href}
					class:strike={span.style.strike}
					class:code={span.style.code}
					class:marker={span.style.marker}
					style:font-size="{span.fontSize}px"
					style:line-height="{span.lineHeight}px"
					style:transform="translate({span.x}px, {span.y}px)">{span.text}</svelte:element
				>
			{/each}

			<img
				class="snail"
				alt=""
				{src}
				width={snail.width}
				height={snail.height}
				style:transform="translate({snail.x}px, {snail.y}px) rotate({snail.tilt}deg) scaleX({snail.flipped
					? -1
					: 1})"
			/>
		</div>
	{/if}
</div>

<style>
	.snail-text {
		position: relative;
		width: 100%;
		margin: 1em 0 2em;
		overflow: show;
		cursor: none;
	}

	.visually-hidden {
		position: absolute;
		width: 1px;
		height: 1px;
		overflow: hidden;
		clip-path: inset(50%);
		white-space: nowrap;
	}

	.flow {
		position: relative;
		width: 100%;
		overflow: show;
		cursor: none;
	}

	.fragment {
		position: absolute;
		top: 0;
		left: 0;
		margin: 0;
		white-space: pre;
		font-size-adjust: none;
		will-change: transform;
		cursor: none;
	}

	.heading {
		color: var(--accent);
	}

	.bold {
		font-weight: bold;
	}

	.italic {
		font-style: italic;
	}

	.underline {
		text-decoration: underline;
	}

	.strike {
		text-decoration: line-through;
	}

	.code,
	.marker,
	a.fragment {
		color: var(--accent);
	}

	.quote-bar {
		position: absolute;
		top: 0;
		left: 0;
		width: 3px;
		border-radius: 2px;
		background: var(--accent);
	}

	.snail {
		position: absolute;
		top: 0;
		left: 0;
		pointer-events: none;
		user-select: none;
		will-change: transform;
		filter: drop-shadow(0 0 12px rgba(0, 0, 0, 0.35));
	}
</style>
