export function getSiteOrigin(value: string | undefined): string {
	if (!value) {
		throw new Error('PUBLIC_SITE_ORIGIN must be set when building the site');
	}

	const url = new URL(value);
	if (
		!['http:', 'https:'].includes(url.protocol) ||
		url.username ||
		url.password ||
		url.pathname !== '/' ||
		url.search ||
		url.hash
	) {
		throw new Error('PUBLIC_SITE_ORIGIN must be an HTTP(S) origin without a path or credentials');
	}

	return url.origin;
}
