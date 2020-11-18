var doneOnce = false;
var working = false;

function setUpNav() {

	$("#menu ul li").click(function() {
        working =true;
        var scrollTo = Math.ceil($('.main > #' + this.id)[0].offsetTop);
		$(".main").stop().animate({
			scrollTop: scrollTo,
		}, 700, 'easeInOutExpo',function(){working = false;});
	});
    
    //SCROLL 
    $('.main').scroll(function(){
                //Au lieu d'une boucle for, qui survole et testes les divs et compare le TopScroll, faire une boucle if qui teste le passage a une autre div
                var scroll = $('.main').scrollTop();
                var divs = $('.page_container');
                for(var i=0; i<divs.size();i++){
                    var prevDiv = $('.main > #'+divs[i].id)[0].offsetTop-1;
                    if( scroll > prevDiv && !working){
                        var divName = divs[i].id;
                        var itemMenu = $("#menu ul #"+divName);
                        $("#menu ul li").removeClass('active');
                        itemMenu.addClass('active');
                    }
                }
            
        });
    
    
}


    function testArrows(e) {
        var scrollTo = 0;
        var id = '.main > #'+$('.active')[0].id;console.log(id);
        if (e.keyCode == '38' && working==false) {
            // up arrow
            working = true;
            var prevItem=$('#menu ul li #'+$(id)[0].previousElementSibling.id);
            
            $("#menu ul li").removeClass('active');
            prevItem.addClass('active');
            
            scrollTo = Math.floor($(id)[0].previousElementSibling.offsetTop)-1;
            
            $(".main").animate({
                scrollTop: scrollTo,
            }, 700, 'easeInOutExpo',function(){
                working=false;});
               
        }
        else if (e.keyCode == '40' && working==false) {
            // down arrow
            working = true;
            var nextItem=$('#menu ul li #'+$('.main > #'+$('.active')[0].id)[0].nextElementSibling.id);
            console.log(nextItem);
//            $("#menu ul li").removeClass('active');
//            nextItem.addClass('active');
//            
            scrollTo = Math.ceil($(id)[0].nextElementSibling.offsetTop)+1;
            
            $(".main").animate({
                scrollTop: scrollTo,
            }, 700, 'easeInOutExpo',function(){
                working=false;});
        }
    }


$(document).ready(function(){
    //ArrowsNavigations
    
    $('.arrow').click(function(){
    var scrollTo = Math.ceil($('.main > #prez')[0].offsetTop);
		$(".main").stop().animate({
			scrollTop: scrollTo,
		}, 700, 'easeInOutExpo',function(){working = false;});   
    })

//    window.onkeydown = testArrows;

});


var keys = [37, 38, 39, 40];

function preventDefault(e) {
  e = e || window.event;
  if (e.preventDefault)
      e.preventDefault();
  e.returnValue = false;  
}

function keydown(e) {
    for (var i = keys.length; i--;) {
        if (e.keyCode === keys[i]) {
            preventDefault(e);
            return;
        }
    }
}

function wheel(e) {
  preventDefault(e);
}

function disable_scroll() {
  if (window.addEventListener) {
      window.addEventListener('DOMMouseScroll', wheel, false);
  }
  window.onmousewheel = document.onmousewheel = wheel;
  document.onkeydown = keydown;
}

function enable_scroll() {
    if (window.removeEventListener) {
        window.removeEventListener('DOMMouseScroll', wheel, false);
    }
    window.onmousewheel = document.onmousewheel = document.onkeydown = null;  
}