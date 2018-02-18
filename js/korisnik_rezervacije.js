$(document).ready(function(){ 
    $.ajax({
        url: './xml_lokacije.php?dohvati_lokacije=1',
        dataType: "xml",
        type: "GET",
        success: prikazi_lokacije
    });
    projekcija_id = 0;
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
        div += "<h4 id='"+ $(this).attr("projekcija_id") +"'>REZERVIRAJ</h4>";
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
        data: {"lokacija": $lokacija_id },
        success: prikazi_projekcije
    });
});



/**SJEDALA */

function prikazi_sjedala($data){
    var tablica = $('<table id = "sjedala">');
    tablica.append('<caption>KINO PLATNO</caption><thead><tr></tr></thead>');
    var tbody = $("<tbody>");
    console.log($data);
    $($data).find('redak').each(function() {
        var red = "<tr>";
        var red_br = $(this).attr("broj_retka");
        $(this).children('sjedalo').each(function(){
            if ($(this).attr("prodano") == 1) {
                red += "<td class='tablica_sjedalo'><img src='img/chair_red.png' alt='' class='icon icon_chair_red' value='" + $(this).attr("id") + "'/><p>R"+ red_br +" S" + $(this).attr("broj_sjedala") +"</p></td>";
            }
            else {
                red += "<td class='tablica_sjedalo'><img src='img/chair_green.png' alt='' class='icon icon_chair' value='" + $(this).attr("id") + "'/><p>R"+ red_br +" S" + $(this).attr("broj_sjedala") +"</p></td>";
            }
        });
        red += "</tr>";
        tbody.append(red);
    });
    tbody.append("</tbody></table>");
    tablica.append(tbody);
    $("#tablica_sjedala").html(tablica);
}
/**dohvat sjedala */
$("#najava").on('click','h4', function(){
    projekcija_id = $(this).attr('id');
    ids = [];
    $(".sjedala").show();
    $.ajax({
        url: './crud_sjedala.php',
        dataType: "xml",
        type: "GET",
        data: {"projekcija_id":projekcija_id},
        success: prikazi_sjedala
    });
});

$("#tablica_sjedala").on('click','.icon_chair', function(){
    var id = $(this).attr('value');
    $(this).removeClass('icon_chair').addClass('icon_chair_yellow');
    ids.push(id);
    $(this).attr('src','img/chair_yellow.png');
});

$('#resetiraj').click(function() {
    $(".icon_chair_yellow").each(function(){
        $(this).attr('src','img/chair_green.png');
        $(this).removeClass('icon_chair_yellow').addClass('icon_chair');
    });
    ids = [];
});

$('#odustani').click(function() {
    $(".icon_chair_yellow").each(function(){
        $(this).attr('src','img/chair_green.png');
        $(this).removeClass('icon_chair_yellow').addClass('icon_chair');
    });
    ids = [];
    $(".sjedala").hide();
});

$('#rezerviraj').click(function() {
    $.ajax({
        url: './crud_sjedala.php',
        type: "POST",
        data: {"projekcija_id":projekcija_id, "ids":ids},
        success: function(data){
            $.ajax({
                url: './crud_sjedala.php',
                dataType: "xml",
                type: "GET",
                data: {"projekcija_id":projekcija_id},
                success: prikazi_sjedala
            });
        }
    });
});
