<h2>Gestion des instruments</h2>
<?php
require 'src/php/utils/verifier_connexion.php';
$instrus = new InstrumentDB($cnx);
$liste = $instrus->getAllInstruments();
$n = 0;
if ($liste == null) {
    print "<br><p id='aucun_instrument'>Aucun instrument encodé</p><br>";
    ?>
    <a href="index_.php?page=ajout_instrument.php">Ajout d'un instrument</a>
    <?php
} else {
    $n = count($liste);
    ?>
    <a href="index_.php?page=ajout_instrument.php" id="icon_ajout"><i class="bi bi-plus-square"></i></a>
    <table class="table table-hover" id="table_gestion">
        <thead>
        <tr>
            <th>Identifiant</th>
            <th>Référence</th>
            <th>Nom</th>
            <th>Couleur</th>
            <th>Prix</th>
            <th>Marque</th>
            <th>Catégorie</th>
            <th>Image</th>
            <th>Modif</th>
            <th>Supp</th>
        </tr>
        </thead>
        <tbody>
        <?php
        foreach ($liste as $i) {
            ?>
            <tr id="instru_<?= $i->id_instrument; ?>">
                <th><?= $i->id_instrument; ?></th>
                <td id="<?= $i->id_instrument; ?>"><?= $i->reference_instrument; ?></td>
                <td id="<?= $i->id_instrument; ?>"><?= $i->nom_instrument; ?></td>
                <td id="<?= $i->id_instrument; ?>"><?= $i->couleur_instrument; ?></td>
                <td id="<?= $i->id_instrument; ?>"><?= $i->prix_instrument; ?></td>
                <td id="<?= $i->id_instrument; ?>"><?= $i->nom_marque; ?></td>
                <td id="<?= $i->id_instrument; ?>"><?= $i->nom_categorie; ?></td>
                <td id="<?= $i->id_instrument; ?>">
                    <img src="./public/images/instruments/<?php echo $i->image_instrument; ?>"
                         alt="<?php echo $i->nom_instrument; ?>" id="table_img">
                </td>
                <td class="modif_td">
                    <button data-id="<?= $i->id_instrument; ?>" class="btn btn_modif" title="<?php print 'Modifier : '.$i->nom_instrument;?>"><a href="index_.php?id_instrument=<?php print $i->id_instrument;?>&page=modif_instrument.php"><i class="bi bi-brush modif"></i></a></button>
                </td>
                <td class="delete_td">
                    <button data-id="<?= $i->id_instrument; ?>" class="btn btn_delete" title="<?php print 'Supprimer : '.$i->nom_instrument;?>"><i class="bi bi-trash3-fill delete"></i></button>
                </td>
            </tr>
            <?php
        }
        ?>
        </tbody>
    </table>
    <?php
}
?>