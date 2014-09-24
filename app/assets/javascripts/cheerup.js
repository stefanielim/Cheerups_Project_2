
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
      url: url+".json",
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

    var newCheerUpContent = $('#cheerup_content').val()

    // $.ajax({
    //   type: "POST", 
    //   dataType: 'json',
    //   url: 
    //   data:
    //   success: function(){

    //   }
    // });
    console.log(newCheerUpContent);

  });
});

