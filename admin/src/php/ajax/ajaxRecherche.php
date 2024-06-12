<?php
header('Content-Type: application/json');
//chemin d'accès depuis le fichier ajax php
require '../db/dbPgConnect.php';
require '../classes/Connexion.class.php';
require '../classes/Instrument.class.php';
require '../classes/InstrumentDB.class.php';
$cnx = Connexion::getInstance($dsn, $user, $password);

$instru = new InstrumentDB($cnx);

if (isset($_POST['input'])) {
    $input = $_POST['input'];
    $res = $instru->recherche($input);
    print $res;
    if ($res !== false) {
        echo json_encode($res);
    } else {
        echo json_encode(array()); // Retourne un tableau vide si aucune donnée n'est trouvée
    }
} else {
    echo json_encode(array('error' => "Paramètre manquant"));
}