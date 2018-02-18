<div class="row main" id="postavke">
    <div class="row">
        <h4>Broj zapisa po stranici: {$stranice_vrijednost}</h4>
        <div class="col-1">
            <button type="button" id="promijeni_stranica" class="buttons promijeni">Promijeni</button>
        </div>
        <div class="row stranice_forma">
            <div class="col-4">
                <form>
                    <label for="novo_stranice">Novi broj</label>
                    <input type="text" id="novo_stranice" name="novo_stranice"><br/>
                </form>
            </div>
            <button type="button" id="postavi_stranica" class="buttons postavi">Postavi</button>
            <button type="button" id="odustani_stranica" class="buttons odustani">Odustani</button>
        </div>
    </div>
    <div class="row">
        <h4>Trenutno vrijeme: {$vrijeme_pomak}</h4>
        <div class="col-1">
            <button type="button" id="promijeni_pomak" class="buttons promijeni">Promijeni</button>
        </div>
        <div class="row pomak_forma">
            <div class="col-4">
                <form>
                    <label for="novo_pomak">Novi pomak</label>
                    <input type="text" id="novo_pomak" name="novo_pomak"><br/>
                </form>
            </div>
            <button type="button" id="postavi_pomak" class="buttons postavi">Postavi</button>
            <button type="button" id="odustani_pomak" class="buttons odustani">Odustani</button>
        </div>
    </div>
    <div class="row">
    </div>
    <div class="row">
    </div>
</div>