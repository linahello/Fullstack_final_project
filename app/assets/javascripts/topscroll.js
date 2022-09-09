
$(document).ready(function(){ 
  $(window).scroll(function(){ 
      if ($(this).scrollTop() > 400) { 
          $('#scroll').fadeIn(); 
      } else { 
          $('#scroll').fadeOut(); 
      } 
  }); 
  $('#scroll').click(function(){ 
      $("html").animate({ scrollTop: 0 }, 0); 
      return false; 
  }); 
});