<script lang="ts">
	import 'css-doodle';
</script>

<div id="bg-anim">
	<css-doodle>
		@grid: 20 / 100vmax; background: var(--bg); scale:calc( 1.4 + cos(@rand(0, .9) * @t(/1000))/2);
		clip-path:
	</css-doodle>
</div>

<style>
	#bg-anim {
		position: fixed;
		padding: 0;
		width: 100%;
		display: grid;
		height: 100%;
		background: var(--accent);
		block-size: 100%;
		color: var(--fg);
	}
</style>
