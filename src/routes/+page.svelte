<script lang="ts">
	import { onMount } from 'svelte';
	import { resolve } from '$app/paths';
	import { pickLanguage } from '$lib/utils/language';

	onMount(() => {
		const lang = pickLanguage(document.cookie, navigator.language || 'en');
		document.cookie = `lang=${lang}; Path=/; Max-Age=31536000; SameSite=Lax`;
		window.location.replace(resolve('/[lang]', { lang }));
	});
</script>

<svelte:head>
	<title>Choose your language | Yoni Firroloni</title>
</svelte:head>

<p>Choose your language / Choisissez votre langue</p>
<nav aria-label="Language selection">
	<a href={resolve('/[lang]', { lang: 'en' })} lang="en" hreflang="en">English</a>
	<a href={resolve('/[lang]', { lang: 'fr' })} lang="fr" hreflang="fr">Français</a>
</nav>
