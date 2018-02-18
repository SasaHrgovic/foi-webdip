<div class="row main">
    <div class = "row edit_forma">
        <form class="forma_admin" id="forma_lokacije" name="forma_lokacije" enctype='multipart/form-data'>
            <label for="naziv">Naziv</label>
            <input type="text" id="naziv" name="naziv"><br/>
            <label for="ulica">Ulica</label>
            <input type="text" id="ulica" name="ulica"><br/>
            <label for="broj">Broj</label>
            <input type="number" id="broj" name="broj"><br/>
            <label for="postanski_broj">Poštanski broj</label>
            <input type="text" id="postanski_broj" name="postanski_broj"><br/>
            <label for="grad">Grad</label>
            <input type="text" id="grad" name="grad"><br/>
            <label for="drzava">Država</label>
            <select id="drzava" name="drzava">
            <option value='0' selected></option>
            </select><br/>
            <label for="telefon">Telefon</label>
            <input type="tel" id="telefon" name="telefon"><br/>
            <label for="latitude">Latitude</label>
            <input type="text" id="latitude" name="latitude"><br/>
            <label for="longitude">Longitude</label>
            <input type="text" id="longitude" name="longitude"><br/>
            <label for="moderator">Moderator</label>
            <select id="moderator" name="moderator">
            </select><br/>
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
                <option value="2">Naziv</option>
                <option value="3">Ulica</option>
                <option value="4">Broj</option>
                <option value="5">Poštanski broj</option>
                <option value="6">Grad</option>
                <option value="7">Država</option>
                <option value="8">Telefon</option>
                <option value="9">Moderator</option>
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
