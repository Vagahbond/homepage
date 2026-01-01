import type { GlobalConfig } from 'payload'

export const ProjectsPageData: GlobalConfig = {
  slug: 'projectsPageData',
  access: {
    read: () => true,
  },
  fields: [
    {
      label: 'Title',
      localized: true,
      name: 'title',
      type: 'text',
      required: true
    },
    {
      label: 'Subtitle',
      localized: true,
      name: 'subtitle',
      type: 'text',
      required: true
    },
  ]
}
