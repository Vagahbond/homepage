import type { Handle } from '@sveltejs/kit';
import { isSupportedLanguage } from '$lib/utils/language';

export const handle: Handle = ({ event, resolve }) => {
	const lang = isSupportedLanguage(event.params.lang) ? event.params.lang : 'en';

	return resolve(event, {
		transformPageChunk: ({ html }) => html.replace('<html lang="en">', `<html lang="${lang}">`)
	});
};
