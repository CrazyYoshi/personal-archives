function ajaxPortfolio() {
	$.ajax({
		type: "POST",
		url: "./php/portfolio.php",
		data: {
			goOn: 'true'
		},
		success: function(res) {
			$("#blocPortfolio").html(res);
			portfolio();
		}
	});
}

function portfolio() {
	var artwork = $('#blocPortfolio');
	var bubble = $('.bubble');
	var portfolio = $(".main > #portfolio");
	var sizeArtworkX = $('#blocPortfolio').width();
	var sizeArtworkY = $('#blocPortfolio').height();
	var fsArtOn = false;
	//	var sizeBubble = 5 * sizeArtworkX / 100;
	var sizeBubble = bubble.width();
	var maxPositionX = sizeArtworkX - sizeBubble;
	var maxPositionY = sizeArtworkY - sizeBubble;
	var buttonSize = 4 * $(window).width() / 100;
    var bubbleBG ="";
	$("#buttonInfo").css({
		height: buttonSize,
		borderTopRightRadius: buttonSize / 2,
		borderBottomRightRadius: buttonSize / 2,
		WebkitBorderTopRightRadius: buttonSize / 2,
		WebkitBorderBottomRightRadius: buttonSize / 2,
		MozBorderRadius: buttonSize / 2
	});
	bubble.css({
        height: sizeBubble + 'px',
        lineHeight : sizeBubble+ 'px',
    });
	bubble.each(function() {
		var posX = Math.floor((Math.random() * maxPositionX) + 1);
		var posY = Math.floor((Math.random() * maxPositionY) + 1);
		$(this).css({
			'marginTop': posY + 'px',
			'marginLeft': posX + 'px',
		});
	});

    bubble.mouseenter(function() {
        bubbleBG = $(this).css('backgroundImage');
        $(this).text('Plus d\'infos');
		portfolio.css({
			'background-image': $(this).css('background-image'),
		});
	});
	bubble.mouseleave(function() {
                    $(this).text('');

		portfolio.css({
			'background-image': "",
		});
	});
	$('.bubble,#displayArt').click(function() {
		if (fsArtOn) {
			$('#ArtDesc').stop().animate({
				height: '0%'
			}, 'easeInOutExpo', function() {
				$('#fsArt').fadeOut();
			});
			$('#displayArt').animate({
				height: '100%'
			}, 'easeInOutExpo');
			fsArtOn = false;
		} else {
			$('#artTitle').text($('> #titre', this).text());
			$('#artInfo').text($('> #description', this).text());
			$('#artLink').attr('href', $('> #src', this).text());
			$('#displayArt').css({
				'background-image': $(this).css('background-image'),
			});
			$('#fsArt').fadeIn(200, function() {});
			fsArtOn = true;
		}
	});
	$('#buttonInfo').click(function() {
		if ($('#ArtDesc').height() == 0) {
			$('#ArtDesc').animate({
				height: '40%'
			}, 'easeInOutExpo');
			$('#displayArt').animate({
				height: '60%'
			}, 'easeInOutExpo');
		} else {
			$('#ArtDesc').stop().animate({
				height: '0%'
			}, 'easeInOutExpo');
			$('#displayArt').animate({
				height: '100%'
			}, 'easeInOutExpo');
		}
	});
}