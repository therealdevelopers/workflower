var nav = document.querySelector('nav');

function navScroll(){
  var className = 'transparent';
  var top = window.scrollY ? window.scrollY : document.documentElement.scrollTop;
  
  if (top > 0) {
    nav.classList.remove(className);
    [].forEach.call(document.querySelectorAll('[data-src]'), function(iframe){
      iframe.setAttribute('src', iframe.getAttribute('data-src'));
      iframe.removeAttribute('data-src');
    });
  } else {
    nav.classList.add('transparent');
    nav.classList.add(className);
  }
};

window.onscroll = navScroll;
navScroll();
setTimeout(function(){ nav.classList.remove('loading'); }, 10);

window.onload = function(){
  // Dropimage handler
  [].forEach.call(document.querySelectorAll('.dropimage'), function(img){
    img.onchange = function(e){
      var inputfile = this, reader = new FileReader();
      reader.onloadend = function(){
        inputfile.style['background-image'] = 'url('+reader.result+')';
        }
      reader.readAsDataURL(e.target.files[0]);
      }
    });
};
