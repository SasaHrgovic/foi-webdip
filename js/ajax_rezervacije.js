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
    var $lokacija_id = $(this).val();
    $.ajax({
        url: './xml_dvorane.php',
        dataType: "xml",
        type: "GET",
        data: {"lokacija_id": $lokacija_id},
        success: prikazi_dvorane
    });
});

$("#dvorana_odabir").on('change', function(){
    var $dvorana_id = $(this).val();
    $.ajax({
        url: './xml_projekcije.php',
        dataType: "xml",
        type: "GET",
        data: {"dvorana_id": $dvorana_id},
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

$(document).on("input", "#lokacija_odabir, #dvorana_odabir, #projekcija_odabir, #trazilica, #sort_stupac, #sort_vrsta", function (){
    var $lokacija_id = $("#lokacija_odabir").val();
    var $dvorana_id = $("#dvorana_odabir").val();
    var $projekcija_id = $("#projekcija_odabir").val();
    var $vrijednost = $("#trazilica").val();
    var $sort_stupac = $('#sort_stupac').val();
    var $sort_vrsta = $('#sort_vrsta').val();
    $.ajax({
        url: './crud_rezervacije.php',
        dataType: 'xml',
        type: 'GET',
        data: { "pn":1, "q": $vrijednost, "sort": $sort_stupac, "type":$sort_vrsta,"lokacija_id":$lokacija_id, "dvorana_id":$dvorana_id, "projekcija_id":$projekcija_id},
        success: function(data) {
            prikazi(data);
            paging(data, 1);
        }
    });
});

function prikazi($data) {
    var tablica = $('<table id = "rezervacije">');
    tablica.append('<thead><tr><th>Film</th><th>Početak</th><th>Rezervirano</th><th>Odobreno</th><th>Korisnik</th><th>Prihvati</th><th>Odbij</th>');
    var tbody = $("<tbody>");
    $($data).find('rezervacija').each(function() {
        var red = "<tr>";
        red += "<td>" + $(this).attr("film_naziv") + "</td>";
        red += "<td>" + $(this).attr("vrijeme_pocetak") + "</td>";
        red += "<td>" + $(this).attr("vrijeme") + "</td>";
        red += "<td>" + $(this).attr("odobrenje_vrijeme") + "</td>";
        red += "<td>" + $(this).attr("ime") + " " + $(this).attr("prezime") + "</td>";
        if($(this).attr("odobrenje") == 0) {
            red += "<td class='ikona_centar'><img src='img/checked.png' alt='' class='icon icon_checked' value='" + $(this).attr("rezervacija_id") + "'/></td>";
        }
        else {
            red += "<td></td>";
        }
        red += "<td class='ikona_centar'><img src='img/delete.png' alt='' class='icon icon_delete' value='" + $(this).attr("rezervacija_id") + "'/></td>";
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
}

/* PAGINATION */
$('#pagination').on('click', 'a', function(e) { // When click on a 'a' element of the pagination div
	var page = this.id; // Page number is the id of the 'a' element
	var $lokacija_id = $("#lokacija_odabir").val();
    var $dvorana_id = $("#dvorana_odabir").val();
    var $projekcija_id = $("#projekcija_odabir").val();
    var $vrijednost = $("#trazilica").val();
    var $sort_stupac = $('#sort_stupac').val();
    var $sort_vrsta = $('#sort_vrsta').val();
    $.ajax({
        url: './crud_rezervacije.php',
        dataType: 'xml',
        type: 'GET',
        data: { "pn":page, "q": $vrijednost, "sort": $sort_stupac, "type":$sort_vrsta,"lokacija_id":$lokacija_id, "dvorana_id":$dvorana_id, "projekcija_id":$projekcija_id},
        success: function(data) {
            prikazi(data);
            paging(data, page);
        }
    });
});

$("#generirana_tablica").on('click','.icon_delete', function(){
    var id = $(this).attr('value');
    var $lokacija_id = $("#lokacija_odabir").val();
    var $dvorana_id = $("#dvorana_odabir").val();
    var $projekcija_id = $("#projekcija_odabir").val();
    var $vrijednost = $("#trazilica").val();
    var $sort_stupac = $('#sort_stupac').val();
    var $sort_vrsta = $('#sort_vrsta').val();
    if(confirm("Jeste li sigurni?")){
        $.ajax({
            url: './crud_rezervacije.php',
            dataType: "xml",
            type: "GET",
            data: {"delete_id":id},
            complete: function(){
                $.ajax({
                    url: './crud_rezervacije.php',
                    dataType: "xml",
                    type: "GET",
                    data: {"pn":1, "q": $vrijednost, "sort": $sort_stupac, "type":$sort_vrsta, "lokacija_id":$lokacija_id,"dvorana_id": $dvorana_id, "projekcija_id":$projekcija_id },
                    success: function(data) {
                        prikazi(data);
                        paging(data, 1);
                    }
                });
            }
        });
    }
});

/* ODBIJ */
$("#generirana_tablica").on('click','.icon_checked', function(){
    var id = $(this).attr('value');
    var $lokacija_id = $("#lokacija_odabir").val();
    var $dvorana_id = $("#dvorana_odabir").val();
    var $projekcija_id = $("#projekcija_odabir").val();
    var $vrijednost = $("#trazilica").val();
    var $sort_stupac = $('#sort_stupac').val();
    var $sort_vrsta = $('#sort_vrsta').val();
    $.ajax({
        url: './crud_rezervacije.php',
        dataType: "xml",
        type: "GET",
        data: {"approve_id":id},
        complete: function(data){
            console.log(data);
            $.ajax({
                url: './crud_rezervacije.php',
                dataType: "xml",
                type: "GET",
                data: {"pn":1, "q": $vrijednost, "sort": $sort_stupac, "type":$sort_vrsta, "lokacija_id":$lokacija_id,"dvorana_id": $dvorana_id, "projekcija_id":$projekcija_id },
                success: function(data) {
                    prikazi(data);
                    paging(data, 1);
                }
            });
        }
    });
});



