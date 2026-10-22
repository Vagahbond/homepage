import { error, redirect } from '@sveltejs/kit';
import {
	canonicalEnglishPath,
	isSupportedLanguage,
	type SupportedLanguage
} from '../utils/language';

export const languageEntries = () => [{ lang: undefined }, { lang: 'fr' }, { lang: 'en' }];

export function getPageLanguage(language: string | undefined, url: URL): SupportedLanguage {
	if (language === 'en') {
		redirect(308, canonicalEnglishPath(url.pathname));
	}

	if (language === undefined) return 'en';
	if (isSupportedLanguage(language)) return language;

	error(404, 'Unsupported language');
}
