
$(function(){

  $('#new_cheerup_title').on('click', function(){
    $('#new_cheerup_form').slideToggle(400, function(){
      // $('#new_cheerup_form').toggleClass('hidden');
    });
  });

  $('#display_methods > a').on('click', function(e) {
    e.preventDefault();
    console.log($(this).attr('href'));
    $('#cheerups').load($(this).attr('href') + ' #cheerups', function() {
      $('.cheerup').hide();
      $('.cheerup').each(function(i) {
        $(this).delay((i++) * 500).fadeIn('fast'); 
      });
    });
    history.pushState({}, '', $(this).attr('href'));
  });

  if ($('table tr').length > 0) {
    $('table tr').hide();
    $('tr').each(function(i) {
      $(this).delay((i++) * 500).fadeIn(500); 
    });
  }

  if ($('.cheerup').length > 0) {
    $('.cheerup').hide();
    $('.cheerup').each(function(i) {
      $(this).delay((i++) * 500).fadeIn(500); 
    });
  }

  // if ($('.cheerup img').length > 0) {
  //   $('.cheerup img').hide();
  // }

  $('#cheerups').on('load', '.cheerup', function(i) {
    $(this).find('img').delay((i++) * 500).fadeIn(100);
  })

});