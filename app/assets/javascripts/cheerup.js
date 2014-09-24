
$(function(){

  $('#new_cheerup_title').on('click', function(){
    $('#new_cheerup_form').slideToggle(400, function(){
      $('#new_cheerup_form').toggleClass('hidden');
    });
  });

});