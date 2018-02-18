$(document).ready(function(){
    $film_id = $("#film_id").val();
    $.ajax({
        url: './crud_filmovi.php',
        dataType: "xml",
        type: "GET",
        data: {"korisnik_film":$film_id},
        success: prikazi_film
    });
    $.ajax({
        url: './crud_filmovi.php',
        dataType: "xml",
        type: "GET",
        data: {"korisnik_filmovi": 1 },
        success: prikazi_filmove
    });
});

function prikazi_film($data){
    var sadrzaj = $('<div></div>');
    $($data).find('film').each(function() {
        var div = "<div class='row'><div class='col-6 slika'>";
        div += "<a value='"+ $(this).attr("film_id") +"'><img src='uploads/"+ $(this).attr("slika") +"' alt='slika'></a><br>";
        div += "<div id='like_dislike'></div>";
        div += "</div>";
        div += "<div class='col-6 detalji'>";
        div += "<h4>Naziv film: </h4>" + "<p>"+ $(this).attr("naziv") +"</p><br>";
        div += "<h4>Originalni naziv: </h4>" + "<p>"+ $(this).attr("naziv_original") +"</p><br>";
        div += "<h4>Žanr: </h4>" + "<p>"+ $(this).attr("zanr") +"</p><br>";
        div += "<h4>Država: </h4>" + "<p>"+ $(this).attr("drzava") +"</p><br>";
        div += "<h4>Redatelj: </h4>" + "<p>"+ $(this).attr("redatelj") +"</p><br>";
        div += "<h4>Godina: </h4>" + "<p>"+ $(this).attr("godina") +"</p><br>";
        div += "<h4>Uloge: </h4>" + "<p>"+ $(this).attr("uloge") +"</p><br>";
        div += "<h4>Trajanje: </h4>" + "<p>"+ $(this).attr("trajanje") +"</p><br>";
        div += "</div></div>";
        div += "<div class='row'><div class='col-6 opis'>";
        div += "<h4>Opis<br></h4>" + "<p>"+ $(this).attr("opis") +"</p>";
        div += "</div></div>";
        sadrzaj.append(div);
    });
    $("#korisnik_filmovi").html(sadrzaj);
    $.ajax({
        url: './xml_filmovi_ocjene.php',
        dataType: "xml",
        type: "GET",
        data: {"film_id":$film_id},
        success: prikazi_ocjene
    });
}

function prikazi_ocjene($data){
    var sadrzaj = $('<div></div>');
    $($data).find('film_ocjena').each(function() {
        $like_br = $(this).attr("like_broj");
        $dislike_br = $(this).attr("dislike_broj");
        $ocjena = $(this).attr("ocjena");
        if ($ocjena == 1) {
            $img_src_like = "img/thumb_green.png";
            $class_like = "like_active";
            $img_src_dislike = "img/thumb_down.png";
            $class_dislike = "dislike_inactive";
        }
        else if ($ocjena == 0) {
            $img_src_like = "img/thumb_up.png";
            $class_like = "like_inactive";
            $img_src_dislike = "img/thumb_red.png";
            $class_dislike = "dislike_active";
        }
        else {
            $img_src_like = "img/thumb_up.png";
            $class_like = "like_inactive";
            $img_src_dislike = "img/thumb_down.png";
            $class_dislike = "dislike_inactive";
        }
        var div = "<p id='down_count'>" + $dislike_br + "</p><img src='"+ $img_src_dislike +"' alt='dislike' id='thumb_down' class='"+ $class_dislike +"'/><p id='up_count'>"+ $like_br +"</p><img src='"+ $img_src_like +"' alt='like' id='thumb_up' class='"+ $class_like + "'/>";
        sadrzaj.append(div);
    });
    $("#like_dislike").html(sadrzaj);
}

$("#korisnik_filmovi").on('click','.like_inactive', function(){
    $.ajax({
        url: './xml_filmovi_ocjene.php',
        dataType: "xml",
        type: "GET",
        data: {"film_ocjena":$film_id,"ocjena":1},
        success: function(){
            $.ajax({
                url: './xml_filmovi_ocjene.php',
                dataType: "xml",
                type: "GET",
                data: {"film_id":$film_id},
                success: prikazi_ocjene
            });
        }
    });
});

$("#korisnik_filmovi").on('click','.dislike_inactive', function(){
    $.ajax({
        url: './xml_filmovi_ocjene.php',
        dataType: "xml",
        type: "GET",
        data: {"film_ocjena":$film_id,"ocjena":0},
        success: function(){
            $.ajax({
                url: './xml_filmovi_ocjene.php',
                dataType: "xml",
                type: "GET",
                data: {"film_id":$film_id},
                success: prikazi_ocjene
            });
        }
    });
});

$("#korisnik_filmovi").on('click','.like_active', function(){
    $.ajax({
        url: './xml_filmovi_ocjene.php',
        dataType: "xml",
        type: "GET",
        data: {"film_ocjena_del":$film_id},
        success: function(){
            $.ajax({
                url: './xml_filmovi_ocjene.php',
                dataType: "xml",
                type: "GET",
                data: {"film_id":$film_id},
                success: prikazi_ocjene
            });
        }
    });
});

$("#korisnik_filmovi").on('click','.dislike_active', function(){
    $.ajax({
        url: './xml_filmovi_ocjene.php',
        dataType: "xml",
        type: "GET",
        data: {"film_ocjena_del":$film_id},
        success: function(){
            $.ajax({
                url: './xml_filmovi_ocjene.php',
                dataType: "xml",
                type: "GET",
                data: {"film_id":$film_id},
                success: prikazi_ocjene
            });
        }
    });
});

function prikazi_filmove($data){
    var sadrzaj = $('<div></div>');
    sadrzaj.append('<h3>Svi filmovi</h3>')
    $($data).find('film').each(function() {
        var div = "<div class='col-4'>";
        div += "<a value='"+ $(this).attr("film_id") +"'><img src='uploads/"+ $(this).attr("slika") +"' alt='slika'></a>";
        div += "<h3>"+ $(this).attr("naziv") +"</h3>";
        div += "</div>";
        sadrzaj.append(div);
    });
    $(".najava").html(sadrzaj);
}

$(".najava").on('click','a', function(){
    $("body").scrollTop(0);
    $film_id = $(this).attr('value');
    $.ajax({
        url: './crud_filmovi.php',
        dataType: "xml",
        type: "GET",
        data: {"korisnik_film":$film_id},
        success: prikazi_film
    });
});