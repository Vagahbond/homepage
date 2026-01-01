<script lang="ts">
	import { convertLexicalToHTML } from '@payloadcms/richtext-lexical/html';

	const { value } = $props();

	const html = $derived(convertLexicalToHTML({ data: value }));
</script>

<!-- eslint-disable-next-line svelte/no-at-html-tags -->
{@html html}
