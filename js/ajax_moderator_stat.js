$(document).ready(function(){
	stranica=1;
	film_id_temp=0;
	graf_prikazan=0;
    $("#pagination a").trigger('click');
 });

$("#generirana_tablica").on('click','.icon_stat', function(){
	film_id_temp = $(this).attr('value');
	var s = new Date($('#pocetni').val());
    var e = new Date($('#zadnji').val());
	if(!Date.parse(s) | !Date.parse(e)){
		alert('Prvo unesite valjane datume');
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
                url: './crud_moderator_stat.php',
                dataType: 'xml',
                type: 'GET',
                data: { "film_id_likes":film_id_temp, "datum_od":sdate, "datum_do":edate},
                success: prikazi_graf
            });
			$("#show_canvas").show();
			$("#gumb_sakrij").show();
    		graf_prikazan = 1;
        }
    }
});

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

$(document).on("input", "#pocetni, #zadnji, #trazilica, #sort_stupac, #sort_vrsta", function (){
	var $vrijednost =  $("#trazilica").val();
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
                url: './crud_moderator_stat.php',
                dataType: 'xml',
                type: 'GET',
                data: { "film_id_likes":film_id_temp, "datum_od":sdate, "datum_do":edate},
                success: prikazi_graf
            });
			if(graf_prikazan == 0) {
                $("#show_canvas").hide();
            }
            else {
                $("#gumb_graf").show();
            }
			//$("#show_canvas").show();
        }
    }
    $.ajax({
        url: './crud_moderator_stat.php',
        dataType: "xml",
        type: "GET",
        data: {"pn":1, "sort": $sort_stupac, "type":$sort_vrsta, "q":$vrijednost, "datum_od":sdate, "datum_do":edate},
        success: function(data) {
            prikazi(data);
            paging(data, 1);
        }
    });
});

function prikazi_graf($data) {
	likes = [];
	likes_n = [];
	dislikes = [];
	dislikes_n = [];
	$("#canvas").remove();
    $($data).find('film').each(function() {
        likes[$(this).attr("datum")] = $(this).attr("likes");
		dislikes[$(this).attr("datum")] = $(this).attr("dislikes");
    });
    for (var x=1; x<=xAxis.length; x++) {
        if (xAxis[x] in likes) {
            likes_n[x] = Number(likes[xAxis[x]]);
        }
        else {
            likes_n[x] = 0;
        }
    }
	for (var x=1; x<=xAxis.length; x++) {
        if (xAxis[x] in dislikes) {
            dislikes_n[x] = Number(dislikes[xAxis[x]]);
        }
        else {
            dislikes_n[x] = 0;
        }
    }
	Val_max = parseInt($($data).find("max_likes").text());
	Val_min = parseInt($($data).find("max_dislikes").text());
	$('<canvas id="canvas" height="400" width="940"></canvas>').appendTo("#show_canvas");
    init();
}

function init() {
	Val_max = Val_max+4;
	Val_min = Val_min-4;
	var razlika = Val_max-Val_min;
	if (razlika == 0) {
		razlika = 1
	}
	var stepSize = 1;
	var columnSize = 0;
	var rowSize = 0;
	var margin = 10;
	var canvas = document.getElementById("canvas");
	var context = canvas.getContext("2d");
	context.fillStyle = "#0099ff";
	context.font = "20 pt Verdana";
	
	var yScale = canvas.height / razlika;
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
		context.fillText(scale, margin,y+yScale);
		context.moveTo(xScale,y+yScale);
		context.lineTo(canvas.width,y+yScale);
		count++;
	}
	context.stroke();
	
	context.translate(0,canvas.height + Val_min * yScale + yScale);
    context.strokeStyle="#FF0000";
	context.lineWidth=3;
	plotDislikes(dislikes_n, context, xScale, yScale);

    context.strokeStyle="#00FF00";
	plotLikes(likes_n, context, xScale, yScale);
}

function plotLikes(dataSet, context, xScale, yScale) {
	context.beginPath();
	context.moveTo(0, dataSet[0]);
	var y = yScale * -1;
	for (i=1;i<=sections;i++) {
		context.lineTo(i * xScale, dataSet[i]*y);
	}
	context.stroke();
}

function plotDislikes(dataSet, context, xScale, yScale) {
	context.beginPath();
	context.moveTo(0, dataSet[0]);
	var y = yScale * 1;
	for (i=1;i<=sections;i++) {
		context.lineTo(i * xScale, dataSet[i]*y);
	}
	context.stroke();
}


/** TAAAAABLICEEEEEE */
function prikazi($data) {
    var tablica = $('<table id = "filmovi_ocjene">');
    tablica.append('<thead><tr><th>ID</th><th>Naziv</th><th>Likes</th><th>Dislikes</th><th>Graf</th>');
    var tbody = $("<tbody>");
    $($data).find('film_ocjena').each(function() {
        var red = "<tr>";
        red += "<td>" + $(this).attr("film_id") + "</td>";
        red += "<td>" + $(this).attr("naziv") + "</td>";
		red += "<td>" + $(this).attr("likes") + "</td>";
		red += "<td>" + $(this).attr("dislikes") + "</td>";
        red += "<td class='ikona_centar'><img src='img/line-chart.png' alt='' class='icon icon_stat' value='" + $(this).attr("film_id") + "'/></td>";
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
	var $vrijednost =  $("#trazilica").val();
    var $sort_stupac = $('#sort_stupac').val();
    var $sort_vrsta = $('#sort_vrsta').val();
    var s = new Date($('#pocetni').val());
    var e = new Date($('#zadnji').val());
    sdate = edate = '';
    if(!Date.parse(s) || !Date.parse(e)){
        sdate = edate = '';
    }
    else {
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
    $.ajax({
        url: './crud_moderator_stat.php',
        dataType: "xml",
        type: "GET",
        data: {"pn":page, "sort": $sort_stupac, "type":$sort_vrsta, "datum_od":sdate, "datum_do":edate, "q":$vrijednost},
        success: function(data) {
            prikazi(data);
            paging(data, page);
        }
    });
});

$("#gumb_sakrij").click(function(){
    $("#gumb_sakrij").hide();
    $("#show_canvas").hide();
    graf_prikazan = 0;
});
