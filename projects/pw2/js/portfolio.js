//gestion du portfolio
function searchArts(tag) {
    $.ajax({
        type: "POST",
        url: './php/ajaxPortfolio.php',
        data: {
            goOn: tag
        },
        success: function (res) {
            $(".boxBloc").html(res);
            portfolio();
        }
    });
}

function getTags() {
    $.ajax({
        type: "POST",
        url: './php/ajaxPortfolio.php',
        data: {
            getTags: 'true'
        },
        success: function (res) {
            $("#portfolio ul").html(res);
            searchArts('Tout');
            $('#portfolio ul > li').click(function () {
                searchArts($(this).text());
            });
        }
    });
}

$(document).ready(function () {
    getTags();
})



function portfolio() {
    var fsArtOn = false;


    $('.boxBloc > figure, i.quit').click(function () {
        if (fsArtOn) {
            $('#viewer').removeClass('viewerOn');
            fsArtOn = false;
        } else {

            var legende = $('> figcaption', this).text();
            legende += ', ' + $('> #year', this).text() + '©';
            var viewer = "#viewer article ";
            var src = $('> img', this).attr('src');

            $(viewer + '> h3').text($('> figcaption', this).text());
            $(viewer + 'figure img').attr('src', src);
            $(viewer + 'figure figcaption').text(legende);
            $('#tags').text($('> #tag', this).text());
            $('#desc').text($('> #description', this).text());
            $(viewer + '> a').attr('href', $('> #src', this).text());
            $('#viewer').addClass('viewerOn');
            fsArtOn = true;
        }
    });
}
