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

		<a class="project-link" href="https://github.com">
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
		width: 100%;
		height: 100%;
		overflow-x: scroll;
	}

	.project-link {
		display: flex;
		flex-direction: column;
		justify-content: space-around;
		text-align: center;

		min-width: max-content;
		width: 6vh;
		margin-left: 1em;
	}

	.project-link:hover {
		font-weight: bolder;
	}

	.project-link-icon {
		transition: all 1s;
		min-height: 6vh;
		margin: 0 auto;
		margin-bottom: 0.5em;
		fill: var(--fg);
		overflow: hidden;
	}

	.project-link:hover .project-link-icon {
		transform: rotateY(360deg);
	}
</style>
