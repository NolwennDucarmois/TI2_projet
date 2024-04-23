<?php
if (isset($_POST['submit_login'])) {
    extract($_POST, EXTR_OVERWRITE);
    $ad = new AdminDB($cnx);
    $admin = $ad->getAdmin($login, $password);
    if ($admin) {
        $_SESSION['admin'] = 1;
        ?>
        <meta http-equiv="refresh" content="0;URL=admin/index_.php?page=accueil_admin.php">
        <?php

    } else {
        print "<br>Accès réservé aux administrateurs";
        ?>
        <meta http-equiv="refresh" content="2;URL=index_.php?page=accueil.php">
        <?php
    }
}
?>

<form method="post" action="<?= $_SERVER['PHP_SELF']; ?>">
    <div class="mb-3">
        <label for="login" class="form-label">Login : </label>
        <input type="text" name="login" class="form-control" id="login">
    </div>
    <div class="mb-3">
        <label for="password" class="form-label">Mot de passe : </label>
        <input type="password" name="password" class="form-control" id="password">
    </div>
    <button type="submit" class="btn btn-primary" name="submit_login">Connexion</button>
</form>
