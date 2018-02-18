<div class="row main">
    <div id="statistika">
        <div class='row' id='show_canvas'>
        </div>
        <form name="filmovi_statistika">
            <div class = "col-2 col-10-off gumbovi desni_gumb">
                <button type="button" id="gumb_sakrij" class="buttons">Sakrij</button>
            </div>
        </form>
    </div>
    <div class ="row">
        <label for='pocetni'>Početni</label>
        <input type='date' name='pocetni' id='pocetni' class='interval_odabir'></input>
        <label for='zadnji'>Zadnji</label>
        <input type='date' name='zadnji' id='zadnji' class='interval_odabir'></input>
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
                <option value="2">Film</option>
                <option value="3">Likes</option>
                <option value="4">Dislikes</option>
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