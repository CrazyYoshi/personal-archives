//gestion du portfolio
function searchArts(tag) {
	$.ajax({
		type: "POST",
		url: './php/ajaxPortfolio.php',
		data: {
			goOn: tag
		},
		success: function(res) {
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
		success: function(res) {
			$(".tagBar").html(res);
            searchArts('Tout');
            $('.tagBar > li').click(function(){
                searchArts($(this).text());
            });
		}
	});
}

$(document).ready(function(){
    getTags();
})



function portfolio() {
	var artwork = $('.boxPortfolio');
	var previewBloc = $('.artBox');
	var portfolio = $(".main > #portfolio");
	var fsArtOn = false;


	$('.artBox, #quit').click(function() {
		if (fsArtOn) {
			$('#viewer').stop().fadeOut(function(){
            });
			fsArtOn = false;
		} else {

			$('#title').text($('> .name', this).text());
			$('#desc').text($('> .desc', this).text());
			$('#legende').text($('> .name', this).text()+', '+$('> .year', this).text()+'©');
			$('#src > a').attr('href', $('> .src', this).text());
			$('#src > a').text($('> .name', this).text());
            $('#tags').text($('> .type', this).text());
			$('#preview').css({
				'background-image': $(this).css('background-image'),
			});
			$('#viewer').fadeIn(200, function() {});
			fsArtOn = true;
		}
	});
}