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
          label: 'Location',
          localized: true,
          name: 'location',
          type: 'text',
          required: true
        },
  ]
}
