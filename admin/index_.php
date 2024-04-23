<?php
session_start();
require './src/php/utils/liste_includes.php';
?>
<!doctype html>
<html lang="fr">
<head>
    <meta charset="UTF-8">
    <title>Magasin d'instruments de musique</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"></script>
    <link rel="stylesheet" href="./admin/public/css/style.css">
    <script src="./public/js/fonctions.js"></script>
</head>
<body>
<div class="container">
    <nav id="menu">
        <?php
        if (file_exists('./src/php/utils/menu_admin.php')) {
            include './src/php/utils/menu_admin.php';
        }
        ?>
    </nav>
    <div id="container">
        <?php
        if (!isset($_SESSION['page'])) {
            $_SESSION['page'] = './pages/accueil_admin.php';
        }
        if (isset($_GET['page'])) {
            $_SESSION['page'] = 'pages/' . $_GET['page'];
        }
        if (file_exists($_SESSION['page'])) {
            include $_SESSION['page'];
        } else {
            include '../pages/page404.php';
        }
        ?>
    </div>
</div>


</body>
</html>
