import adapter from '@sveltejs/adapter-static';
import { vitePreprocess } from '@sveltejs/vite-plugin-svelte';
import { config as envConfig } from "dotenv"
envConfig();

/** @type {import('@sveltejs/kit').Config} */
const config = {
  // Consult https://svelte.dev/docs/kit/integrations
  // for more information about preprocessors

  preprocess: vitePreprocess(),
  kit: {
    prerender: {
      handleHttpError: ({ path, _, message }) => {
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
