var bg = document.getElementById('bg');
var musicians = document.getElementById('musicians');
var cloud_bg = document.getElementById('cloud_bg');
var cloud = document.getElementById('cloud');
var cloud_right = document.getElementById('cloud_right');
var crowd = document.getElementById('crowd');
var text_parallax = document.getElementById('text_parallax');

document.addEventListener('DOMContentLoaded',, (event) => {
window.addEventListener('scroll', function() {
  var value = window.scrollY;
  bg.style.top = value * 0.5 + 'px';
  cloud_right.style.top = value * 0.5 + 'px';
  cloud_bg.style.top = value * 0.25 + 'px';
  cloud.style.top = value * 0.15 + 'px';
  text_parallax.style.top = value + 'px';
});
};