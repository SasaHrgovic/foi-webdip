<?php /* Smarty version 2.6.30, created on 2016-08-07 01:34:20
         compiled from registration.tpl */ ?>
<div class="row main">
    <div class="row registration">
        <form class="registration" id="registracija" name="registracija" action="registration.php" method="POST" enctype='multipart/form-data'>
            <div class="col-6">
                <label for="ime">Ime:</label><br/>
                <input type="text" id="ime" class="input_normal" name="ime"><br/>
                <p id="ime_poruka" class="poruka_gr"><?php echo $this->_tpl_vars['gr_ime']; ?>
</p>
                <label for="prezime">Prezime:</label><br/>
                <input type="text" id="prezime" class="input_normal" name="prezime"><br/>
                <p id="prezime_poruka" class="poruka_gr"><?php echo $this->_tpl_vars['gr_prezime']; ?>
</p>
                <label for="korime">Korisničko ime: </label><br/>
                <input type="text" id="korime" class="input_normal" name="korime"><br/>
                <p id="korime_poruka" class="poruka_gr"><?php echo $this->_tpl_vars['gr_korime']; ?>
</p>
                <label for="lozinka1">Lozinka</label><br/>
                <input type="password" id="lozinka1" class="input_normal" name="lozinka1"><br/>
                <p id="lozinka1_poruka" class="poruka_gr"><?php echo $this->_tpl_vars['gr_lozinka1']; ?>
</p>
                <label for="lozinka2">Potvrda lozinke:</label><br/>
                <input type="password" id="lozinka2" class="input_normal" name="lozinka2"><br/>
                <p id="lozinka2_poruka" class="poruka_gr"><?php echo $this->_tpl_vars['gr_lozinka2']; ?>
</p>
            </div>
            <div class="row birthday">
                <label for="dan">Datum rođenja</label><br/>
                <div class="col-2">
                    <label for="dan">Dan</label>
                    <input type="number" id="dan" class="input_normal" name="dan"><br/>
                    <p id="dan_poruka" class="poruka_gr"><?php echo $this->_tpl_vars['gr_dan']; ?>
</p>
                </div>
                <div class="col-2">
                    <label for="mjesec">Mjesec</label>
                    <input list="mjeseci" id="mjesec" class="input_normal" name="mjesec"><br/>
                    <p id="mjesec_poruka" class="poruka_gr"><?php echo $this->_tpl_vars['gr_mjesec']; ?>
</p>
                </div>
                <div class="col-2">
                    <label for="godina">Godina</label>
                    <input type="number" id="godina" class="input_normal" name="godina"><br/>
                    <p id="godina_poruka" class="poruka_gr"><?php echo $this->_tpl_vars['gr_godina']; ?>
</p>
                </div>
                <datalist id="mjeseci">
                    <option value="1">Siječanj</option>
                    <option value="2">Veljača</option>
                    <option value="3">Ožujak</option>
                    <option value="4">Travanj</option>
                    <option value="5">Svibanj</option>
                    <option value="6">Lipanj</option>
                    <option value="7">Srpanj</option>
                    <option value="8">Kolovoz</option>
                    <option value="9">Rujan</option>
                    <option value="10">Listopad</option>
                    <option value="11">Studeni</option>
                    <option value="12">Prosinac</option>
                </datalist>
            </div>
            <div class="col-6">
              <label for="spol">Spol:</label><br/>
              <select  id="spol" class="input_normal" name="spol" form="registracija">
                  <option value="">Odaberi spol</option>
                  <option value="f">Žensko</option>
                  <option value="m">Muško</option>
              </select><br/>
              <p id="spol_poruka" class="poruka_gr"><?php echo $this->_tpl_vars['gr_spol']; ?>
</p>
                <label for="drzava">Mobilni telefon:</label><br/>
                <select id="drzava" class="input_normal" name="drzava" form="registracija">
                    <option value="" selected="selected">Odaberi državu</option>
                    <option value="1">Hrvatska</option>
                    <option value="2">Srbija</option>
                    <option value="3">Bosna i Hercegovina</option>
                    <option value="4">Crna Gora</option>
                    <option value="5">Slovenija</option>
                    <option value="6">Makedonija</option>
                    <option value="7">Kosovo</option>
                </select>
                <input type="tel" id="tel" class="input_normal" name="tel" placeholder="xxx xxxxxxx"><br/>
                <p id="tel_poruka" class="poruka_gr"><?php echo $this->_tpl_vars['gr_tel']; ?>
</p>
                <label for="email">Email:</label><br/>
                <input type="email" id="email" class="input_normal" name="email"><br/>
                <p id="email_poruka" class="poruka_gr"><?php echo $this->_tpl_vars['gr_email']; ?>
</p>
                <input type="hidden" name="MAX_FILE_SIZE" value="2097152" />
                <label for="image">Slika</label><br/>
                <input type="file" id="image" name="image" accept="image/*"><br/>
                <p id="slika_poruka" class="poruka_gr"><?php echo $this->_tpl_vars['gr_image']; ?>
</p>
                <label>Obavijesti</label><br/>
                <label for="obavijesti">Da</label>
                <input type="radio" id="da" name="obavijesti" value="1" checked>
                <label for="vazno">Ne</label>
                <input type="radio" id="ne" name="obavijesti" value="0"><br/>
                <p id="obavijesti_poruka" class="poruka_gr"><?php echo $this->_tpl_vars['gr_obavijesti']; ?>
</p>
                <label for="g-recaptcha">ReCaptcha</label>
                <div class="g-recaptcha" data-sitekey="6LchnSYTAAAAACL5itgWNX7XTdSabodoXOqh-LV0"></div>
                <p id="captcha_poruka" class="poruka_gr"><?php echo $this->_tpl_vars['gr_captcha']; ?>
</p>
                <label for="submit">Pošalji</label><br/>
                <input type="submit" id="submit" value="submit" class="input_not">
            </div>
        </form>
    </div>
</div>