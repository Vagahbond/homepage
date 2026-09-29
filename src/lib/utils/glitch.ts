export function glitch(document: Document) {
  const chars = '░▒▓█▄▀0123456789';

  const intervals: ReturnType<typeof setInterval>[] = [];
  const timeouts = new Set<ReturnType<typeof setTimeout>>();

  // All the divs that contain text
  const all = document.querySelectorAll('h1, h2, h3, h4, h5, h6, span, p')
    .entries().filter(e => e[1].textContent.length > 0).map(e => e[1]);

  all.forEach(element => {

    if (element.children.length > 0) {
      return;
    }

    intervals.push(setInterval(() => {
      const textNode = Array.from(element.childNodes).find(
        (node): node is Text => node.nodeType === Node.TEXT_NODE && (node.nodeValue?.length ?? 0) > 0
      );

      if (!textNode) {
        return;
      }

      const original = textNode.nodeValue ?? '';

      const charIndex = Math.floor(Math.random() * chars.length);

      const textIndex = Math.floor(Math.random() * original.length);

      if (textIndex >= original.length - 1) {
        return;
      }

      const replaced = original[textIndex];

      if (!(/\w/).test(replaced)) {
        return;
      }

      const glitched = original.substring(0, textIndex) + chars[charIndex] + original.substring(textIndex + 1);

      textNode.nodeValue = glitched;

      const timeout = setTimeout(() => {
        timeouts.delete(timeout);
        if (textNode.nodeValue === glitched) {
          textNode.nodeValue = original;
        }
      }, 300);
      timeouts.add(timeout);

    }, Math.floor(Math.random() * 9000) + 1000))

  })

  return () => {
    intervals.forEach(clearInterval);
    timeouts.forEach(clearTimeout);
  };
}
