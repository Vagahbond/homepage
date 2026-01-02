import type { GlobalConfig } from 'payload'
import Icon from '../icons'

export const ContactPageData: GlobalConfig = {
  slug: 'contactPageData',
  access: {
    read: () => true,
  },
  fields: [
    {
      label: 'Top Left frame',
      name: 'topLeft',
      type: 'group',
      fields: [
        {
          label: 'Title',
          name: 'title',
          type: 'text',
          localized: true,
          required: true
        },
        {
          label: 'Text',
          name: 'text',
          type: 'richText',
          localized: true,
          required: true,
        },
      ]
    },
    {
      label: 'Top Right frame',
      name: 'topRight',
      type: 'group',
      fields: [
        {
          label: 'Title',
          name: 'title',
          type: 'text',
          localized: true,
          required: true
        },
        {
          label: 'Text',
          name: 'text',
          type: 'richText',
          localized: true,
          required: true,
        },
      ]
    },
    {
      label: 'Bottom Left frame',
      name: 'bottomLeft',
      type: 'group',
      fields: [
        {
          label: 'Title',
          name: 'title',
          type: 'text',
          localized: true,
          required: true
        },
        {
          label: 'Text',
          name: 'text',
          type: 'richText',
          localized: true,
          required: true,
        },
      ]
    },
    {
      label: 'Bottom Right frame',
      name: 'bottomRight',
      type: 'group',
      fields: [
        {
          label: 'Title',
          name: 'title',
          type: 'text',
          required: true,
          localized: true,
        },
        {
          label: 'Email',
          name: 'email',
          type: 'text',
          required: true,
          localized: true,
        },
        {
          label: 'Links',
          name: 'links',
          type: 'array',
          fields: [
            {
              name: 'label',
              label: 'Label',
              type: 'text',
              localized: true
            },
            {
              name: 'url',
              label: 'URL',
              type: 'text',
              localized: true
            },
            {
              name: 'icon',
              label: 'icon',
              type: 'select',
              options: Object.entries(Icon).map(v => { return { label: v[0], value: v[1] } })
            },
          ]
        },
      ]
    },
  ],
}
