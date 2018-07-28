// # Place all the behaviors and hooks related to the matching controller here.
// # All this logic will automatically be available in application.js.
// # You can use CoffeeScript in this file: http://coffeescript.org/
$(document).ready(function(){
  $(".comment-box .reply-button").unbind("click").on("click", function(e){
    e.preventDefault()
    $("#reply-"+this.dataset.id).toggle()
  })
})