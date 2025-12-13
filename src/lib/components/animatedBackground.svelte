<script lang="ts">
	import 'css-doodle';
</script>

<!-- <video id="bg-video" loop muted autoplay src="/background.webm"></video> -->
<div id="bg-anim">
	<css-doodle>
		@grid: 20 / 100vmax; background: var(--bg); scale:calc( 1.4 + cos(@rand(0, .9) * @t(/1000))/2);
		clip-path:
	</css-doodle>
	<!-- <css-doodle grid="13x20">
		translate: calc(-50% - ((@ux - (@uw / 2)) * 0.001) * sin(6*@t(/40, +@y(*π), %360deg)) * 30%) 0;
		@content: ✦
	</css-doodle>
	<!--	<css-doodle>
			@grid: 50 / 100vmax; border-radius: 50%; background: var(--fg); scale:sin(@atan2(@dy , @dx ) /
			@t(/500)); rotate: -90deg;
		</css-doodle>
	</css-doodle> -->
</div>

<style>
	#bg-video {
		position: fixed;
		right: 0;
		bottom: 0;
		min-width: 100%;
		min-height: 100%;
	}

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
