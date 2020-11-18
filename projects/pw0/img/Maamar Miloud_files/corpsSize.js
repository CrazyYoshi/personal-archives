function fontSize() {
    //Valeurs fixe pour les dimensions selectionnées
    var testWidth = 1088;
    var fontSizeH1 = 80;
	var fontSizeH2 = 40;
	var fontSizeH3 = 30;
    var bodySize = 13;
    //Valeurs relatives au client
	var displayWidth = $('.main').width();
	var percentage = displayWidth / testWidth;
	var newFontSizeH1 = Math.floor(fontSizeH1 * percentage);
	var newFontSizeH2 = Math.floor(fontSizeH2 * percentage);
	var newFontSizeH3 = Math.floor(fontSizeH3 * percentage);
	var newFontBody = Math.floor(bodySize * percentage);
	$("h1").css("font-size", newFontSizeH1);
	$("h2").css("font-size", newFontSizeH2);
	$("h3").css("font-size", newFontSizeH3);
	$("p, span").css("font-size", newFontBody);
    
    //Marge sup du titre d'accueil H1 (alignement vertical)
	var marginTopH1 = Math.floor(((90 * $(window).height()) / 100 / 2) - newFontSizeH1);
	$('h1').css('marginTop', marginTopH1 + 'px');
    
    //Hauteur de ligne des éléments du menu
	$('#menu ul li').css('line-height', Math.floor(10 * $(window).height() / 100) + "px");
    
    //
    
}

function reSizeSite() {
	$(".main").css({
		height: (90 * $(window).height()) / 100,
		width: $(window).width()
	});
	$(".page_container").css({
		'min-height': $('.main').height(),
	});
	$(".main > #home").css({
		height: (90 * $(window).height()) / 100,
		width: $(window).width()
	});
	var tabDetail = parseInt($('.longest').width()) / 2 * 3 + 'px';
	$('.detail').css('width', tabDetail);
	$('.logo').css('height', $('.logo').width());
	$('.logo').css('marginLeft', parseInt($('.logo').closest('.blocContent').width()) / 2 - parseInt($('.logo').width()) + 'px');
	var marginTop = $('.logo').height() / 2 - $('.fiche').height() / 2 + parseInt($('.logo').css('marginTop'));
	$('.fiche').css('marginTop', marginTop + 'px');
}