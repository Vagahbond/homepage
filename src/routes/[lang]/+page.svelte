<script lang="ts">
	import { destroy } from '$lib/utils/destroy';
	import { glitch } from '$lib/utils/glitch.js';
	import { onMount } from 'svelte';
	import Links from '$lib/components/links.svelte';

	const { data } = $props();

	onMount(() => glitch(document));

	const onDestroy = () => {
		alert(data.labels.destructionMessage);
		destroy(document);
	};

	let tvSkewAmount = $state({ x: 0, y: 0 });

	function onMouseMove(event: MouseEvent) {
		console.log(tvSkewAmount);
		tvSkewAmount.x = -(event.clientX / window.innerWidth - 0.25);
		tvSkewAmount.y = event.clientY / window.innerHeight - 0.5;
	}
</script>

<svelte:window onmousemove={onMouseMove} />

<div class="container">
	<div class="home-screen">
		<div class="avatar-picture-container">
			<div class="tv" style:transform={`rotate3d(${tvSkewAmount.y}, ${tvSkewAmount.x}, 0, 10deg)`}>
				<div class="antenna-container">
					<div class="antenna section-base"></div>
					<div class="antenna section-1"></div>
					<div class="antenna section-2"></div>
					<div class="antenna section-3"></div>
					<div class="antenna section-bitonio"></div>
				</div>
				<div class=" avatar-picture">
					<div class="screen-shape screen-shadow screen">
						<div class="snail-container">
							<img alt="A magnificent snail" src="/snail.png" />
						</div>
					</div>
					<div class="controls">
						<div class="control color"><div class="dot"></div></div>
						<div class="control glitch"><div class="dot"></div></div>
						<div class="control position"><div class="dot"></div></div>
						<div class="control" style:margin-top="auto" style:width="1px" style:height="1px"></div>
						<div
							class="control"
							role="button"
							tabindex="0"
							style:width="20px"
							style:height="3px"
							style:border-radius="5px"
							onclick={onDestroy}
							onkeydown={(e) => (e.key === 'Enter' || e.key === ' ') && onDestroy()}
						></div>
					</div>
				</div>
			</div>

			<div class="bordered blurred-bg links">
				<Links links={data.labels.links} />
			</div>
		</div>

		<div class="bordered blurred-bg name">
			<h1 id="name"><span style:color="var(--accent)">#_</span> Vagahbond</h1>
			<div class="navbar">
				<!--
				<div class="navbar-item clickable">
					<a href={resolve('/[lang]/experience', { lang: lang })} class="navbar-link">
						<div class="navbar-link-icon">
							<Icon width="auto" height="100%" icon={IconEnum.EXPERIENCES} class="clickable" />
						</div>
						Career</a
					>
				</div>

				<div class="navbar-item clickable">
					<a href={resolve('/[lang]/projects', { lang: lang })} class="navbar-link">
						<div class="navbar-link-icon">
							<Icon width="auto" height="100%" icon={IconEnum.CODE} class="clickable" />
						</div>
						Projects</a
					>
				</div>

				<div class="navbar-item clickable">
					<a href={resolve('/[lang]/about', { lang: lang })} class="navbar-link">
						<div class="navbar-link-icon">
							<Icon width="auto" height="100%" icon={IconEnum.CONTACT} class="clickable" />
						</div>
						About</a
					>
				</div>
        -->

				<Links links={data.labels.nav} />
			</div>

			<div class="titles">
				<h2 id="title" class="glitch-text">
					{data.labels.title}
				</h2>
				<h2 style:color="var(--accent)">&amp;</h2>
				<h2 id="other-title" class="glitch-text">
					{data.labels.subtitle}
				</h2>
			</div>

			<h2 id="location" class="glitch-text">
				<span id="location-name">{data.labels.location}</span>
			</h2>
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
		display: flex;
		justify-content: center;
		align-items: center;
		flex-direction: column;
		height: 100%;

		gap: 1em;
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

		box-shadow: 10px 10px 10px var(--accent);
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
		opacity: 0.5;
		animation: glitch3 2.5s infinite;
	}

	.avatar-picture:has(.glitch:hover) img {
		animation: glitch1 2.5s infinite;
		filter: brightness(60%) contrast(0.3) hue-rotate(10deg);
		opacity: 0.4;
	}

	.avatar-picture:has(.glitch:hover) .snail-container {
		animation: distort 6s ease-in-out infinite;
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

		display: flex;
		flex-direction: column;
		align-items: center;
		justify-content: center;
		gap: 3rem;
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
		display: inline-block;
		width: max-content;
		display: flex;
		flex-direction: row;
		justify-content: center;
		align-items: center;
	}

	#name span {
		width: min-content;
	}

	.titles {
		display: flex;
		flex-direction: column;
		justify-content: space-between;
		align-items: center;
	}

	#title {
		margin: 0;
		color: var(--fg);
	}

	#other-title {
		margin: 0;
		color: var(--fg);
	}

	#location {
		margin: 0;
		text-overflow: clip;
	}

	#location-name {
		color: var(--accent);
		width: max-content;
	}

	.navbar {
		display: flex;
		flex-direction: row;
		gap: 0.5em;
		justify-content: space-between;
		width: 100%;
	}

	@media (max-width: 800px) {
		.home-screen {
			flex-direction: column;
			max-height: 100vh;
			overflow-y: scroll;
		}

		.navbar {
			max-width: 100vw;
			overflow: hidden;
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
		.home-screen {
			flex-direction: column-reverse;
			justify-content: center;
			align-items: center;
			gap: 2em;

			max-width: 100vw;
			overflow: hidden;

			margin: 0;
			padding: 0;
		}

		.avatar-picture-container {
			height: auto;
			margin: 0;
		}

		.name {
			padding: 0.5em 1.5em;
			margin: 0;
		}

		#location {
			display: none;
		}

		.titles {
			display: none;
		}

		.navbar {
			max-width: 100vw;
			overflow: hidden;
			margin: 0;
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
		transition: all 1s ease-in-out;
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

	.tv:hover .antenna-container {
		transform: rotate(330deg);
	}

	.tv:hover .antenna-container .section-3 {
		width: 32%;
	}

	.tv:hover .antenna-container .section-2 {
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
		transition: width 1s ease-in-out;
		height: 3px;
		width: 0;
	}

	.section-3 {
		transition: width 1s ease-in-out;
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

	@keyframes distort {
		0% {
			transform: skew(0deg, 0deg);
		}
		12% {
			transform: skew(0deg, 0deg);
		}
		13% {
			transform: skew(120deg, 0deg);
		}
		14% {
			transform: skew(0deg, 0deg);
		}
		15% {
			transform: skew(110deg, 0deg);
		}
		16% {
			transform: skew(0deg, 0deg);
		}
		40% {
			transform: skew(0deg, 0deg);
		}
		41% {
			transform: skew(-98deg, 0deg);
		}
		42% {
			transform: skew(0deg, 0deg);
		}
		70% {
			transform: skew(0deg, 0deg);
		}
		71% {
			transform: skew(110deg, 0deg);
		}
		72% {
			transform: skew(-90deg, 0deg);
		}
		73% {
			transform: skew(110deg, 0deg);
		}
		74% {
			transform: skew(0deg, 0deg);
		}
		100% {
			transform: skew(0deg, 0deg);
		}
	}

	.snail-container {
		width: 100%;
		height: 100%;
		margin: 0;
		padding: 0;
	}

	.links {
		padding: 2em 0;
	}
</style>
