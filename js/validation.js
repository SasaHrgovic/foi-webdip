$(document).ready(function(){
    $forma = $("form");
    $ime = $("#ime");
    $prezime = $("#prezime");
    $korime = $("#korime");
    $lozinka1 = $("#lozinka1");
    $lozinka2 = $("#lozinka2");
    $dan = $("#dan");
    $mjesec = $("#mjesec");
    $godina = $("#godina");
    $spol = $("#spol");
    $drzava = $("#drzava");
    $tel = $("#tel");
    $email = $("#email");
/*dodati nova polja u funkciju*/
    $forma.submit(function(event) {
        if (provjeri($ime) & provjeri($prezime) & provjeri_korime($korime) & provjeri_lozinka($lozinka1) & provjeri_podudaranje($lozinka2, $lozinka1) & provjeri_dan($dan) & provjeri_mjesec($mjesec) & provjeri_godina($godina) & provjeri($spol) & provjeri_drzava($drzava) & provjeri_telefon($tel) & provjeri_email($email) & provjeri_obavijesti()) return true;
        else event.preventDefault();
    });

    $ime.blur(function(){ provjeri($(this)); });
    $prezime.blur(function(){ provjeri($(this)); });
    $korime.blur(function(){ provjeri_korime($(this)); });
    $lozinka1.blur(function(){ provjeri_lozinka($(this)); });
    $lozinka2.blur(function() { provjeri_podudaranje($(this), $lozinka1); });
    $dan.blur(function() { provjeri_dan($(this)); });
    $mjesec.blur(function() { provjeri_mjesec($(this)); });
    $godina.blur(function() { provjeri_godina($(this)); });
    $spol.blur(function() { provjeri($(this)); });
    $drzava.blur(function() { provjeri_drzava($(this)); });
    $tel.blur(function() { provjeri_telefon($(this)); });
    $email.blur(function() { provjeri_email($(this)); });
});


function provjeri($element) {
    if ($element.val() === "") {
        var poruka = "Ovo polje ne smije biti prazno";
        prikazi_greska($element, poruka);
    } else {
        brisi_greska($element);
        return true;
    } 
}

function provjeri_korime($element){
    var vrijednost = $element.val();
    var poruka = "";
    var korime_regx = /^[a-zA-Z0-9_-]{6,15}$/;
    var postoji = "";
    $.ajax({
        type: "GET",
        url: "korisnik.php",
        dataType: "xml",
        data: { "korisnik": vrijednost},
        success: function(data) {
            $(data).find("korisnici").each(function(){
                postoji = $(this).find("korisnik").text();
            });
            if(postoji == 1){
                poruka = "Korisničko ime već postoji";
                prikazi_greska($element, poruka);
                //$element.next().effect("highlight", {color: "yellow"}, 5000);
                //$element.focus();
                return false;
            }
        }
    });
    if ($element.attr("type") !== 'text') {
        poruka = "Polje nije tipa text";
    } else if(!provjeri($element)) return false;
    else if (vrijednost.length < 6) {
        poruka = "Korisničko ime mora imati najmanje 6 znakova";
    } else if(!korime_regx.test(vrijednost)) {
        poruka = "Može sadržavati od 3 do 20 brojka, slova i znakova _ i -";
    } else return true;
    prikazi_greska($element, poruka);
}

function provjeri_lozinka($element) {
    var vrijednost = $element.val();
    var poruka = "";
    var znakovi = /((?=.*\d)(?=.*[a-z])(?=.*[A-Z])(?=.*[!#$%&@_-]).{8,20})/;
    if ($element.attr("type") !== 'password') {
        poruka = "Polje nije tipa password";
    } else if (!provjeri($element)) return false;
    else if (vrijednost.length < 8) {
        poruka = "Lozinka mora imati najmanje 8 znakova";
    } else if (!znakovi.test(vrijednost)) {
        poruka = "Mora imati velika i mala slova, brojke i znakove";
    } else return true;
    prikazi_greska($element, poruka);
}

function provjeri_podudaranje ($element2, $element1) {
    var poruka;
    var vrijednost1 = $element1.val();
    var vrijednost2 = $element2.val();
    if($element2.attr("type") !== 'password'){
        poruka = "Polje nije tipa password";
    } else if (!provjeri($element2)) return false;
    else if (vrijednost1 !== vrijednost2) {
        poruka = "Lozinke se ne podudaraju";
    } else return true;
    prikazi_greska($element2, poruka);
}

function provjeri_dan($element) {
    var poruka;
    var vrijednost = $element.val();
    if($element.attr("type") !== 'number') {
        poruka = "Polje nije tipa number";
    } else if (!provjeri($element)) return false;
    else if (vrijednost < 1 || vrijednost > 31) {
        poruka = "Unos mora biti u rasponu od 1 do 31 i ne smije biti negativan";
    } else return true;
    prikazi_greska($element, poruka);
}

function provjeri_mjesec($element) {
    var poruka;
    var vrijednost = $element.val();
    if(!($element[0].hasAttribute("list"))) {
       poruka = "Unos nije tipa datalist";
    } else if (!provjeri($element)) return false;
    else if (vrijednost < 1 || vrijednost > 12) {
        poruka = "Unos mora biti broj između 1 i 12";
    } else return true;
    prikazi_greska($element, poruka);
}

function provjeri_godina($element) {
    var poruka;
    var vrijednost = $element.val();
    if($element.attr("type") !== 'number') {
        poruka = "Polje nije tipa number";
    } else if (!provjeri($element)) return false;
    else if (vrijednost < 1930 || vrijednost > 2015) {
        poruka = "Unos mora biti u rasponu od 1930 do 2015";
    } else return true;
    prikazi_greska($element, poruka);
}

function provjeri_drzava($element) {
    var vrijednost = $element.val();
    if(vrijednost === "") {
        $('#drzava_poruka').html("Morate odabrati državu");
        $element.removeClass("inputPass").addClass("inputFail");
    } else{
        $('#drzava_poruka').html("");
        $element.removeClass("inputFail").addClass("inputPass");
        return true;
    }
}

function provjeri_telefon($element) {
    var poruka;
    var vrijednost = $element.val();
    var regExp = /[0-9]{3}\s[0-9]{6,7}$/;
    if($element.attr("type") !== 'tel') {
        poruka = "Polje nije tipa tel";
    } else if (!provjeri($element)) return false;
    else if (!regExp.test(vrijednost)) {
        poruka = "Broj mora biti formata xxx xxxxxxx";
    } else return true;
    prikazi_greska($element, poruka);
}

function provjeri_email($element) {
    var poruka;
    var vrijednost = $element.val();
    //var regExp = /^\w{2,}@(\w{2,}\.){1,2}\w{2,}$/;
    var regExp = /^[a-zA-Z0-9._-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,4}$/;
    if($element.attr("type") !== 'email') {
        poruka = "Polje nije tipa email";
    } else if (!provjeri($element)) return false;
    else if (!regExp.test(vrijednost)) {
        poruka = "Email nije ispravno unesen";
    } else return true;
    prikazi_greska($element, poruka);
}


function provjeri_obavijesti() {
    $ne = $("#ne");
    var poruka;
    if (!$("input[name='obavijesti']:checked").val()) {
        poruka = "Morate odabrati jednu opciju";
        prikazi_greska($ne, poruka);
    }
    else {
        brisi_greska($ne);
        return true;
    }
}

function prikazi_greska($element, $poruka) {
    $($element).nextUntil("label").remove();
    $($element).after("<p class='poruka_gr'></p>");
    $($element).next().append($poruka);
    $element.removeClass("inputPass").addClass("inputFail");
}

function brisi_greska($element) {
    $($element).nextUntil("label").remove();
    $($element).after("</br>");
    $element.removeClass("inputFail").addClass("inputPass");
}