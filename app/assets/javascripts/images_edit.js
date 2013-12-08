$(function() {

	$('#upload-progress').hide();


	$('#file-select-button').click(function(e) {
		$('.file-upload').trigger('click');
	});

	$('.file-upload').change(function(e) {
		var val = $(this).val();
		var file = val.split(/[\\/]/);

		$('#file-name').val(file[file.length - 1]);
	});

	$(':file').change(function() {
		var file = this.files[0];
		var formData = new FormData($('.edit_gallery')[0]);
		var gallery_id = $('#gallery_id').val();
		name = file.name;
		size = file.size;
		type = file.type;

		$.ajax({
			url : '/admin/galleries/'+ gallery_id + '/upload/',
			type : 'POST',
			xhr : function() {
				var myXhr = $.ajaxSettings.xhr();
				if (myXhr.upload) {
					myXhr.upload.addEventListener('progress', progressHandler, false);
				}
				return myXhr;
			},
			beforeSend : beforeSendHandler,
			success : completeHandler,
			error : errorHandler,

			data : formData,
			cache : false,
			contentType : false,
			processData : false
		});

	});

	function beforeSendHandler() {
		$('#upload-progress .bar').css('width', 0 + '%');
		$('#upload-progress').show();
	}

	function errorHandler(e) {
		console.log(e);
	}

	function completeHandler() {
		$('#upload-progress').hide();
		$('#file-name').val('');
		$('#gallery_images_photo').val('');
	}

	function progressHandler(e) {
		console.log(e.loaded);
		var percentLoaded = (e.totalSize - e.loaded) / 100;
		console.log(percentLoaded);
		$('#upload-progress').css('width', percentLoaded + '%');
		console.log($('#upload_progress').css('width'));

		if (e.lengthComputable) {
			console.log(e.loaded);
			$('#upload-progress .bar').attr({
				value : e.loaded,
				max : e.total
			});
		}

	}

});
