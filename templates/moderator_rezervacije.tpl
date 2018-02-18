<div class="row main">
    <div class = "row">
        <div class = "col-4">
         <form name="filmovi_projekcije">
            <select id="lokacija_odabir" class="projekcije_filter">
            </select><br/>
            <select id="dvorana_odabir" class="projekcije_filter">
                <option value=''>Odaberi dvoranu</option>
            </select><br/>
            <select id="projekcija_odabir" class="projekcije_filter">
                <option value=''>Odaberi projekciju</option>
            </select><br/>
        </form>
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
                <option value="5">ID</option>
                <option value="1">Film</option>
                <option value="4">Početak</option>
                <option value="8">Rezervirano</option>
                <option value="10">Odobrenje</option>
                <option value="11">Ime</option>
                <option value="12">Prezime</option>
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