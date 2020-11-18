$(document).ready(function() {
	//WebSite Setup
	fontSize();
	setUpMenu();
	reSizeSite();
	workXP();
	$(window).resize(function() {
		//resizing contentDiv
		reSizeSite();
		fontSize();
		setUpMenu();
		workXP();
	});
});