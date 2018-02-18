$(document).ready(function(){
    $("#pagination a").trigger('click');
    $.ajax({
        url: './xml_lokacije.php?dohvati_lokacije=1',
        dataType: "xml",
        type: "GET",
        success: prikazi_lokacije
    });
});

$("#lokacija_odabir").on('change', function(){
    $lokacija_id = $(this).val();
    $.ajax({
        url: './xml_dvorane.php',
        dataType: "xml",
        type: "GET",
        data: {"lokacija_id": $lokacija_id },
        success:prikazi_dvorane
    });
});

$("#dvorana_odabir").on('change', function(){
    $dvorana_id = $(this).val();
    $.ajax({
        url: './xml_projekcije.php',
        dataType: "xml",
        type: "GET",
        data: {"dvorana_id": $dvorana_id },
        success: prikazi_projekcije
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

function prikazi_projekcije($data) {
    var popis = "<option value='' selected>Odaberi projekciju</option>";
    $($data).find('projekcija').each(function() {
        popis += "<option value='" + $(this).attr("projekcija_id") + "' id='projekcija"+ $(this).attr("projekcija_id") +  "'>"+ $(this).attr("vrijeme_pocetak") + ": " + $(this).attr("naziv") + "</option>";
    });
    $("#projekcija_odabir").html(popis);
}

$(document).on("change", "#lokacija_odabir, #dvorana_odabir, #projekcija_odabir, #sort_stupac, #sort_vrsta", function (){
    var $lokacija_id = $('#lokacija_odabir').val();
    var $dvorana_id = $('#dvorana_odabir').val();
    var $projekcija_id = $('#projekcija_odabir').val();
    var $sort_stupac = $('#sort_stupac').val();
    var $sort_vrsta = $('#sort_vrsta').val();
    $.ajax({
        url: './xml_ulaznice.php',
        dataType: "xml",
        type: "GET",
        data: {"pn":1, "sort": $sort_stupac, "type":$sort_vrsta, "lokacija_id":$lokacija_id, "dvorana_id":$dvorana_id, "projekcija_id":$projekcija_id},
        success: function(data) {
            prikazi(data);
            paging(data, 1);
        }
    });
});

/** TAAAAABLICEEEEEE */
function prikazi($data) {
    var tablica = $('<table id = "ulaznice">');
    tablica.append('<thead><tr><th>Ime</th><th>Prezime</th><th>Film</th><th>Postavljeno</th><th>Ulaznica</th><th>Sjedala</th>');
    var tbody = $("<tbody>");
    $($data).find('ulaznica').each(function() {
        var red = "<tr>";
        red += "<td>" + $(this).attr("ime") + "</td>";
		red += "<td>" + $(this).attr("prezime") + "</td>";
		red += "<td>" + $(this).attr("film_naziv") + "</td>";
        red += "<td>" + $(this).attr("vrijeme") + "</td>";
        red += "<td class='ikona_centar'><a href='uploads/" + $(this).attr("slika") + "' target='_blank'><img src='uploads/"+ $(this).attr("slika") +"' alt='' class='icon'/></a></td>";
        red += "<td>" + $(this).attr("sjedala") + "</td>";
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
}

/* PAGINATION */
$('#pagination').on('click', 'a', function(e) { // When click on a 'a' element of the pagination div
	var page = this.id; // Page number is the id of the 'a' element
    var $lokacija_id = $('#lokacija_odabir').val();
    var $dvorana_id = $('#dvorana_odabir').val();
    var $projekcija_id = $('#projekcija_odabir').val();
    var $sort_stupac = $('#sort_stupac').val();
    var $sort_vrsta = $('#sort_vrsta').val();
    $.ajax({
        url: './xml_ulaznice.php',
        dataType: "xml",
        type: "GET",
        data: {"pn":page, "sort": $sort_stupac, "type":$sort_vrsta, "lokacija_id":$lokacija_id, "dvorana_id":$dvorana_id, "projekcija_id":$projekcija_id},
        success: function(data) {
            prikazi(data);
            paging(data, 1);
        }
    });
});
