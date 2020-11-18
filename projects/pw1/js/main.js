
function testSkill(scroll){
    $('.skillContainer').each(function(e){
        targetOffset  =  $('.skillContainer')[e].offsetTop;
        targetOffset  += $('.skillContainer')[e].offsetHeight;
        targetOffset  += $('.skillContainer')[e].offsetParent.offsetTop;
        targetOffset  -= $('.skillContainer')[e].offsetParent.offsetHeight;
        offsetDisable =  $('.skillContainer')[e].offsetParent.offsetTop;
        offsetDisable += $('.skillContainer')[e].offsetHeight;
        offsetDisable += $('.skillContainer')[e].offsetTop;

        if(scroll >= targetOffset && scroll <= offsetDisable){
            $(this).addClass($(this).attr('percentage')+' opacity');
        }


    });

}

$(document).ready(function() {

    var mainScroll = $('.main').scrollTop();
    $('.main').scroll(function(){
        mainScroll = $('.main').scrollTop();
        testSkill(mainScroll);
    });




    $('#menu > ul').click(function(){
        if($('#menu').hasClass('down')){$('#menu').removeClass('down');}
        else{$('#menu').addClass('down');}
    });
    $('.work').click(function(){
        if($(this).hasClass('workOn')){
            $(this).removeClass('workOn');
        }
        else{$(this).addClass('workOn');}
    });
    $('.artBox').click(function(){
        if($(this).hasClass('opened')){
            $(this).removeClass('opened');
        }
        else{$(this).addClass('opened');}
    });


});

