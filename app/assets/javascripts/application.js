// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// the compiled file.
//
// WARNING: THE FIRST BLANK LINE MARKS THE END OF WHAT'S TO BE PROCESSED, ANY BLANK LINE SHOULD
// GO AFTER THE REQUIRES BELOW.
//
//= require jquery
//= require jquery_ujs
//= require jquery.flexslider
//= require twitter/bootstrap
//= require turbolinks
//= require picturefill


$(window).ready(function() {
    $('.flexslider').flexslider({
        slideshowSpeed: 12000,
        pauseOnHover: true,
        controlsContainer: ".switches-container",
        controlNav: true,
        manualControls: "#switches .carousel-switch"
    });


});

$('.carousel-text h1, .carousel-switch h2, .story h2').each(function() {
    var html = $(this).html();
    var word = html.substr(0,html.indexOf(" "));
    var rest = html.substr(html.indexOf(" "));
    $(this).html(rest).prepend($("<b/>").html(word).addClass("first-word"));
});





