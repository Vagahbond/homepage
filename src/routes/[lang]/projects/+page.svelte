<script lang="ts">
	import Links from '$lib/components/links.svelte';
	import RichText from '$lib/components/richText.svelte';
	import type { Project } from '$lib/payload-types';
	import { AccentColor } from '$lib/utils/colors';
	import type { PaginatedDocs } from 'payload';

	const { data } = $props<{ data: PaginatedDocs<Project> }>();
	let mobileImageModalPic = $state<string | null>(null);

	const initialColorIndex = $derived(Math.floor(Math.random() * data.projects.totalDocs));

	function getProjectColor(index: number) {
		const colors = Object.values(AccentColor);
		return colors[(initialColorIndex + index) % colors.length];
	}
</script>

<div class="projects-screen">
	<div class="title bordered blurred-bg">
		<h1>{data.labels.title}</h1>
		<h4 class="subtitle">{data.labels.subtitle}</h4>
	</div>
	<div class="timeline-top bordered blurred-bg"></div>
	{#each data.projects.docs as project, index (index)}
		{@const color = getProjectColor(index)}
		{@const date = new Date(project.date)}
		{@const imageUrl = `/image/${btoa(project?.image?.url)}`}

		<link rel="preload" as="image" href={imageUrl} />

		<div class={`project-item ${index % 2 && 'reverse'}`}>
			<div class="project-picture">
				<img
					alt={project?.image?.alt ?? ''}
					src={imageUrl}
					class="bordered blurred-bg"
					style:--accent={color}
				/>
			</div>
			<div class="project-center blurred-bg bordered" style:--accent={color}>
				<div class="project-circle" style:--accent={color}></div>
			</div>
			<div class="project-desc">
				<div class="project-desc-frame bordered blurred-bg" style:--accent={color}>
					<h1>{project.name}</h1>
					<h6 class="project-date">{date.getMonth() + 1}/{date.getFullYear()}</h6>
					<button class="mobile-project-picture" onclick={() => (mobileImageModalPic = imageUrl)}>
						<img
							alt={project?.image?.alt ?? ''}
							src={imageUrl}
							class="bordered blurred-bg"
							style:--accent={color}
						/>
					</button>

					<div class="project-desc-text">
						<RichText value={project.description} />
					</div>
					<div class="icons-container">
						<Links links={project.links} />
					</div>
				</div>
			</div>
		</div>
	{/each}
	<div class="timeline-bottom bordered blurred-bg"></div>

	<div class={`mobile-image-modal blurred-bg ${mobileImageModalPic && 'show'}`}>
		<button onclick={() => (mobileImageModalPic = null)}>
			<img
				class="bordered"
				src={mobileImageModalPic}
				alt="A screenshot of the last selected project"
			/>
		</button>
	</div>
</div>

<style>
	* {
		color: var(--fg);
	}

	.project-desc {
		width: 98.5vw;
		vertical-align: middle;
		display: flex;
		max-height: 100vh;
	}

	.projects-screen {
		padding-top: 2em;
		padding-bottom: 2em;
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
	}
	.subtitle {
		transition: all 1s;
		height: 0;
		overflow: hidden;
		padding: 0;
		margin: 0;
		padding-left: 1em;
		filter: brightness(70%);
		max-width: 100%;
	}

	.title h1 {
		transition: all 1s;
	}

	.title:hover h1 {
		margin-bottom: 0;
	}

	.title:hover .subtitle {
		height: 2em;
	}

	.projects-screen {
		display: flex;
		flex-direction: column;
		justify-content: center;

		width: 100vw;
		min-width: 100vw;
		overflow: scroll;
	}

	.timeline-top {
		z-index: 10;
		width: 1vw;
		height: 1vw;
		margin-right: auto;
		margin-left: auto;
		margin-top: 1vw;
		border-bottom: none;
		border-radius: 0;
		border-top-left-radius: 50%;
		border-top-right-radius: 50%;
		border-color: var(--fg);
	}

	.timeline-bottom {
		z-index: 10;
		width: 1vw;
		height: 1vw;
		margin-right: auto;
		margin-left: auto;
		margin-bottom: 1vw;
		border-top: none;
		border-radius: 0;
		border-bottom-left-radius: 50%;
		border-bottom-right-radius: 50%;
		border-color: var(--fg);
	}

	.project-item {
		width: 100%;
		height: 80vh;
		display: flex;
		flex-direction: row;
		justify-content: center;
	}

	.project-item.reverse {
		flex-direction: row-reverse;
	}

	.project-center {
		background: transparent;
		width: 1vw;
		border-top: none;
		border-bottom: none;
		border-radius: 0;
		border-color: var(--fg);
		/* border-left: 0.25vw solid var(--fg);
		border-right: 0.25vw solid var(--fg); */
		display: flex;
		overflow: visible;
	}

	.project-item:hover .project-circle {
		height: 1vw;
	}

	.project-circle {
		margin: auto;
		background-color: var(--accent);
		width: 1vw;
		height: 90%;
		transition: all 1s;
		border-radius: 0.5vw;
	}

	.project-picture {
		width: 98.5vw;
		display: flex;
		justify-content: center;
	}

	.mobile-project-picture {
		display: none;
	}

	.project-item:hover .project-picture img {
		transition: all 1s;
		max-width: 40vw;
		max-height: 80vh;
	}

	.project-picture img {
		max-width: 38vw;
		max-height: 75vh;
		object-fit: cover;
		margin: auto;
	}

	.project-desc-frame h1 {
		margin: 0;
	}

	.project-desc-frame {
		transition: all 1s;
		display: flex;
		width: 28vw;
		margin: auto;
		flex-direction: column;
		justify-content: center;
		padding: 2em;
		padding-top: 2em;
		padding-bottom: 2em;
		background: transparent;
		max-height: 30em;
	}

	.project-date {
		filter: brightness(70%);
		margin: 0;
	}

	.project-desc-text {
		max-height: 20em;
		margin-top: 2em;
		overflow-y: scroll;
	}

	.icons-container {
		margin-top: 2em;
		display: flex;
		flex-direction: row;
		width: 100%;
	}

	.mobile-image-modal {
		display: none;
	}

	@media (max-width: 800px) {
		.title {
			width: auto;
			margin: 0em 1em;
			margin-bottom: 2em;
		}

		.subtitle {
			margin-left: 0;
			padding-left: 0;
		}

		.title:hover .subtitle {
			padding-top: 1em;
			height: 3em;
		}

		.project-item {
			padding-left: 1em;
			padding-right: 1em;
			justify-content: space-between;
			width: 100%;
			margin: 0;
			max-height: unset;
			height: fit-content;
		}

		.project-picture {
			display: none;
		}

		.mobile-project-picture {
			display: block;
			margin: 1em auto;
			cursor: pointer;
		}

		.mobile-project-picture img {
			max-height: 70vw;
			max-width: 70vw;
		}

		.project-circle {
			width: 2vw;
			border-radius: 2vw;
		}

		.project-item:hover .project-circle {
			height: 2vw;
		}

		.project-center {
			width: 2vw;
		}

		.project-desc-text {
			max-height: unset;
			height: fit-content;
			overflow-y: unset;
			margin-top: 0;
		}

		.project-desc {
			margin-right: 1em;
			margin-left: 0;

			max-height: unset;
		}

		.project-desc-frame {
			padding: 1em 1em;
			margin: 2em 1em;
			width: 100%;

			max-height: unset;
		}

		.timeline-top {
			width: 2vw;
			height: 2vw;
			margin-left: 1em;
		}

		.timeline-bottom {
			width: 2vw;
			height: 2vw;
			margin-left: 1em;
		}

		.project-item.reverse {
			flex-direction: row;
		}

		.mobile-image-modal {
			transition: all 1s;
			display: none;
			position: fixed;
			inset: 0;
			padding: 1em;
			z-index: 200;
		}

		.mobile-image-modal button {
			max-height: 100%;
			max-width: 100%;
			height: max-content;
			width: max-content;
			padding: 0;
		}

		.mobile-image-modal button img {
			max-height: 100%;
			max-width: 100%;

			margin: 0;
			border-radius: 6px;
		}

		.mobile-image-modal.show {
			display: flex;
			flex-direction: column;
			justify-content: space-around;
		}
	}
</style>
