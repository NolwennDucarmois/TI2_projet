$(document).ready(function () {
    $('#troisieme').hide();
    $('#quatrieme').hide();
    $('#btn3').click(function () {
        $('#troisieme').slideDown('slow');
        $(this).hide();
    });
});