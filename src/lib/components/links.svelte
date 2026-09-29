<script lang="ts">
	import Icon from '$lib/icons/icon.svelte';
	import type { Project } from '$lib/payload-types';
	import IconEnum from 'backend/src/icons';

	interface Props {
		links: Project['links'];
	}

	const { links, ...props }: Props = $props();
</script>

<div {...props} class="links-container">
	{#each links as link, index (index)}
		{@const icon = link.icon
			? (Object.values(IconEnum).find((v) => v === link.icon) ?? IconEnum.CLOSE)
			: IconEnum.CLOSE}

		<a class="project-link" href={link.url}>
			<div class="project-link-icon">
				<Icon width="auto" height="100%" {icon} />
			</div>
			{link.label}
		</a>
	{/each}
</div>

<style>
	.links-container {
		display: flex;
		flex-direction: row;
		justify-content: space-between;
		width: 100%;
		height: 100%;
		overflow-x: auto;
	}

	.project-link {
		display: flex;
		flex-direction: column;
		justify-content: space-around;
		text-align: center;

		min-width: max-content;
		width: 6vh;
		margin-left: 1em;
		border-radius: 0.5em;
		backdrop-filter: blur(10px);
		padding: 0.2em;
	}

	.project-link:hover {
		font-weight: bolder;
	}

	.project-link-icon {
		transition: all 1s;
		min-height: 3vh;
		max-height: 3vh;
		margin: 0 auto;
		margin-bottom: 0.5em;
		overflow: hidden;
		color: var(--accent);
	}

	.project-link:hover .project-link-icon {
		transform: rotateY(360deg);
	}
</style>
