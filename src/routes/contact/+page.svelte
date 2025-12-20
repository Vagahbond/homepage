<script>
	import Code from '$lib/icons/code.svelte';
	import { blur, draw, fly, scale, slide } from 'svelte/transition';
</script>

<div class="contact-screen">
	<div
		id="frame1"
		class="frame blurred-bg bordered"
		in:slide={{ delay: 500 }}
		out:slide={{ delay: 300, duration: 100 }}
	>
		<h2>Nice to meet you !</h2>
	</div>
	<div
		id="frame2"
		class="frame blurred-bg bordered"
		in:slide={{ delay: 750 }}
		out:slide={{ delay: 200, duration: 100 }}
	>
		<h2>Educated &amp; self-taught</h2>
	</div>
	<div
		id="frame3"
		class="frame blurred-bg bordered"
		in:slide={{ delay: 1000 }}
		out:slide={{ delay: 100, duration: 100 }}
	>
		<h2>Simple solutions to complex problems</h2>
	</div>
	<div
		id="frame4"
		class="frame blurred-bg bordered"
		in:slide={{ delay: 1250 }}
		out:slide={{ delay: 0, duration: 100 }}
	>
		<h2>Nice to meet you !</h2>
	</div>
	<div
		id="frame5"
		class="frame"
		out:blur={{ delay: 0, duration: 100 }}
		in:fly={{ delay: 750, duration: 1000, y: 2000 }}
	>
		<Code />
	</div>
</div>

<style>
	.contact-screen {
		width: 100vw;
		height: 100vh;
		overflow: hidden;

		display: grid;
		grid-template-columns: repeat(7, 1fr);
		grid-template-rows: repeat(8, 1fr);
	}

	.frame {
		margin: 1em;
		z-index: 5;
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
	}
</style>
