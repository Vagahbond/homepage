import type { Project } from "$lib/payload-types";
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
  const projects: PaginatedDocs<Project> = await payload.find({
    collection: 'projects',
    locale: params.lang as Config["locale"]
  });
  const labels = await payload.findGlobal({
    slug: "projectsPageData",
    locale: params.lang as Config["locale"]
  })

  return { projects, labels };
}
