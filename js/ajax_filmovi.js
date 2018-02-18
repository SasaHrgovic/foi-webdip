$(document).ready(function(){ 
    $( "#gumb_dodaj" ).click(function() {
        $(".edit_forma").show();
        $("#gumb_dodaj").hide();
        $("#gumb_odustani").show();
        $("#dodaj_zapis").show();
        $("#update_zapis").hide();
    });
    $( "#gumb_odustani" ).click(function() {
        $('#naziv').val('');
        $('#naziv_original').val('');
        $('#zanr').val('');
        $('#drzava').val('');
        $('#redatelj').val('');
        $('#godina').val('');
        $('#uloge').val('');
        $('#opis').val('');
        $('#trajanje').val('');
        $( ".edit_forma" ).hide();
        $("#gumb_odustani").hide();
        $( "#gumb_dodaj" ).show();
    });

    $("#pagination a").trigger('click');
    $drzava_zadnji = "drzava_zadnji";
    $zanr_zadnji = "zanr_zadnji";

    $(document).ready(function(){ 
        $.ajax({
            url: './xml_zanrovi.php',
            dataType: "xml",
            type: "GET",
            success: prikazi_zanrove
        });
    });
});

function prikazi($data) {
    var tablica = $('<table id = "filmovi">');
    tablica.append('<thead><tr><th>Naziv</th><th>Original</th><th>Žanr</th><th>Država</th><th>Redatelj</th><th>Godina</th><th>Uloge</th><th>Opis</th><th>Trajanje</th><th>Slika</th><th>Uredi</th><th>Obriši</th>');
    var tbody = $("<tbody>");
    $($data).find('film').each(function() {
        var red = "<tr>";
        red += "<td>" + $(this).attr("naziv") + "</td>";
        red += "<td>" + $(this).attr("naziv_original") + "</td>";
        red += "<td>" + $(this).attr("zanr") + "</td>";
        red += "<td>" + $(this).attr("drzava") + "</td>";
        red += "<td>" + $(this).attr("redatelj") + "</td>";
        red += "<td>" + $(this).attr("godina") + "</td>";
        red += "<td>" + $(this).attr("uloge") + "</td>";
        red += "<td style='min-width:350px;'>" + $(this).attr("opis") + "</td>";
        red += "<td>" + $(this).attr("trajanje") + "</td>";
        if($(this).attr("slika") == "") {
            red += "<td class='ikona_centar'><img src='img/upload-button.png' alt='' class='icon icon_upload' value='" + $(this).attr("film_id") + "'/></td>";
        }
        else {
            red += "<td class='ikona_centar'><a href='uploads/" + $(this).attr("slika") + "' target='_blank'><img src='uploads/"+ $(this).attr("slika") +"' alt='' class='icon'/></a></td>";
        }
        red += "<td class='ikona_centar'><img src='img/edit.png' alt='' class='icon icon_edit' value='" + $(this).attr("film_id") + "'/></td>";
        red += "<td class='ikona_centar'><img src='img/delete.png' alt='' class='icon icon_delete' value='" + $(this).attr("film_id") + "'/></td>";
        red += "</tr>";
        tbody.append(red);
    });
    tbody.append("</tbody></table>");
    tablica.append(tbody);
    $("#generirana_tablica").html(tablica);
}
    
function paging($data, page){
    $($data).find("filmovi").each(function(){
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
    stranica = page;
}

/* PAGINATION */
$('#pagination').on('click', 'a', function(e) { // When click on a 'a' element of the pagination div
	var page = this.id; // Page number is the id of the 'a' element
	var $vrijednost = $("#trazilica").val();
    var $sort_stupac = $('#sort_stupac').val();
    var $sort_vrsta = $('#sort_vrsta').val();
	$.ajax({
		url: './crud_filmovi.php',
        dataType: 'xml',
        type: 'GET',
		data: { "pn": page, "q": $vrijednost, "sort": $sort_stupac, "type":$sort_vrsta},
		success: function(data) {
            prikazi(data);
            paging(data, page);
        }
	});
});

$(document).on("input", "#trazilica, #sort_stupac, #sort_vrsta", function (){
    var $vrijednost = $("#trazilica").val();
    var $sort_stupac = $('#sort_stupac').val();
    var $sort_vrsta = $('#sort_vrsta').val();

    $.ajax({
        url: './crud_filmovi.php',
        dataType: "xml",
        type: "GET",
        data: {"pn":1, "q": $vrijednost, "sort": $sort_stupac, "type":$sort_vrsta},
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
    var naziv = $('#naziv').val();
    var naziv_original = $('#naziv_original').val();
    var zanr_id = $('#zanr').val();
    var drzava_id = $('#drzava').val();
    var redatelj = $('#redatelj').val();
    var godina = $('#godina').val();
    var uloge = $('#uloge').val();
    var opis = $('#opis').val();
    var trajanje = $('#trajanje').val();
    $.ajax({
        url: './crud_filmovi.php',
        type: "POST",
        async:true,
        data: {"naziv":naziv, "naziv_original":naziv_original, "zanr_id": zanr_id, "drzava_id": drzava_id, "redatelj":redatelj, "godina":godina, "uloge":uloge, "opis":opis, "trajanje":trajanje },
        success: obrisi
    });
});

function popuni($data){
    $($data).find('film').each(function() {
        $('#naziv').val($(this).attr("naziv"));
        $('#naziv_original').val($(this).attr("naziv_original"));
        $zanr_zadnji = "zanr" + $(this).attr("zanr_id");
        document.getElementById($zanr_zadnji).selected = "true";
        $drzava_zadnji = "drzava" + $(this).attr("drzava_id");
        document.getElementById($drzava_zadnji).selected = "true";
        $('#redatelj').val($(this).attr("redatelj"));
        $('#godina').val($(this).attr("godina"));
        $('#uloge').val($(this).attr("uloge"));
        $('#opis').val($(this).attr("opis"));
        $('#trajanje').val($(this).attr("trajanje"));
    });
    $("#gumb_dodaj").trigger('click');
    $("#dodaj_zapis").hide();
    $("#update_zapis").show();
}


/* UPDATE PRIKAZ PODATAKA*/
$("#generirana_tablica").on('click','.icon_edit', function(){
    if(document.getElementById($drzava_zadnji).length) {
        document.getElementById($drzava_zadnji).selected = "false";
        document.getElementById($zanr_zadnji).selected = "false";
    }
    update_id = $(this).attr('value');
    console.log(update_id);
    $.ajax({
        url: './crud_filmovi.php',
        dataType: "xml",
        type: "GET",
        data: {"update_id":update_id},
        success: popuni
    });
});

/* UPDATE SLANJE PODATAKA */
$("#update_zapis").click(function() {
    var naziv = $('#naziv').val();
    var naziv_original = $('#naziv_original').val();
    var zanr_id = $('#zanr').val();
    var drzava_id = $('#drzava').val();
    var redatelj = $('#redatelj').val();
    var godina = $('#godina').val();
    var uloge = $('#uloge').val();
    var opis = $('#opis').val();
    var trajanje = $('#trajanje').val();
    $.ajax({
        url: './crud_filmovi.php',
        type: "POST",
        async:true,
        data: {"film_id":update_id, "naziv":naziv, "naziv_original":naziv_original, "zanr_id": zanr_id, "drzava_id": drzava_id, "redatelj":redatelj, "godina":godina, "uloge":uloge, "opis":opis, "trajanje":trajanje },
        success: function(){
            $("#gumb_odustani").trigger('click');
            $.ajax({
                url: './crud_filmovi.php',
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
            url: './crud_filmovi.php',
            dataType: "xml",
            type: "GET",
            data: {"delete_id":id},
            success: function(){
                $.ajax({
                    url: './crud_filmovi.php',
                    dataType: "xml",
                    type: "GET",
                    data: {"pn":1},
                    success: prikazi
                });
            }
        });
    }
});


//prikaz žanrova
function prikazi_zanrove($data) {
    var popis = "<option value='0'>Odaberi žanr</option>";
    $($data).find('zanr').each(function() {
        popis += "<option value='" + $(this).attr("zanr_id") + "' id='zanr"+ $(this).attr("zanr_id") +"'>"+ $(this).attr("naziv") +"</option>";
    });
    $("#zanr").html(popis);
}


$("#generirana_tablica").on('click','.icon_upload', function(){
    $('#id_film').val($(this).attr("value"));
    $(".upload_forma").show();
});

$('#forma_upload').submit(function () {
    var formData = new FormData($(this)[0]);
    vrijednost = $("#trazilica").val();
    $sort_stupac = $('#sort_stupac').val();
    $sort_vrsta = $('#sort_vrsta').val();
    $("#upload_poruka").show();
    $.ajax({
        url: './crud_filmovi.php',
        type: 'POST',
        data: formData,
        async: true,
        success: function () {
            $("#upload_poruka").hide();
            $(".upload_forma").hide();
            alert("Slika je uspješno prenesena.");
            $.ajax({
                url: './crud_filmovi.php',
                dataType: "xml",
                type: "GET",
                data: {"pn":stranica, "q": vrijednost, "sort": $sort_stupac, "type":$sort_vrsta, },
                success: prikazi
            });
        },
        cache: false,
        contentType: false,
        processData: false
    });

    return false;
});
