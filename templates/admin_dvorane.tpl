<div class="row main">
    <div class = "row edit_forma">
        <form class="forma_admin">
            <label for="naziv">Broj mjesta</label>
            <input type="text" id="kapacitet" name="kapacitet"><br/>
            <div class="col-1 col-4-off">
                <button type="button" id="dodaj_zapis" class="buttons">Dodaj</button>
                <button type="button" id="update_zapis" class="buttons">Ažuriraj</button>
            </div>
        </form>
    </div>
    <div class = "row">
        <div class = "col-2 col-10-off gumbovi desni_gumb">
            <button type="button" id="gumb_dodaj" class="buttons">&#43; Dodaj</button>
            <button type="button" id="gumb_odustani" class="buttons">Odustani</button>
        </div>
    </div>
    <form name="dvorane_lokacije">
        <select id="lokacija_odabir">
        </select><br/>
    </form>
    <div id="generirana_tablica"></div>
    <div class="row sjedala">
        <h3>Raspored sjedala</hr>
        <div id="tablica_sjedala"></div>
        <button type="button" id="dodaj_red" class="buttons_seats">&darr; Red +1</button>
        <button type="button" id="ukloni_red" class="buttons_seats">&uarr; Red -1</button>
        <button type="button" id="ukloni_stupac" class="buttons_seats">&larr; Stupac -1</button>
        <button type="button" id="dodaj_stupac" class="buttons_seats">&rarr; Stupac +1</button>
    </div>
</div>