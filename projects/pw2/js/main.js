$(document).ready(function () {

    $('.artBox').click(function () {
        if ($(this).hasClass('opened')) {
            $(this).removeClass('opened');
        } else {
            $(this).addClass('opened');
        }
    });



});
