import adapter from '@sveltejs/adapter-static';
import { vitePreprocess } from '@sveltejs/vite-plugin-svelte';
import { getSiteOrigin } from './src/lib/utils/site.ts';
import { config as envConfig } from 'dotenv';
envConfig();

const siteOrigin = getSiteOrigin(
  process.env.PUBLIC_SITE_ORIGIN ??
  (process.argv.includes('build') ? undefined : 'http://localhost:5173')
);
process.env.PUBLIC_SITE_ORIGIN = siteOrigin;

/** @type {import('@sveltejs/kit').Config} */
const config = {
  // Consult https://svelte.dev/docs/kit/integrations
  // for more information about preprocessors

  preprocess: vitePreprocess(),
  kit: {
    prerender: {
      origin: siteOrigin,
      handleHttpError: ({ message }) => {
        /* if (path === "/") {
           return
         }*/

        // otherwise fail the build
        throw new Error(message);
      }
    },
    typescript: {
      config: (cfg) => {
        cfg.exclude = ['data'];
      }
    },
    adapter: adapter()
  }
};

export default config;
