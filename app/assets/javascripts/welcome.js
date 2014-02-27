$(function(){
    $('#wrapper').click(function(){
        $('#header').animate({width: 'toggle'});
    });

    $('#header').click(function(e){
        e.stopPropagation();
    });

    $.supersized({
        slides  :   [ {image : 'http://www.elizabethmcphetridge.com/assets/uploaded_images/33/original/Jerome.jpg?1393346584', title : 'Jerome'} ]
    });


});
