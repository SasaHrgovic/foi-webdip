<div class="row main">
    <div class = "row edit_forma">
        <form class="forma_admin" id="forma_ulaznica" name="forma_ulaznica" enctype='multipart/form-data'>
            <label for="naziv">Naziv</label>
            <div class="col-1 col-4-off">
                <button type="button" id="dodaj_zapis" class="buttons">Dodaj</button>
                <button type="button" id="update_zapis" class="buttons">Ažuriraj</button>
            </div>
        </form>
    </div>
    <div class = "row upload_forma">
        <form class="forma_admin" id="forma_upload" name="forma_upload" enctype='multipart/form-data'>
            <label for="id_rezervacija">Rezervacija ID</label><br/>
            <input type="text" id="id_rezervacija" name="id_rezervacija"><br/>
            <label for="image">Slika</label><br/>
            <input type="file" id="image" name="image" accept="image/*"><br/>
            <p id="slika_poruka" class="poruka_gr">{$gr_image}</p>
            <label for="submit">Pošalji</label><br/>
            <input type="submit" id="submit" value="submit" class="input_not">
        </form>
        <h4 id="upload_poruka">Upload slike je u tijeku. Molimo Vas da ne osvježavate prozor.</h4>
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