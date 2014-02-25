$(function(){
    $('#wrapper').click(function(){
        $('#header').animate({width: 'toggle'});
    });

    $('#header').click(function(e){
        e.stopPropagation();
    });

    $.supersized({
        slides  :   [ {image : 'images/portfolio1/LeviChimneyMan.jpg', title : 'New York'} ]
    });


});
