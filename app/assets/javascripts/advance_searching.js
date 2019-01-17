$(document).on("turbolinks:load", function(){
  $("#recipe-search").on("keyup", function(e){
    	autocomplete(e)
  });

  function autocomplete(e){
    e.preventDefault()
    $.ajax({
      url: '/searching',
      type: 'POST',
      data: $("#recipe-search").serialize(), //takes the form data and authenticity toke and converts it into a standard URL
      dataType: 'json', //specify what type of data you're expecting back from the servers
      error: function() {
        console.log("Something went wrong");
      },
      success: function(data) {
        $("#list").html("");
        var first_option = document.createElement("option");
  	    first_option.innerHTML = "Select Here...";
  	    $("#list").append(first_option);

        data.forEach(function(element) {
          var option = document.createElement("option");
          option.value = '/recipes/#{element[0].id}';
          option.innerHTML = element[0].name + " (" + element[1] + ")";

          //append option to list
          $("#list").append(option);
        });
      }
    })
  }
