<?php
require 'src/php/utils/verifier_connexion.php';
$instrus = new InstrumentDB($cnx);
$liste = $instrus->getInstrumentById($_GET['id_instrument']);
if ($liste) {
    $id = $liste[0]->id_instrument;
    $couleur = $liste[0]->couleur_instrument;
    $prix = $liste[0]->prix_instrument;
    $image = $liste[0]->image_instrument;
}
?>

<h2>Modification d'un instrument</h2>
<br>
<div class="container">
    <form method="get" id="formulaire_modifInstru" action="">
        <div class="form-floating mb-3">
            <input type="hidden" name="id" id="id" value="<?= $id; ?>">
            <input type="text" class="form-control" id="couleur" name="couleur" placeholder="couleur" value="<?= $couleur; ?>">
            <label for="couleur">Couleur</label>
        </div>
        <div class="form-floating mb-3">
            <input type="number" class="form-control" id="prix" name="prix" placeholder="prix" value="<?= $prix; ?>">
            <label for="prix">Prix</label>
        </div>
        <br>
        <button type="submit" class="btn btn-outline-success" id="btn_modif">Modifier</button>
        <button type="reset" id="reset" class="btn btn-outline-success">Annuler</button>
    </form>
</div>
