<script lang="ts">
	import Arrow from '$lib/icons/arrow.svelte';
	import { scale } from 'svelte/transition';

	const { onLeftClicked, onRightClicked } = $props();
</script>

<div class="left-area">
	<button
		onclick={() => {
			onLeftClicked();
		}}
		id="scroll-left-button"
		class="scroll-button"
		transition:scale
	>
		<Arrow direction="left" />
	</button>
</div>

<div class="right-area">
	<button
		onclick={() => {
			onRightClicked();
		}}
		id="scroll-right-button"
		class="scroll-button"
		transition:scale
	>
		<Arrow direction="right" />
	</button>
</div>

<style>
	.scroll-button {
		transition: all 0.5s ease-in-out;
		display: flex;
		animation: 3s ease infinite spring;
		position: fixed;
		cursor: pointer;

		z-index: 10;
	}

	.left-area {
		position: fixed;
		top: 0;
		left: 0;
		bottom: 0;
		width: 6vh;
		z-index: 20;
	}

	.left-area:hover {
		width: 10vh;
	}

	.left-area:hover #scroll-left-button {
		left: 1em;
	}

	#scroll-left-button {
		height: 6vh;
		width: 6vh;
		left: -2em;
		top: 47vh;
	}

	.right-area {
		position: fixed;
		top: 0;
		right: 0;
		bottom: 0;
		width: 6vh;
		z-index: 20;
	}

	.right-area:hover {
		width: 10vh;
	}

	.right-area:hover #scroll-right-button {
		right: 1em;
	}

	#scroll-right-button {
		height: 6vh;
		width: 6vh;
		right: -2em;
		top: 47vh;
	}

	#scroll-right-button:hover {
		scale: 1.2;
	}

	#scroll-left-button:hover {
		scale: 1.2;
	}
</style>
