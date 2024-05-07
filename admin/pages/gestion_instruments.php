<h2>Gestion des instruments</h2>
<a href="index_.php?page=ajout_instrument.php">Nouveau instrument</a>

<?php
$instrus = new InstrumentDB($cnx);
$liste = $instrus->getAllInstruments();
var_dump($liste);
$n = count($liste);
if ($n == 0) {
    print "<br>Aucun instrument encodé<br>";
} else {
    ?>
    <table class="table table-hover">
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
            <th>Suppression</th>
        </tr>
        </thead>
        <tbody>
        <?php
        foreach ($liste as $i) {
            ?>
            <tr>
                <th><?= $i->id_instrument; ?></th>
                <td id="<?= $i->id_instrument; ?>"><?= $i->reference_instrument; ?></td>
                <td id="<?= $i->id_instrument; ?>"><?= $i->nom_instrument; ?></td>
                <td id="<?= $i->id_instrument; ?>"><?= $i->couleur_instrument; ?></td>
                <td id="<?= $i->id_instrument; ?>"><?= $i->prix_instrument; ?></td>
                <td id="<?= $i->id_instrument; ?>"><?= $i->nom_marque; ?></td>
                <td id="<?= $i->id_instrument; ?>"><?= $i->nom_categorie; ?></td>
                <td id="<?= $i->id_instrument; ?>"><?= $i->image_instrument; ?></td>
            </tr>
            <?php
        }
        ?>
        </tbody>
    </table>
    <?php
}
?>