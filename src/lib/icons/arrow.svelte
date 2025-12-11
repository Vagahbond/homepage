<script lang="ts">
	import { onMount } from 'svelte';

	type Direction = 'left' | 'right' | 'up' | 'down';

	const { direction } = $props<{ direction?: Direction }>();

	let rotation = $state(0);

	onMount(() => {
		switch (direction) {
			case 'left':
				rotation = 90;
				break;
			case 'right':
				rotation = 270;
				break;
			case 'up':
				rotation = 180;
				break;
		}
	});
</script>

<svg viewBox="0 0 24 24" xmlns="http://www.w3.org/2000/svg" style:rotate={`${rotation}deg`}>
	<path
		d="M12 2C6.48 2 2 6.48 2 12s4.48 10 10 10 10-4.48 10-10S17.52 2 12 2m0 13.5L7.5 11l1.42-1.41L12 12.67l3.08-3.08L16.5 11z"
	></path>
</svg>
