export function generateMediaUrl(payloadUrl: string) {
  const extension = payloadUrl.split('.').pop();
  return `/image/${btoa(payloadUrl)}.${extension}`;
}
