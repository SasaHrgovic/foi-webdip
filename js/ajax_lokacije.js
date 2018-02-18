$(document).ready(function(){ 
    $( "#gumb_dodaj" ).click(function() {
        $(".edit_forma").show();
        $("#gumb_dodaj").hide();
        $("#gumb_odustani").show();
        $("#dodaj_zapis").show();
        $("#update_zapis").hide();
    });
    $( "#gumb_odustani" ).click(function() {
        $('#lokacija_id').val('');
        $('#naziv').val('');
        $('#ulica').val('');
        $('#broj').val('');
        $('#postanski_broj').val('');
        $('#grad').val('');
        $('#drzava').val('');
        $('#telefon').val('');
        $('#latitude').val('');
        $('#longitude').val('');
        $( ".edit_forma" ).hide();
        $("#gumb_odustani").hide();
        $( "#gumb_dodaj" ).show();
    });

    $("#pagination a").trigger('click');

    $.ajax({
        url: './xml_korisnici.php',
        dataType: "xml",
        type: "GET",
        success: prikazi_moderatore
    });
});

function prikazi($data) {
    var tablica = $('<table id = "lokacije">');
    tablica.append('<thead><tr><th>Naziv</th><th>Ulica</th><th>Broj</th><th>Pošta</th><th>Grad</th><th>Država</th><th>Telefon</th><th>Moderator</th><th>Karta</th><th>Uredi</th><th>Obriši</th>');
    var tbody = $("<tbody>");
    $($data).find('lokacija').each(function() {
        var red = "<tr>";
        red += "<td style='min-width:200px;'>" + $(this).attr("naziv") + "</td>";
        red += "<td>" + $(this).attr("ulica") + "</td>";
        red += "<td>" + $(this).attr("broj") + "</td>";
        red += "<td>" + $(this).attr("postanski_broj") + "</td>";
        red += "<td>" + $(this).attr("grad") + "</td>";
        red += "<td>" + $(this).attr("drzava") + "</td>";
        red += "<td>" + $(this).attr("telefon") + "</td>";
        red += "<td>" + $(this).attr("moderator_ime") + " " + $(this).attr("moderator_prezime") + "</td>";
        red += "<td class='ikona_centar'><a href='lokacije.php?lat=" + $(this).attr("latitude") + "&long="+ $(this).attr("longitude") + "'><img src='img/maps.png' alt='' class='icon'/></a></td>";
        red += "<td class='ikona_centar'><img src='img/edit.png' alt='' class='icon icon_edit' id='" + $(this).attr("lokacija_id") + "'/></td>";
        red += "<td class='ikona_centar'><img src='img/delete.png' alt='' class='icon icon_delete' id='" + $(this).attr("lokacija_id") + "'/></td>";
        red += "</tr>";
        tbody.append(red);
    });
    tbody.append("</tbody></table>");
    tablica.append(tbody);
    $("#generirana_tablica").html(tablica);
}
    
function paging($data, page){
    $($data).find("lokacije").each(function(){
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
	vrijednost = $("#trazilica").val();
    $sort_stupac = $('#sort_stupac').val();
    $sort_vrsta = $('#sort_vrsta').val();
	$.ajax({
		url: './crud_lokacije.php',
        dataType: 'xml',
        type: 'GET',
		data: { "pn": page, "q": vrijednost, "sort": $sort_stupac, "type":$sort_vrsta},
		success: function(data) {
            prikazi(data);
            paging(data, page);
        }
	});
});

/* SEARCH */
$("#trazilica").on('input', function(){
    vrijednost = $("#trazilica").val();
    $sort_stupac = $('#sort_stupac').val();
    $sort_vrsta = $('#sort_vrsta').val();
    $.ajax({
        url: './crud_lokacije.php',
        dataType: "xml",
        type: "GET",
        data: {"pn":stranica, "q": vrijednost, "sort": $sort_stupac, "type":$sort_vrsta},
        success: prikazi
    });
});

/* SORT */
$(".sort_stupac").each(function() {
    $(this).on('change', function(){
        vrijednost = $("#trazilica").val();
        $sort_stupac = $('#sort_stupac').val();
        $sort_vrsta = $('#sort_vrsta').val();
        $.ajax({
            url: './crud_lokacije.php',
            dataType: "xml",
            type: "GET",
            data: {"pn":stranica, "q": vrijednost, "sort": $sort_stupac, "type":$sort_vrsta, },
            success: prikazi
        });
    });
});

function obrisi(){
    $("#gumb_odustani").trigger('click');
}

/* CREATE */
$('#dodaj_zapis').click(function() {
    var naziv = $('#naziv').val();
    var ulica = $('#ulica').val();
    var broj = $('#broj').val();
    var postanski_broj = $('#postanski_broj').val();
    var grad = $('#grad').val();
    var drzava = $('#drzava').val();
    var telefon = $('#telefon').val();
    var latitude = $('#latitude').val();
    var longitude = $('#longitude').val();
    $.ajax({
        url: './crud_lokacije.php',
        type: "POST",
        async:false,
        data: {"naziv":naziv, "ulica":ulica, "broj": broj, "postanski_broj": postanski_broj, "grad":grad, "drzava":drzava, "telefon":telefon, "latitude":latitude, "longitude":longitude },
        success: obrisi
    });
});

function popuni($data){
    $($data).find('lokacija').each(function() {
        $('#naziv').val($(this).attr("naziv"));
        $('#ulica').val($(this).attr("ulica"));
        $('#broj').val($(this).attr("broj"));
        $('#postanski_broj').val($(this).attr("postanski_broj"));
        $('#grad').val($(this).attr("grad"));
        $('#telefon').val($(this).attr("telefon"));
        $('#latitude').val($(this).attr("latitude"));
        $('#longitude').val($(this).attr("longitude"));
        $('#moderator').val($(this).attr("korisnik_id"));
        var drzava = $(this).attr("drzava_id");
        $("#drzava option[value='" + drzava + "']").attr("selected","selected");
    });
    $("#gumb_dodaj").trigger('click');
    $("#dodaj_zapis").hide();
    $("#update_zapis").show();
}

/* UPDATE PRIKAZ PODATAKA*/
$("#generirana_tablica").on('click','.icon_edit', function(){
    update_id = $(this).attr('id');
    $.ajax({
        url: './crud_lokacije.php',
        dataType: "xml",
        type: "GET",
        data: {"update_id":update_id},
        success: popuni
    });
});

/* UPDATE SLANJE PODATAKA */
$("#update_zapis").click(function() {
    var naziv = $('#naziv').val();
    var ulica = $('#ulica').val();
    var broj = $('#broj').val();
    var postanski_broj = $('#postanski_broj').val();
    var grad = $('#grad').val();
    var drzava = $('#drzava').val();
    var telefon = $('#telefon').val();
    var latitude = $('#latitude').val();
    var longitude = $('#longitude').val();
    var moderator_id = $('#moderator').val();
    $.ajax({
        url: './crud_lokacije.php',
        type: "POST",
        data: {"lokacija_id":update_id, "naziv":naziv, "ulica":ulica, "broj": broj, "postanski_broj": postanski_broj, "grad":grad, "drzava":drzava, "telefon":telefon, "latitude":latitude, "longitude":longitude, "moderator_id":moderator_id },
        success: function(){
            $("#gumb_odustani").trigger('click');
            $.ajax({
                url: './crud_lokacije.php',
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
    var id = $(this).attr('id');
    if(confirm("Jeste li sigurni?")){
        $.ajax({
            url: './crud_lokacije.php',
            dataType: "xml",
            type: "GET",
            data: {"delete_id":id},
            success: function(){
                $.ajax({
                    url: './crud_lokacije.php',
                    dataType: "xml",
                    type: "GET",
                    data: {"pn":1},
                    success: prikazi
                });
            }
        });
    }
});


if ($(window).width() < 719) {
    $('.edit_forma label').each(function(){
        $("<br/>").insertAfter(this);
    })
}


function prikazi_moderatore($data) {
    var popis = "<option value='' selected>Postavi moderatora</option>";
    $($data).find('korisnik').each(function() {
        popis += "<option value='" + $(this).attr("korisnik_id") + "'>"+ $(this).attr("ime") + " " + $(this).attr("prezime") +"</option>";
    });
    $("#moderator").html(popis);
}
