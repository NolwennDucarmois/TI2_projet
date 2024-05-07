<form action="index_.php" method="GET">
    <label for="par">Liste : </label>
    <select id="select_marque_cat" name="par">
        <option value="marque">Par marque</option>
        <option value="categorie">Par catégorie</option>
    </select>
    <button type="submit" id="submit_cat_marque" class="btn btn-outline-success">Obtenir</button>
</form>
<?php
if (isset($_GET['par'])) {
    $c = $_GET['par'];
    if ($c === 'marque') {
        include 'liste_instruMarque.php';
    } elseif ($c === 'categorie') {
        include 'liste_instruCat.php';
    }
} else {
    include 'liste_instruTout.php';
}
?>