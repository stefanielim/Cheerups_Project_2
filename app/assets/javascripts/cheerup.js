
$().ready(function(e){

  console.log("document ready");
  $("a[id *= downvote],a[id ^= upvote]").on('click',function(event) { 

    //event.preventDefault();
    var cheerupVoteAction = event.currentTarget.id.split('_')[0];  
    var cheerup_id = event.currentTarget.id.split('_')[1];  
    var url = " ";
    var direction = " ";
    if (cheerupVoteAction == "upvote") {
      url = "/cheerups/"+ cheerup_id + "/vote/up";
      direction = "up";
    }
    else {
      url = "/cheerups/"+ cheerup_id + "/vote/down";
      direction = "down";
    }

    console.log(event);
    console.log(event.currentTarget.id);
    console.log(cheerup_id);
    console.log(cheerupVoteAction);
    console.log(url);

    $.ajax({
      type: "PUT",
      dataType: 'json',
      url: url,
      success: function(){

      var id =  cheerupVoteAction+ "_" +cheerup_id;
  
      if (cheerupVoteAction == "upvote") {

        var idOfAttributeToBeSet = "prominence_"+id;
        console.log('p#'+idOfAttributeToBeSet);
        $('p#'+idOfAttributeToBeSet).text("Prominence 1");
        $("'p#'+id").text("Upvotes 1");                

      }
      else {
      $('p#id').text("Downvotes 1");                        
      }

      console.log("successful post");
     }

    });

    return false;
  });


  // function to create a cheerup using the ajax method 

  $('#new_cheerup').on('submit',function(event){

    event.preventDefault();

    console.log($("#inner-editor").text());
    console.log("form submitted");

  });

  // Stef animation

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
  });

});

//cheerups/cheerup_id/vote/up


