
function setUpMenu() {
	widthSize = Math.floor(100 / 6);
	$('#menu ul li').css({
		width: widthSize + "%"
	});
	$("#menu ul li").click(function() {
		$("#menu ul li").removeClass('selectedO selectedW');
		if ($(this).hasClass('whiteTab')) {
			$(this).addClass('selectedW');
		} else {
			$(this).addClass('selectedO');
		}
		var actualScroll = $('.main').scrollTop();
		var scrollTo = actualScroll + $('.main > #' + $(this).attr('id')).offset().top - Math.floor(10 * $(window).height() / 100);
		var duree = 1000 * Math.abs(scrollTo - actualScroll) / parseInt($('.page_container').height());
		$(".main").stop().animate({
			scrollTop: scrollTo,
		}, duree, 'easeInOutExpo');
	});
}
