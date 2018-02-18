$(document).ready(function(){
    $("#pagination a").trigger('click');
    $.ajax({
        url: './xml_korisnici.php',
        dataType: "xml",
        type: "GET",
        success: prikazi_korisnike
    });
    $.ajax({
        url: './xml_tip_radnje.php',
        dataType: "xml",
        type: "GET",
        success: prikazi_tipove_radnje
    });
});

$(document).on("change","#radnja_tip_odabir", function (){
    var tip_radnje_id = $("#radnja_tip_odabir").val();
    $.ajax({
        url: './xml_radnje.php',
        dataType: "xml",
        type: "GET",
        data: {"tip_radnje_id":tip_radnje_id},
        success: prikazi_radnje
    });
});

function prikazi_korisnike($data) {
    var popis = "<option value=''>Svi korisnici</option>";
    $($data).find('korisnik').each(function() {
        popis += "<option value='" + $(this).attr("korisnik_id") + "'>"+ $(this).attr("ime") + " " + $(this).attr("prezime") +"</option>";
    });
    $("#korisnik_odabir").html(popis);
}

function prikazi_tipove_radnje($data) {
    var popis = "<option value=''>Svi tipovi</option>";
    $($data).find('tip_radnje').each(function() {
        popis += "<option value='" + $(this).attr("tip_radnje_id") + "'>"+ $(this).attr("radnja") +"</option>";
    });
    $("#radnja_tip_odabir").html(popis);
}

function prikazi_radnje($data) {
    var popis = "<option value=''>Sve radnje</option>";
    $($data).find('radnja').each(function() {
        popis += "<option value='" + $(this).attr("radnja") + "'>"+ $(this).attr("radnja") +"</option>";
    });
    $("#radnja_odabir").html(popis);
}

$(document).on("change", "#korisnik_odabir, #radnja_odabir, #radnja_tip_odabir, #pocetni, #zadnji, #sort_stupac, #sort_vrsta", function (){
    var $radnja_ime = $('#radnja_odabir').val();
    var $korisnik_id = $('#korisnik_odabir').val();
    var $radnja_tip_id = $('#radnja_tip_odabir').val();
    var $sort_stupac = $('#sort_stupac').val();
    var $sort_vrsta = $('#sort_vrsta').val();
    var s = new Date($('#pocetni').val());
    var e = new Date($('#zadnji').val());
    sdate = edate = '';
    if(!Date.parse(s) || !Date.parse(e)){
        sdate = edate = '';
    }
    else {
        if (e.getFullYear() > 2000) {
            var ed = '' + e.getDate();
            var em = '' + (e.getMonth()+1);
            var ey = '' + e.getFullYear();
            if (ed.length < 2) ed = '0' + ed;
            if (em.length < 2) em = '0' + em;
            edate = ey + '-' + em + '-' + ed;
            var sd = '' + s.getDate();
            var sm = '' + (s.getMonth()+1);
            var sy = '' + s.getFullYear();
            if (sd.length < 2) sd = '0' + sd;
            if (sm.length < 2) sm = '0' + sm;
            sdate = sy + '-' + sm + '-' + sd;
        }
        else {
            sdate = edate = '';
        }
    }
    $.ajax({
        url: './crud_dnevnik.php',
        dataType: "xml",
        type: "GET",
        data: {"pn":1, "sort": $sort_stupac, "type":$sort_vrsta, "opis":$radnja_ime, "tip_radnje_id":$radnja_tip_id, "korisnik_id":$korisnik_id, "datum_od":sdate, "datum_do":edate},
        success: function(data) {
            prikazi(data);
            paging(data, 1);
        }
    });
});

/** TAAAAABLICEEEEEE */
function prikazi($data) {
    var tablica = $('<table id = "dnevnik">');
    tablica.append('<thead><tr><th>Datum</th><th>Ime</th><th>Prezime</th><th>Opis</th><th>Radnja</th>');
    var tbody = $("<tbody>");
    $($data).find('dnevnik_stat').each(function() {
        var red = "<tr>";
        red += "<td>" + $(this).attr("datum") + "</td>";
        red += "<td>" + $(this).attr("ime") + "</td>";
		red += "<td>" + $(this).attr("prezime") + "</td>";
		red += "<td>" + $(this).attr("opis") + "</td>";
        red += "<td>" + $(this).attr("radnja") + "</td>";
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
    var $radnja_ime = $('#radnja_odabir').val();
    var $korisnik_id = $('#korisnik_odabir').val();
    var $radnja_tip_id = $('#radnja_tip_odabir').val();
    var $sort_stupac = $('#sort_stupac').val();
    var $sort_vrsta = $('#sort_vrsta').val();
    var s = new Date($('#pocetni').val());
    var e = new Date($('#zadnji').val());
    sdate = edate = '';
    if(!Date.parse(s) || !Date.parse(e)){
        sdate = edate = '';
    }
    else {
        var sd = '' + s.getDate();
        var sm = '' + (s.getMonth()+1);
        var sy = '' + s.getFullYear();
        if (sd.length < 2) sd = '0' + sd;
        if (sm.length < 2) sm = '0' + sm;
        sdate = sy + '-' + sm + '-' + sd;
        var ed = '' + e.getDate();
        var em = '' + (e.getMonth()+1);
        var ey = '' + e.getFullYear();
        if (ed.length < 2) ed = '0' + ed;
        if (em.length < 2) em = '0' + em;
        edate = ey + '-' + em + '-' + ed;
    }
	$.ajax({
		url: './crud_dnevnik.php',
        dataType: 'xml',
        type: 'GET',
		data: {"pn":page, "sort": $sort_stupac, "type":$sort_vrsta, "opis":$radnja_ime, "tip_radnje_id":$radnja_tip_id, "korisnik_id":$korisnik_id, "datum_od":sdate, "datum_do":edate},
		success: function(data) {
            prikazi(data);
            paging(data, page);
        }
	});
});