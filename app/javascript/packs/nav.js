let nav = document.getElementById('nav-wrapper');
let hamburger = document.getElementById('js-hamburger');
let blackBg = document.getElementById('js-black-bg');

hamburger.addEventListener('click', () => {
  nav.classList.toggle('open');
});
blackBg.addEventListener('click', () => {
  nav.classList.remove('open');
});
