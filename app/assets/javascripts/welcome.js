$(document).on('ready page:load',function(){
    $('#hit-area').hover(function(e){
        var position = -60;
        var hitAreaPosition = -110;
        if($('#header').css('bottom') == '-60px'){
            position = 50;
            hitAreaPosition = 0;
        }
        $('#header').animate({bottom: position},"fast");
        $('#hit-area').animate({bottom: hitAreaPosition},"fast");

    });

    $.ajax({
        url: 'load_gallery/2',
        type: 'GET',
        dataType: 'script'
    });   
});
