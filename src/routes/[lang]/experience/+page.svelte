<script lang="ts">
	import RichText from '$lib/components/richText.svelte';
	import type { Experience, ExperiencesPageDatum, Project } from '$lib/payload-types';
	import type { PaginatedDocs } from 'payload';

	const { data } = $props<{
		data: { experiences: PaginatedDocs<Experience>; labels: ExperiencesPageDatum };
	}>();

	function formatDate(date: string) {
		const month = new Date(date).getMonth() + 1;
		const year = new Date(date).getFullYear();
		return `${month < 10 ? '0' : ''}${month}/${year}`;
	}
</script>

<div class="experiences-screen">
	<div class="title bordered blurred-bg">
		<h1>{data.labels.title}</h1>
		<h4 class="subtitle">{data.labels.subtitle}</h4>
	</div>

	<div class="experiences-container">
		{#each data.experiences.docs as experience, index (index)}
			{@const imageUrl = `/image/${btoa(experience?.image?.url)}`}

			<link rel="preload" as="image" href={imageUrl} />

			<div class="experience-item">
				<div class="experience-description">
					<h1 class="experience-name">{experience.name}</h1>
					<div class="experience-subtitle">
						<h3 class="experience-location">{experience.location}</h3>
						<h6 class="experience-date">
							{formatDate(experience.start)} - {formatDate(experience.end)}
						</h6>
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

				<div class="experience-picture">
					<img
						alt={experience?.image?.alt ?? ''}
						class="screen-shape screen-shadow"
						src={imageUrl}
					/>
				</div>
			</div>
		{/each}
	</div>
</div>

<style>
	* {
		z-index: 10;
	}

	.experiences-screen {
		display: flex;
		flex-direction: column;
		justify-content: center;

		width: 100vw;
		min-width: 100vw;

		z-index: 10;
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
		z-index: 10;
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

	.experience-item {
		display: flex;
		flex-direction: row;
		justify-content: center;
		align-items: center;
		width: 100%;
	}

	.experience-picture {
		width: 40%;
		display: flex;
		justify-content: center;
		align-items: center;
		padding: 2em;
	}

	.experience-picture img {
		backdrop-filter: blur(10px);
		padding: 2em;
		max-height: 220px;
		max-width: 440px;
		object-fit: contain;
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
</style>
