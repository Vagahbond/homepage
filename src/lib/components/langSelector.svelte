<script lang="ts">
	import { resolve } from '$app/paths';
	import { page } from '$app/state';
	import type { RoutesWithLang } from '$lib/utils/nav';

	const route = $derived(
		page.route.id?.startsWith('/[[lang]]') ? (page.route.id as RoutesWithLang) : '/[[lang]]'
	);
</script>

<div class="lang-selector">
	<a
		class="screen-shape"
		class:selected={page.params.lang === 'fr'}
		href={resolve(route, { lang: 'fr' })}
		onclick={() => (document.cookie = 'lang=fr; Path=/; Max-Age=31536000; SameSite=Lax')}
		lang="fr"
		hreflang="fr"
		aria-label="Français"
		aria-current={page.params.lang === 'fr' ? 'page' : undefined}
	>
		<span> 🇫🇷 </span>
	</a>
	<a
		class="screen-shape"
		class:selected={!page.params.lang}
		href={resolve(route, { lang: undefined })}
		onclick={() => (document.cookie = 'lang=en; Path=/; Max-Age=31536000; SameSite=Lax')}
		lang="en"
		hreflang="en"
		aria-label="English"
		aria-current={!page.params.lang ? 'page' : undefined}>🇺🇸</a
	>
</div>

<style>
	.lang-selector {
		position: fixed;
		right: 1.5em;
		top: 1.5em;
		color: var(--fg);
		z-index: 200;

		border-radius: 16px;
		overflow: hidden;
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
