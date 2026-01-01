<script lang="ts">
	import '../style.css';
	import favicon from '$lib/assets/favicon.svg';
	import { onMount } from 'svelte';
	import { getAccentColor } from '$lib/utils/colors';
	import AnimatedBackground from '$lib/components/animatedBackground.svelte';
	import { page } from '$app/state';
	import AnimatedFrame from '$lib/components/animatedFrame.svelte';
	import { goto } from '$app/navigation';
	import { resolve } from '$app/paths';
	import type { RouteId } from '$app/types';
	import LangSelector from '$lib/components/langSelector.svelte';
	import NavButtons from '$lib/components/navButtons.svelte';

	let { children } = $props();

	let accentColor = $state('');

	onMount(() => {
		accentColor = getAccentColor();
	});

	const screens: Array<RouteId> = ['/[lang]', '/[lang]/projects', '/[lang]/contact'];

	let curScreen = $state<RouteId>(page.route.id ?? '/[lang]');

	let forward = $state<boolean>(false);
	let showPage = $state(false);

	function nextScreen(): void {
		forward = true;
		const next = screens[screens.indexOf(curScreen) + 1] ?? screens[0];
		curScreen = next;

		navigate(next);
	}

	function prevScreen(): void {
		forward = false;
		const index = screens.indexOf(curScreen) - 1;
		const prev = index < 0 ? screens[screens.length - 1] : screens[index];
		curScreen = prev;

		navigate(prev);
	}

	function navigate(dest: RouteId) {
		showPage = false;

		setTimeout(() => {
			// eslint-disable-next-line @typescript-eslint/ban-ts-comment
			// @ts-ignore
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

	onMount(() => {
		showPage = true;
	});
</script>

<svelte:head>
	<link rel="icon" href={favicon} />
</svelte:head>

<svelte:window on:keydown={on_key_down} />

<svelte-css-wrapper style="--accent: {accentColor}">
	<AnimatedBackground />
	<LangSelector />
	<NavButtons onLeftClicked={prevScreen} onRightClicked={nextScreen} />

	{#if showPage}
		<AnimatedFrame {forward}>
			{@render children()}
		</AnimatedFrame>
	{/if}
</svelte-css-wrapper>

<style>
</style>
