<script lang="ts">
	import { invalidateAll } from '$app/navigation';
	import { page } from '$app/state';
	import SnailText from '$lib/components/snailText.svelte';
	import Arrow from '$lib/icons/arrow.svelte';
	import { glitch } from '$lib/utils/glitch.js';
	import { onMount } from 'svelte';

	const { data } = $props();

	let lang = $derived(page.params.lang);
	$effect(() => {
		if (lang === 'fr' || lang === 'en') {
			invalidateAll();
		}
	});

	let text = $derived(data.article.text);

	onMount(() => glitch(document));
</script>

<div class="about-screen">
	<h1 class="title"><span style:color="var(--fg)">󱄅❯</span> {data.article.title}</h1>
	<div class="rich-text">
		<SnailText value={text} />
	</div>
	<nav>
		{#if data.currentIndex > 1}
			<a href={`/${lang}/about?article=${data.currentIndex - 1}`}>
				<div class="arrow">
					<Arrow direction="left" />
				</div>

				Previous article
			</a>
		{/if}
		{#if data.nextArticle}
			<a href={`/${lang}/about?article=${data.currentIndex + 1}`}>
				Next article : {data.nextArticle.title}
				<div class="arrow">
					<Arrow direction="right" />
				</div>
			</a>
		{/if}
	</nav>
</div>

<style>
	nav {
		display: flex;
		flex-direction: row;
		align-items: center;
		justify-content: space-around;
		padding: 1em;
	}

	nav a {
		display: flex;
		flex-direction: row;
		align-items: center;
	}

	.arrow {
		height: 1em;
		width: 1em;
		max-width: 1em;
		max-height: 1em;
		fill: var(--accent);
		margin: 0 1em;
		overflow: hidden;
		cursor: pointer;
	}

	.title {
		width: fit-content;
		padding: 1em;
		color: var(--accent);
	}

	.rich-text {
		flex: 1;
		padding: 0 4em;
		overflow-x: show;
		overflow-y: auto;
		cursor: none;
	}

	.about-screen {
		width: 100vw;
		height: 100vh;
		overflow: hidden;

		display: flex;
		flex-direction: column;

		backdrop-filter: blur(10px);
	}
</style>
