<script lang="ts">
	import { destroy } from '$lib/utils/destroy';
	import { glitch } from '$lib/utils/glitch.js';
	import { onMount } from 'svelte';

	const { data } = $props();

	onMount(() => {
		glitch(document);
	});
</script>

<div class="container">
	<div class="home-screen">
		<div class="avatar-picture-container">
			<div class="antenna-container">
				<div class="antenna section-base"></div>
				<div class="antenna section-1"></div>
				<div class="antenna section-2"></div>
				<div class="antenna section-3"></div>
				<div class="antenna section-bitonio"></div>
			</div>
			<div class=" avatar-picture">
				<div class="screen-shape screen-shadow screen">
					<img alt="A magnificent snail" src="/snail.png" />
				</div>
				<div class="controls">
					<div class="control color"><div class="dot"></div></div>
					<div class="control glitch"><div class="dot"></div></div>
					<div class="control position"><div class="dot"></div></div>
					<div class="control" style:margin-top="auto" style:width="1px" style:height="1px"></div>
					<div
						class="control"
						style:width="20px"
						style:height="3px"
						style:border-radius="5px"
						onclick={() => destroy(document)}
					></div>
				</div>
			</div>
		</div>
		<div class="bordered blurred-bg name">
			<h1 id="name" class="glitch-text">Vagahbond</h1>
			<!-- <h4 id="aka">A.K.A.</h4> -->
			<!-- <h1 id="username">Vagahbond</h1> -->
			<h2 id="title" class="glitch-text">
				{data.labels.title}
			</h2>
			<h3 id="location" class="glitch-text">
				Location: <span id="location-name">{data.labels.location}</span>
			</h3>
		</div>
	</div>
</div>

<style>
	.container {
		transition: all 0.5s ease-in-out;

		position: relative;
		right: 0;
		left: 0;
		bottom: 0;
		top: 0;

		overflow-x: hidden;

		color: var(--fg);
	}

	.home-screen {
		display: flex;
		justify-content: space-evenly;

		height: 100vh;
		width: 100vw;
		min-width: 100vw;
	}

	.avatar-picture-container {
		margin-top: auto;
		margin-bottom: auto;
	}

	.avatar-picture * {
		margin: 0.8em 0.5em;
		padding: 1em;
		display: flex;
	}

	.avatar-picture > .screen {
		overflow: hidden;
		max-width: 16em;
		width: 16em;
	}

	.avatar-picture img {
		transition: all 2s ease-in-out;
		opacity: 0;
		overflow: hidden;
	}

	.avatar-picture {
		height: 20em;
		min-width: 20em;
		min-height: 20em;
		display: block;
		margin-bottom: 10px;

		overflow: hidden;

		display: flex;

		background-color: var(--fg);
		border-radius: 20px;
		padding: 0em;
	}

	.avatar-picture-container:hover img {
		overflow: hidden;
		/* VHS 
    */
		animation: scroll 2s ease-in-out infinite;
		animation: shake-vhs 2s ease infinite;
		opacity: 0.8;
	}

	.avatar-picture div img:hover {
		animation: 2s ease infinite rotate;
	}

	.screen::before,
	.screen::after {
		transition: all 2.5s ease-in-out;
		background-color: transparent;
		position: absolute;
		z-index: 100;
		inset: 3em;
	}

	.screen::before {
		content: 'CHANNEL 1';
		opacity: 0;
	}

	.avatar-picture-container:hover .screen::before {
		opacity: 0.8;
		top: 3em;
		left: 3em;
		bottom: 14em;
		right: 14em;
	}

	.avatar-picture-container:hover .screen::after {
		top: 14em;
		bottom: 5em;
		left: -6em;
		content: '---';
	}

	.avatar-picture:has(.glitch:hover) .screen::before {
		content: 'No Signal';
		left: 0;
		right: 8em;
		opacity: 0.5;
		background-color: var(--accent);
		animation: glitch2 2.5s infinite;
	}
	.avatar-picture:has(.glitch:hover) .screen::after {
		left: 3em;
		right: 0em;
		background-color: var(--fg);
		opacity: 0.5;
		animation: glitch3 2.5s infinite;
	}

	.avatar-picture:has(.glitch:hover) img {
		animation: glitch1 2.5s infinite;
		filter: brightness(60%) contrast(0.3) hue-rotate(10deg);
		opacity: 0.4;
	}

	.avatar-picture:has(.position:hover) img {
		transform: scale(1.5, 0.8);
	}

	.avatar-picture:has(.color:hover) img {
		filter: brightness(150%) contrast(2) hue-rotate(20deg);
	}

	.name {
		transition: all 0.5s ease-in-out;
		padding: 0em 0em;
		margin-top: auto;
		margin-bottom: auto;

		display: flex;
		flex-direction: column;
		justify-content: space-between;
	}

	.name * {
		transition: all 0.5s ease-in-out;

		display: flex;
		flex-direction: column;
		justify-content: space-around;
	}

	#name {
		height: 1.75em;
		margin: 0;
		color: var(--fg);
	}

	#aka,
	#username {
		height: 0;
		overflow: hidden;
		white-space: nowrap;
		margin: 0;
	}

	#username {
		color: var(--accent);
	}

	#location {
		color: var(--fg);
		white-space: nowrap;
		display: block;
	}

	#location-name {
		color: var(--accent);
		white-space: nowrap;
		display: inline;
	}

	.name:hover #aka,
	.name:hover #username {
		height: 1.75em;
	}

	@media (max-width: 800px) {
		.home-screen {
			flex-direction: column;
			max-height: 100vh;
			overflow-y: scroll;
		}

		.avatar-picture-container {
			margin-left: auto;
			margin-right: auto;
			margin-bottom: 0;
		}

		.avatar-picture {
			margin-bottom: 0;
		}

		.name {
			margin-top: 0;
			margin-left: auto;
			margin-right: auto;
		}
	}

	@media (max-width: 600px) {
		.name {
			padding: 0.5em 1.5em;
		}
	}

	.controls {
		border-radius: 10px;
		display: flex;
		flex-direction: column;
		justify-content: center;
		align-items: center;
		width: 2em;
		margin-left: 0;
		margin: 0.5em 0.5em 0.5em 0;
	}

	@keyframes rotate {
		0% {
			transform: rotate(0deg);
		}
		100% {
			transform: rotate(360deg);
		}
	}

	.control {
		height: 30px;
		width: 30px;
		background-color: var(--accent);
		border-radius: 50%;
		transition: all 2s ease-in-out;
		border: 3px solid var(--bg);
		padding: 0;
	}

	.control:hover {
		transform: rotate(350deg);
	}

	.dot {
		height: 3px;
		width: 3px;
		padding: 0;
		background-color: var(--bg);
		border-radius: 1px;
		transition: all 0.5s ease-in-out;
		margin: 3px auto 3px auto;
	}

	.antenna-container {
		transition: all 3s ease-in-out;
		margin: 0 1em;
		padding: 0;
		height: 10px;
		flex-direction: row;
		display: flex;
		justify-content: start;
		align-items: center;
		transform: rotate(360deg);
		transform-origin: 0.5em 50%;
		z-index: 100;
		width: 100%;
	}

	.avatar-picture-container:hover .antenna-container {
		transform: rotate(330deg);
	}

	.avatar-picture-container:hover .antenna-container .section-3 {
		width: 32%;
	}

	.avatar-picture-container:hover .antenna-container .section-2 {
		width: 32%;
	}

	.antenna {
		width: 32%;

		background-color: var(--fg);
	}

	.section-1 {
		height: 5px;
	}

	.section-2 {
		transition: width 3s ease-in-out;
		height: 3px;
		width: 0;
	}

	.section-3 {
		transition: width 2s ease-in-out;
		height: 1px;
		width: 0;
	}

	.section-bitonio {
		width: 3%;
		height: 8px;
	}

	.section-base {
		width: 10px;
		height: 10px;
		border-radius: 100%;
	}
</style>
