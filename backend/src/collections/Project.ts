import type { CollectionConfig } from 'payload'

export const Project: CollectionConfig = {
  slug: 'projects',
  fields: [
    { name: 'name', type: 'text', label: 'Project name', required: true },
    {
      name: 'description',
      label: 'Porject description',
      type: 'richText',
      required: true,
    },
    {
      name: 'image',
      type: 'upload',
      relationTo: 'media',
    },

    { name: 'date', label: 'Last date that the project has been worked on', type: 'date' },
    {
      name: 'links',
      label: 'Links to access the project',
      type: 'array',
      fields: [
        {
          name: 'label',
          label: 'Will be shown on the interface',
          type: 'text',
        },
        {
          name: 'url',
          label: 'An URL to send the user to',
          type: 'text',
        },
      ],
    },
  ],
}
