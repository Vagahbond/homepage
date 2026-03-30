import { error } from '@sveltejs/kit';
import type { RequestHandler } from './$types';
import payloadHandle from "$lib/utils/payload"
import { generateMediaUrl } from '$lib/utils/media';

export const prerender = true

export const entries = async () => {
  const payload = await payloadHandle.getInstance()
  const images = await payload.find({ collection: "media", limit: 1000 });

  return images.docs.map(i => { return { slug: generateMediaUrl(i.url ?? "").split('/').pop() } });
};

export const GET: RequestHandler = async ({ params }) => {
  const { slug } = params;

  let remoteUrl;

  const [base, extension] = slug.split('.');

  try {
    remoteUrl = atob(base);  // Decode base64 to get original CMS URL
  } catch {
    throw error(400, 'Invalid image slug');
  }

  const contentType = extension === 'svg' ? 'image/svg+xml' : `image/${extension}`;

  const response = await fetch(`http://localhost:3000${remoteUrl}`);

  if (!response.ok) {
    throw error(response.status, 'Failed to fetch image');
  }

  return new Response(response.body, {
    headers: {
      'Content-Type': contentType,
      'Cache-Control': 'public, max-age=31536000, immutable'  // Optional: Cache for performance
    }
  });
}
