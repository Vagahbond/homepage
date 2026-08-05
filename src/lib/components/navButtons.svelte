<script lang="ts">
	import Arrow from '$lib/icons/arrow.svelte';
	import Icon from '$lib/icons/icon.svelte';
	import { scale } from 'svelte/transition';
	import IconEnum from 'backend/src/icons';
	import { page } from '$app/state';

	const { onLeftClicked, onRightClicked, onHomeClicked } = $props();
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

{#if page.route.id !== '/[lang]'}
	<button
		onclick={() => {
			onHomeClicked();
		}}
		id="home-button"
		class="home-button"
		transition:scale
	>
		<Icon icon={IconEnum.HOME} />
	</button>
{/if}

<style>
	.home-button {
		position: fixed;
		bottom: 3vh;
		right: 3vh;
		width: 3vh;
		z-index: 15;

		transition: all 0.3s ease-in-out;
		display: flex;
		animation: 3s ease infinite spring;
		overflow: hidden;

		fill: var(--fg);
		cursor: pointer;
		background-color: var(--bg);
		padding: 0.8em;
		border-radius: 50%;
	}

	.home-button:hover {
		width: 6vh;
	}

	.scroll-button {
		transition: all 0.3s ease-in-out;
		display: flex;
		animation: 3s ease infinite spring;
		position: fixed;
		overflow: hidden;
		border-radius: 50%;
		cursor: pointer;

		z-index: 10;
	}

	.left-area {
		position: fixed;
		top: 0;
		left: 0;
		bottom: 0;
		width: 6vh;
		z-index: 15;
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
		left: -4vh;
		top: 47vh;
	}

	.right-area {
		position: fixed;
		top: 0;
		right: 0;
		bottom: 0;
		width: 6vh;
		z-index: 15;
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
		right: -4vh;
		top: 47vh;
	}

	#scroll-right-button:hover {
		scale: 1.2;
	}

	#scroll-left-button:hover {
		scale: 1.2;
	}
</style>
