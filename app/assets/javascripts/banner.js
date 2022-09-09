var bg = document.getElementById('bg');
var cloud_right = document.getElementById('cloud_right');
var cloud_bg = document.getElementById('cloud_bg');
var cloud = document.getElementById('cloud');
let text_parallax = document.getElementById('text_parallax');
var crowd = document.getElementById('crowd');

text_parallax.style.top = "3vw";
window.addEventListener('scroll', function() {
var value = window.scrollY;
bg.style.top = value * 0.005 + 'px';
cloud_right.style.top = value * 0.5 + 'px';
cloud_bg.style.top = value * 0.25 + 'px';
cloud.style.top = value * 0.15 + 'px';
text_parallax.style.top = value + 'px';
});
