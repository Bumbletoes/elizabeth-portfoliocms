$(document).on('ready page:load',function(){
    $('#clickArea').click(function(e){
 //       $('#header').animate({height: 'toggle'});
        $('#header').fadeToggle();
      });

    $.ajax({
        url: 'load_gallery/2',
        type: 'GET',
        dataType: 'script'
    });   
});
