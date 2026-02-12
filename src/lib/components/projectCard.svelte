<script lang="ts">
	import Icon from '$lib/icons/icon.svelte';
	import type { Project } from '$lib/payload-types';
	import Links from './links.svelte';
	import RichText from './richText.svelte';

	let { project, color } = $props<{ project: Project; color: string }>();

	const date = $derived(new Date(project.date));
</script>

<div class="project-desc-frame bordered blurred-bg" style:--accent={color}>
	<h1>{project.name}</h1>
	<h6 class="project-date">{date.getMonth()}/{date.getFullYear()}</h6>
	<div class="project-desc-text">
		<RichText value={project.description} />
	</div>
	<div class="icons-container">
		<Links links={project.links} />
	</div>
</div>

<style>
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
		padding: 4em;
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
</style>
