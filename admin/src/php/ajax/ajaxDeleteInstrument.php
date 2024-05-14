<?php
header('Content-Type: application/json');
//chemin d'accès depuis le fichier ajax php
require '../db/dbPgConnect.php';
require '../classes/Connexion.class.php';
require '../classes/Instrument.class.php';
require '../classes/InstrumentDB.class.php';
$cnx = Connexion::getInstance($dsn, $user, $password);

$cl = new InstrumentDB($cnx);
$data[] = $cl->delete_instru($_GET['id']);
print json_encode($data);
