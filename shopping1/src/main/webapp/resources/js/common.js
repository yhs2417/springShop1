 //공용 핸들바 함수
Handlebars.registerHelper("multiply",function(x,y,options){
	let res=Number(x)*Number(y)
	return res.toLocaleString()+" 원"; 
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

//if문 헬퍼
Handlebars.registerHelper("loopCheck",function(index,start,end,options) {
	
	if(index >= start && index <= end) {
		return options.fn(this);
	} else {
		return options.inverse(this);
	}
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
			//console.log(url);
			$(el).summernote('editor.insertImage', url);
		}
	});
} 


function execPostCode() {
    new daum.Postcode({
        oncomplete: function(data) {
           // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

           // 도로명 주소의 노출 규칙에 따라 주소를 조합한다.
           // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
           var fullRoadAddr = data.roadAddress; // 도로명 주소 변수
           var extraRoadAddr = ''; // 도로명 조합형 주소 변수

           // 법정동명이 있을 경우 추가한다. (법정리는 제외)
           // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
           if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
               extraRoadAddr += data.bname;
           }
           // 건물명이 있고, 공동주택일 경우 추가한다.
           if(data.buildingName !== '' && data.apartment === 'Y'){
              extraRoadAddr += (extraRoadAddr !== '' ? ', ' + data.buildingName : data.buildingName);
           }
           // 도로명, 지번 조합형 주소가 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
           if(extraRoadAddr !== ''){
               extraRoadAddr = ' (' + extraRoadAddr + ')';
           }
           // 도로명, 지번 주소의 유무에 따라 해당 조합형 주소를 추가한다.
           if(fullRoadAddr !== ''){
               fullRoadAddr += extraRoadAddr;
           }

           //console.log(data.zonecode);
           //console.log(fullRoadAddr);
           
           $("#addrNum").val(data.zonecode);
           $("#addr1").val(fullRoadAddr);
           
       }
    }).open();
}//postCode끝

$('[data-toggle="tooltip"]').tooltip();

 