<script lang="ts">
	import Doc from '$lib/icons/doc.svelte';
	import Repo from '$lib/icons/repo.svelte';
	import Try from '$lib/icons/try.svelte';
	import { PortableText } from '@portabletext/svelte';

	const { project, color } = $props();
</script>

<div class="project-desc">
	<div class="project-desc-frame bordered blurred-bg" style:--accent={color}>
		<h1>{project.name}</h1>
		<h6 class="project-date">{project.date}</h6>
		<span class="project-desc-text">
			<PortableText value={project.description.root.children} />
		</span>
		<div class="icons-container">
			<a class="project-link" href="https://github.com">
				<div class="project-link-icon">
					<Repo />
				</div>
				Source
			</a>
			<a class="project-link" href="https://github.com">
				<div class="project-link-icon">
					<Doc />
				</div>
				Documentation
			</a>
			<a class="project-link" href="https://github.com">
				<div class="project-link-icon">
					<Try />
				</div>
				Demo
			</a>
		</div>
	</div>
</div>

<style>
	.project-desc {
		width: 98.5vw;
		height: 100%;
		vertical-align: middle;
		display: flex;
	}

	.project-desc h1 {
		margin: 0;
	}

	.project-desc-frame {
		transition: all 1s;
		display: flex;
		width: 28em;
		margin: auto;
		flex-direction: column;
		justify-content: center;
		padding: 4em;
		padding-top: 2em;
		padding-bottom: 2em;
		background: transparent;
	}

	.project-date {
		filter: brightness(70%);
		margin: 0;
	}

	.project-desc-text {
		margin-top: 2em;
	}

	.icons-container {
		margin-top: 2em;
		display: flex;
		flex-direction: row;
		width: 100%;
	}

	.project-link {
		display: flex;
		flex-direction: column;
		justify-content: center;
		margin-right: 1em;
		margin-left: 1em;
	}

	.project-link:hover {
		font-weight: bolder;
	}

	.project-link-icon {
		margin: auto;
		margin-bottom: 0.5em;
		width: 1.5em;
		height: 1.5em;
	}
</style>
