<?php
header('Content-Type: application/json');
//chemin d'accès depuis le fichier ajax php
require '../db/dbPgConnect.php';
require '../classes/Connexion.class.php';
require '../classes/Instrument.class.php';
require '../classes/InstrumentDB.class.php';
$cnx = Connexion::getInstance($dsn, $user, $password);

$instru = new InstrumentDB($cnx);

// fonctionne pas pour l'image venant d'un autre dossier (ne met pas l'image) que celui dans le projet et dossier instruments
$imgChemin = $_GET['image'];
$nom_img = basename($imgChemin); // basename pour garder que le nom du fichier
$dossierPourStocker = '/../../public/images/instruments/';
$img = $dossierPourStocker . $nom_img;
move_uploaded_file($imgChemin, $img);

$d[] = $instru->ajout_instru($_GET['reference'], $_GET['nom'], $_GET['couleur'], $_GET['prix'], $_GET['id_marque'], $_GET['id_categorie'], $nom_img);
print json_encode($d);
