function workXP() {
	var fsOn = false;
	$('.work').css({
		'height': 15 * parseInt($('.page_container').height()) / 100 + 'px',
		width: '30%',
	});
	$('.info').css({
		'top': $('.work').height(),
	});
	$('.work').mouseenter(function() {
		$('> .info', this).stop().animate({
			'top': 0,
		}, 1000, 'easeOutBounce');
	});
	$('.work').mouseleave(function() {
		$('> .info', this).stop().animate({
			'top': $('.work').height(),
		}, 1000, 'easeOutBounce');
	});
	$('.info,#fsDesc').click(function() {
		var hauteurPXlogo = $('#logo').width() * (80 * $(window).width() / 100) / 100;
		if (fsOn) {
			$('#Content').animate({
				'marginTop': '100%'
			}, 2000, 'easeInOutElastic', function() {
				$('#fsDesc').fadeOut();
			});
			fsOn = false;
		} else {
			$('#place').text($('> .place', this).text());
			$('#job').text($('> .job', this).text());
			$('#information').text($('> .information', this).text());
			$('#date').text($('> .date', this).text());
			$('#logo').css({
				'height': hauteurPXlogo + 'px',
				'background-image': $(this).closest('.work').css('background-image'),
				'marginLeft': (80 * $(window).width() / 100) / 2 - hauteurPXlogo / 2 + 'px',
			});
			$('#fsDesc').fadeIn(200, function() {
				$('#Content').animate({
					'marginTop': 0
				}, 1000, 'easeInOutElastic')
			});
			fsOn = true;
		}
	});
}