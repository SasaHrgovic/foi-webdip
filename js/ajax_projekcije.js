$(document).ready(function(){ 
    $("#dodaj_zapis").hide();
    $dvorana_val = $("#dvorana_odabir").val();
    if ($dvorana_val == 0) {
        $("#gumb_dodaj").hide();
    }
    operacija = 0;
    $( "#gumb_dodaj" ).click(function() {
        $(".edit_forma").show();
        $("#gumb_dodaj").hide();
        $("#gumb_odustani").show();
        $("#update_zapis").hide();
        operacija = 1;
    });
    $( "#gumb_odustani" ).click(function() {
        $('#film_odabir').val('');
        $('#vrijeme').val('');
        $('#dvorana_promjena').val('');
        $('#dvorana_promjena').hide();
        $('#dvorana_promjena_lbl').hide('');
        $(".edit_forma").hide();
        $("#gumb_odustani").hide();
        $("#gumb_dodaj").show();
        $("#dodaj_zapis").hide();
        $("#update_zapis").hide();
        operacija = 0;
    });

    $("#pagination a").trigger('click');
    $film_zadnji = "film_zadnji";
    dvorana_zadnji = "dvorana_zadnji";

    $.ajax({
        url: './xml_lokacije.php?dohvati_lokacije=1',
        dataType: "xml",
        type: "GET",
        success: prikazi_lokacije
    });

    $.ajax({
        url: './xml_filmovi.php',
        dataType: "xml",
        type: "GET",
        success: prikazi_filmove
    });
});

function promijeni_dvoranu($data) {
    var popis = "<option value='' selected>Odaberi dvoranu</option>";
    $($data).find('dvorana').each(function() {
        popis += "<option value='" + $(this).attr("dvorana_id") + "' id='dvorana"+ $(this).attr("dvorana_id") + "'>"+ $(this).attr("broj") + "</option>";
    });
    $("#dvorana_promjena").html(popis);
    return true;
}

function prikazi_filmove($data) {
    var popis = "<option value='' selected>Odaberi film</option>";
    $($data).find('film').each(function() {
        popis += "<option value='" + $(this).attr("film_id") + "' id='film"+ $(this).attr("film_id") + "'>"+ $(this).attr("trajanje") +" min: "+ $(this).attr("naziv") + "</option>";
    });
    $("#film_odabir").html(popis);
}

$("#lokacija_odabir").on('change', function(){
    $('#film_odabir').val('');
    $('#vrijeme').val('');
    dvorana_zadnji = "dvorana_zadnji";
    $("#gumb_dodaj").hide();
    $lokacija_id = $(this).val();
    if ($lokacija_id == 0) {
        dvorana_zadnji = "dvorana_zadnji";
        $("#gumb_odustani").trigger('click');
        $("#gumb_dodaj").hide();
    }
    $.ajax({
        url: './xml_dvorane.php',
        dataType: "xml",
        type: "GET",
        data: {"lokacija_id": $lokacija_id },
        success: function(data) {
            prikazi_dvorane(data);
            promijeni_dvoranu(data);
        }
    });
});

function prikazi_lokacije($data) {
    var popis = "<option value='' selected>Odaberi lokaciju</option>";
    $($data).find('lokacija').each(function() {
        popis += "<option value='" + $(this).attr("lokacija_id") + "' id='lokacija" + $(this).attr("lokacija_id") + "'>"+ $(this).attr("naziv") + "</option>";
    });
    $("#lokacija_odabir").html(popis);
}

function prikazi_dvorane($data) {
    var popis = "<option value='' selected>Odaberi dvoranu</option>";
    $($data).find('dvorana').each(function() {
        popis += "<option value='" + $(this).attr("dvorana_id") + "'>"+ $(this).attr("broj") + "</option>";
    });
    $("#dvorana_odabir").html(popis);
}

function prikazi($data) {
    var tablica = $('<table id = "projekcije">');
    tablica.append('<thead><tr><th>Film</th><th>Trajanje</th><th>Dvorana</th><th>Broj mjesta</th><th>Početak</th><th>Završetak</th><th>Uredi</th><th>Obriši</th>');
    var tbody = $("<tbody>");
    $($data).find('projekcija').each(function() {
        var red = "<tr>";
        red += "<td>" + $(this).attr("naziv") + "</td>";
        red += "<td>" + $(this).attr("trajanje") + "</td>";
        red += "<td>" + $(this).attr("broj") + "</td>";
        red += "<td>" + $(this).attr("broj_mjesta") + "</td>";
        red += "<td>" + $(this).attr("vrijeme_pocetak") + "</td>";
        red += "<td>" + $(this).attr("vrijeme_zavrsetak") + "</td>";

        red += "<td class='ikona_centar'><img src='img/edit.png' alt='' class='icon icon_edit' value='" + $(this).attr("projekcija_id") + "'/></td>";
        red += "<td class='ikona_centar'><img src='img/delete.png' alt='' class='icon icon_delete' value='" + $(this).attr("projekcija_id") + "'/></td>";
        red += "</tr>";
        tbody.append(red);
    });
    tbody.append("</tbody></table>");
    tablica.append(tbody);
    $("#generirana_tablica").html(tablica);
}
    
function paging($data, page){
    $($data).find("projekcije").each(function(){
        $pages = $(this).find("pages").text();
    });
    var pagination = '';
    if (page == 1) pagination += '<div class="cell_disabled"><span>First</span></div><div class="cell_disabled"><span>Previous</span></div>';
    else pagination += '<div class="cell"><a href="#" id="1">First</a></div><div class="cell"><a href="#" id="' + (page - 1) + '">Previous</span></a></div>';

    for (var i=parseInt(page)-3; i<=parseInt(page)+3; i++) {
        if (i >= 1 && i <= $pages) {
            pagination += '<div';
            if (i == page) pagination += ' class="cell_active"><span>' + i + '</span>';
            else pagination += ' class="cell"><a href="#" id="' + i + '">' + i + '</a>';
            pagination += '</div>';
        }
    }
    
    if (page == $pages) pagination += '<div class="cell_disabled"><span>Next</span></div><div class="cell_disabled"><span>Last</span></div>';
    else pagination += '<div class="cell"><a href="#" id="' + (parseInt(page) + 1) + '">Next</a></div><div class="cell"><a href="#" id="' + $pages + '">Last</span></a></div>';
    
    $('#pagination').html(pagination);
}

/* PAGINATION */
$('#pagination').on('click', 'a', function(e) { // When click on a 'a' element of the pagination div
	var page = this.id; // Page number is the id of the 'a' element
	var vrijednost = $("#trazilica").val();
    var $sort_stupac = $('#sort_stupac').val();
    var $sort_vrsta = $('#sort_vrsta').val();
    var $lokacija_id = $("#lokacija_odabir").val();
    var $dvorana_id = $("#dvorana_odabir").val();
	$.ajax({
		url: './crud_projekcije.php',
        dataType: 'xml',
        type: 'GET',
		data: { "pn":page, "q": vrijednost, "sort": $sort_stupac, "type":$sort_vrsta, "lokacija_id":$lokacija_id,"dvorana_id": $dvorana_id},
		success: function(data) {
            prikazi(data);
            paging(data, page);
        }
	});
});

$(document).on("input", "#lokacija_odabir, #dvorana_odabir, #trazilica, #sort_stupac, #sort_vrsta", function (){
    var $lokacija_id = $('#lokacija_odabir').val();
    var $dvorana_id = $('#dvorana_odabir').val();
    var vrijednost = $("#trazilica").val();
    var $sort_stupac = $('#sort_stupac').val();
    var $sort_vrsta = $('#sort_vrsta').val();
    $.ajax({
        url: './crud_projekcije.php',
        dataType: "xml",
        type: "GET",
        data: {"pn":1, "sort": $sort_stupac, "type":$sort_vrsta,"q": vrijednost, "lokacija_id":$lokacija_id, "dvorana_id":$dvorana_id},
        success: function(data) {
            prikazi(data);
            paging(data, 1);
        }
    });
});

function obrisi(){
    $("#gumb_odustani").trigger('click');
}

/* CREATE */
$('#dodaj_zapis').click(function() {
    operacija = 'insert';
    $dvorana_id = $("#dvorana_odabir").val();
    $film_id = $("#film_odabir").val();
    $vrijeme_pocetak = $("#vrijeme").val();
    $.ajax({
        url: './crud_projekcije.php',
        type: "POST",
        async:true,
        data: {"dvorana_id":$dvorana_id, "film_id":$film_id, "vrijeme_pocetak":$vrijeme_pocetak},
        success: obrisi
    });
});

function popuni($data){
    $(".edit_forma").show();
    $($data).find('projekcija').each(function() {
        lokacija_edit = "lokacija" + $(this).attr("lokacija_id");
        document.getElementById(lokacija_edit).selected = "true";
        $lokacija_id = $('#lokacija_odabir').val();
        dvorana_zadnji = "dvorana" + $(this).attr("dvorana_id");
        $.ajax({
            url: './xml_dvorane.php',
            dataType: "xml",
            type: "GET",
            data: {"lokacija_id": $lokacija_id },
            success: function(data){
                promijeni_dvoranu(data);
                document.getElementById(dvorana_zadnji).selected = "true";
            }
        });
        
        $film_zadnji = "film" + $(this).attr("film_id");
        document.getElementById($film_zadnji).selected = "true";
        $('#vrijeme').val($(this).attr("vrijeme_pocetak"));
    });
    $("#dodaj_zapis").hide();
    $("#dvorana_promjena").show();
    $("#dvorana_promjena_lbl").show();
}


/* UPDATE PRIKAZ PODATAKA*/
$("#generirana_tablica").on('click','.icon_edit', function(){
    operacija = 2;
    document.getElementById(dvorana_zadnji).selected = "false";
    document.getElementById($film_zadnji).selected = "false";
    update_id = $(this).attr('value');
    $.ajax({
        url: './crud_projekcije.php',
        dataType: "xml",
        type: "GET",
        data: {"update_id":update_id},
        success: popuni
    });
    $("#update_zapis").hide();
    $("#gumb_odustani").show();
    $("#gumb_dodaj").hide();
});

/* UPDATE SLANJE PODATAKA */
$("#update_zapis").click(function() {
    var film_id = $('#film_odabir').val();
    var dvorana_id = $("#dvorana_promjena").val();
    var vrijeme_pocetak = $("#vrijeme").val();
    $.ajax({
        url: './crud_projekcije.php',
        type: "POST",
        async:true,
        data: {"projekcija_id":update_id, "film_id":film_id, "dvorana_id":dvorana_id, "vrijeme_pocetak":vrijeme_pocetak },
        success: function(){
            $("#gumb_odustani").trigger('click');
            $.ajax({
                url: './crud_projekcije.php',
                dataType: "xml",
                type: "GET",
                data: {"pn":1},
                success: prikazi
            });
        }
    });
});

/* DELETE */
$("#generirana_tablica").on('click','.icon_delete', function(){
    var id = $(this).attr('value');
    if(confirm("Jeste li sigurni?")){
        $.ajax({
            url: './crud_projekcije.php',
            dataType: "xml",
            type: "GET",
            data: {"delete_id":id},
            success: function(){
                $.ajax({
                    url: './crud_projekcije.php',
                    dataType: "xml",
                    type: "GET",
                    data: {"pn":1},
                    success: prikazi
                });
            }
        });
    }
});


$("#dvorana_odabir").on('change', function(){
    $dvorana_val = $(this).val();
    if ($dvorana_val == 0) {
        $("#gumb_odustani").trigger('click');
        $("#gumb_dodaj").hide();
    }
    else {
        $("#gumb_dodaj").show();
    }
});

$("#vrijeme").on('input', function(){
    $("#dodaj_zapis").hide();
    $("#update_zapis").hide();
})


function projekcije_greske($data){
    $($data).find('pocetak').each(function() {
        $pocetak_greska = "Ne možete odabrati ovaj termin zbog filma " + $(this).attr("naziv") + " koji počinje u " + $(this).attr("pocetak");
        $('#pocetak_greska').text($pocetak_greska);
    });
    $($data).find('zavrsetak').each(function() {
        $zavrsetak_greska = "Ne možete odabrati ovaj termin zbog filma " + $(this).attr("naziv") + " koji završava u " + $(this).attr("zavrsetak");
        $('#zavrsetak_greska').text($zavrsetak_greska);
    });
    poc_greska = $('#pocetak_greska').text();
    zav_greska = $('#zavrsetak_greska').text();
    vrijeme_greska = $('#vrijeme').text();
    if(!poc_greska.trim() && !zav_greska.trim()) {
        if(operacija == 1) {
            $('#dodaj_zapis').show();
        }
        else if (operacija == 2) {
            $('#update_zapis').show();
        }
        else {
            $('#dodaj_zapis').hide();
            $('#update_zapis').hide();
        }
    }
    else {
        $('#dodaj_zapis').hide();
        $('#update_zapis').hide();
    }
}

$( "#provjeri_termin" ).click(function() {
    $('#pocetak_greska').text("");
    $('#zavrsetak_greska').text("");
    $dvorana_id = $('#dvorana_odabir').val();
    $film_id = $('#film_odabir').val();
    $vrijeme = $('#vrijeme').val();
    $.ajax({
        url: './xml_razlika.php',
        dataType: "xml",
        type: "GET",
        data: {"dvorana_id":$dvorana_id, "film_id":$film_id, "vrijeme":$vrijeme},
        success: projekcije_greske
    });
});

function promijeni_dvoranu($data) {
    var popis = "<option value='' selected>Odaberi dvoranu</option>";
    $($data).find('dvorana').each(function() {
        popis += "<option value='" + $(this).attr("dvorana_id") + "' id='dvorana"+ $(this).attr("dvorana_id") + "'>"+ $(this).attr("broj") + "</option>";
    });
    $("#dvorana_promjena").html(popis);
}
