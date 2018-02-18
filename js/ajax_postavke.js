$('#promijeni_stranica').click(function(){
    $(".stranice_forma").show();
});
$('#promijeni_pomak').click(function(){
    $(".pomak_forma").show();
});

$('#postavi_stranica').click(function(){
    var stranice = $("#novo_stranice").val();
    $.ajax({
        type: 'POST',
        url: 'crud_stranice.php',
        data: {'stranice': stranice},
        success: function (data) {
            $("#odustani_stranica").trigger('click');
        }
    });
});

$('#postavi_pomak').click(function(){
    var pomak = $("#novo_pomak").val();
    $.ajax({
        type: 'POST',
        url: 'https://barka.foi.hr/WebDiP/pomak_vremena/vrijeme.php',
        data: {'pomak': pomak},
        success: function (data) {
            $.ajax({
                type: 'GET',
                url: 'https://barka.foi.hr/WebDiP/pomak_vremena/pomak.php?format=xml',
                dataType: 'xml',
                success: function (data) {
                    novi_pomak = $(data).find('brojSati').text();
                    $.post('vrijeme_pomak.php', {'pomak': novi_pomak});
                    $("#odustani_pomak").trigger('click');
                }
            });
        }
    });
});


$('#odustani_stranica').click(function(){
    $(".stranice_forma").hide();
});
$('#odustani_pomak').click(function(){
    $(".pomak_forma").hide();
});
