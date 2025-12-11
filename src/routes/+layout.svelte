<script lang="ts">
	import '../style.css';
	import favicon from '$lib/assets/favicon.svg';
	import { onMount } from 'svelte';

	let { children } = $props();

	let accentColor = $state('');

	function getAccentColor(): string {
		const accents = ['#eb6f92', '#f6c177', '#ebbcba', '#31748f', '#9ccfd8', '#c4a7e7'];

		const rIndex = Math.floor(Math.random() * 6);

		return accents[rIndex];
	}

	onMount(() => {
		accentColor = getAccentColor();
	});
</script>

<svelte:head>
	<link rel="icon" href={favicon} />
</svelte:head>

<video id="bg-video" loop muted autoplay src="/background.webm"></video>

<svelte-css-wrapper style="--accent: {accentColor}">
	{@render children()}
</svelte-css-wrapper>

<style>
	#bg-video {
		position: fixed;
		right: 0;
		bottom: 0;
		min-width: 100%;
		min-height: 100%;
	}
</style>
