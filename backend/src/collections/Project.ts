import Icon from '../icons'
import type { CollectionConfig } from 'payload'

export const Project: CollectionConfig = {
  slug: 'projects',
  fields: [
    { name: 'name', localized: true, type: 'text', label: 'Project name', required: true },
    {
      name: 'description',
      localized: true,
      label: 'Project description',
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
          localized: true,
          label: 'Label',
          type: 'text',
        },
        {
          name: 'url',
          label: 'URL',
          type: 'text',
        },
        {
          name: 'icon',
          label: 'icon',
          type: 'select',
          options: Object.entries(Icon).map(v => {return {label: v[0], value: v[1]}})
        },
      ],
    },
  ],
}
