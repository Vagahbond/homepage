
import { SupportedLanguages } from "$lib/utils/payload";
import { redirect } from "@sveltejs/kit";
import type { PageServerLoad } from "../$types";
import payloadHandle from "$lib/utils/payload"
import type { EntryGenerator } from "./$types";
import type { Config } from "$lib/payload-types";

export const entries: EntryGenerator = () => {
  return [
    { lang: 'fr' },
    { lang: 'en' }
  ];
};


export const load: PageServerLoad = async ({ url, params }) => {
  if (!SupportedLanguages.includes(params.lang)) {
    redirect(308, "/")
  }

  const articleIndex = "1";// url.searchParams.get('article');

  const payload = await payloadHandle.getInstance()

  const article = await payload.find({
    collection: 'articles',
    sort: ["-date"],
    locale: params.lang as Config['locale'],
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
  return { article: article.docs[0], nextArticle: nextArticle.docs[0], currentIndex: Number.parseInt(articleIndex ?? "1") };
}
