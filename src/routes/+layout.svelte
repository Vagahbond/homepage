<script lang="ts">
	import '../style.css';
	import { onMount } from 'svelte';
	import { getAccentColor } from '$lib/utils/colors';
	import AnimatedBackground from '$lib/components/animatedBackground.svelte';
	import { page } from '$app/state';
	import AnimatedFrame from '$lib/components/animatedFrame.svelte';
	import { goto } from '$app/navigation';
	import { resolve } from '$app/paths';
	import LangSelector from '$lib/components/langSelector.svelte';
	import NavButtons from '$lib/components/navButtons.svelte';
	import { isSupportedLanguage, supportedLanguages } from '$lib/utils/language';
	import { PUBLIC_SITE_ORIGIN } from '$env/static/public';
	import { getSiteOrigin } from '$lib/utils/site';
	import type { RoutesWithLang } from '$lib/utils/nav';

	let { children } = $props();

	const siteOrigin = getSiteOrigin(PUBLIC_SITE_ORIGIN);

	let accentColor = $state('');

	onMount(() => {
		accentColor = getAccentColor();
	});

	$effect(() => {
		const lang = page.params.lang ?? 'en';
		const saved = document.cookie.match(/(?:^|;\s*)lang=([^;]*)/)?.[1];
		document.documentElement.lang = lang;
		if (isSupportedLanguage(saved) && saved !== lang) {
			let destination: string = resolve(localizedRoute, {
				lang: saved === 'en' ? undefined : saved
			});
			destination += page.url.search + page.url.hash;
			void goto(destination, { replaceState: true });
		} else if (!isSupportedLanguage(saved)) {
			document.cookie = `lang=${lang}; Path=/; Max-Age=31536000; SameSite=Lax`;
		}
	});

	const localizedRoute = $derived(
		page.route.id?.startsWith('/[[lang]]') ? (page.route.id as RoutesWithLang) : '/[[lang]]'
	);
	const defaultPath = $derived(resolve(localizedRoute, { lang: undefined }));

	const screens: Array<RoutesWithLang> = [
		'/[[lang]]',
		'/[[lang]]/experience',
		'/[[lang]]/projects',
		'/[[lang]]/about'
	];

	const curScreen = $derived(localizedRoute);

	let forward = $state<boolean>(false);
	let showPage = $state(true);

	function navigateHome(): void {
		navigate('/[[lang]]');
	}

	function nextScreen(): void {
		forward = true;
		const next = screens[screens.indexOf(curScreen) + 1] ?? screens[0];

		navigate(next);
	}

	function prevScreen(): void {
		forward = false;
		const index = screens.indexOf(curScreen) - 1;
		const prev = index < 0 ? screens[screens.length - 1] : screens[index];

		navigate(prev);
	}

	function navigate(dest: RoutesWithLang) {
		showPage = false;

		setTimeout(() => {
			goto(resolve(dest, { lang: page.params.lang })).finally(() => {
				showPage = true;
			});
		}, 500);
	}

	function on_key_down(event: KeyboardEvent) {
		switch (event.key) {
			case 'ArrowRight':
			case 'l': {
				nextScreen();
				break;
			}

			case 'h':
			case 'ArrowLeft': {
				prevScreen();
				break;
			}
		}
	}
</script>

<svelte:head>
	<link rel="canonical" href={new URL(page.url.pathname, siteOrigin).href} />
	{#each supportedLanguages as lang (lang)}
		<link
			rel="alternate"
			hreflang={lang}
			href={new URL(resolve(localizedRoute, { lang }), siteOrigin).href}
		/>
	{/each}
	<link rel="alternate" hreflang="x-default" href={new URL(defaultPath, siteOrigin).href} />
</svelte:head>

<svelte:window on:keydown={on_key_down} />
<div class="crt">
	<svelte-css-wrapper style:--accent={accentColor}>
		<AnimatedBackground />
		<LangSelector />
		<NavButtons
			onLeftClicked={prevScreen}
			onRightClicked={nextScreen}
			onHomeClicked={navigateHome}
		/>

		{#if showPage}
			<AnimatedFrame {forward}>
				<div class="">
					{@render children()}
				</div>
			</AnimatedFrame>
		{/if}
	</svelte-css-wrapper>
</div>

<style>
	.crt {
		height: 100vh;
		width: 100vw;
		overflow: hidden;
	}

	.scrollable {
		max-height: 100vh;
		overflow-y: auto;
	}
</style>
