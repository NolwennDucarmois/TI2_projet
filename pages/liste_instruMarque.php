<?php
$c = new MarqueDB($cnx);
$liste = $c->getAllMarques();
$n = count($liste);
?>
<div class="album py-5 bg-body-tertiary">
    <div class="container">
        <div class="row row-cols-1 row-cols-sm-2 row-cols-md-3 g-3">
            <?php
            for ($i = 0; $i < $n; $i++) {
                ?>
                <div class="col">
                    <div class="card shadow-sm">
                        <div class="card-body d-flex justify-content-between align-items-center">
                            <span class="card-text">
                                <?php
                                print $liste[$i]->nom_marque;
                                ?>
                            </span>
                            <a href="index_.php?id_marque=<?php print $liste[$i]->id_marque;?>&page=instrumentsMarque.php"><i class="bi bi-box-arrow-up-right"></i></a>
                        </div>
                    </div>
                </div>
                <?php
            }
            ?>
        </div>
    </div>