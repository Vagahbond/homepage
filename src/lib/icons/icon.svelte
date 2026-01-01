<script lang="ts">
	import Arrow from './arrow.svelte';
	import Close from './close.svelte';
	import Code from './code.svelte';
	import Contact from './contact.svelte';
	import Doc from './doc.svelte';
	import Projects from './projects.svelte';
	import Repo from './repo.svelte';
	import Resume from './resume.svelte';
	import Toggle from './toggle.svelte';
	import Try from './try.svelte';
	import Icon from 'backend/src/icons';

	const { icon } = $props<{ icon: Icon }>();
</script>

{#if icon === Icon.ARROW}
	<Arrow />
{:else if icon === Icon.CLOSE}
	<Close />
{:else if icon === Icon.CODE}
	<Code />
{:else if icon === Icon.CONTACT}
	<Contact />
{:else if icon === Icon.DOC}
	<Doc />
{:else if icon === Icon.PROJECTS}
	<Projects />
{:else if icon === Icon.REPO}
	<Repo />
{:else if icon === Icon.RESUME}
	<Resume />
{:else if icon === Icon.TOGGLE}
	<Toggle />
{:else if icon === Icon.TRY}
	<Try />
{/if}
