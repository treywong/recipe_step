$("#recipe-search").on("keyup", function(){
  	autocomplete()
});

function autocomplete(){
  $.ajax({
    url: '/advance_searching',
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
        option.value = '/recipes/#{element.id}';
        option.innerHTML = element.name + " (" + element.user.username + ")";

        //append option to list
        $("#list").append(option);



        let form = document.getElementById('recipe-search');

        // text input field
        let name = document.getElementById('name');
        let otherList = document.getElementById('other-list');
        let nameTerm = name.value
        console.log(nameTerm);
      });
    }
  });
}