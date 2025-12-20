<script lang="ts">

</script>

<div class="container">
	<div class="home-screen">
		<div id="avatar-picture" class="bordered blurred-bg">
			<img src="/snail.png" />
		</div>
		<div class="bordered blurred-bg name">
			<h1 id="name">Yoni Firroloni</h1>
			<h4 id="aka">A.K.A.</h4>
			<h1 id="username">Vagahbond</h1>
			<h2 id="title">Software Engineer</h2>
			<h3 id="location">
				Location: <span id="location-name">New Zealand</span>
			</h3>
		</div>
	</div>
</div>

<style>
	.container {
		transition: all 0.5s ease-in-out;

		position: relative;
		right: 0;
		left: 0;
		bottom: 0;
		top: 0;

		color: var(--fg);
	}

	.home-screen {
		display: flex;
		justify-content: space-evenly;

		height: 100vh;
		width: 100vw;
		min-width: 100vw;
	}

	#avatar-picture * {
		margin: auto;
	}

	#avatar-picture {
		width: 20em;
		height: 20em;
		display: block;
		margin-top: auto;
		margin-bottom: auto;

		border-radius: 50%;

		display: flex;
	}

	#avatar-picture:hover {
		animation: 2s ease infinite spring;
	}

	.name {
		transition: all 0.5s ease-in-out;
		padding: 1em 5em;
		margin-top: auto;
		margin-bottom: auto;

		display: flex;
		flex-direction: column;
		justify-content: space-between;
	}

	.name * {
		transition: all 0.5s ease-in-out;

		display: flex;
		flex-direction: column;
		justify-content: space-around;
	}

	#name {
		height: 1.75em;
		margin: 0;
	}

	#title {
		color: var(--accent);
	}

	#aka,
	#username {
		height: 0;
		overflow: hidden;
		white-space: nowrap;
		margin: 0;
	}

	#username {
		color: var(--accent);
	}

	#location {
		color: var(--fg);
		white-space: nowrap;
		display: block;
	}

	#location-name {
		color: var(--accent);
		white-space: nowrap;
		display: inline;
	}

	.name:hover #aka,
	.name:hover #username {
		height: 1.75em;
	}
</style>
