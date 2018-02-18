<?php /* Smarty version 2.6.30, created on 2016-08-03 19:03:41
         compiled from prijava.tpl */ ?>
<div class="row main">
    <div class="row registration">
        <form class="registration" onsubmit="" action="prijava.php" method="POST" enctype='multipart/form-data'>
            <div class="col-6">
            <label for="username">Korisničko ime:</label>
            <input type="text" name="username" id="username" class="input_normal" placeholder="  korisničko ime"><br/>
            <p id="username_poruka" class="poruka_gr"><?php echo $this->_tpl_vars['gr_username']; ?>
</p>
            <label for="password">Lozinka:</label>
            <input type="password" name="password" id="password" class="input_normal" placeholder="  lozinka"><br/>
            <p id="lozinka_poruka" class="poruka_gr"><?php echo $this->_tpl_vars['gr_password']; ?>
</p>
            <label for="zapamti">Zapamti me:</label>
            <input type="checkbox" name="check" value="zapamti" id="zapamti" checked><br/>
            <label for="submitp">Pošalji</label>
            <input type="submit" id="submitp" value="submit">
            <p id="submit_poruka" class="poruka_gr"><?php echo $this->_tpl_vars['gr_submit']; ?>
</p>
            </div>
        </form>
    </div>
</div>