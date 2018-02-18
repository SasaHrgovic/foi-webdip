<div class="row main">
<div class = "row edit_forma">
    <div class = "row">
        <div class="col-6">
            <form class="forma_admin" id="forma_tip_korisnika" name="forma_tip_korisnika">
                <label for="tip_korisnika">Tip korisnika</label>
                <select id="tip_korisnika" name="tip_korisnika">
                </select><br/>
            </form>
        </div>
    </div>
    <div class = "row">
        <div class="col-2 col-3-off">
                <button type="button" id="odustani_tip" class="buttons">Odustani</button>
            </div>
            <div class="col-2 col-2-off">
                <button type="button" id="promijeni_tip" class="buttons">Promijeni</button>
            </div>
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
    <div id="generirana_tablica"></div>
    <div class = "row">
        <div class = "col-6 col-6-off pagination">
            <div id="pagination">
                <div><a href="#" id="1"></a></div>
            </div>
        </div>
    </div>
</div>