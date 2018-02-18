$(document).ready(function(){
    if ($(window).width() > 719) {
        $(".menu").show();
        $( ".hamburger" ).hide();
    }
    else {
        $( ".hamburger" ).show();
        $(".menu").hide();
    }

    $( ".hamburger" ).click(function() {
        $( ".menu" ).slideToggle( "slow", function() {
        });
    })

    $(window).resize(function(){
        if ($(window).width() > 719) {
            $(".menu").show();
            $( ".hamburger" ).hide();
        }
        else {
            $( ".hamburger" ).show();
            $(".menu").hide();
        }
    });
});