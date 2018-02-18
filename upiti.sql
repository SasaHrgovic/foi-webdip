SELECT filmovi.film_id, filmovi.naziv as film_naziv, filmovi.naziv_original, filmovi.zanr_id, zanrovi.naziv as zanr_naziv, filmovi.drzava_id, drzave.naziv as drzava_naziv, filmovi.redatelj, filmovi.godina, filmovi.uloge, filmovi.opis, filmovi.trajanje, filmovi.slika_id from filmovi join zanrovi on filmovi.zanr_id = zanrovi.zanr_id join drzave on filmovi.drzava_id = drzave.drzava_id where filmovi.obrisan = '0'


create view projekcije_pogled as select projekcije.projekcija_id, projekcije.film_id, filmovi.naziv, filmovi.trajanje, projekcije.dvorana_id, dvorane.broj, dvorane.broj_mjesta, dvorane.lokacija_id, projekcije.vrijeme from
filmovi join projekcije on filmovi.film_id = projekcije.film_id join dvorane on dvorane.dvorana_id = projekcije.dvorana_id where projekcije.obrisan='0'

select projekcije.projekcija_id, projekcije.film_id, filmovi.naziv as 'film_naziv', projekcije.film_id, dvorane.broj, projekcije.dvorana_id, lokacije.naziv as 'lokacija_naziv', projekcije.vrijeme_pocetak from filmovi join projekcije on filmovi.film_id = projekcije.film_id join dvorane on dvorane.dvorana_id = projekcije.dvorana_id join lokacije on dvorane.lokacija_id = lokacije.lokacija_id where projekcije.obrisan = '0'


SELECT projekcije.projekcija_id, projekcije.film_id, filmovi.naziv AS  'film_naziv', projekcije.film_id, dvorane.broj, projekcije.dvorana_id, lokacije.naziv AS  'lokacija_naziv', lokacije.lokacija_id, projekcije.vrijeme_pocetak
FROM filmovi
JOIN projekcije ON filmovi.film_id = projekcije.film_id
JOIN dvorane ON dvorane.dvorana_id = projekcije.dvorana_id
JOIN lokacije ON dvorane.lokacija_id = lokacije.lokacija_id
WHERE projekcije.obrisan =  '0'


SELECT projekcije_pogled.naziv as 'film_naziv', projekcije_pogled.dvorana_id, projekcije_pogled.lokacija_id, projekcije_pogled.vrijeme_pocetak, rezervacije.rezervacija_id, rezervacije.projekcija_id, rezervacije.korisnik_id, rezervacije.vrijeme, rezervacije.odobrenje, rezervacije.odobrenje_vrijeme, korisnici.ime, korisnici.prezime from projekcije_pogled join rezervacije on projekcije_pogled.projekcija_id = rezervacije.projekcija_id join korisnici on rezervacije.korisnik_id = korisnici.korisnik_id where rezervacije.obrisan='0'

select sjedalo_rezervacija.prodano from sjedalo_rezervacija, rezervacije where rezervacije.projekcija_id = 2 and rezervacije.rezervacija_id = sjedalo_rezervacija.rezervacija_id and sjedalo_rezervacija.sjedalo_id = 1

/*KOOORISNICIII*/

select korisnici.korisnik_id, korisnici.ime, korisnici.prezime, korisnici.korime, korisnici.datum_rodjenja, korisnici.spol, korisnici.drzava_id, drzave.naziv as 'drzava_naziv', korisnici.telefon, korisnici.email, korisnici.slika_id, korisnici.obavijesti, korisnici.tip_id, tip_korisnika.naziv as 'tip_naziv', korisnici.vrijeme, korisnici.aktivan, korisnici.promasaj_broj from korisnici join drzave on korisnici.drzava_id=drzave.drzava_id join tip_korisnika on tip_korisnika.tip_id = korisnici.tip_id where korisnici.obrisan=0

SELECT DATE(vrijeme) AS datum,
        COUNT(ocjena) AS NumLikes
 FROM   filmovi_ocjene where film_id=3 and ocjena = 1
 GROUP BY 1
 ORDER BY 1

 SELECT film_id, DATE( vrijeme ) AS datum, COUNT( ocjena ) AS likes
FROM filmovi_ocjene
WHERE ocjena =1
GROUP BY 1 , 2
ORDER BY 2 
LIMIT 0 , 30

select film_id as 'id', date(vrijeme) as 'datum', (select count(*) from filmovi_ocjene where ocjena=1 and film_id=id and date(vrijeme)=datum) as 'likes', (select count(*) from filmovi_ocjene where ocjena=0 and film_id=id and date(vrijeme)=datum) as 'dislikes' from filmovi_ocjene group by id,datum order by 2

LIKE DISLIKE 
select film_id as 'id', (select count(*) from filmovi_ocjene where film_id = id and ocjena=1) as 'likes', (select count(*) from filmovi_ocjene where film_id = id and ocjena=0) as 'dislikes' from filmovi_ocjene group by film_id

select film_id as 'id', naziv, (select count(*) from filmovi_ocjene_pogled where film_id = id and ocjena=1) as 'likes', (select count(*) from filmovi_ocjene_pogled where film_id = id and ocjena=0) as 'dislikes' from filmovi_ocjene_pogled group by film_id
