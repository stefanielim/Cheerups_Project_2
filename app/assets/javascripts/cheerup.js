$().ready(function(e){

  console.log("document ready");
  $("a[id *= downvote],a[id ^= upvote]").on('click',function(event) { 
    
    event.preventDefault();
    console.log('clicked vote');
    var cheerupVoteAction = event.currentTarget.id.split('_')[0];  
    var cheerup_id = event.currentTarget.id.split('_')[1];  
    var url = " ";
    var direction = " ";
    if (cheerupVoteAction == "upvote") {
      url = "/cheerups/"+ cheerup_id + "/vote/up";
      direction = "up";
    } else {
      url = "/cheerups/"+ cheerup_id + "/vote/down";
      direction = "down";
    }
    
    $.ajax({
      type: "PUT",
      url: url+".json",
      success: function() {
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


  // function to create a cheerup using the ajax method 

  // $('#new_cheerup').on('submit',function(event){

  //   event.preventDefault();

  //   var currentUserId = Number($("a[href$='sign_out']").prev()[0].toString().substr(28,31))
    
  //   console.log(currentUserId);

  //   var newCheerUpContent = $('#cheerup_content').val()
    // POST method for new cheerup

  //   $.ajax({ 
  //     type: 'POST',
  //     url: "/cheerups",
  //     data: {cheerup: {user_id: currentUserId, content: newCheerUpContent}},
  //     success: function(){
  //         console.log("POST Sucess");
  //     },
  //     error: function(){
  //         console.log("POST Error");
  //     }

  //   });

  //   console.log(newCheerUpContent);
  //   console.log("form submitted");

  // });


  function getCheerupInformation(url,requestType){
    console.log("In Cheerup Information");

    $.ajax({
      type: requestType,
      dataType: 'json',
      url: url,
      success: function(response){
        var cheerup_id = response.cheerup['id'];
        console.log(response)
        $('#prominence_'+cheerup_id).text(response.cheerup['prominence']);  
        $('li#upvote_'+cheerup_id+' a i').text(response.cheerup['upvote']);
        $('li#downvote_'+cheerup_id+' a i').text(response.cheerup['downvote']);

      },
      
      error: function(response){
        console.log("There was an error in GET request"+ response.text);
      }
    });
  }

 // Stef animation

  $('#new_cheerup_title').on('click', function(){
    $('#new_cheerup_form').slideToggle(400, function(){
      // $('#new_cheerup_form').toggleClass('hidden');
    });
  });
  
  $('#display_methods').on('click', 'a', function(e) {
    e.preventDefault();
    // console.log($(this).attr('href'));
    $('#cheerups').load($(this).attr('href') + ' #cheerups', function() {
      $('.cheerup').hide();
      $('.cheerup').each(function(i) {
        $(this).delay((i++) * 500).fadeIn('fast'); 
      });
    });
    
    history.pushState({}, '', $(this).attr('href'));
    $('#display_methods input:checked').prop("checked", false);
    $(this).parent().find('input').prop('checked', true);
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
      $(this).delay((i++) * 500).fadeIn(300); 
    });
  }

  $('#cheerups').on('load', '.cheerup', function(i) {
    $(this).find('img').delay((i++) * 500).fadeIn(100);
  });

  // cheerup character counter

  var characterCount = 0;
    $('#new_cheerup').before("<p id='new_cheerup_character_count'></p>");
    $('#new_cheerup div:last > input').attr('disabled', 'disabled');

    $('#new_cheerup').on('keyup',function(e){
      characterCount = $('#cheerup_content').val().length;  
      checkMessageLengthAndEnableAndDisableNewCheerupBox(characterCount);
      displayCharacterCount(characterCount);
    });

    function displayCharacterCount(characterCount){
      $('#new_cheerup_character_count').text(characterCount + "/141");
    }

    function checkMessageLengthAndEnableAndDisableNewCheerupBox(charlength) {
      if (charlength > 141) {
          $("input[type=submit]").attr('disabled', 'true');
      } else {
          $("input[type=submit]").removeAttr('disabled');
      }
    }
});

