$(document).ready(function(){ 
    $.ajax({
        url: './xml_lokacije.php?dohvati_lokacije=1',
        dataType: "xml",
        type: "GET",
        success: prikazi_lokacije
    });
});

function prikazi_lokacije($data) {
    var popis = "<option value='1' selected>Odaberi lokaciju</option>";
    $($data).find('lokacija').each(function() {
        popis += "<option value='" + $(this).attr("lokacija_id") + "' id='lokacija" + $(this).attr("lokacija_id") + "'>"+ $(this).attr("naziv") + "</option>";
    });
    $("#lokacija_odabir").html(popis);
}

function prikazi_projekcije($data){
    var sadrzaj = $('<div></div>');
    sadrzaj.append('<h3>Sljedeće na rasporedu</h3>')
    $($data).find('projekcija').each(function() {
        var div = "<div class='col-4'>";
        div += "<a href='korisnik_filmovi.php?film_id=" + $(this).attr("film_id") + "'><img src='uploads/"+ $(this).attr("slika") +"' alt='slika'></a>";
        div += "<h3>"+ $(this).attr("naziv") +"</h3>";
        div += "<h1>"+ $(this).attr("vrijeme") +"</h1>";
        div += "<h3>"+ $(this).attr("datum") + "</h3>";
        div += "</div>";
        sadrzaj.append(div);
    });
    $("#najava").html(sadrzaj);
}

$("#lokacija_odabir").on('change', function(){
    $lokacija_id = $(this).val();
    $.ajax({
        url: './xml_index.php',
        dataType: "xml",
        type: "GET",
        data: {"lokacija_id": $lokacija_id },
        success: prikazi_projekcije
    });
});