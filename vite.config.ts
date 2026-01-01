import { sveltekit } from '@sveltejs/kit/vite';
import { fileURLToPath } from 'node:url';
import { defineConfig } from 'vite';

const exclude = [ fileURLToPath(new URL('./data', import.meta.url))];

export default defineConfig({
	optimizeDeps: {
		exclude: exclude
	},
	server: {
    fs: {
            allow: ['backend/src/icons.ts'],

    },
		watch: {
			ignored: exclude
		}
	},
	build: {
		rollupOptions: {
      external: exclude,
			watch: {
				exclude: exclude
			}
		}
	},
	plugins: [sveltekit()]
});
