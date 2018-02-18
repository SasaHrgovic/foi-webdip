$(document).ready(function(){
    $( "#gumb_dodaj" ).click(function() {
        $(".edit_forma").show();
        $("#gumb_dodaj").hide();
        $("#gumb_odustani").show();
        $("#dodaj_zapis").show();
        $("#update_zapis").hide();
    });
    $( "#gumb_odustani" ).click(function() {
        $('#kapacitet').val('');
        $( ".edit_forma" ).hide();
        $("#gumb_odustani").hide();
        $( "#gumb_dodaj" ).show();
    });

    $.ajax({
        url: './xml_lokacije.php?dohvati_lokacije=1',
        dataType: "xml",
        type: "GET",
        success: prikazi_lokacije
    });

    $("#lokacija_odabir").on('change', function(){
        $lokacija_id = $(this).val();
        $.ajax({
            url: './crud_dvorane.php',
            dataType: "xml",
            type: "GET",
            data: {"lokacija_id": $lokacija_id },
            success: prikazi
        });
    });
});

function prikazi_lokacije($data) {
    var popis = "<option value='0' selected>Odaberi lokaciju</option>";
    $($data).find('lokacija').each(function() {
        popis += "<option value='" + $(this).attr("lokacija_id") + "'>"+ $(this).attr("naziv") + "</option>";
    });
    $("#lokacija_odabir").html(popis);
}


function prikazi($data) {
    var tablica = $('<table id = "dvorane">');
    tablica.append('<thead><tr><th>Id</th><th>Broj mjesta</th><th>Sjedala</th><th>Uredi</th><th>Obriši</th>');
    var tbody = $("<tbody>");
    $($data).find('dvorana').each(function() {
        var red = "<tr>";
        red += "<td>" + $(this).attr("dvorana_id") + "</td>";
        red += "<td>" + $(this).attr("broj_mjesta") + "</td>";
        red += "<td class='ikona_centar'><img src='img/chair.png' alt='' class='icon icon_chair' id='" + $(this).attr("dvorana_id") + "'/></td>";
        red += "<td class='ikona_centar'><img src='img/edit.png' alt='' class='icon icon_edit' id='" + $(this).attr("dvorana_id") + "'/></td>";
        red += "<td class='ikona_centar'><img src='img/delete.png' alt='' class='icon icon_delete' id='" + $(this).attr("dvorana_id") + "'/></td>";
        red += "</tr>";
        tbody.append(red);
    });
    tbody.append("</tbody></table>");
    tablica.append(tbody);
    $("#generirana_tablica").html(tablica);
}


function obrisi(){
    $("#gumb_odustani").trigger('click');
}


/* CREATE */
$('#dodaj_zapis').click(function() {
    var lokacija_id = $('#lokacija_odabir').val();
    var kapacitet = $('#kapacitet').val();
    $.ajax({
        url: 'https://barka.foi.hr/WebDiP/2015_projekti/WebDiP2015x030/crud_dvorane.php',
        type: "POST",
        data: {"lokacija_id":lokacija_id, "kapacitet":kapacitet },
        success: function(){
            $.ajax({
                url: 'https://barka.foi.hr/WebDiP/2015_projekti/WebDiP2015x030/crud_dvorane.php',
                dataType: "xml",
                type: "GET",
                data: {"lokacija_id": lokacija_id },
                success: prikazi
            });
        }
    });
});

function popuni($data){
    $($data).find('lokacija').each(function() {
        $('#kapacitet').val($(this).attr("kapacitet"));
    });
    $("#gumb_dodaj").trigger('click');
    $("#dodaj_zapis").hide();
    $("#update_zapis").show();
}

/* UPDATE PRIKAZ PODATAKA*/
$("#generirana_tablica").on('click','.icon_edit', function(){
    update_id = $(this).attr('id');
    $.ajax({
        url: 'https://barka.foi.hr/WebDiP/2015_projekti/WebDiP2015x030/crud_dvorane.php',
        dataType: "xml",
        type: "GET",
        data: {"update_id":update_id},
        success: popuni
    });
});

/* UPDATE SLANJE PODATAKA */
//update_id dohvaćen odozgo, globalno
$("#update_zapis").click(function() {
    var kapacitet = $('#kapacitet').val();
    $.ajax({
        url: 'https://barka.foi.hr/WebDiP/2015_projekti/WebDiP2015x030/crud_dvorane.php',
        type: "POST",
        data: {"dvorana_id":update_id, "kapacitet":kapacitet},
        success: function(){
            $("#gumb_odustani").trigger('click');
            var lokacija_id = $("#lokacija_odabir").val();
            $.ajax({
                url: 'https://barka.foi.hr/WebDiP/2015_projekti/WebDiP2015x030/crud_dvorane.php',
                dataType: "xml",
                type: "GET",
                data: {"lokacija_id": lokacija_id },
                success: prikazi
            });
        }
    });
});

/* DELETE */
$("#generirana_tablica").on('click','.icon_delete', function(){
    var lokacija_id = $("#lokacija_odabir").val();
    var id = $(this).attr('id');
    if(confirm("Jeste li sigurni?")){
        $.ajax({
            url: 'https://barka.foi.hr/WebDiP/2015_projekti/WebDiP2015x030/crud_dvorane.php',
            dataType: "xml",
            type: "GET",
            data: {"delete_id":id},
            success: function(){
                $.ajax({
                    url: 'https://barka.foi.hr/WebDiP/2015_projekti/WebDiP2015x030/crud_dvorane.php',
                    dataType: "xml",
                    type: "GET",
                    data: {"lokacija_id": $lokacija_id },
                    success: prikazi
                });
            }
        });
    }
});


function prikazi_sjedala($data){
    var tablica = $('<table id = "sjedala">');
    tablica.append('<caption>KINO PLATNO</caption><thead><tr></tr></thead>');
    var tbody = $("<tbody>");
    $($data).find('redak').each(function() {
        var red = "<tr>";
        var red_br = $(this).attr("broj_retka");
        $(this).children('sjedalo').each(function(){
            red += "<td class='tablica_sjedalo'><img src='img/chair_green.png' alt='' class='icon icon_chair' id='" + $(this).attr("id") + "'/><p>R"+ red_br +" S" + $(this).attr("broj_sjedala") +"</p></td>";
        });
        red += "</tr>";
        tbody.append(red);
    });
    tbody.append("</tbody></table>");
    tablica.append(tbody);
    $("#tablica_sjedala").html(tablica);
    $(".sjedala").show();
}
/**dohvat sjedala */
$("#generirana_tablica").on('click','.icon_chair', function(){
    dvorana_id = $(this).attr('id');
    $.ajax({
        url: 'https://barka.foi.hr/WebDiP/2015_projekti/WebDiP2015x030/crud_sjedala.php',
        dataType: "xml",
        type: "GET",
        data: {"dvorana_id":dvorana_id, "dohvati":1},
        success: prikazi_sjedala
    });
});

/**ewfhweiufhui */

/*CREATE */

$("#dodaj_red").click(function() {
    $.ajax({
        url: 'https://barka.foi.hr/WebDiP/2015_projekti/WebDiP2015x030/crud_sjedala.php',
        dataType: "xml",
        type: "GET",
        data: {"dvorana_id":dvorana_id, "br_redaka":1},
        success: function(){
            $.ajax({
                url: 'https://barka.foi.hr/WebDiP/2015_projekti/WebDiP2015x030/crud_sjedala.php',
                dataType: "xml",
                type: "GET",
                data: {"dvorana_id":dvorana_id, "dohvati":1},
                success: prikazi_sjedala
            });
        }
    });
});

$("#dodaj_stupac").click(function() {
    $.ajax({
        url: 'https://barka.foi.hr/WebDiP/2015_projekti/WebDiP2015x030/crud_sjedala.php',
        dataType: "xml",
        type: "GET",
        data: {"dvorana_id":dvorana_id, "br_stupaca":1},
        success: function(){
            $.ajax({
                url: 'https://barka.foi.hr/WebDiP/2015_projekti/WebDiP2015x030/crud_sjedala.php',
                dataType: "xml",
                type: "GET",
                data: {"dvorana_id":dvorana_id, "dohvati":1},
                success: prikazi_sjedala
            });
        }
    });
});

$("#ukloni_red").click(function() {
    $.ajax({
        url: 'https://barka.foi.hr/WebDiP/2015_projekti/WebDiP2015x030/crud_sjedala.php',
        dataType: "xml",
        type: "GET",
        data: {"dvorana_id":dvorana_id, "del_rows":1},
        success: function(){
            $.ajax({
                url: 'https://barka.foi.hr/WebDiP/2015_projekti/WebDiP2015x030/crud_sjedala.php',
                dataType: "xml",
                type: "GET",
                data: {"dvorana_id":dvorana_id, "dohvati":1},
                success: prikazi_sjedala
            });
        }
    });
});

$("#ukloni_stupac").click(function() {
    $.ajax({
        url: 'https://barka.foi.hr/WebDiP/2015_projekti/WebDiP2015x030/crud_sjedala.php',
        dataType: "xml",
        type: "GET",
        data: {"dvorana_id":dvorana_id, "del_cols":1},
        success: function(){
            $.ajax({
                url: 'https://barka.foi.hr/WebDiP/2015_projekti/WebDiP2015x030/crud_sjedala.php',
                dataType: "xml",
                type: "GET",
                data: {"dvorana_id":dvorana_id, "dohvati":1},
                success: prikazi_sjedala
            });
        }
    });
});