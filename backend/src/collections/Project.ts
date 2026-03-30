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
      name: 'index', label: 'How important is the project, 1 being the most important and 10 being the least important', type: 'number', required: true,
      min: 1,
      max: 10,
    },
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
          options: Object.entries(Icon).map(v => { return { label: v[0], value: v[1] } })
        },
      ],
    },
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
