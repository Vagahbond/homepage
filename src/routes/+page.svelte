<script lang="ts">
	import Arrow from '$lib/icons/arrow.svelte';
	import AnimatedFrame from '$lib/components/animatedFrame.svelte';
	import Home from '$lib/screens/home.svelte';
	import Projects from '$lib/screens/projects.svelte';
	import { scale } from 'svelte/transition';
	import Contact from '$lib/screens/contact.svelte';

	interface Screen {
		name: string;
		index: number;
	}

	const screens: Array<Screen> = [
		{
			name: 'home',
			index: 0
		},
		{
			name: 'projects',
			index: 1
		},
		{
			name: 'contact',
			index: 2
		}
	];

	let curScreen = $state<Screen>(screens[0]);

	let forward = $state<boolean>(true);

	function nextScreen(): Screen | undefined {
		const next = screens.find((s) => s.index === curScreen.index + 1);

		if (!next) {
			return screens.find((s) => s.index === 0);
		}

		return next;
	}

	function prevScreen(): Screen | undefined {
		const next = screens.find((s) => s.index === curScreen.index - 1);

		if (!next) {
			return screens.sort((a, b) => b.index - a.index)[0];
		}

		return next;
	}

	function on_key_down(event: KeyboardEvent) {
		switch (event.key) {
			case 'ArrowRight':
			case 'l': {
				if (!forward) forward = true;
				let next = nextScreen();
				if (next) curScreen = next;
				break;
			}

			case 'h':
			case 'ArrowLeft': {
				if (forward) forward = false;
				let prev = prevScreen();
				if (prev) curScreen = prev;
				break;
			}
		}
	}
</script>

<svelte:window on:keydown={on_key_down} />

<button
	onclick={() => {
		curScreen = prevScreen() ?? curScreen;
	}}
	id="scroll-left-button"
	class="scroll-button"
	transition:scale
>
	<Arrow direction="left" />
</button>

<button
	onclick={() => {
		curScreen = nextScreen() ?? curScreen;
	}}
	id="scroll-right-button"
	class="scroll-button"
	transition:scale
>
	<Arrow direction="right" />
</button>

<div class="container">
	{#if curScreen.name === 'home'}
		<AnimatedFrame {forward}>
			<Home />
		</AnimatedFrame>
	{:else if curScreen.name === 'projects'}
		<AnimatedFrame {forward}>
			<Projects />
		</AnimatedFrame>
	{:else if curScreen.name === 'contact'}
		<AnimatedFrame {forward}>
			<Contact />
		</AnimatedFrame>
	{/if}
</div>

<style>
	.container {
		transition: all 0.5s ease-in-out;

		position: relative;
		right: 0;
		left: 0;
		bottom: 0;
		top: 0;

		color: var(--fg);
	}

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
</style>
