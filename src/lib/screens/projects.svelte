<script lang="ts">
	import avatar from '$lib/assets/avatar.jpg';
	import ProjectCard from '$lib/components/projectCard.svelte';
	import { AccentColor } from '$lib/utils/colors';

	interface Project {
		name: string;
		description: string;
		image: typeof avatar;
		date: Date;
	}

	let projects: Project[] = [
		{ name: 'Project 1', description: 'Some project', image: avatar, date: new Date() },
		{ name: 'Project 2', description: 'Some proSome projectject', image: avatar, date: new Date() },
		{ name: 'Project 3', description: 'Some projecSome projectt', image: avatar, date: new Date() },
		{
			name: 'Project 4',
			description: 'Some proSome projectSome projectject',
			image: avatar,
			date: new Date()
		},
		{
			name: 'Project 5',
			description: 'Some projSome projectSome projectSome projectect',
			image: avatar,
			date: new Date()
		},
		{
			name: 'Project 6',
			description: 'Some proSome projectSome projectSome projectSome projectject',
			image: avatar,
			date: new Date()
		},
		{
			name: 'Project 7',
			description: 'Some prSome projectSome projectSome projectSome projectoject',
			image: avatar,
			date: new Date()
		},
		{
			name: 'Project 8',
			description: 'Some prSome projectSome projectSome projectoject',
			image: avatar,
			date: new Date()
		}
	];

	const initialIndex = Math.floor(Math.random() * projects.length);

	function getProjectColor(index: number) {
		const colors = Object.values(AccentColor);
		return colors[(initialIndex + index) % colors.length];
	}
</script>

<div class="projects-screen">
	<div class="title bordered blurred-bg">
		<h1>Practice makes perfect</h1>
		<h4 class="subtitle">Building the expertise your enterprise needs.</h4>
	</div>
	<div class="timeline-top bordered blurred-bg"></div>
	{#each projects as project, index (index)}
		{@const color = getProjectColor(index)}
		<div class="project-item">
			{#if !(index % 2)}
				<div class="project-picture">
					<img
						alt={project.name}
						src={project.image}
						class="bordered blurred-bg"
						style:--accent={color}
					/>
				</div>
				<div class="project-center blurred-bg bordered" style:--accent={color}>
					<div class="project-circle" style:--accent={color}></div>
				</div>
				<ProjectCard {project} {color} />
			{:else}
				<ProjectCard {project} {color} />
				<div class="project-center blurred-bg bordered" style:--accent={color}>
					<div class="project-circle" style:--accent={color}></div>
				</div>
				<div class="project-picture">
					<img
						alt={project.name}
						src={project.image}
						class="bordered blurred-bg"
						style:--accent={color}
					/>
				</div>
			{/if}
		</div>
	{/each}
	<div class="timeline-bottom bordered blurred-bg"></div>
</div>

<style>
	.title {
		transition: all 1s;
		margin-left: 2em;
		margin-right: auto;
		margin-top: 1em;
		padding-left: 1em;
		padding-right: 1em;
		padding-top: 0.5em;
		padding-bottom: 0.5em;
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
		justify-content: center;
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
		border-radius: 6px;
		background-color: var(--accent);
		width: 1vw;
		height: 90%;
		transition: all 1s;
	}

	.project-picture {
		width: 98.5vw;
		display: flex;
		justify-content: center;
	}

	.project-item:hover .project-picture img {
		transition: all 1s;
		max-width: 30em;
		max-height: 30em;
	}

	.project-picture img {
		max-width: 28em;
		max-height: 28em;
		object-fit: cover;
		margin: auto;
	}
</style>
