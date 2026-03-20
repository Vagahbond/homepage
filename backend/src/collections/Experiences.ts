
import type { CollectionConfig } from 'payload'

export const Experience: CollectionConfig = {
  slug: 'experiences',
  fields: [
    { name: 'name', localized: true, type: 'text', label: 'Company name', required: true },
    {
      name: 'description',
      localized: true,
      label: 'Experience description',
      type: 'richText',
      required: true,
    },
    {
      name: 'image',
      type: 'upload',
      relationTo: 'media',
    },

    { name: 'start', label: 'When did it start', type: 'date' },
    { name: 'end', label: 'When did it end', type: 'date' },
    {
      name: 'techs',
      label: 'Technologies involved',
      type: 'array',
      fields: [
        {
          name: 'label',
          label: 'Label',
          type: 'text',
        },
        {
          name: 'icon',
          label: 'icon',
          type: 'text',
        },
      ],
    },
  ],
}
