<?php
header('Content-Type: application/json');
//chemin d'accès depuis le fichier ajax php
require '../db/dbPgConnect.php';
require '../classes/Connexion.class.php';
require '../classes/Instrument.class.php';
require '../classes/InstrumentDB.class.php';
$cnx = Connexion::getInstance($dsn, $user, $password);

$instru = new InstrumentDB($cnx);
$d[] = $instru->ajout_instru($_GET['reference'],$_GET['nom'],$_GET['couleur'],$_GET['prix'],$_GET['id_marque'],$_GET['id_categorie']);
print json_encode($d);