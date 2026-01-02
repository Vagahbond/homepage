<script lang="ts">
	import Arrow from './arrow.svelte';
	import Close from './close.svelte';
	import Code from './code.svelte';
	import Contact from './contact.svelte';
	import Doc from './doc.svelte';
	import Github from './github.svelte';
	import Linkedin from './linkedin.svelte';
	import Mail from './mail.svelte';
	import Projects from './projects.svelte';
	import Repo from './repo.svelte';
	import Resume from './resume.svelte';
	import Toggle from './toggle.svelte';
	import Try from './try.svelte';
	import Icon from 'backend/src/icons';

	const { icon, ...props } = $props();
</script>

{#if icon === Icon.ARROW}
	<Arrow {...props} />
{:else if icon === Icon.CLOSE}
	<Close {...props} />
{:else if icon === Icon.CODE}
	<Code {...props} />
{:else if icon === Icon.CONTACT}
	<Contact {...props} />
{:else if icon === Icon.DOC}
	<Doc {...props} />
{:else if icon === Icon.PROJECTS}
	<Projects {...props} />
{:else if icon === Icon.REPO}
	<Repo {...props} />
{:else if icon === Icon.RESUME}
	<Resume {...props} />
{:else if icon === Icon.TOGGLE}
	<Toggle {...props} />
{:else if icon === Icon.TRY}
	<Try {...props} />
{:else if icon === Icon.GITHUB}
	<Github {...props} />
{:else if icon === Icon.LINKEDIN}
	<Linkedin {...props} />
{:else if icon === Icon.MAIL}
	<Mail {...props} />
{/if}
