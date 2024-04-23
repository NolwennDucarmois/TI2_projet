<?php
if(file_exists('./lib/php/dbPgConnect.php')){
    require 'lib/php/dbPgConnect.php';
    require 'lib/php/classes/Autoloader.class.php';
    Autoloader::register();
    $cnx = Connexion::getInstance($dsn, $user, $password);
} else {
    //si on se trouve dans la partie publique
    if (file_exists('./admin/src/php/db/dbPgConnect.php')) {
        require './admin/src/php/db/dbPgConnect.php';
        require './admin/src/php/classes/Autoloader.class.php';
        Autoloader::register();
        $cnx = Connexion::getInstance($dsn, $user, $password);
    }
}
