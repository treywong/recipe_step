$("#recipe-search").on("keyup", function(){
  autocomplete()
});

function autocomplete(){
  $.ajax({
    url: '/advance_searching'
    type: 'POST',
    data: $("#recipe-search").serialize(), //takes the form data and authenticity toke and converts it into a standard URL
    dataType: 'json', //specify what type of data you're expecting back from the servers
    error: function() {
        console.log("Something went wrong");
    },
    success: function(data) {
      $("#list").html("");

      data.forEach(function(element) {
        var recipe = document.createElement("recipe");
        recipe.value = element;

        //append recipe to list
        $("#list").append(recipe);
      });
    }
  });
}