$(document).ready(function(){
  
  $('.customer__tab').click(function(){
    var index = $('.customer__tab').index(this);
    $('.customer__content').removeClass('is_active');
    $('.customer__content').eq(index).addClass('is_active');
    $('.customer__tab').removeClass('is_selected');
    $(this).addClass('is_selected');
  }); 

 
});
