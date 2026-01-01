import { error } from '@sveltejs/kit';
import type { RequestHandler } from './$types';
import payloadHandle from "$lib/utils/payload"

export const prerender = true

export const entries = async () => {
  const payload = await payloadHandle.getInstance()
  const images = await payload.find({ collection: "media" })

  return images.docs.map(i => { return { slug: btoa(i.url ?? "") } })
};

export const GET: RequestHandler = async ({ params }) => {
  const { slug } = params;


  let remoteUrl;
  try {
    remoteUrl = atob(slug);  // Decode base64 to get original CMS URL
  } catch {
    throw error(400, 'Invalid image slug');
  }

  const response = await fetch(`http://localhost:3000${remoteUrl}`);

  if (!response.ok) {
    throw error(response.status, 'Failed to fetch image');
  }

  return new Response(response.body, {
    headers: {
      'Content-Type': response.headers.get('Content-Type') || 'image/jpeg',
      'Cache-Control': 'public, max-age=31536000, immutable'  // Optional: Cache for performance
    }
  });
}
