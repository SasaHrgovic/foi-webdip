$(document).ready(function(){
    if ($(window).width() > 719) {
        $(".user_nav").show();
        $( ".hamburger_user" ).hide();
    }
    else {
        $( ".hamburger_user" ).show();
        $(".user_nav").hide();
    }

    $( ".hamburger_user" ).click(function() {
        $( ".user_nav" ).slideToggle( "slow", function() {
        });
    })

    $(window).resize(function(){
        if ($(window).width() > 719) {
            $(".user_nav").show();
            $( ".hamburger_user" ).hide();
        }
        else {
            $( ".hamburger_user" ).show();
            $(".user_nav").hide();
        }
    });
});