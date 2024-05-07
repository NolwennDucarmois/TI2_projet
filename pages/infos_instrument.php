<?php
$c = new InstrumentDB($cnx);
$liste = $c->getInstrumentById($_GET['id_instrument']);
$n = count($liste);
?>
<a href="index_.php?page=liste_instru.php" class="link-opacity-50-hover"><i class="bi bi-box-arrow-in-left"></i> Retour</a>
<?php
for ($i = 0; $i < $n; $i++) {
    ?>
    <div class="container">
        <div class="row">
            <div class="col-md-6">
                <img src="<?php echo $liste[$i]->image_instrument ?>" alt="<?php echo $liste[$i]->nom_instrument ?>"
                     title="<?php print $liste[$i]->nom_instrument ?>" id="image_instrument_aff">
            </div>
            <div class="col-md-6">
                <h3 id="nom_instrument_aff"><?php echo $liste[$i]->nom_instrument; ?></h3>
                <br>
                <div id="reference_div">
                    <span id="reference_instrument_aff">Référence :</span>
                    <span id="reference_instrument_infos"><?php echo $liste[$i]->reference_instrument ?></span>
                </div>
                <div id="marque_div">
                    <span id="marque_instrument_aff">Marque :</span>
                    <span id="marque_instrument_infos"><?php echo $liste[$i]->nom_marque ?></span>
                </div>
                <div id="categorie_div">
                    <span id="categorie_instrument_aff">Catégorie :</span>
                    <span id="categorie_instrument_infos"><?php echo $liste[$i]->nom_categorie ?></span>
                </div>
                <div id="couleur_div">
                    <span id="couleur_instrument_aff">Couleur :</span>
                    <span id="couleur_instrument_infos"><?php echo $liste[$i]->couleur_instrument ?></span>
                </div>
                <br>
                <p id="prix_instrument_aff"><?php echo $liste[$i]->prix_instrument; ?>€</p>
            </div>
        </div>
    </div>
    <?php
}
?>
