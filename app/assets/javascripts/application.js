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
//= require jquery.turbolinks
//= require jquery_ujs
//= require twitter/bootstrap
//= require turbolinks
//= require_tree


$(window).ready(function() {
    $('.flexslider').flexslider({
        controlsContainer: ".switches-container",
        controlNav: true,
        manualControls: "#switches .carousel-switch"
    });

    var twitter = function(d,s,id){var js,fjs=d.getElementsByTagName(s)[0];if(!d.getElementById(id)){js=d.createElement(s);js.id=id;js.src="//platform.twitter.com/widgets.js";fjs.parentNode.insertBefore(js,fjs);}}(document,"script","twitter-wjs");

    if ($(".fb-like").length > 0) {
        if (typeof (FB) != 'undefined') {
            FB.init({ status: true, cookie: true, xfbml: true });
        } else {
            $.getScript("http://connect.facebook.net/en_US/all.js#xfbml=1", function () {
                FB.init({ status: true, cookie: true, xfbml: true });
            });
        }
    }

    if (typeof (IN) != 'undefined') {
        IN.parse();
    } else {
       $.getScript("http://platform.linkedin.com/in.js");
   }

});

$('.carousel-text h1, .carousel-switch h2, .story h2').each(function() {
    var html = $(this).html();
    var word = html.substr(0,html.indexOf(" "));
    var rest = html.substr(html.indexOf(" "));
    $(this).html(rest).prepend($("<span/>").html(word).addClass("first-word"));
});

