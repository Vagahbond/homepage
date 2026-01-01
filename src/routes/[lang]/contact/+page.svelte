<script>
	import Links from '$lib/components/links.svelte';
	import RichText from '$lib/components/richText.svelte';
	import Icon from '$lib/icons/icon.svelte';
	import IconEnum from 'backend/src/icons';
	import { blur, fly, slide } from 'svelte/transition';

	const { data } = $props();
</script>

<div class="contact-screen">
	<div
		id="frame1"
		class="frame blurred-bg bordered"
		in:slide={{ delay: 500 }}
		out:slide={{ delay: 300, duration: 100 }}
	>
		<h2>{data.labels.topLeft.title}</h2>
		<div class="contact-text">
			<RichText value={data.labels.topLeft.text} />
		</div>
	</div>
	<div
		id="frame2"
		class="frame blurred-bg bordered"
		in:slide={{ delay: 750 }}
		out:slide={{ delay: 200, duration: 100 }}
	>
		<h2>{data.labels.topRight.title}</h2>
		<div class="contact-text">
			<RichText value={data.labels.topRight.text} />
		</div>
	</div>
	<div
		id="frame4"
		class="frame blurred-bg bordered"
		in:slide={{ delay: 1000 }}
		out:slide={{ delay: 100, duration: 100 }}
	>
		<h2>{data.labels.bottomLeft.title}</h2>
		<div class="contact-text">
			<RichText value={data.labels.bottomLeft.text} />
		</div>
	</div>
	<div
		id="frame3"
		class="frame blurred-bg bordered"
		in:slide={{ delay: 1250 }}
		out:slide={{ delay: 0, duration: 100 }}
	>
		<h2>{data.labels.bottomRight.title}</h2>
		<div class="links">
			<Links links={data.labels.bottomRight.links} />
		</div>
	</div>
	<div
		id="frame5"
		class="frame"
		out:blur={{ delay: 0, duration: 100 }}
		in:fly={{ delay: 750, duration: 1000, y: 2000 }}
	>
		<Icon icon={IconEnum.CODE} />
	</div>
</div>

<style>
	* {
		color: var(--fg);
	}

	.contact-screen {
		width: 100vw;
		height: 100vh;
		overflow: hidden;

		display: grid;
		grid-template-columns: repeat(7, 1fr);
		grid-template-rows: repeat(8, 1fr);
	}

	.frame {
		margin: 0.5em;
		z-index: 5;
		padding: 1em;
		display: flex;
		flex-direction: column;
	}

	.frame h2 {
		margin: 0;
		font-weight: bold;
	}

	.contact-text {
		overflow-y: scroll;
	}

	.links {
		display: flex;
		flex-direction: row;
		margin-top: auto;
		margin-bottom: auto;
	}

	#frame1 {
		grid-column: span 4 / span 4;
		grid-row: span 4 / span 4;
	}

	#frame2 {
		grid-column: span 3 / span 3;
		grid-row: span 5 / span 5;
		grid-column-start: 5;
	}

	#frame3 {
		grid-column: span 4 / span 4;
		grid-row: span 3 / span 3;
		grid-column-start: 4;
		grid-row-start: 6;
	}

	#frame4 {
		grid-column: span 3 / span 3;
		grid-row: span 4 / span 4;
		grid-column-start: 1;
		grid-row-start: 5;
	}

	#frame5 {
		margin: 3em;
		grid-column-start: 4;
		grid-row-start: 5;
		z-index: 0;
		fill: var(--fg);
		cursor: pointer;
	}

	@media (max-width: 800px) {
	}
</style>
