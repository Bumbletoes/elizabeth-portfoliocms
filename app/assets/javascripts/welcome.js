$(document).on('ready page:load',function(){
    $('#header').click(function(e){
        if(e.toElement.id == 'header'){
            var position = -70;
            if($('#header').css('bottom') == '-70px'){
                position = 50;
            }
            $('#header').animate({bottom: position},"fast");
        }
    });

    $.ajax({
        url: 'load_gallery/2',
        type: 'GET',
        dataType: 'script'
    }).done(function(){
        $('.preview-image-container img').click(function(){
            $.supersized.goTo($(this).attr('data-index'));
        });
    });
});
