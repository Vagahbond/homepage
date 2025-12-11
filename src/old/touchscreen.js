function isTouchDevice() {
  return (
    "ontouchstart" in window ||
    navigator.maxTouchPoints > 0 ||
    navigator.msMaxTouchPoints > 0
  );
}

if (isTouchDevice()) {
  document.querySelectorAll(".card").forEach(
    (l) => (
      (l.onclick = (e) => {
        l.addEventListener("touchstart", (e) => {
          e.peventDefault();
          l.focus();
        });
      }),
      false
    ),
  );
}
