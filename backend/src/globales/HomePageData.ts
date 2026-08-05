import Icon from '../icons'
import type { GlobalConfig } from 'payload'

export const HomePageData: GlobalConfig = {
  slug: 'homePageData',
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
      required: true,
      defaultValue: ''
    },

    {
      label: 'Location',
      localized: true,
      name: 'location',
      type: 'text',
      required: true
    },
    {
      label: 'Destruction-message',
      localized: true,
      name: 'destructionMessage',
      type: 'text',
      required: false
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
    {
      label: 'Navigation links',
      name: 'nav',
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
}
