
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
      success: function(response){
        console.log(response);
      //code to get the prominence score and upvote and downvote  

      url = "/cheerups/"+cheerup_id;
      var cheerUpHtml = getCheerupInformation(url,"GET");


      var id =  cheerupVoteAction+ "_" +cheerup_id;
      
      if (cheerupVoteAction == "upvote") {

        var idOfAttributeToBeSet = "prominence_"+id;
        //console.log('p#'+idOfAttributeToBeSet);
        $('p#'+idOfAttributeToBeSet).text("Prominence 1");
        $('p#'+id).text("Upvotes 1");                

      }
      else {
      $('p#id').text("Downvotes 1");                        
      }
      console.log("cheerupVoteAction=" + cheerupVoteAction);  
      console.log("id=" + id);  
      console.log("successful put");
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
    console.log("form submitted");


  });
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
      console.log("cheerup content" + response.content);
    }

  });

  return "<htm>"
}
