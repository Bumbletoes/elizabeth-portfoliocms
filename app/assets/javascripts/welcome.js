$(function(){
    $('#wrapper').click(function(){
        $('#header').animate({width: 'toggle'});
    });

    $('#header').click(function(e){
        e.stopPropagation();
    });

    $.ajax({
        url: 'load_gallery/2',
        type: 'GET',
        dataType: 'script'
    });




});
