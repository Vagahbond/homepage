import type { Experience, ExperiencesPageDatum } from "$lib/payload-types";
import payloadHandle, { SupportedLanguages } from "$lib/utils/payload"
import { type PaginatedDocs } from "payload";
import type { EntryGenerator, PageServerLoad } from "./$types";
import { redirect } from "@sveltejs/kit";
import type { Config } from "$lib/payload-types"

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

  const experiences: PaginatedDocs<Experience> = await payload.find({
    collection: 'experiences',
    locale: params.lang as Config["locale"],
    sort: ['index', '-date'],
    limit: 100
  });

  const labels: ExperiencesPageDatum = await payload.findGlobal({
    slug: "experiencesPageData",
    locale: params.lang as Config["locale"]
  })

  return { experiences, labels };
}
