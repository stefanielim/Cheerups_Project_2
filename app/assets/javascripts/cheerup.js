
$().ready(function(e){

  console.log("document ready");
  $("a[id *= downvote],a[id ^= upvote]").on('click',function(event) { 

    event.preventDefault();

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
      url: url+".json",
      success: function(){
        
        console.log("PUT request was successful");
      
      //code to get the prominence score and upvote and downvote  

      url = "/cheerups/"+cheerup_id;

      getCheerupInformation(url,"GET");
      

     },
     error: function(response){
      console.log("There was an error in PUT request"+ response.text);
     }

    });
    console.log("after the ajax PUT");
    return false;
  });
});


  // function to create a cheerup using the ajax method 

  $('#new_cheerup').on('submit',function(event){

    event.preventDefault();
    var newCheerUpContent = $('#cheerup_content').val()

    console.log(newCheerUpContent);
    console.log("form submitted");


  });


  function getCheerupInformation(url,requestType){
    console.log("In Cheerup Information");

    console.log("url = " + url);
    console.log("request Type = " + requestType);

    $.ajax({
      type: requestType,
      dataType: 'json',
      url: url,
      success: function(response){
        console.log("after Sucess get response is" + response );
        console.log("cheerup content" + response.cheerup['content']);
        console.log("cheerup user_id" + response.cheerup['user_id']);
        console.log("cheerup id" + response.cheerup['id']);

        var cheerup_id = response.cheerup['id'];

        $('#prominence_'+cheerup_id).text("Prominence "+response.cheerup['prominence']);  
        $('#upvote_'+cheerup_id).text("Upvotes "+response.cheerup['upvote']);
        $('#downvote_'+cheerup_id).text("Downvotes "+response.cheerup['downvote']);

      },
      error: function(response){
       console.log("There was an error in GET request"+ response.text);
      }

    });

    
  }



  /*

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

*/

