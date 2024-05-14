$(document).ready(function () {

    $('#logo').hide();
    $('#premiere').hide();
    $('#nom_ent_infos').hide();
    $('#date_ent_infos').hide();
    $('#ent_ent_infos').hide();
    $('#iban_ent_infos').hide();
    $('#mail_ent_infos').hide();
    $('#tel_ent_infos').hide();
    $('#deuxieme').hide();
    $('#infos_magasin1').hide();
    $('#infos_magasin2').hide();
    $('#infos_magasin3').hide();
    $('#troisieme').hide();
    $('#tr1').hide();
    $('#tr2').hide();
    $('#tr3').hide();
    $('#tr4').hide();
    $('#tr5').hide();
    $('#tr6').hide();
    $('#tr7').hide();
    $('#quatrieme').hide();


    // affichage des section par les boutons et qu'ils disparaissent quand on clique dessus
    $('#btn_logo').click(function () {
        $('#logo').fadeIn(3000);
        $(this).hide();
        $('img').animate({
            left: '85%'
        });
    });
    $('#btn1').click(function () {
        $('#premiere').fadeIn(3000, function () {
            $('#alert_profil').animate({
                left: '70%'
            });
        });
        $(this).hide();
    });
    // affichage des informations de l'entreprise quand on clique sur son nom
    $('#nom_ent').click(function () {
        $(this).css({
            'font-style': 'italic',
            'font-weight': 'bold'
        });
        $('#nom_ent_infos').show();
        $('#nom_ent_infos').css({
            'color': '#a72ac4'
        });
    });
    $('#date_ent').click(function () {
        $(this).css({
            'font-style': 'italic',
            'font-weight': 'bold'
        });
        $('#date_ent_infos').show();
        $('#date_ent_infos').css({
            'color': '#a72ac4'
        });
    });
    $('#ent_ent').click(function () {
        $(this).css({
            'font-style': 'italic',
            'font-weight': 'bold'
        });
        $('#ent_ent_infos').show();
        $('#ent_ent_infos').css({
            'color': '#a72ac4'
        });
    });
    $('#iban_ent').click(function () {
        $(this).css({
            'font-style': 'italic',
            'font-weight': 'bold'
        });
        $('#iban_ent_infos').show();
        $('#iban_ent_infos').css({
            'color': '#a72ac4'
        });
    });
    $('#mail_ent').click(function () {
        $(this).css({
            'font-style': 'italic',
            'font-weight': 'bold'
        });
        $('#mail_ent_infos').show();
        $('#mail_ent_infos').css({
            'color': '#a72ac4'
        });
    });
    $('#tel_ent').click(function () {
        $(this).css({
            'font-style': 'italic',
            'font-weight': 'bold'
        });
        $('#tel_ent_infos').show();
        $('#tel_ent_infos').css({
            'color': '#a72ac4'
        });
    });

    $('#btn2').click(function () {
        $('#deuxieme').fadeIn(3000);
        $(this).hide();
    });
    $('#mag1').click(function () {
        $('#infos_magasin1').slideDown(2000);
        $('#m1').css({
            'font-weight': 'bold',
            'font-size': '18px',
        });
        $('#mag1').css({
            'background-color': '#7db77d'
        });
    });
    $('#mag2').click(function () {
        $('#infos_magasin2').slideDown(2000);
        $('#m2').css({
            'font-weight': 'bold',
            'font-size': '18px',
        });
        $('#mag2').css({
            'background-color': '#977db7'
        });
    });
    $('#mag3').click(function () {
        $('#infos_magasin3').slideDown(2000);
        $('#m3').css({
            'font-weight': 'bold',
            'font-size': '18px',
        });
        $('#mag3').css({
            'background-color': '#b7ab7d'
        });
    });

    $('#btn3').click(function () {
        $('#troisieme').fadeIn(3000);
        $(this).hide();
    });

    // affichage de l'horaire jour par jour
    $('#tr0').mouseover(function () {
        $('#tr1').show();
    });
    $('#tr1').mouseover(function () {
        $('#tr2').show();
    });
    $('#tr2').mouseover(function () {
        $('#tr3').show();
    });
    $('#tr3').mouseover(function () {
        $('#tr4').show();
    });
    $('#tr4').mouseover(function () {
        $('#tr5').show();
    });
    $('#tr5').mouseover(function () {
        $('#tr6').show();
    });
    $('#tr6').mouseover(function () {
        $('#tr7').show();
    });

    $('#btn4').click(function () {
        $('#quatrieme').fadeIn(3000);
        $(this).hide();
    });

    $('#btn_ajouter').click(function (e) {
        e.preventDefault();
        let reference = $('#reference').val();
        let nom = $('#nom').val();
        let couleur = $('#couleur').val();
        let prix = $('#prix').val();
        let id_marque = $('#id_marque').val();
        let id_categorie = $('#id_categorie').val();
        let image = $('#image').val();
        let param = 'reference=' + reference + '&nom=' + nom + '&couleur=' + couleur + '&prix=' + prix + '&id_marque=' + id_marque + '&id_categorie=' + id_categorie + '&image=' + image;
        let retour = $.ajax({
            type: 'get',
            dataType: 'json',
            data: param,
            url: './src/php/ajax/ajaxAjoutInstrument.php',
            success: function (data) {//data = retour du # php
                console.log(data);
                // pour rediriger vers la page de gestion après l'ajout
                window.location.href = 'index_.php?page=gestion_instruments.php';
            },
            error: function (data) {
                console.log(data);
                alert('Problème lors de l\'ajout');
            }
        });
    });
    $('#reset').click(function (){
        window.location.href = 'index_.php?page=gestion_instruments.php';
    });

    $('.btn_delete').click(function () {
        let id = $(this).data('id'); // récupère l'id grace à data-id
        $(this).closest('tr').remove(); // supprime la ligne directement
        let param = {id: id};
        $.ajax({
            type: 'get',
            dataType: 'json',
            data: param,
            url: './src/php/ajax/ajaxDeleteInstrument.php',
            success: function (data) {
                console.log(data);
                console.log('Instrument supprimé avec succès');
            },
            error: function (data) {
                console.log(data);
                alert('Problème lors de la suppression');
            }
        });
    });
});