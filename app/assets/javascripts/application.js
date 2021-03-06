// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require jquery-ui/widgets/sortable
//= require jquery-fileupload/basic
//= require jquery-ui/widgets/sortable
//= require popper.min
//= require bootstrap
//= require mdb
//= require rails_sortable
//= require ckeditor/config
//= require social-share-button
//= require_tree .

function image_preview(input, width, height) {
  if (input.files && input.files[0]) {
    var reader = new FileReader();
    reader.onload = function (e) {
      $('.img_prev')
        .show()
        .attr('src', e.target.result)
        .width(width)
        .height(height);
    };
    reader.readAsDataURL(input.files[0]);
  }
}

$(document).ready(function(){
  $('img').error(function() {
    $(this).attr('src', '/images/missing-image.jpg');
  });

  $('select').formSelect();
  $('.carousel.carousel-slider').carousel({
    fullWidth: true,
    indicators: true
  });
  setTimeout(autoplay, 3000);
  function autoplay() {
    $('.carousel').carousel('next');
    setTimeout(autoplay, 3000);
  }
  $('.materialboxed').materialbox();
  $('.sortable').railsSortable();
});
