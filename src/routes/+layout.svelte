<script lang="ts">
	import '../style.css';
	import favicon from '$lib/assets/favicon.svg';
	import { onMount } from 'svelte';
	import { getAccentColor } from '$lib/utils/colors';
	import AnimatedBackground from '$lib/components/animatedBackground.svelte';

	let { children } = $props();

	let accentColor = $state('');

	onMount(() => {
		accentColor = getAccentColor();
	});
</script>

<svelte:head>
	<link rel="icon" href={favicon} />
</svelte:head>

<svelte-css-wrapper style="--accent: {accentColor}">
	<AnimatedBackground />

	{@render children()}
</svelte-css-wrapper>
