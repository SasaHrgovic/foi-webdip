$(document).ready(function(){ 
    stranica = 1;
    $("#pagination a").trigger('click');
});

function prikazi($data) {
    var tablica = $('<table id = "rezervacije">');
    tablica.append('<thead><tr><th>Film</th><th>Početak</th><th>Rezervirano</th><th>Odobreno</th><th>Ulaznica</th>');
    var tbody = $("<tbody>");
    $($data).find('rezervacija').each(function() {
        var red = "<tr>";
        red += "<td>" + $(this).attr("film_naziv") + "</td>";
        red += "<td>" + $(this).attr("vrijeme_pocetak") + "</td>";
        red += "<td>" + $(this).attr("vrijeme") + "</td>";
        if($(this).attr("odobrenje") == 0) {
            red += "<td>NE</td>";
            red += "<td></td>";
        }
        else {
            if($(this).attr("slika") == "") {
                red += "<td>DA</td>";
                red += "<td class='ikona_centar'><img src='img/upload-button.png' alt='' class='icon icon_upload' value='" + $(this).attr("rezervacija_id") + "'/></td>";
            }
            else {
                red += "<td>DA</td>";
                red += "<td class='ikona_centar'><a href='uploads/" + $(this).attr("slika") + "' target='_blank'><img src='uploads/"+ $(this).attr("slika") +"' alt='' class='icon'/></a></td>";
            }
        }
        red += "</tr>";
        tbody.append(red);
    });
    tbody.append("</tbody></table>");
    tablica.append(tbody);
    $("#generirana_tablica").html(tablica);
}
    
function paging($data, page){
    $($data).find("rezervacije").each(function(){
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
    $lokacija_id = $("#lokacija_odabir").val();
    $dvorana_id = $("#dvorana_odabir").val();
    $projekcija_id = $("#projekcija_odabir").val();
	$.ajax({
		url: './crud_odobreno.php',
        dataType: 'xml',
        type: 'GET',
		data: { "pn":page, "q": vrijednost, "sort": $sort_stupac, "type":$sort_vrsta, "lokacija_id":$lokacija_id,"dvorana_id": $dvorana_id, "projekcija_id":$projekcija_id},
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
    $lokacija_id = $("#lokacija_odabir").val();
    $dvorana_id = $("#dvorana_odabir").val();
    $projekcija_id = $("#projekcija_odabir").val();
    $.ajax({
        url: './crud_odobreno.php',
        dataType: "xml",
        type: "GET",
        data: {"pn":stranica, "q": vrijednost, "sort": $sort_stupac, "type":$sort_vrsta, "lokacija_id":$lokacija_id,"dvorana_id": $dvorana_id, "projekcija_id":$projekcija_id},
        success: prikazi
    });
});

/* SORT */
$(".sort_stupac").each(function() {
    $(this).on('change', function(){
        vrijednost = $("#trazilica").val();
        $sort_stupac = $('#sort_stupac').val();
        $sort_vrsta = $('#sort_vrsta').val();
        $lokacija_id = $("#lokacija_odabir").val();
        $dvorana_id = $("#dvorana_odabir").val();
        $projekcija_id = $("#projekcija_odabir").val();
        $.ajax({
            url: './crud_odobreno.php',
            dataType: "xml",
            type: "GET",
            data: {"pn":stranica, "q": vrijednost, "sort": $sort_stupac, "type":$sort_vrsta, "lokacija_id":$lokacija_id,"dvorana_id": $dvorana_id, "projekcija_id":$projekcija_id },
            success: prikazi
        });
    });
});

$("#generirana_tablica").on('click','.icon_upload', function(){
    $('#id_rezervacija').val($(this).attr("value"));
    $(".upload_forma").show();
});

$('#forma_upload').submit(function () {
    var formData = new FormData($(this)[0]);
    vrijednost = $("#trazilica").val();
    $sort_stupac = $('#sort_stupac').val();
    $sort_vrsta = $('#sort_vrsta').val();
    $("#upload_poruka").show();
    $.ajax({
        url: './crud_odobreno.php',
        type: 'POST',
        data: formData,
        async: true,
        success: function () {
            $("#upload_poruka").hide();
            $(".upload_forma").hide();
            alert("Slika je uspješno prenesena.");
            $.ajax({
                url: './crud_odobreno.php',
                dataType: "xml",
                type: "GET",
                data: {"pn":1, "q": vrijednost, "sort": $sort_stupac, "type":$sort_vrsta},
                success: prikazi
            });
        },
        cache: false,
        contentType: false,
        processData: false
    });

    return false;
});