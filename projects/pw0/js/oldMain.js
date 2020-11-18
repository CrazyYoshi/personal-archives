function fontSize() {
	var testWidth = 1088;
	var fontSizeH1 = 80;
	var fontSizeH2 = 40;
	var fontSizeH3 = 30;
	var displayWidth = $('.main').width();
	var percentage = displayWidth / testWidth;
	var newFontSizeH1 = Math.floor(fontSizeH1 * percentage) - 1;
	var newFontSizeH2 = Math.floor(fontSizeH2 * percentage) - 1;
	var newFontSizeH3 = Math.floor(fontSizeH3 * percentage) - 1;
	$("h1").css("font-size", newFontSizeH1);
	$("h2").css("font-size", newFontSizeH2);
	$("h3").css("font-size", newFontSizeH3);
//	var marginTopH1 = (parseInt($('.main').height()) / 2) - newFontSizeH1;
//	$('h1').css('marginTop', marginTopH1 + 'px');
}

function setUpMenu() {
	
	var elemNumber = 0;
	$('.page_container').each(function (i) {
		$('#menu ul').append("<li id='" + i + "'>" + $(this).attr('name') + "</li>");
		elemNumber = i + 1;
	});
	
   widthSize=100/elemNumber;
    $('#menu ul li').css({
                height:10 * $(window).height() / 100,
				width : widthSize+"%"
	});
			
	$("#menu ul li").click(function () {
        /* 
		$("#menu ul li").removeClass("selected");
		$(this).addClass("selected");
*/ 
		var scrollTo = 90 * $(window).height() / 100 * $(this).attr('id');
		$(".main").stop().animate({
			scrollTop: $('div[name="'+$(this).text()+'"]').offset().top,
		}, 1500);
	});
}





$(document).ready(function () {
	//WebSite Setup

    fontSize();
	setUpMenu();
	$(".main,.page_container").css({
		height: (90 * $(window).height()) / 100,
		width: $(window).width()
	});
	
	
	
	$(window).resize(function () {
		//resizing contentDiv
		$(".main,.page_container").css({
			height: (90 * $(window).height()) / 100,
			width: $(window).width()
		});
		fontSize();
	});
});