

//animatescroll
$('a.animatescroll').on("click", function() {
		let x = $(this).attr("href")
		console.log(x)
		$(x).animatescroll();
});
	
$('.carousel').carousel({
	interval : 2000
});

$('[data-toggle="tooltip"]').tooltip();

//wayPoint
$('#wayPoint').waypoint(function(direction) {
	if (direction === 'down') {
		$('#firstNav').attr("style", "visibility:hidden");
		$('#secondNav').attr("style", "visibility:visible");
		$('#btn_top').css("visibility", "visible");
	}
}, {
	offset : '10'
});

$('#wayPoint').waypoint(function(direction) {
	if (direction === 'up') {
		$('#firstNav').attr("style", "visibility:visible;width:100%;position:absolute;z-index:100");
		$('#secondNav').attr("style", "visibility:hidden");
		$('#btn_top').css("visibility", "hidden");
	}
}, {
	offset : '10'
});//#wayPoint end

//summerNote설정
$('.summerNote').summernote({
	height : 300,
	lang : 'ko-KR',

	callbacks : {
		onImageUpload : function(files, editor, welEditable) {
			for (var i = files.length - 1; i >= 0; i--) {
				sendFile(files[i], this);
			}
		}
	}

});
//summerNote 이미지업로드 함수 구현
function sendFile(file, el) {
	let form_data = new FormData();
	form_data.append('file', file);
	$.ajax({
		data : form_data,
		type : "POST",
		url : '/shop1/image',
		cache : false,
		contentType : false,
		enctype : 'multipart/form-data',
		processData : false,
		dataType : "text",
		success : function(url) {
			console.log(url);
			$(el).summernote('editor.insertImage', url);
		}
	});
}//sendFile