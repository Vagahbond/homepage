<script lang="ts">
	import { resolve } from '$app/paths';
	import { page } from '$app/state';
	import type { RoutesWithLang } from '$lib/utils/nav';

	const route = $derived(page.route.id as RoutesWithLang);
</script>

<div class="lang-selector">
	<!-- eslint-disable-next-line @typescript-eslint/ban-ts-comment -->
	<!-- @ts-ignore -->
	<a
		class={`blurred-bg ${page.params.lang === 'fr' && 'selected'}`}
		href={resolve(route, { lang: 'fr' })}
	>
		<span> 🇫🇷 </span>
	</a>
	<a
		class={`blurred-bg ${page.params.lang === 'en' && 'selected'}`}
		href={resolve(route, { lang: 'en' })}>🇺🇸</a
	>
</div>

<style>
	.lang-selector {
		position: fixed;
		right: 1.5em;
		top: 1.5em;
		color: var(--fg);
		z-index: 200;

		padding: 2px;
	}

	a {
		border-radius: 6px;
		padding: 0.5em;
		transition: all 0.2s;
	}

	a:hover:not(.selected) {
		border-bottom: 2px var(--fg) solid;
		border-top: 2px var(--fg) solid;
	}

	.selected {
		cursor: not-allowed;
		border-bottom: 2px var(--accent) solid;
		border-top: 2px var(--accent) solid;
	}
</style>
