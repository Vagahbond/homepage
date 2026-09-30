<script lang="ts">
	import RichText from '$lib/components/richText.svelte';
	import type { Experience, ExperiencesPageDatum } from '$lib/payload-types';
	import { glitch } from '$lib/utils/glitch';
	import { generateMediaUrl } from '$lib/utils/media';
	import type { PaginatedDocs } from 'payload';
	import { onMount } from 'svelte';
	import Arrow from '$lib/icons/arrow.svelte';

	const { data } = $props<{
		data: { experiences: PaginatedDocs<Experience>; labels: ExperiencesPageDatum };
	}>();

	let currentIndex = $derived(0);

	let lastTouchY = $state(0);

	let cooldown = $state(false);
	let lastScrollDelta = $state(0);

	onMount(() => glitch(document));

	function formatDate(date: string) {
		const month = new Date(date).getMonth() + 1;
		const year = new Date(date).getFullYear();
		return `${month < 10 ? '0' : ''}${month}/${year}`;
	}

	function incrementIndex(negative: boolean = false) {
		if (!negative && currentIndex + 1 < data.experiences.totalDocs) {
			currentIndex += 1;
		} else if (negative && currentIndex > 0) {
			currentIndex -= 1;
		}
	}

	function onScroll(e: WheelEvent) {
		e.preventDefault();

		const delta = e.deltaY;

		const isScrollImportant = Math.abs(delta) > lastScrollDelta;

		lastScrollDelta = Math.abs(delta);

		if (!isScrollImportant || cooldown) {
			return;
		}

		cooldown = true;

		if (e.deltaY < 0) {
			incrementIndex(true);
		} else if (e.deltaY > 0) {
			incrementIndex();
		}

		setTimeout(() => {
			cooldown = false;
		}, 300);
	}

	function onSwipe(e: TouchEvent) {
		if (!e.changedTouches.length) return;

		let element: HTMLElement = e.changedTouches[0].target as HTMLElement;

		while (element.parentElement) {
			if (
				getComputedStyle(element).overflowY === 'scroll' &&
				element.scrollHeight > element.clientHeight
			)
				return;
			element = element.parentElement;
		}

		if (e.type === 'touchstart') {
			lastTouchY = e.changedTouches[0].clientY;
		} else if (e.type === 'touchend') {
			const delta = e.changedTouches[0].clientY - lastTouchY;

			if (Math.abs(delta) < 100) {
				return;
			}

			if (delta > 0) {
				incrementIndex(true);
			} else if (delta < 0 && currentIndex < data.experiences.totalDocs - 1) {
				incrementIndex();
			}
		}
	}
</script>

<svelte:window onwheel={onScroll} ontouchstart={onSwipe} ontouchend={onSwipe} />

<div class="experiences-screen">
	<div class="title bordered blurred-bg" class:hidden-on-mobile={currentIndex > 0}>
		<h1><span style:color="var(--fg)">$_</span> {data.labels.title}</h1>
	</div>

	<div class="experiences-container" style:margin-top={`-${currentIndex * 100}vh`}>
		{#each data.experiences.docs as experience, index (index)}
			{@const imageUrl = generateMediaUrl(experience?.image?.url)}

			<link rel="preload" as="image" href={imageUrl} />

			<div class="experience-item">
				<div class="experience-description">
					<h1 class="experience-name">
						{experience.name}
					</h1>
					<div class="experience-subtitle">
						<h3 class="experience-location">{experience.location}</h3>
						<h4 class="experience-date">
							{formatDate(experience.start)} - {experience.end
								? formatDate(experience.end)
								: 'Present'}
						</h4>
					</div>
					<div class="description">
						<RichText value={experience.description} />
					</div>
					<div class="experience-tags">
						{#each experience.techs as tech, index (index)}
							<img
								alt={tech.label}
								height="32"
								width="32"
								src={`https://cdn.simpleicons.org/${tech.icon}/e0def4`}
								title={tech.label}
							/>
						{/each}
					</div>
				</div>

				<div
					class={`experience-picture ${experience.expandImage && 'expand'} ${experience.lightImageBg && 'light-image-bg'}`}
				>
					<img
						alt={experience?.image?.alt ?? ''}
						class="screen-shape screen-shadow screen"
						src={imageUrl}
					/>
				</div>
			</div>
			<!-- <div class="separator"></div> -->
		{/each}
	</div>
	<div
		class="progress-bar"
		style:--progress={`${((1 + currentIndex) / data.experiences.totalDocs) * 100}vw`}
	></div>
</div>
{#if currentIndex > 0}
	<button
		class="scroll-button up"
		onclick={() => {
			if (currentIndex > 0) currentIndex -= 1;
		}}
		title="Forward in time"
	>
		<Arrow direction="up" />
	</button>
{/if}

{#if currentIndex + 1 < data.experiences.totalDocs}
	<button
		class="scroll-button down"
		onclick={() => {
			if (currentIndex < data.experiences.totalDocs) currentIndex += 1;
		}}
		title="Back in time"
	>
		<Arrow direction="down" />
	</button>
{/if}

<style>
	* {
		z-index: 10;
	}

	.experiences-screen {
		display: flex;
		flex-direction: column;

		width: 100vw;
		min-width: 100vw;

		height: 100vh;
		max-height: 100vh;

		overflow: hidden;

		z-index: 10;
	}

	.experiences-container {
		transition: all 0.5s ease-out;
		margin-top: 0;
	}

	.scroll-button {
		transition: all 0.3s ease-out;
		position: fixed;

		width: 3em;
		height: 3em;
		border-radius: 50%;
		backdrop-filter: blur(10px);
		left: calc(50% - 1.5em);

		z-index: 11;
		cursor: pointer;
	}

	.scroll-button:hover {
		width: 3.5em;
		height: 3.5em;
		left: calc(50% - 1.75em);
	}

	.scroll-button.up {
		top: 1.5em;
		z-index: 30;
	}

	.scroll-button.down {
		bottom: 1.5em;
		z-index: 30;
	}

	.title {
		transition: all 1s;
		margin-left: 1em;
		margin-right: 1em;
		margin-bottom: 2em;
		padding-left: 1em;
		padding-right: 1em;
		padding-top: 0.5em;
		padding-bottom: 0.5em;
		width: fit-content;
		z-index: 12;

		position: fixed;
		top: 0;
	}

	.experience-item {
		display: flex;
		flex-direction: row;
		justify-content: center;
		align-items: center;
		width: 100%;
		height: 100vh;
	}

	.experience-picture {
		width: 40%;
		display: flex;
		justify-content: center;
		align-items: center;
		padding: 2em;
	}

	.experience-picture img {
		padding: 2em;
		max-height: 220px;
		max-width: 440px;
		object-fit: contain;
	}

	.experience-picture.expand img {
		padding: 0;
	}

	.experience-picture.light-image-bg img {
		background-image: repeating-radial-gradient(
			circle at 17% 32%,
			rgba(0, 0, 0, 1),
			rgba(200, 200, 200, 1) 0.00085px
		);
	}

	.experience-description {
		width: 60%;
		display: flex;
		flex-direction: column;
		padding: 2em;
		background-color: var(--bg);
	}

	.experience-name {
		margin: 0;
	}

	.experience-subtitle {
		display: flex;
		flex-direction: row;
		align-items: center;
		justify-content: space-between;
		margin: 1em 0;
		filter: brightness(80%);
	}

	.experience-location {
		margin: 0;
		color: var(--fg);
	}

	.experience-location::before {
		content: '';
		margin: 0 0.5em;
	}

	.experience-date {
		margin: 0;
		color: var(--fg);
	}

	.description {
		overflow-y: scroll;
		margin-bottom: 0.5em;
		font-size: 1.2em;
	}

	.experience-date::before {
		content: '';
		margin: 0 0.5em;
	}

	.experience-tags {
		display: flex;
		flex-direction: row;
		gap: 1em;
		align-items: center;
		justify-content: center;
	}

	.separator {
		width: 80%;
		height: 0.1em;
		background-color: var(--accent);
		margin: 1em 10%;
		border-radius: 0.5em;
	}

	.progress-bar {
		transition: all 0.5s ease-in-out;
		width: var(--progress);
		height: 0.3em;
		background-color: var(--accent);
		border-radius: 0.5em 0.5em 0 0;
		position: fixed;
		bottom: 0;
	}

	@media (max-width: 800px) {
		.hidden-on-mobile {
			display: none;
		}

		.experience-picture {
			margin: 0;
			padding: 0 1em;
			display: flex;
			flex-direction: column;
			justify-content: center;
			align-items: center;
			gap: 0;
			width: 80vw;
			max-width: 80vw;
			max-height: 20vh;
		}

		.experience-picture img {
			margin: 0;
			padding: 1em;
		}

		.experience-item {
			flex-direction: column-reverse;
			align-items: center;
			justify-content: space-around;
			max-height: 80vh;
			height: 80vh;
			padding-top: 10vh;
			padding-bottom: 10vh;
			margin: 0;
			overflow: hidden;
			gap: 0;
		}

		.experience-description {
			width: 90%;
			margin: 0;
			padding: 0;
		}

		.experience-subtitle {
			flex-direction: column;
			align-items: flex-start;
		}
		.experience-date {
			margin-left: 1em;
			margin-top: 0.5em;
		}

		.description {
			margin-bottom: 1em;
			max-height: 30vh;
			font-size: 1em;
		}
	}
</style>
