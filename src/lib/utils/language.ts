export const supportedLanguages = ['en', 'fr'] as const;

export type SupportedLanguage = (typeof supportedLanguages)[number];

export function isSupportedLanguage(language: string | undefined): language is SupportedLanguage {
	return supportedLanguages.some((supported) => supported === language);
}

export function pickLanguage(cookies: string, browserLanguage: string): SupportedLanguage {
	const saved = cookies
		.split(';')
		.map((cookie) => cookie.trim())
		.find((cookie) => cookie.startsWith('lang='))
		?.slice('lang='.length);

	if (isSupportedLanguage(saved)) return saved;

	const language = browserLanguage.slice(0, 2).toLowerCase();
	return isSupportedLanguage(language) ? language : 'en';
}
