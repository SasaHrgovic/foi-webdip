<div class="row main">
    <div class = "row edit_forma">
        <form class="forma_admin" id="forma_lokacije" name="forma_lokacije">
            <label for="naziv">Naziv</label>
            <input type="text" id="naziv" name="naziv"><br/>
            <label for="naziv_original">Originalni naziv</label>
            <input type="text" id="naziv_original" name="naziv_original"><br/>
            <label for="zanr">Žanr</label>
            <select id="zanr" name="zanr">
            </select><br/>
            <label for="drzava">Država</label>
            <select id="drzava" name="drzava">
            </select><br/>
            <label for="redatelj">Redatelj</label>
            <input type="text" id="redatelj" name="redatelj"><br/>
            <label for="godina">Godina</label>
            <input type="number" id="godina" name="godina"><br/>
            <label for="uloge">Uloge</label>
            <input type="text" id="uloge" name="uloge"><br/>
            <label for="opis">Opis</label>
            <input type="text" id="opis" name="opis"><br/>
            <label for="trajanje">Trajanje</label>
            <input type="number" id="trajanje" name="trajanje"><br/>
            <div class="col-1 col-4-off">
                <button type="button" id="dodaj_zapis" class="buttons">Dodaj</button>
                <button type="button" id="update_zapis" class="buttons">Ažuriraj</button>
            </div>
        </form>
    </div>
    <div class = "row upload_forma">
        <form class="forma_admin" id="forma_upload" name="forma_upload" enctype='multipart/form-data'>
            <label for="id_film">Film ID</label><br/>
            <input type="text" id="id_film" name="id_film"><br/>
            <label for="image">Slika</label><br/>
            <input type="file" id="image" name="image" accept="image/*"><br/>
            <p id="slika_poruka" class="poruka_gr">{$gr_image}</p>
            <label for="submit">Pošalji</label><br/>
            <input type="submit" id="submit" value="submit" class="input_not">
        </form>
        <h4 id="upload_poruka">Upload slike je u tijeku. Molimo Vas da ne osvježavate prozor.</h4>
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
                <option value="3">Original</option>
                <option value="5">Žanr</option>
                <option value="7">Država</option>
                <option value="8">Redatelj</option>
                <option value="9">Godina</option>
                <option value="10">Uloge</option>
                <option value="11">Opis</option>
                <option value="12">Trajanje</option>
                <option value="13">Moderator</option>
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
<div id="drzava_zadnji"></div>
<div id="zanr_zadnji"></div>