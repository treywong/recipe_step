// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, or any plugin's
// vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require rails-ujs
//= require activestorage
//= require turbolinks
//= require_tree .

function getEdamamRecipes(name) {
	fetch('https://api.edamam.com/search?q=' + name +'&app_id=' + AppId + '&app_key=' + AppKey)
		.then(function(response) {

			if (!response.ok){
				window.alert('Hey, seems like something went wrong, please email <email address> for reports!');
				return;
			}
			return response.json();
		})
		.then(function(result) {

			if (!result){
				return;
			}

			const items = result.response;
		})
		.catch(function(err) {
			window.alert('Hey, seems like the Edamam API is down, please try again later!')
			console.log("Message: " + err)
		})
}