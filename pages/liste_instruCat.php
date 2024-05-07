<?php
$c = new CategorieDB($cnx);
$liste = $c->getAllCategories();
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
                        <img src="<?php print $liste[$i]->image_categorie ?>" alt="<?php print $liste[$i]->nom_categorie ?>" title="<?php print $liste[$i]->nom_categorie ?>" width="400px" height="350px">
                        <div class="card-body d-flex justify-content-between align-items-center">
                            <span class="card-text">
                                <?php
                                print $liste[$i]->nom_categorie;
                                ?>
                            </span>
                            <a href="index_.php?id_categorie=<?php print $liste[$i]->id_categorie;?>&page=instrumentsCategorie.php"><i class="bi bi-box-arrow-up-right"></i></a>
                        </div>
                    </div>
                </div>
                <?php
            }
            ?>
        </div>
    </div>