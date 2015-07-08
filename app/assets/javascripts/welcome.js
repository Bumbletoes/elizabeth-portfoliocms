$(document).on('ready page:load',function(){
    $.ajax({
        url: 'load_gallery/6',
        type: 'GET',
        dataType: 'script'
    });
});
