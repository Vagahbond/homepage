<script lang="ts">
	import '../style.css';
	import favicon from '$lib/assets/favicon.svg';
	import { onMount } from 'svelte';
	import { getAccentColor } from '$lib/utils/colors';
	import AnimatedBackground from '$lib/components/animatedBackground.svelte';
	import Arrow from '$lib/icons/arrow.svelte';
	import { scale } from 'svelte/transition';
	import { page } from '$app/state';
	import AnimatedFrame from '$lib/components/animatedFrame.svelte';
	import { goto } from '$app/navigation';
	import { resolve } from '$app/paths';
	import type { RouteId } from '$app/types';

	let { children } = $props();

	let accentColor = $state('');

	onMount(() => {
		accentColor = getAccentColor();
	});

	const screens: Array<RouteId> = ['/', '/projects', '/contact'];

	let curScreen = $state<RouteId>(page.route.id ?? '/');

	let forward = $state<boolean>(false);
	let showPage = $state(false);

	function nextScreen(): void {
		const next = screens[screens.indexOf(curScreen) + 1] ?? screens[0];
		curScreen = next;

		navigate(next);
	}

	function prevScreen(): void {
		const index = screens.indexOf(curScreen) - 1;
		const prev = index < 0 ? screens[screens.length - 1] : screens[index];
		curScreen = prev;

		navigate(prev);
	}

	function navigate(dest: RouteId) {
		showPage = false;

		setTimeout(() => {
			goto(resolve(dest), { state: { forward } }).finally(() => {
				showPage = true;
			});
		}, 500);
	}

	function on_key_down(event: KeyboardEvent) {
		switch (event.key) {
			case 'ArrowRight':
			case 'l': {
				forward = true;
				nextScreen();
				break;
			}

			case 'h':
			case 'ArrowLeft': {
				forward = false;
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
	<!-- <button
		onclick={() => {
			prevScreen();
		}}
		id="scroll-left-button"
		class="scroll-button"
		transition:scale
	>
		<Arrow direction="left" />
	</button>
  -->
	<button
		onclick={() => {
			nextScreen();
		}}
		id="scroll-right-button"
		class="scroll-button"
		transition:scale
	>
		<Arrow direction="right" />
	</button>

	{#if showPage}
		<AnimatedFrame forward>
			{@render children()}
		</AnimatedFrame>
	{/if}
</svelte-css-wrapper>

<style>
	.scroll-button {
		transition: all 0.5s ease-in-out;
		display: flex;
		animation: 3s ease infinite spring;
		position: fixed;
		cursor: pointer;

		z-index: 10;
	}

	#scroll-left-button {
		height: 6vh;
		width: 6vh;
		left: 3em;
		top: 47vh;
	}

	#scroll-right-button {
		height: 6vh;
		width: 6vh;
		right: 3em;
		top: 47vh;
	}

  #scroll-right-button:hover {
    scale: 1.5;
  }

</style>
