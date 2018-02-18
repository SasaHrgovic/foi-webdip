<div class="row main">
    <div class = "row edit_forma">
        <form class="forma_admin" id="forma_lokacije" name="forma_lokacije" enctype='multipart/form-data'>
            <label for="naziv">Odaberi film</label>
            <select id="film_odabir">
            </select><br/>
            <label for="naziv">Vrijeme početka</label>
            <input type="text" id="vrijeme" name="vrijeme"><br/>
            <p id="pocetak_greska"></p>
            <p id="zavrsetak_greska"></p>
            <label for="dvorana_promjena" id="dvorana_promjena_lbl">Promijeni dvoranu</label>
            <select id="dvorana_promjena">
            </select><br/>
            <button type="button" id="provjeri_termin" class="buttons">Provjeri</button>
            <div class="col-1 col-4-off">
                <button type="button" id="dodaj_zapis" class="buttons">Dodaj</button>
                <button type="button" id="update_zapis" class="buttons">Ažuriraj</button>
            </div>
        </form>
    </div>
    <div class = "row">
        <div class = "col-4">
         <form name="filmovi_projekcije">
            <select id="lokacija_odabir" class="projekcije_filter">
            </select><br/>
            <select id="dvorana_odabir" class="projekcije_filter">
                <option value=''>Odaberi dvoranu</option>
            </select><br/>
        </form>
        </div>
        <div class = "col-2 col-6-off gumbovi desni_gumb">
            <button type="button" id="gumb_dodaj" class="buttons">&#43; Dodaj</button>
            <button type="button" id="gumb_odustani" class="buttons">Odustani</button>
        </div>
    </div>
    <div class ="row tablica_naslov">
        <div class = "col-3">
            <form class="trazilica" name="trazilica">
                <input type="text" id="trazilica" name="trazilica" placeholder="Pretraživanje">
            </form>
        </div>
        <div class = "col-4 col-5-off sort">
            <label for="sort_stupac">Sortiraj</label>
            <select class="sort_stupac" id="sort_stupac">
                <option value="1">ID</option>
                <option value="3">Film</option>
                <option value="4">Trajanje</option>
                <option value="6">Dvorana</option>
                <option value="9">Početak</option>
                <option value="10">Završetak</option>
            </select>
            <select class="sort_stupac" id="sort_vrsta">
                <option value="asc" selected="selected">Uzlazno</option>
                <option value="desc">Silazno</option>
            </select>
        </div>
    </div>
    <div id = "generirana_tablica"></div>
    <div class = "row">
        <div class = "col-6 col-6-off pagination">
            <div id="pagination">
                <div><a href="#" id="1"></a></div>
            </div>
        </div>
    </div>
</div>
<div id="film_zadnji"></div>
<div id="dvorana_zadnji"></div>
<div id="loakcija_edit"></div>
