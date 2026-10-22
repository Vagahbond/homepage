import type { Project, ProjectsPageDatum } from '$lib/payload-types';
import payloadHandle from '$lib/utils/payload';
import { type PaginatedDocs } from 'payload';
import type { EntryGenerator, PageServerLoad } from './$types';
import { getPageLanguage, languageEntries } from '$lib/server/language';

export const entries: EntryGenerator = languageEntries;

export const load: PageServerLoad = async ({ params, url }) => {
	const lang = getPageLanguage(params.lang, url);

	const payload = await payloadHandle.getInstance();

	const projects: PaginatedDocs<Project> = await payload.find({
		collection: 'projects',
		locale: lang,
		sort: ['index', '-date'],
		limit: 100
	});

	const labels: ProjectsPageDatum = await payload.findGlobal({
		slug: 'projectsPageData',
		locale: lang
	});

	return { projects, labels };
};
