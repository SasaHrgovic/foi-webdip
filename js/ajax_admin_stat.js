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
    graf_prikazan=0;
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

function getAllDays() {
    var s = new Date($('#pocetni').val());
    var e = new Date($('#zadnji').val());
    var a = [];
    while(s <= e) {
        var day = '' + s.getDate();
        var month = '' + (s.getMonth()+1);
        var year = '' + s.getFullYear();
        if (day.length < 2) day = '0' + day;
        if (month.length < 2) month = '0' + month;
        nd = year + '-' + month + '-' + day;
        a.push(nd);
        s.setDate(s.getDate() + 1);
    }
    return a;
};

function getHeaderDays() {
    var s = new Date($('#pocetni').val());
    var e = new Date($('#zadnji').val());
    var a = [];
    while(s <= e) {
        var day = '' + s.getDate();
        var month = '' + (s.getMonth()+1);
        if (day.length < 2) day = '0' + day;
        if (month.length < 2) month = '0' + month;
        nd = day + '.' + month;
        a.push(nd);
        s.setDate(s.getDate() + 1);
    }
    return a;
};


$(document).on("change", "#korisnik_odabir, #radnja_odabir, #radnja_tip_odabir, #pocetni, #zadnji, #sort_stupac, #sort_vrsta", function (){
    var $radnja_ime = $('#radnja_odabir').val();
    var $korisnik_id = $('#korisnik_odabir').val();
    var $radnja_tip_id = $('#radnja_tip_odabir').val();
    var $sort_stupac = $('#sort_stupac').val();
    var $sort_vrsta = $('#sort_vrsta').val();
    var s = new Date($('#pocetni').val());
    var e = new Date($('#zadnji').val());
    xAxis = [];
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
            xAxis = getAllDays();
            xHeaders = getHeaderDays();
            xHeaders.unshift(" ");
            xAxis.unshift(" ");
            console.log(xAxis);
            sections = xAxis.length-1;
            $.ajax({
                url: './crud_admin_stat.php',
                dataType: 'xml',
                type: 'GET',
                data: { "radnja_ime":$radnja_ime, "datum_od":sdate, "datum_do":edate, "korisnik_id":$korisnik_id},
                success: prikazi_graf
            });
            if(graf_prikazan == 0) {
                $("#gumb_graf").show();
            }
            else {
                $("#gumb_graf").hide();
            }
        }
        else $("#gumb_graf").hide();
    }
    $.ajax({
        url: './crud_admin_stat.php',
        dataType: "xml",
        type: "GET",
        data: {"pn":1, "sort": $sort_stupac, "type":$sort_vrsta, "opis":$radnja_ime, "tip_radnje_id":$radnja_tip_id, "korisnik_id":$korisnik_id, "datum_od":sdate, "datum_do":edate},
        success: function(data) {
            prikazi(data);
            paging(data, 1);
        }
    });
});


function prikazi_graf($data) {
	brojke = [];
	brojke_n = [];
	$("#canvas").remove();
    $($data).find('radnja_stat').each(function() {
        brojke[$(this).attr("datum")] = $(this).attr("stat_broj");
    });
    for (var x=1; x<=xAxis.length; x++) {
        if (xAxis[x] in brojke) {
            brojke_n[x] = Number(brojke[xAxis[x]]);
        }
        else {
            brojke_n[x] = 0;
        }
    }
    Val_max = $($data).find("max_stat_broj").text();
	$('<canvas id="canvas" height="400" width="940"></canvas>').appendTo("#show_canvas");
    init();
}

function init() {
	Val_max = parseInt(Val_max)+4;
	var Val_min = -1;
	var stepSize = 1;
	var columnSize = 0;
	var rowSize = 0;
	var margin = 10;
	var canvas = document.getElementById("canvas");
	var context = canvas.getContext("2d");
	context.fillStyle = "#0099ff";
	context.font = "20 pt Verdana";
	
	var yScale = canvas.height / Val_max;
	var xScale = canvas.width / sections;
	context.strokeStyle="#009933"; // color of grid lines
	context.beginPath();
		// print Parameters on X axis, and grid lines on the graph
	for (i=1;i<=sections;i++) {
		var x = i * xScale;
		context.fillText(xHeaders[i], x-15,10);
		context.moveTo(x,yScale);
		context.lineTo(x, canvas.height);
	}
		// print row header and draw horizontal grid lines
	var count =  0;
	for (scale=Val_max;scale>=Val_min;scale = scale - stepSize) {
		var y = yScale * count * stepSize;
		context.fillText(scale-1, margin,y+yScale);
		context.moveTo(xScale,y+yScale);
		context.lineTo(canvas.width,y+yScale);
		count++;
	}
	context.stroke();
	
	context.translate(0,canvas.height + Val_min * yScale + yScale);
    context.strokeStyle="#FF0000";
	context.lineWidth=3;
	plotBrojke(brojke_n, context, xScale, yScale);
}

function plotBrojke(dataSet, context, xScale, yScale) {
	context.beginPath();
	context.moveTo(0, dataSet[0]);
	var y = yScale * -1;
	for (i=1;i<=sections;i++) {
		context.lineTo(i * xScale, dataSet[i]*y);
	}
	context.stroke();
}

/** TAAAAABLICEEEEEE */
function prikazi($data) {
    var tablica = $('<table id = "filmovi_ocjene">');
    tablica.append('<thead><tr><th>Datum</th><th>Ime</th><th>Prezime</th><th>Opis</th><th>Radnja</th><th>Broj</th>');
    var tbody = $("<tbody>");
    $($data).find('dnevnik_stat').each(function() {
        var red = "<tr>";
        red += "<td>" + $(this).attr("datum") + "</td>";
        red += "<td>" + $(this).attr("ime") + "</td>";
		red += "<td>" + $(this).attr("prezime") + "</td>";
		red += "<td>" + $(this).attr("opis") + "</td>";
        red += "<td>" + $(this).attr("radnja") + "</td>";
        red += "<td>" + $(this).attr("broj") + "</td>";
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
		url: './crud_admin_stat.php',
        dataType: 'xml',
        type: 'GET',
		data: {"pn":page, "sort": $sort_stupac, "type":$sort_vrsta, "opis":$radnja_ime, "tip_radnje_id":$radnja_tip_id, "korisnik_id":$korisnik_id, "datum_od":sdate, "datum_do":edate},
		success: function(data) {
            prikazi(data);
            paging(data, page);
        }
	});
});


$("#gumb_graf").click(function() {
    $("#gumb_graf").hide();
    $("#gumb_sakrij").show();
    $("#show_canvas").show();
    graf_prikazan = 1;
});

$("#gumb_sakrij").click(function(){
    $("#gumb_graf").show();
    $("#gumb_sakrij").hide();
    $("#show_canvas").hide();
    graf_prikazan = 0;
});