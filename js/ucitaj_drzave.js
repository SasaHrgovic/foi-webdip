$(document).ready(function(){ 
    $.ajax({
        url: './xml_drzave.php',
        dataType: "xml",
        type: "GET",
        success: prikazi_drzave
    });
});

function prikazi_drzave($data) {
    var popis = "<option value='0'>Odaberi državu</option>";
    $($data).find('drzava').each(function() {
        popis += "<option value='" + $(this).attr("drzava_id") + "' id='drzava"+ $(this).attr("drzava_id") +"'>"+ $(this).attr("naziv") +"</option>";
    });
    $("#drzava").html(popis);
}