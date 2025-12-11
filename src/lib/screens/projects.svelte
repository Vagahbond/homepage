<script lang="ts">
	import avatar from '$lib/assets/avatar.jpg';
	import Arrow from '$lib/icons/arrow.svelte';

	interface Project {
		name: string;
		description: string;
		image: typeof avatar;
	}
	let projects: Project[] = [
		{ name: 'Project 1', description: 'Some project', image: avatar },
		{ name: 'Project 2', description: 'Some proSome projectject', image: avatar },
		{ name: 'Project 3', description: 'Some projecSome projectt', image: avatar },
		{ name: 'Project 4', description: 'Some proSome projectSome projectject', image: avatar },
		{
			name: 'Project 5',
			description: 'Some projSome projectSome projectSome projectect',
			image: avatar
		},
		{
			name: 'Project 6',
			description: 'Some proSome projectSome projectSome projectSome projectject',
			image: avatar
		},
		{
			name: 'Project 7',
			description: 'Some prSome projectSome projectSome projectSome projectoject',
			image: avatar
		},
		{
			name: 'Project 8',
			description: 'Some prSome projectSome projectSome projectoject',
			image: avatar
		}
	];
</script>

<div class="projects-screen">
	<div class="timeline-top">
		<Arrow direction="up" />
	</div>
	{#each projects as project, index (index)}
		<div class="project-item">
			{#if index % 2}
				<div class="project-picture">
					<img alt={project.name} src={project.image} class="bordered blurred-bg" />
				</div>
				<div class="project-center blurred-bg">
					<div class="project-circle"></div>
				</div>
				<div class="project-desc">
					<div class="project-desc-frame bordered blurred-bg">
						<h1>{project.name}</h1>
						<span>
							{project.description}
						</span>
					</div>
				</div>
			{:else}
				<div class="project-desc">
					<div class="project-desc-frame bordered blurred-bg">
						<h1>{project.name}</h1>
						<span>
							{project.description}
						</span>
					</div>
				</div>

				<div class="project-center blurred-bg">
					<div class="project-circle"></div>
				</div>
				<div class="project-picture">
					<img alt={project.name} src={project.image} class="bordered blurred-bg" />
				</div>
			{/if}
		</div>
	{/each}
</div>

<style>
	.projects-screen {
		display: flex;
		flex-direction: column;
		justify-content: center;

		width: 100vw;
		min-width: 100vw;
		overflow: scroll;
	}

	.timeline-top {
		height: 3.25vw;
		width: 3.25vw;
		margin-top: 2em;
		margin-right: auto;
		margin-left: auto;
		margin-bottom: -1em;
		border-radius: 50%;
		background-color: var(--fg);
		color: var(--fg);
		z-index: 10;
	}

	.project-item {
		width: 100%;
		height: 80vh;
		display: flex;
		justify-content: center;
	}

	.project-center {
		background: transparent;
		width: 1vw;
		border-left: 0.25vw solid var(--fg);
		border-right: 0.25vw solid var(--fg);
		display: flex;
		overflow: visible;
	}

	.project-circle {
		margin: auto;
		background-color: var(--accent);
		border-radius: 50%;
		width: 1vw;
		height: 1vw;
	}

	.project-desc {
		width: 98.5vw;
		height: 100%;
		vertical-align: middle;
		display: flex;
	}

	.project-desc-frame {
		display: flex;
		max-width: 28em;
		margin: auto;
		flex-direction: column;
		justify-content: center;
		padding: 4em;
		background: transparent;
	}

	.project-picture {
		width: 98.5vw;
		display: flex;
		justify-content: center;
	}

	.project-picture img {
		max-width: 28em;
		max-height: 28em;
		object-fit: cover;
		margin: auto;
	}
</style>
