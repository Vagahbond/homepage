import type { EntryGenerator, PageServerLoad } from './$types';
import { getPageLanguage, languageEntries } from '$lib/server/language';
import { canonicalEnglishPath } from '$lib/utils/language';
import payloadHandle from '$lib/utils/payload';

export const entries: EntryGenerator = languageEntries;

export const load: PageServerLoad = async ({ params, url }) => {
	const lang = getPageLanguage(params.lang, url);
	const payload = await payloadHandle.getInstance();
	const labels = await payload.findGlobal({
		slug: 'homePageData',
		locale: lang
	});

	return {
		labels: {
			...labels,
			nav: labels.nav?.map((link) => ({
				...link,
				url: link.url ? canonicalEnglishPath(link.url) : link.url
			}))
		}
	};
};
