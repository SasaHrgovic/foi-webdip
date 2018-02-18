<div class="row main">
    <div class ="row">
        <label for='korisnik'>Korisnik</label>
        <select id="korisnik_odabir">
        </select>
        <label for='radnja_tip_odabir'>Vrsta radnje</label>
        <select id="radnja_tip_odabir">
            <option value="">Odaberi</option>
        </select>
        <label for='radnja_odabir'>Radnja</label>
        <select id="radnja_odabir">
            <option value="">Odaberi radnju</option>
        </select>
    </div>
    <div class ="row tablica_naslov">
        <div class = "col-5">
        <label for='pocetni'>Početni</label>
        <input type='date' name='pocetni' id='pocetni' class='interval_odabir'></input>
        <label for='zadnji'>Zadnji</label>
        <input type='date' name='zadnji' id='zadnji' class='interval_odabir'></input>
        </div>
        <div class = "col-4 col-3-off sort">
            <label for="sort_stupac">Sortiraj</label>
            <select class="sort_stupac" id="sort_stupac">
                <option value="1">Vrijeme</option>
                <option value="3">Ime</option>
                <option value="4">Prezime</option>
                <option value="5">Opis</option>
                <option value="6">Radnja</option>
            </select>
            <select class="sort_stupac" id="sort_vrsta">
                <option value="asc" selected="selected">Uzlazno</option>
                <option value="desc">Silazno</option>
            </select>
        </div>
    </div>
    <div id="generirana_tablica"></div>
    <div class = "row">
        <div class = "col-6 col-6-off pagination">
            <div id="pagination">
                <div><a href="#" id="1"></a></div>
            </div>
        </div>
    </div>
</div>