import type { GlobalConfig } from 'payload'

export const AboutPageData: GlobalConfig = {
  slug: 'aboutPageData',
  access: {
    read: () => true,
  },
  fields: [
    {
      label: 'Title',
      name: 'title',
      type: 'text',
      localized: true,
      required: true
    },
    {
      label: 'Meta description',
      localized: true,
      name: 'metaDescription',
      type: 'textarea',
      required: true,
      defaultValue: ""
    },
    {
      label: 'Text',
      name: 'text',
      type: 'richText',
      localized: true,
      required: true,
    },
  ]
}
