import payloadHandle from "$lib/utils/payload"

export async function load() {
  const payload = await payloadHandle.getInstance() 
	const projects = await payload.find({
		collection: 'projects',
	});

	return { projects };
}
