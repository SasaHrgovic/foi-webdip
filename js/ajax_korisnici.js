$(document).ready(function(){ 
    stranica=1;
    $("#pagination a").trigger('click');
    $drzava_zadnji = "drzava_zadnji";
    $.ajax({
        url: './xml_tip_korisnika.php',
        dataType: "xml",
        type: "GET",
        success: prikazi_tipove_korisnika
    });
});

function prikazi($data) {
    var tablica = $('<table id = "korisnici">');
    tablica.append('<thead><tr><th>Ime</th><th>prezime</th><th>Korime</th><th>Rođenje</th><th>Spol</th><th>Država</th><th>Telefon</th><th>Email</th><th>Slika</th><th>Obavijesti</th><th>Tip</th><th>Registriran</th><th>Aktivan</th><th>Blokiran</th>');
    var tbody = $("<tbody>");
    $($data).find('korisnik').each(function() {
        var red = "<tr>";
        red += "<td>" + $(this).attr("ime") + "</td>";
        red += "<td>" + $(this).attr("prezime") + "</td>";
        red += "<td>" + $(this).attr("korime") + "</td>";
        red += "<td>" + $(this).attr("datum_rodjenja") + "</td>";
        red += "<td>" + $(this).attr("spol") + "</td>";
        red += "<td>" + $(this).attr("drzava_naziv") + "</td>";
        red += "<td>" + $(this).attr("telefon") + "</td>";
        red += "<td>" + $(this).attr("email") + "</td>";
        if($(this).attr("slika") == "") {
            red += "<td></td>";
        }
        else {
            red += "<td class='ikona_centar'><a href='uploads/" + $(this).attr("slika") + "' target='_blank'><img src='uploads/"+ $(this).attr("slika") +"' alt='' class='icon'/></a></td>";
        }
        if($(this).attr("obavijesti") == 1) {
            red += "<td>da</td>";
        }
        else {
            red += "<td>da</td>";
        }
        red += "<td>" + $(this).attr("tip_naziv") + "<br><a href='#' class='tip_promijeni' id='"+ $(this).attr("korisnik_id") +"'>promijeni</a></td>";
        red += "<td>" + $(this).attr("vrijeme") + "</td>";
        if($(this).attr("aktivan") == 1) {
            red += "<td>da<br><a href='#' class='deaktiviraj' id='"+ $(this).attr("korisnik_id") +"'>deaktiviraj</a></td>";
        }
        else {
            red += "<td>ne<br><a href='#' class='aktiviraj' id='"+ $(this).attr("korisnik_id") +"'>aktiviraj</a></td>";
        }
        if($(this).attr("promasaj_broj") < 4) {
            red += "<td>ne<br><a href='#' class='blokiraj' id='"+ $(this).attr("korisnik_id") +"'>blokiraj</a></td>";
        }
        else {
            red += "<td>da<br><a href='#' class='odblokiraj' id='"+ $(this).attr("korisnik_id") +"'>odblokiraj</a></td>";
        }
        //red += "<td class='ikona_centar'><img src='img/edit.png' alt='' class='icon icon_edit' value='" + $(this).attr("film_id") + "'/></td>";
        //red += "<td class='ikona_centar'><img src='img/delete.png' alt='' class='icon icon_delete' value='" + $(this).attr("film_id") + "'/></td>";
        red += "</tr>";
        tbody.append(red);
    });
    tbody.append("</tbody></table>");
    tablica.append(tbody);
    $("#generirana_tablica").html(tablica);
}
    
function paging($data, page){
    $pages = $($data).find("pages").text();
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
		url: './crud_korisnici.php',
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
        url: './crud_korisnici.php',
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
            url: './crud_korisnici.php',
            dataType: "xml",
            type: "GET",
            data: {"pn":stranica, "q": vrijednost, "sort": $sort_stupac, "type":$sort_vrsta, },
            success: prikazi
        });
    });
});


$("#generirana_tablica").on('click','.aktiviraj', function(){
    aktiviraj_id = $(this).attr('id');
    vrijednost = $("#trazilica").val();
    $sort_stupac = $('#sort_stupac').val();
    $sort_vrsta = $('#sort_vrsta').val();
    page = $('.cell_active span').html();
	$.ajax({
		url: './crud_korisnici.php',
        dataType: 'xml',
        type: 'GET',
		data: { "aktiviraj_id":aktiviraj_id},
		success: function(data) {
            $.ajax({
                url: './crud_korisnici.php',
                dataType: 'xml',
                type: 'GET',
                data: { "pn": page, "q": vrijednost, "sort": $sort_stupac, "type":$sort_vrsta},
                success: function(data) {
                    prikazi(data);
                    paging(data, page);
                }
            });
        }
	});
});

$("#generirana_tablica").on('click','.deaktiviraj', function(){
    deaktiviraj_id = $(this).attr('id');
    page = $('.cell_active span').html();
    vrijednost = $("#trazilica").val();
    $sort_stupac = $('#sort_stupac').val();
    $sort_vrsta = $('#sort_vrsta').val();
	$.ajax({
		url: './crud_korisnici.php',
        dataType: 'xml',
        type: 'GET',
		data: { "deaktiviraj_id":deaktiviraj_id},
		success: function(data) {
            $.ajax({
                url: './crud_korisnici.php',
                dataType: 'xml',
                type: 'GET',
                data: { "pn": page, "q": vrijednost, "sort": $sort_stupac, "type":$sort_vrsta},
                success: function(data) {
                    prikazi(data);
                    paging(data, page);
                }
            });
        }
	});
});

$("#generirana_tablica").on('click','.blokiraj', function(){
    blokiraj_id = $(this).attr('id');
    page = $('.cell_active span').html();
    vrijednost = $("#trazilica").val();
    $sort_stupac = $('#sort_stupac').val();
    $sort_vrsta = $('#sort_vrsta').val();
	$.ajax({
		url: './crud_korisnici.php',
        dataType: 'xml',
        type: 'GET',
		data: { "blokiraj_id":blokiraj_id},
		success: function(data) {
            $.ajax({
                url: './crud_korisnici.php',
                dataType: 'xml',
                type: 'GET',
                data: { "pn": page, "q": vrijednost, "sort": $sort_stupac, "type":$sort_vrsta},
                success: function(data) {
                    prikazi(data);
                    paging(data, page);
                }
            });
        }
	});
});

$("#generirana_tablica").on('click','.odblokiraj', function(){
    odblokiraj_id = $(this).attr('id');
    page = $('.cell_active span').html();
    vrijednost = $("#trazilica").val();
    $sort_stupac = $('#sort_stupac').val();
    $sort_vrsta = $('#sort_vrsta').val();
	$.ajax({
		url: './crud_korisnici.php',
        dataType: 'xml',
        type: 'GET',
		data: { "odblokiraj_id":odblokiraj_id},
		success: function(data) {
            $.ajax({
                url: './crud_korisnici.php',
                dataType: 'xml',
                type: 'GET',
                data: { "pn": page, "q": vrijednost, "sort": $sort_stupac, "type":$sort_vrsta},
                success: function(data) {
                    prikazi(data);
                    paging(data, page);
                }
            });
        }
	});
});

$("#generirana_tablica").on('click','.tip_promijeni', function(){
    promijeni_tip_id = $(this).attr('id');
    $(".edit_forma").show();
    $("#gumb_odustani").show();
});

$("#promijeni_tip").click(function() {
    var $korisnik_tip = $('#tip_korisnika').val();
    if ($korisnik_tip == 0) {
        alert("Morate odabrati tip");
    }
    else {
        page = $('.cell_active span').html();
        vrijednost = $("#trazilica").val();
        $sort_stupac = $('#sort_stupac').val();
        $sort_vrsta = $('#sort_vrsta').val();
        $.ajax({
            url: './crud_korisnici.php',
            dataType: 'xml',
            type: 'GET',
            data: { "tip_id":$korisnik_tip, "korisnik_id":promijeni_tip_id},
            success: function(data) {
                $.ajax({
                    url: './crud_korisnici.php',
                    dataType: 'xml',
                    type: 'GET',
                    data: { "pn": page, "q": vrijednost, "sort": $sort_stupac, "type":$sort_vrsta},
                    success: function(data) {
                        prikazi(data);
                        paging(data, page);
                    }
                });
            }
        });
    }
    $(".edit_forma").hide();
});

$("#odustani_tip").click(function() {
    $(".edit_forma").hide();
})

function prikazi_tipove_korisnika($data) {
    var popis = "<option value='0' selected>Odaberi tip</option>";
    $($data).find('tip_korisnika').each(function() {
        popis += "<option value='" + $(this).attr("tip_id") + "'>"+ $(this).attr("naziv") +"</option>";
    });
    $("#tip_korisnika").html(popis);
}
