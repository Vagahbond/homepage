
import type { CollectionConfig } from 'payload'

export const Article: CollectionConfig = {
  slug: 'articles',
  fields: [
    { name: 'title', localized: true, type: 'text', label: 'Title', required: true },
    {
      name: 'exceprt',
      localized: true,
      label: 'Short description',
      type: 'text',
      required: true,
    },
    {
      name: 'text',
      localized: true,
      label: 'Text',
      type: 'richText',
      required: true,
    },
  ],
}
