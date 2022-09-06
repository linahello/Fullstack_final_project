let bg = document.getElementById('bg');
let musicians = document.getElementById('musicians');
let cloud_bg = document.getElementById('cloud_bg');
let cloud = document.getElementById('cloud');
let cloud_right = document.getElementById('cloud_right');
let crowd = document.getElementById('crowd');
let text_parallax = document.getElementById('text_parallax');
let nav = document.getElementById('nav');

window.addEventListener('scroll', function() {
  var value = window.scrollY;
  bg.style.top = value * 0.5 + 'px';
  cloud_right.style.top = value * 0.5 + 'px';
  cloud_bg.style.top = value * 0.25 + 'px';
  cloud.style.top = value * 0.15 + 'px';
  text_parallax.style.top = value + 'px';
});
