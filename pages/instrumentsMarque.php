<?php
$c = new MarqueDB($cnx);
$liste = $c->getInstrumentByIdMarque($_GET['id_marque']);
$n = count($liste);
?>
<a href="index_.php?page=liste_instru.php" class="link-opacity-50-hover"><i class="bi bi-box-arrow-in-left"></i> Retour</a>
<div class="album py-5 bg-body-tertiary">
    <div class="container">
        <div class="row row-cols-1 row-cols-sm-2 row-cols-md-3 g-3">
            <?php
            for ($i = 0; $i < $n; $i++) {
                ?>
                <div class="col">
                    <div class="card shadow-sm">
                        <div class="card-body d-flex justify-content-between align-items-center">
                            <p class="card-text">
                                <span><?php echo $liste[$i]->nom_instrument; ?></span>
                                <p id="prix_instru"><?php echo $liste[$i]->prix_instrument; ?>€</p>
                            <a href="index_.php?id_instrument=<?php print $liste[$i]->id_instrument;?>&page=infos_instrument.php"><i class="bi bi-info-square-fill" style="margin-left: 35px"></i></a>
                            </p>
                        </div>
                    </div>
                </div>
                <?php
            }
            ?>
        </div>
    </div>