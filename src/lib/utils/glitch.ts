export function glitch(document: Document) {
  const chars = '░▒▓█▄▀0123456789';

  // All the divs that contain text
  const all = document.querySelectorAll('h1, h2, h3, h4, h5, h6 ')
    .entries().filter(e => e[1].textContent.length > 0).map(e => e[1]);

  all.forEach(text => {

    setInterval(() => {

      const charIndex = Math.floor(Math.random() * chars.length);

      const textIndex = Math.floor(Math.random() * text.textContent.length);

      if (textIndex >= text.textContent.length - 1) {
        return;
      }

      const replaced = text.textContent[textIndex];

      if (replaced === ' ' || replaced === '\n') {
        return;
      }

      text.innerHTML = text.textContent.substring(0, textIndex) + chars[charIndex] + text.textContent.substring(textIndex + 1);

      setTimeout(() => {
        text.innerHTML = text.textContent.substring(0, textIndex) + replaced + text.textContent.substring(textIndex + 1);
      }, 300)

    }, Math.floor(Math.random() * 9000) + 1000)

  })

}
