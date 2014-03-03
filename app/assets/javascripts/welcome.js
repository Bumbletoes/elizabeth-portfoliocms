$(function(){

    // Find another way to do this
    $('#wrapper').click(function(){
        $('#header').animate({width: 'toggle'});
    });

// Gotta find some other way to prevent the header and it's childrenfrom going poof
// This way breaks remote == true on the links
/*
    $('#header').click(function(e){
        e.stopPropagation();
    });
*/  

    $.ajax({
        url: 'load_gallery/2',
        type: 'GET',
        dataType: 'script'
    });
    
    
});
