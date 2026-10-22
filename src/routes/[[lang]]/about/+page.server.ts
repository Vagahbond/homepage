import { getPageLanguage, languageEntries } from '$lib/server/language';
import type { PageServerLoad } from './$types';
import payloadHandle from '$lib/utils/payload';
import type { EntryGenerator } from './$types';
import type { ExperiencesPageDatum } from '$lib/payload-types';

export const entries: EntryGenerator = languageEntries;

export const load: PageServerLoad = async ({ url, params }) => {
	const lang = getPageLanguage(params.lang, url);

	const articleIndex = '1'; // url.searchParams.get('article');

	const payload = await payloadHandle.getInstance();

	const labels: ExperiencesPageDatum = await payload.findGlobal({
		slug: 'aboutPageData',
		locale: lang
	});

	const article = await payload.find({
		collection: 'articles',
		sort: ['-date'],
		locale: lang,
		limit: 1,
		page: articleIndex ? parseInt(articleIndex) : 1
	});

	const nextArticle = { docs: [] }; /* await payload.find({
    collection: 'articles',
    sort: ["-date"],
    locale: params.lang as Config['locale'],
    limit: 1,
    page: articleIndex ? parseInt(articleIndex) + 1 : 2
  });
*/
	return {
		article: article.docs[0],
		nextArticle: nextArticle.docs[0],
		currentIndex: Number.parseInt(articleIndex ?? '1'),
		labels
	};
};
