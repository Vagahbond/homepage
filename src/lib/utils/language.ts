export const supportedLanguages = ['en', 'fr'] as const;

export type SupportedLanguage = (typeof supportedLanguages)[number];

export function isSupportedLanguage(language: string | undefined): language is SupportedLanguage {
  return supportedLanguages.some((supported) => supported === language);
}

export function canonicalEnglishPath(path: string): string {
  if (!/^\/en(?=\/|[?#]|$)/.test(path)) return path;

  const unprefixed = path.slice('/en'.length);
  return !unprefixed || /^[?#]/.test(unprefixed) ? `/${unprefixed}` : unprefixed;
}
