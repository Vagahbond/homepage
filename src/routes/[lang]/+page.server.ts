import { SupportedLanguages } from "$lib/utils/payload";
import { redirect } from "@sveltejs/kit";
import type { EntryGenerator, PageServerLoad } from "./$types";
import payloadHandle from "$lib/utils/payload"
import type { Config } from "$lib/payload-types";

export const entries: EntryGenerator = () => {
  return [
    { lang: 'fr' },
    { lang: 'en' }
  ];
};


export const load: PageServerLoad = async ({ params }) => {
  if (!SupportedLanguages.includes(params.lang)) {
    redirect(308, "/")
  }

  const payload = await payloadHandle.getInstance()
  const labels = await payload.findGlobal({
    slug: 'homePageData',
    locale: params.lang as Config["locale"]
  });

  return { labels };
}
