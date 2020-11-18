$(document).ready(function() {
	//WebSite Setup
    $("html").queryLoader2();
	fontSize();
	setUpMenu();
	reSizeSite();
	workXP();
	ajaxPortfolio();
	$(window).resize(function() {
		//resizing contentDiv
		reSizeSite();
		fontSize();
		setUpMenu();
		workXP();
		portfolio();
	});
});

