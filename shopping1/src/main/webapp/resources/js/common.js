//animatescroll
$('a.animatescroll').on("click", function() {
		let x = $(this).attr("href")
		$(x).animatescroll();
		$('body').animatescroll();
});
	
$('.carousel').carousel({
	interval : 2000
});

$('[data-toggle="tooltip"]').tooltip();

//wayPoint
$('.wayPoint').waypoint(function(direction) {
	if (direction === 'down') {
		$('#firstNav').attr("style", "visibility:hidden");
		$('#secondNav').attr("style", "visibility:visible");
		$('#btn_top').css("visibility", "visible");
	}
}, {
	offset : '10'
});

$('.wayPoint').waypoint(function(direction) {
	if (direction === 'up') {
		$('#firstNav').attr("style", "visibility:visible;width:100%;position:absolute;z-index:100");
		$('#secondNav').attr("style", "visibility:hidden");
		$('#btn_top').css("visibility", "hidden");
	}
}, {
	offset : '10'
});//#wayPoint end

$('#productDetailAndReview').waypoint(function(direction) {
	if (direction === 'down') {
		 
		$('#btn_top').css("visibility", "visible");
		$('.detailHidden').css("visibility", "visible");
		$('.detailVisible').css("visibility", "hidden");

	}
}, {
	offset : '10'
});

$('#productDetailAndReview').waypoint(function(direction) {
	if (direction === 'up') {
		$('.detailHidden').css("visibility", "hidden");
		$('.detailVisible').css("visibility", "visible");
		$('#btn_top').css("visibility", "hidden");
	}
}, {
	offset : '10'
});//#wayPoint end


//공용 핸들바 함수
Handlebars.registerHelper("multiply",function(x,y,options){
	let res=Number(x)*Number(y)
	return res.toLocaleString(); 
})

Handlebars.registerHelper("comma",function(x,options){
 
	return Number(x).toLocaleString(); 
})

Handlebars.registerHelper("dating",function(x,options){
	let date=new Date(x); 
	let dateFormat=new simpleDateFormat("yy-MM-dd/hh:mm");
	return  dateFormat.format(date); 
})

Handlebars.registerHelper('breaklines', function(text) {
    text = Handlebars.Utils.escapeExpression(text);
    text = text.replace(/(\r\n|\n|\r)/gm, '<br>');
    return new Handlebars.SafeString(text);
});


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