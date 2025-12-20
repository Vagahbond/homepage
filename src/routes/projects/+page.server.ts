import payloadHandle from "$lib/utils/payload"

export async function load() {
	const projects = await payloadHandle.getInstance().find({
		collection: 'projects',
	});

	return { projects };
}
