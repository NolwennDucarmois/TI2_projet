<?php
$marques = new MarqueDB($cnx);
$listeM = $marques->getAllTous();
$n = count($listeM);
?>

<h2>Ajout d'un instrument</h2>
<br>
<div class="container">
    <form method="get" id="formulaire_ajoutInstru" action="">
        <div class="form-floating mb-3">
            <input type="text" class="form-control" id="reference" name="reference" placeholder="reference">
            <label for="reference">Référence de l'instrument</label>
        </div>
        <div class="form-floating mb-3">
            <input type="text" class="form-control" id="nom" name="nom" placeholder="nom">
            <label for="nom">Nom de l'instrument</label>
        </div>
        <div class="form-floating mb-3">
            <input type="text" class="form-control" id="couleur" name="couleur" placeholder="couleur">
            <label for="couleur">Couleur</label>
        </div>
        <div class="form-floating mb-3">
            <input type="number" class="form-control" id="prix" name="prix" placeholder="prix">
            <label for="prix">Prix</label>
        </div>
        <select class="form-select" aria-label="Marque" id="id_marque" name="id_marque">
            <option selected>Marque à choisir</option>
            <?php
            for($m=0; $m<$n; $m++) {
                ?>
                <option value="<?= $listeM[$m]->id_marque; ?>"><?= $listeM[$m]->nom_marque; ?></option>
                <?php
            }
            ?>
        </select>
        <br>
        <select class="form-select" aria-label="Categorie" id="id_categorie" name="id_categorie">
            <option selected>Catégorie à choisir</option>
            <option value="1">Instrument à vent</option>
            <option value="2">Instrument à cordes</option>
            <option value="3">Instrument à percussions</option>
            <option value="4">Clavier</option>

        </select>
        <br>
        <div class="input-group">
            <input type="file" class="form-control" id="image" aria-describedby="inputGroupFileAddon04" aria-label="Upload">
        </div>
        <br>
        <button type="submit" class="btn btn-outline-success" id="btn_ajouter">Ajouter ou Modifier</button>
        <button type="reset" id="reset" class="btn btn-outline-success">Annuler</button>
    </form>
</div>
