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

<h4 class="border-bottom mx-5 py-3 wayPoint">상품 목록</h4>

<div class='container pt-3' style="min-height: 500px">
		<!-- 정렬기준
		<div class="btn-toolbar justify-content-end pr-5">
			<div class="btn-group btn-group-sm">

				<button type="button" class="btn btn-white dropdown-toggle"
					data-toggle="dropdown">정렬</button>
				<div class="dropdown-menu" id="AlignBtn">
					<a class="dropdown-item" id="priceDesc" href="#">고가순</a> 
					<a class="dropdown-item" id="priceAsc" href="#">저가순</a> 
					<a class="dropdown-item" id="regDateDesc" href="#">최신 등록순</a> 
					<a class="dropdown-item" id="regDateAsc" href="#">오래된 등록순</a>
				</div>
				// 몇개씩 볼건지 
				<div class="btn-group pl-2 btn-group-sm">
					<button type="button" id="recommendAddBtn" class="btn btn-white"></button>
					<button type="button" id="recommendDelBtn" class="btn btn-danger"></button>
 				</div>
 				
			</div>
		</div>-->
		<div class="form-group row pt-2">
       		 		
		<select	class="form-control col-md-2 offset-md-10" id="productAlign">
			<option selected value=''>정렬기준</option>
			<option value='priceDesc'>고가순</option>
			<option value='priceAsc'>저가순</option>
			<option value='regDateDesc'>최신등록순</option>
			<option value='regDateAsc'>오래된 등록순</option>
		</select>
		</div>
		
	<!--제품 리스트 올곳 -->
	<div class='card-columns products pt-4 justify-content-center'>
	
	</div>
	
	<!-- 검색 -->
	<div class="form-group row pt-5">
       		 		
		<select	class="form-control col-md-1 offset-md-3" id="condition">
			<option selected value='productName'>제품명</option>
			<option value='companyName'>제조사</option>
		</select>
		<input type="text" id="keyword" placeholder="검색어"
				class="form-control col-md-4 mr-2">
		<input type="button" id="searchBtn" value="검색"
				class="form-control col-md-1 ">
	</div>
	
	<!-- 페이징 -->
	<ul class="pagination justify-content-center paging mt-4">
	
	</ul>

</div><!-- container end -->

<jsp:include page="../include/mainFooter.jsp" />

<script src="<c:url value='/resources/js/common.js'/>"></script>

<!--상품리스트 템플릿-->
<script id="ProductsTemplate" type="text/x-handlebars-template">
{{#product}}
<div class="card" id='{{productId}}'>
	
	<img class='card-img-top img-thumbnail' 
		src="<c:url value='/{{thumNail}}'/>">
	
	<div class='card-body'>
		<h5 class='card-title'>
			{{#if recommend}} 
				<span class="badge badge-warning">추천</span>
 			{{/if}}
			{{productName}}
		</h5>
		
		<h6 class="text-muted"> 제조사 : {{companyName}} </h6> 
		{{{explain1}}} <br>
		<h6 class="text-danger">
			{{#comma price}} {{/comma}} 원 
		</h6>
	 
	</div>
</div>
{{/product}}
</script>

<script>

category='${category}'; //JSP에서 넘긴값
//이후 select선택시 그 선택값으로 유지되도록
align="";
condition="";
keyword="";

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
			let template = $('#ProductsTemplate').html();
			let ctemplate = Handlebars.compile(template);
			let html = ctemplate(data);
			$(".products").html(html);

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

          	$(".paging").html(str);
			
          	console.log("product lists success") 
			} 
		}); //ajax
	/*	
	$.getJSON("/shop1/manager/productList/"+category+"/"
			+page+"/"+align+"/"+condition+"/"+keyword,
			function(data) {
				console.log(data);

				//상품정보 div에 반영
				let template = $('#ProductsTemplate').html();
				let ctemplate = Handlebars.compile(template);
				let html = ctemplate(data);
				$(".products").html(html);

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

	          	$(".paging").html(str);
				
	          	console.log("product lists success");
			});//gjson 끝*/

};//getProducts(page) 끝

//처음 시작시 1페이지 불러오기
getProducts(1)

//페이징 클릭시
$(".pagination").on("click","li a",function(e)
{ 	
	e.preventDefault();
	getProducts($(this).attr("href"));
});

//정렬 선택시 
$("#productAlign").on("change",function()
{
	console.log("정렬선택됨 옵션="+$(this).val());
	align=$(this).val();//페이지 바뀌어도 이값로 계속 유지되도록
	getProducts(1);
	
});

//검색어 입력시
$("#searchBtn").on("click",function()
{
	console.log("검색 조건="+$('#condition').val());
	console.log("검색어="+$('#keyword').val());

	condition=$('#condition').val(); //페이지 바뀌어도 이값로 계속 유지되도록
	keyword=$('#keyword').val();
	getProducts(1);
	
});


$('.products').on("click",".card",function(){
	let productId=$(this).attr('id');
	console.log("제품 자세히 보기 클릭됨 id="+productId);
	
	self.location="detail?id="+productId
})

  console.log = function(){}

</script>