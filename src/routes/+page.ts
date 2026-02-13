import { redirect } from '@sveltejs/kit';

export function load() {
  const locale = Intl.DateTimeFormat().resolvedOptions().timeZone
  if (locale === 'Europe/Paris') {
    return redirect(302, '/fr');
  }
  redirect(302, '/en');
}
