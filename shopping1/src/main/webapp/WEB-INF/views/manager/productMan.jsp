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

<h4 class="border-bottom mx-5 py-3 wayPoint">상품 관리</h4>


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

	<!-- 탭패널 (상품등록)-->
	<jsp:include page="productRegister.jsp" />
	<!-- 탭패널 (상품관리(수정, 삭제, 추천상품 등록))-->
	<jsp:include page="productModify.jsp" />


	<!-- 탭패널 (주문조회) -->
	<div class="tab-pane fade" id="orders">
		<div class="list-group">
			<a href="#" class="list-group-item list-group-item-action"
				data-toggle="collapse"> 준비중입니다</a>
		</div>

	</div><!-- 탭패널 (주문조회 )end-->
</div> <!-- tab-content end -->
</div> <!-- row end -->

</div><!-- container end -->



<jsp:include page="../include/mainFooter.jsp" />

<script src="<c:url value='/resources/js/common.js'/>"></script>

<!--상품리스트 템플릿-->
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
	<td>{{explain1}}</td>

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
//redirect 메세지
if ('${redirectMsg}' != "") 
{
	alert('${redirectMsg}')
};

align="";
condition="";
keyword="";

//상품등록 form의 select 에 카테고리 불러오기
$('.categorySelect').on("change",function()
{
console.log($(this).val());
$.getJSON(
		"/shop1/manager/companies/"+ $(this).val(),
		function(data) {
			console.log(data)
			let str = "";
			$(data).each(function() {
								str += "<option value='"+this.companyName+"'>"
										+ this.companyName
										+ "</option>"
							});

			$('.companySelect').html(str);
		});//getjson
}) //#category.change()끝

//상품목록 불러오기 함수구현
function getProducts(page)
{
	$.ajax({
		type : "POST",
		url : "/shop1/manager/productList/"+category+"/"+page,
		dataType : "json",
		headers : {
			"Content-type" : "application/json",
			"X-HTTP-Method-Override" : "POST"
		},
		data : JSON.stringify({
			align: align,
			condition:condition,
			keyword:keyword
		}),
		success : function(data) {
			console.log(data);
			
			//상품정보 div에 반영
			let template = $('#ProductListTemplate').html();
			let ctemplate = Handlebars.compile(template);
			let html = ctemplate(data);
			$(".productList").html(html);

			//페이징 반영
			let str="";
			if(data.paging.startPg>10)
			{
          	 str+="<li><a href='"+(data.paging.startPg-1)+"'>이전</a></li>"
			}

          	for(let i=data.paging.startPg ; i<=data.paging.endPg ; i++)
		  	{
          		 if(data.paging.cri.pg===i)
          		{
          			str+="<li class='page-item'><a class='current page-link' href='"+i+"'>"+i+"</a></li>";
          		}
          		 else if(data.paging.cri.pg!==i)
          		{
          			str+="<li class='page-item'><a href='"+i+"'class='page-link'>"+i+"</a></li>";
          		}
		  	}

          	if(data.paging.endPg<data.paging.totalP)
			{
          	 str+="<li><a href='"+(data.paging.endPg+1)+"'>다음</a></li>"
			}

          	$(".productPaging").html(str);
			
          	console.log("product lists success") 
			} 
		}); //ajax
	/*	
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
	          			str2+="<li class='page-item'><a class='current page-link' href='"+i+"'>"+i+"</a></li>";
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
			});//gjson 끝  */

};//getProducts(page) 끝

//최상단 카테고리 클릭시 해당 카테고리 자료 불러오기
$('#productMenu a').on("click",function()
{
	category = $(this).text(); //현재 카테고리 변수
	
	console.log(category + "의 내역 불러오기");
	getProducts(1);
	checkedIds = new Set(); //체크된 행 넣는 set초기화(페이지 바뀌어도 유지)

})
 		
//페이징 클릭
$(".pagination").on("click","li a",function(e)
{
	e.preventDefault();
	getProducts($(this).attr("href"));
});
//정렬 선택시 
$("#Align").on("change",function()
{
	console.log("정렬선택됨 옵션="+$(this).val());
	align=$(this).val();//페이지 바뀌어도 이값로 계속 유지되도록
	getProducts(1);
	
});

//검색어 입력시
$("#searchingBtn").on("click",function()
{
	console.log("검색 조건="+$('#condition1').val());
	console.log("검색어="+$('#keyword1').val());

	condition=$('#condition1').val(); //페이지 바뀌어도 이값로 계속 유지되도록
	keyword=$('#keyword1').val();
	getProducts(1);
	
});

//모두 선택 체크 버튼 클릭시
$('.allCheck').on("click", function() 
{
	console.log("allcheck클릭됨"+$(this).prop("checked"));
	const chk = $(this).prop("checked");//allcheck체크버튼의 클릭여부
	if (chk) {
		//모든 체크 모든 활성화
		$('.chkBox').prop("checked", true);
		
		//해당페이지의 행들 id를 다 set에 넣기
		$("input[class='chkBox']").each(function(){
		checkedIds.add($(this).attr("id"));
		})
		console.log(checkedIds);
	}	
	else 
	{
		$('.chkBox').prop("checked", false);
	 
		//해당페이지의 행들 id를 다 set에서빼기
		$("input[class='chkBox']").each(function(){
		checkedIds.delete($(this).attr("id"));
		})
	console.log(checkedIds);
	}
});

//각행의 체크버튼 클릭시
$('tbody.productList').on("click",'.chkBox', function(e)
{
	$('.allCheck').prop("checked", false);
	
	if($(this).prop("checked")) //체크한경우
	{
		console.log("클릭된 체크버튼 id:"+	$(this).attr("id"));
		checkedIds.add($(this).attr("id"));
	}
	else if(!$(this).prop("checked"))//체크해체한경우
	{
		console.log("클릭해체된 체크버튼 id:"+$(this).attr("id"));
		checkedIds.delete($(this).attr("id"));
	}
	console.log(checkedIds);
});

//추천상품 추가 클릭
$('#recommendAddBtn').on("click",function()
{
	//$("input[class='chkBox']:checked").each(function(){
	//arr.push($(this).attr("id"));		 

	//해당카테고리의 기존 모든 추천상품의 id를 checkedIds에 넣어서, 총 추천개수가 10개가 안넘게 체크해야함.
	$.getJSON("/shop1/manager/recommendedList/"+category
			,function(data)
		{
		$(data).each(function()
			{
				checkedIds.add(String(this)) //""씌워서 들어가야함. 
			})
		console.log("기존 추천 상품 아이디:"+data);
		console.log("총 추천상품수:"+checkedIds.size);
		for(let i of checkedIds)
		{console.log("추천상품:"+i)};
		
		if(checkedIds.size>10)
		{
			console.log("추천상품 고른게 10개 초과함");
			alert("추천상품이 10개가 넘습니다");
		}
		else if(checkedIds.size<=10)	
		{
			const array=new Array();
			
			for(let i of checkedIds)
				{
				array.push(i);
				}
			console.log("추천상품:"+array);
		  
		$.ajax({
			type : "PUT",
			url : "/shop1/manager/recommendUpdate/"+category,
			dataType : "text",
			headers : {
				"Content-type" : "application/json",
				"X-HTTP-Method-Override" : "PUT"
			},
			data : JSON.stringify(array),
			success : function(data) {
				console.log(data);
				alert("추천상품 변경되었습니다");
				checkedIds.clear() //체크된거 초기화
				getProducts($('.current').attr('href'),category);
			} 
		}); //ajax
		} //elseif
		})//getjson
});
	
//추천상품 제거 클릭
$('#recommendDelBtn').on("click",function()
{
	const array=new Array();
	
	for(let i of checkedIds)
		{
		array.push(i);
		}
	console.log("추천상품에서 제거할 것:"+array);
 	
	if(array!="")
	{
		console.log("ajax진입");
		$.ajax({
		type : "PUT",
		url : "/shop1/manager/recommendDel/",
		dataType : "text",
		headers : {
			"Content-type" : "application/json",
			"X-HTTP-Method-Override" : "PUT"
		},
		data : JSON.stringify(array),
		success : function(data) {
			console.log(data);
			alert("추천상품에서 제거되었습니다");
			checkedIds.clear(); //체크됬던거 초기화
			getProducts($('.current').attr('href'),category);
			} 
		}); //ajax
	}
	else if(array==="")
		{ alert("상품을 선택해주세요")}
});

//각행의 수정 버튼 클릭
$('tbody.productList').on("click", ".productMod", function(e) {
	let $from = $(this).parent().parent().siblings(); //각 td

	let $to1 = $("#productModForm div").children('input');
	let $to3 = $("#productModForm div").children('textarea');

	$to1.eq(0).val($from.eq(1).text()); //아이디
	$to1.eq(1).val($from.eq(3).text()); //이름
	$to1.eq(2).val($from.eq(4).text()); //가격
	$to1.eq(3).val($from.eq(5).text()); //분류
	$to1.eq(4).val($from.eq(6).text()); //제조사

	$to3.eq(0).val($from.eq(7).text()); //간략설명
	$to3.eq(1).val($from.eq(8).text()); //상세설명

})
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
					});//ajax 완
})//.productModBtn끝



</script>
</body>
</html>
