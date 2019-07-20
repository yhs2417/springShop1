<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html>
<jsp:include page="../include/staticHead.jsp" />

<body>

	<jsp:include page="../include/plugin-JS.jsp" />
<jsp:include page="../include/mainHeader.jsp" />

<h4 class="border-bottom mx-5 py-3" id="wayPoint">상품 관리</h4>


<div class='container pt-3' style="min-height: 500px">

<div class="row">
	 
	 <!-- 좌측 메뉴 -->
	<div class="col-md-2 list-group list-group-flush">
		<a
			class="list-group-item list-group-item-action 
			active list-group-item-light"
			data-toggle="list" href="#register">상품등록</a> <a
			class="list-group-item list-group-item-action 
		list-group-item-light"
			data-toggle="list" href="#manage">상품관리</a> <a
			class="list-group-item list-group-item-action 
			list-group-item-light"
			data-toggle="list" href="#orders">주문조회</a>
	</div>

	<jsp:include page="../include/productRegister.jsp" />	
	<jsp:include page="../include/productManage.jsp" />		
		

	<!-- 탭패널3 -->
	<div class="tab-pane fade" id="orders">
		<div class="list-group">
			<a href="#" class="list-group-item list-group-item-action"
				data-toggle="collapse"> 준비중입니다</a>
		</div> 
	
	</div><!-- 탭패널3 end-->
</div> <!-- tab-content end -->
</div> <!-- row end -->

</div><!-- container end -->



<jsp:include page="../include/mainFooter.jsp" />

<script src="<c:url value='/resources/js/common.js'/>"></script>


<script id="ProductListTemplate" type="text/x-handlebars-template">
{{#product}}
<tr>
<th scope="row">
<input type="checkbox" class="chkBox" id={{productId}}>
</th>
<td>{{productId}}</td>
<td>
	{{#if recommend}}
		추천
	{{/if}}
</td>

<td>{{productName}}</td>
<td>{{price}}
</td>
<td>{{category}}</td>
<td>{{companyName}}</td>
<td>{{explain1}}"</td>

<td hidden>
{{explain2}}
</td>	
<td>
	<img src='{{thumNail}}' width="70" height="70"/>
</td>
<td>
<div class="btn-group-vertical btn-group-sm">
<button type="button" class="btn btn-secondary productMod"
		data-toggle="modal" data-target="#productModModal">
수정</button>
  <button type="button" class="btn btn-secondary mt-1 productDel">삭제</button>
</div>
 </td>		
</tr>
{{/product}}
</script>

<script>
if ('${redirectMsg}' != "") {
	alert('${redirectMsg}')
};

//각행의 수정 버튼 클릭
$('tbody.productList').on("click", ".productMod", function(e) {
	let $from = $(this).parent().parent().siblings(); //각 td

	let $to1 = $("#productModForm div").children('input');
	let $to3 = $("#productModForm div").children('textarea');

	$to1.eq(0).val($from.eq(1).text()); //아이디
	$to1.eq(1).val($from.eq(2).text()); //이름
	$to1.eq(2).val($from.eq(3).text()); //가격
	$to1.eq(3).val($from.eq(4).text()); //분류
	$to1.eq(4).val($from.eq(5).text()); //제조사

	$to3.eq(0).val($from.eq(6).text()); //간략설명
	$to3.eq(1).val($from.eq(7).text()); //상세설명

})//.productMod'					

//수정 모달의 수정버튼 클릭
$('.productModBtn')
		.on(
				"click",
				function() {
					let data = {
						productId : $(
								'#productModForm div input[name="productId"]')
								.val(),
						productName : $(
								'#productModForm div input[name="productName"]')
								.val(),
						price : $(
								'#productModForm div input[name="price"]')
								.val(),
						explain1 : $(
								'#productModForm div textarea[name="explain1"]')
								.val(),
						explain2 : $(
								'#productModForm div textarea[name="explain2"]')
								.val(),
						img : $(
								'#productModForm div input[name="thumnail"]')
								.val()
					};
					console.log(data);
					$.ajax({
						type : "PUT",
						url : "/shop1/manager/productUpdate",
						dataType : "text",
						headers : {
							"Content-type" : "application/json",
							"X-HTTP-Method-Override" : "PUT"
						},
						data : JSON.stringify(data),
						success : function(data) {
							//getReplies($('#current').text()); //ajax 안에 넣어야 작동함!!!!!!
							console.log(data);
							alert("수정되었습니다");
							$("#productModModal").modal("hide");

						}
					});//ajax 완료
				})//.productModBtn끝

//상품행 삭제
$('tbody.productList').on("click", '.productDel', function(e) {
	console.log($(this).parent().parent().siblings().eq(1).text());
	let con = confirm("삭제 하시겠습니까?");
	if (con) {
		console.log("productDel 클릭");
		$.ajax({
			type : "DELETE",
			url : "/shop1/manager/productDelete",
			dataType : "text",
			headers : {
				"Content-type" : "application/json",
				"X-HTTP-Method-Override" : "DELETE"
			},
			data : $(this).parent().parent().siblings().eq(1).text(),
			success : function(data) {
				console.log(data);
				getProducts(1,category);
			}
		}); //ajax
	}
})//productDel 끝

//상품목록 불러오기
function getProducts(page,category)
{
	$.getJSON("/shop1/manager/productList/"+category+"/"+page,
			function(data) {
				console.log(data);
				
				//상품정보 div에 반영
				let template = $('#ProductListTemplate').html();
				let ctemplate = Handlebars.compile(template);
				let html = ctemplate(data);
				$(".productList").html(html);
				
				//페이징 반영
				let str2="";
				if(data.paging.startPg>10)
				{	
	          	 str2+="<li><a href='"+(data.paging.startPg-1)+"'>이전</a></li>"
				}
	       
	          	for(let i=data.paging.startPg ; i<=data.paging.endPg ; i++)
			  	{
	          		 if(data.paging.cri.pg===i)
	          		{
	          			str2+="<li class='page-item'><a class='current' href='"+i+"'class='page-link'>"+i+"</a></li>";
	          		}
	          		 else if(data.paging.cri.pg!==i)
	          		{
	          			str2+="<li class='page-item'><a href='"+i+"'class='page-link'>"+i+"</a></li>";
	          		}
			  	}
			
	          	if(data.paging.endPg<data.paging.totalP)
				{	
	          	 str2+="<li><a href='"+(data.paging.endPg+1)+"'>다음</a></li>"
				}
	          	
	          	$(".productPaging").html(str2);
				console.log("product list success");
			});//gjson 끝

};//getProducts(page) 끝



//분류별 링크 클릭시 내역 불러오기
$('#productMenu a').on(
		"click",
		function() {
			category = $(this).text(); //현재 카테고리
			console.log(category + "의 내역 불러오기");
			getProducts(1,category);
 		}) //#productMenu a end

//페이징 클릭
$(".pagination").on("click","li a",function(e)
		{ e.preventDefault();
			getProducts($(this).attr("href"),category);
		});
		
$("[data-toggle='tooltip']").tooltip();

$('#allCheck').on("click", function() {

	let chk = $('#allCheck').prop("checked");
	if (chk) {
		$('.chkBox').prop("checked", true);
	} else {
		$('.chkBox').prop("checked", false);
	}
});//allCheck end

$('.chkBox').on("click", function() {

	$('#allCheck').prop("checked", false);

});
//summerNote설정과 이미지업르도
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
}
//select 에 카테고리 불러오기
$('.categorySelect')
		.on(
				"change",
				function() {
					console.log($(this).val());
					$
							.getJSON(
									"/shop1/manager/companies/"
											+ $(this).val(),
									function(data) {
										console.log(data)
										let str = "";
										$(data)
												.each(
														function() {
															str += "<option value='"+this.companyName+"'>"
																	+ this.companyName
																	+ "</option>"
														});

										$('.companySelect').html(str);
									});//getjson
				}) //#category.change()끝

//정규식					
const getIdCheck = RegExp(/^[a-zA-Z0-9]{4,14}$/);
const getPwCheck = RegExp(/([a-zA-Z0-9].*[!,@,#,$,%,^,&,*,?,_,~])|([!,@,#,$,%,^,&,*,?,_,~].*[a-zA-Z0-9])/);
chk2 = true;
chk3 = true //비번 아무 수정 안할수 있음

//패스워드 입력값 검증.
$('#userPwd').on(
		'keyup',
		function() {
			//비밀번호 공백 확인
			if ($("#userPwd").val() === "") {
				$('#userPwd').removeClass("is-invalid");
				chk2 = false;
			}
			//비밀번호 유효성검사
			else if (!getPwCheck.test($("#userPwd").val())
					|| $("#userPwd").val().length < 8) {
				$('#userPwd').removeClass("is-valid");
				$('#userPwd').addClass("is-invalid");
				chk2 = false;
			} else {
				$('#userPwd').removeClass("is-invalid");
				$('#userPwd').addClass("is-valid");
				chk2 = true;
			}

		});

//패스워드 확인란 입력값 검증.
$('#userPwd2').on('keyup', function() {
	//비밀번호 확인란 공백 확인
	if ($("#userPwd2").val() === "") {
		$('#userPwd2').removeClass("is-invalid");
		chk3 = false;
	}
	//비밀번호 확인란 유효성검사
	else if ($("#userPwd2").val() != $("#userPwd").val()) {
		$('#userPwd2').removeClass("is-valid");
		$('#userPwd2').addClass("is-invalid");
		chk3 = false;
	} else {
		$('#userPwd2').removeClass("is-invalid");
		$('#userPwd2').addClass("is-valid");
		chk3 = true;
	}
});//#userPwd2

$('#modifyUserBtn').on("click", function() {
	console.log(chk2 + "," + chk3)
	console.log($('#userId').val())
	console.log($('#userPwd2').val())
	if (chk2 && chk3) {
		const user = {
			userId : $("#userId").val(),
			userPwd : $("#userPwd").val(),
			addrNum : $("#addrNum").val(),
			addr1 : $("#addr1").val(),
			addr2 : $("#addr2").val()
		};
		console.log(user);

		$.ajax({
			type : "POST",
			url : "/shop1/user/info",
			headers : {
				"Content-Type" : "application/json",
				"X-HTTP-Method-Override" : "POST"
			},
			dataType : "text",
			data : JSON.stringify(user),
			success : function(result) {
				console.log("result: " + result);
				if (result === "success") {
					alert("업데이트 되었습니다");
					self.location = "/shop1/user/info";
				}
			}
		});//ajax끝
	} else {
		alert('입력정보를 다시 확인하세요.');
	}
}); //signupbtn 끝

$('#withdrawalBtn').on("click", function() {
	let x = confirm("회원 탈퇴 하시겠습니까?");
	console.log(x)
	if (x == true) {

		$.ajax({
			type : "DELETE",
			url : "/shop1/user/withdrawal",
			headers : {
				"Content-Type" : "application/json",
				"X-HTTP-Method-Override" : "DELETE"
			},
			dataType : "text",
			data : "${login.userNum}",
			success : function(result) {
				console.log("result: " + result);
				if (result === "success") {
					alert("탈퇴처리 되셨습니다");
					self.location = "/shop1";
				}
			}
		});//ajax
	}
})//withdrawalBtn 끝
</script>
</body>
</html>