<script lang="ts">
	import { cubicIn, cubicOut } from 'svelte/easing';
	import { fly } from 'svelte/transition';

	const { children, forward } = $props();
	let animXCoord = $derived(forward ? 1200 : -1200);
</script>

<div
	out:fly={{ delay: 0, duration: 500, x: -animXCoord, easing: cubicIn }}
	in:fly={{ delay: 500, duration: 500, x: animXCoord, easing: cubicOut }}
>
	{@render children()}
</div>
