$(document).on('ready page:load',function(){
    $('#clickArea').click(function(e){
        console.log(e);
        $('#header').animate({width: 'toggle'});
    });

    $.ajax({
        url: 'load_gallery/2',
        type: 'GET',
        dataType: 'script'
    });   
});
