export function destroy(document: Document) {
  const chars = '░▒▓█▄▀▌▐■□▪▫▬▭▮▯⠿⡿⣿⠾⢾⣾⠷⡷⣷⠯⡯⣯⠟⡟⣟0123456789';

  const all = document.querySelectorAll('div, h1, h2, h3, h4, h5, h6, p, span, li, button');

  all.forEach(text => {

    setInterval(() => {

      const charIndex = Math.floor(Math.random() * chars.length);

      const textIndex = Math.floor(Math.random() * text.innerHTML.length);

      if (textIndex >= text.innerHTML.length - 1) {
        return;
      }


      text.innerHTML = text.innerHTML.substring(0, textIndex) + chars[charIndex] + text.innerHTML.substring(textIndex + 1);

    }, 200)

  })

}
