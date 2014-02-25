$(function(){
    $('#wrapper').click(function(){
        $('#header').animate({width: 'toggle'});
    });

    $('#header').click(function(e){
        e.stopPropagation();
    });
});
