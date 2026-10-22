import type { Experience, ExperiencesPageDatum } from '$lib/payload-types';
import payloadHandle from '$lib/utils/payload';
import { type PaginatedDocs } from 'payload';
import type { EntryGenerator, PageServerLoad } from './$types';
import { getPageLanguage, languageEntries } from '$lib/server/language';

export const entries: EntryGenerator = languageEntries;

export const load: PageServerLoad = async ({ params, url }) => {
	const lang = getPageLanguage(params.lang, url);

	const payload = await payloadHandle.getInstance();

	const experiences: PaginatedDocs<Experience> = await payload.find({
		collection: 'experiences',
		locale: lang,
		sort: ['-date'],
		limit: 100
	});

	const labels: ExperiencesPageDatum = await payload.findGlobal({
		slug: 'experiencesPageData',
		locale: lang
	});

	return { experiences, labels };
};
