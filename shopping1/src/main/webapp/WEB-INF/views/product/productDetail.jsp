<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html>
	<jsp:include page="../include/htmlHeader.jsp" />

<body>
	<jsp:include page="../include/hiddenMenu.jsp" />
	<jsp:include page="../include/mainHeader.jsp" />

<h4 class="mx-5 py-5"></h4>

<div class='container pt-3' id="productDetailContainer"style="min-height: 500px">

	<div class="form-row pl-3">
		<div class="form-group col-md-4" >
			<img src="<c:url value='/${product.thumNail}'/>" 
			width=100% height=100% class="img-fruid"/>
		</div>
		
		<div class="form-group col-md-8">
			<div class="form-group row">
				<label class="col-md-2 col-form-label">제품명</label>
				<label class="col-md-3 col-form-label" >${product.productName} </label> 
				<label class="col-md-2 col-form-label">가격</label>
				<label class="col-md-3  col-form-label" > 
					<fmt:formatNumber value="${product.price}" pattern="#,###"/> 원
				</label> 
			</div>
		 
			<div class="form-group row">
					<label class="col-md-2 col-form-label ">제조사</label>
					<label class="col-md-3 col-form-label " >${product.companyName} </label> 
					<label class="col-md-2  col-form-label ">
						등록일
					</label>
					<label class="col-md-3 col-form-label" >
						<fmt:formatDate value='${product.regDate}' 
							pattern="YYYY-MM-dd"/> 
					</label> 
			</div>
			 
			<div class="form-group row">
					<label class="col-md-2 col-form-label ">간략 설명</label>
					<label class="col-md-5 col-form-label" >${product.explain1} </label> 
			</div>
			<div class="form-group row">
				<label class="col-md-2 col-form-label">수량</label>
				<input type="text" class="col-md-1 form-control ml-2" id="productCount" value='1'/>
					<div class="btn-group ">
						<button type="button" id="productPlusCount" class="btn btn-white mr-1">
							<i class="fas fa-plus"></i>
						</button>
						<button type="button" id="productMinusCount" class="btn btn-white">
							<i class="fas fa-minus"></i>
						</button>
					</div>
			</div><!-- form-group row. -->
			
			<div class="btn-toolbar justify-content-end">	
				<div class="btn-group">
					<button type="button" id="addCart" class="btn btn-warning mr-1">
						장바구니담기
					</button>
					<!-- 
					<button type="button" id="" class="btn btn-white" 
							onclick="alert('준비중입니다')">
						구매하기
					</button> -->
				</div>
				
			</div><!-- btn-toolbar -->
			
			 
		</div> <!-- 우측폼form-group col-md-8 -->
	
	
	</div>  <!-- from-row -->

	<!-- 상세보기, 구매후기,q&a 버튼 -->
	<div class="mt-5" id="productDetailAndReview">
	
		<!-- 숨겨진것 
		<ul class="nav nav-tabs nav-fill detailHidden" 
		 	style="position:fixed; visibility:hidden;top:55px; z-index:100; width:88%"	>
			<li class="nav-item">
				<a class="nav-link text-body bg-light active border border-dark" href="#detail"
				data-toggle="tab">
				상세보기
				 </a>
			</li>
			<li class="nav-item ">
				<a class="nav-link text-body bg-light border border-dark" href="#review"
				data-toggle="tab">
				구매후기
				 </a>
			</li>
			<li class="nav-item ">
				<a class="nav-link text-body bg-light border border-dark" href="#question"
				data-toggle="tab">
				Q&A
				 </a>
			</li>
		</ul>-->
		<!-- 보이던것 -->
		<ul class="nav nav-tabs nav-fill">
			 
			<li class="nav-item">
				<a class="nav-link text-body bg-light active border border-dark" href="#detail"
				data-toggle="tab" style="font-size:15px;">
					상세보기
				</a>
			</li>
			<li class="nav-item ">
				<a class="nav-link text-body bg-light border border-dark" href="#review"
				data-toggle="tab" style="font-size:15px;">
					구매후기
				</a>
			</li>
			<li class="nav-item ">
				<a class="nav-link text-body bg-light border border-dark" href="#question"
				data-toggle="tab" style="font-size:15px;">
					Q&A
				</a>
			</li>
		</ul>
	</div>
	
	<div class="tab-content mt-3" style="min-height :500px">
		<div class="tab-pane fade show active " id="detail" style="border:0">
			${product.explain2}
		
		</div><!-- detail 끝 -->
		 
		<div class="tab-pane fade" id="review" style="border:0">
			<jsp:include page="review.jsp" />
		
		</div><!-- review끝 -->
	
		
		<div class="tab-pane fade" id="question" style="border:0 ">
		준비중입니다.
		
		</div><!-- question끝 -->
		
	</div> <!-- tab-content --> 

	
				
</div><!-- container end -->



<jsp:include page="../include/mainFooter.jsp" />
  
<script src="<c:url value='/resources/js/SimpleDateFormat.js'/>"></script>
 
<script src="<c:url value='/resources/js/common.js'/>"></script>

<!--리뷰리스트 템플릿-->
<script id="reviewsTemplate" type="text/x-handlebars-template">
	
{{#review}}
 
	<a href="#review{{reviewId}}" class="mr-0 list-group-item list-group-item-action"
			data-toggle="collapse">
		<div class="row">
			<div class='col-md-6 text-center'>
				{{header}}
			</div>
			<div class='col-md-3 pt-1 text-center'>
				{{userId}}
			</div>
			<div class='col-md-3 pt-1 text-center'>
				{{#dating regDate}} {{/dating}}
			</div>
		</div>
		</a>
		
		<div class="collapse mx-4 my-4" id="review{{reviewId}}">
		 	<div>{{content}}</div> 
			
 			<div class="btn-toolbar justify-content-end">	
				<div class="btn-group btn-group-sm">
					<button type="button" id="{{reviewId}}" 
						class="reviewModBtn btn btn-warning mr-1"
						>
						수정
					</button>
					<button type="button" id="{{reviewId}}" class="reviewDelBtn btn btn-danger">
						삭제
					</button>
				</div>
			</div> 

		</div>
{{/review}}
</script>

<script>
productId=${product.productId};
align="";

$('#productPlusCount').on("click",function(){
	let count=Number($('#productCount').val());
	console.log("제품 수량 더하기 기존수량:"+count);
	count+=1;
	$('#productCount').val(count) ;
	console.log("제품 수량 더하기 변경수량:"+count);
})	
//수량빼기 버튼
$('#productMinusCount').on("click",function()
{
	let count=Number($('#productCount').val());
	if(count!=1)
	{ 
		console.log("제품 수량 빼기 기존수량:"+count);
		count=count-1;
		$('#productCount').val(count) ;
		console.log("제품 수량 빼기 변경수량:"+count);
	}
})	

function getReviews(page)
{
	$.ajax({
		type : "POST",
		url : "/shop1/review/list/"+page+"/"+productId,
		dataType : "json",
		headers : {
			"Content-type" : "application/json",
			"X-HTTP-Method-Override" : "POST"
		},
		data : JSON.stringify({
			align: align 
		}),
		success : function(data) {
			console.log(data);
			
			//상품정보 div에 반영
			let template = $('#reviewsTemplate').html();
			let ctemplate = Handlebars.compile(template);
			let html = ctemplate(data);
			$("#reviewsList").html(html);

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

          	$(".reviewsPaging").html(str);
			
          	console.log("리뷰 lists success") 
			} 
		}); //ajax
};//getReviews

getReviews(1);

//페이징 클릭
$(".reviewsPaging").on("click","li a",function(e)
{ 	
	e.preventDefault();
	getReviews($(this).attr("href"));
});


//후기 작성모달열기
$('#reviewRegister').on("click",function(){
	console.log("리뷰등록 모달 열기클릭됨");
	if('${login.userId}'=="")
	{
	 alert("로그인이 필요합니다.")
	}
	else if('${login.userId}'!="")
	{
		$('#reviewModal').modal('show');
		$('#reviewModalBody div input').eq(0).val('${login.userId}');
		
	}
})

//정렬 선택시 
$("#reviewAlign").on("change",function()
{
	console.log("정렬선택됨 옵션="+$(this).val());
	align=$(this).val();//페이지 바뀌어도 이값로 계속 유지되도록
	getReviews(1);
	
});

//후기 등록클릭
$('.reviewModalBtn').on("click",function()
{
	console.log("리뷰등록 클릭됨");
 
	let header=$('#reviewModalBody div input').eq(1).val();
 	let content=$('#reviewModalBody div textarea').val();
 	
	$.ajax({
		type : "POST",
		url : "/shop1/review/register",
		dataType : "text",
		headers : {
			"Content-type" : "application/json",
			"X-HTTP-Method-Override" : "POST"
		},
		data : JSON.stringify({
			header: header,
			content:content,
			productId:productId,
			userId:'${login.userId}'
		}),
		success : function(data) {
			if (data==='success')
				{
					console.log("후기등록 성공");
					alert("등록되었습니다");
					$('#reviewModal').modal('hide');
					getReviews(1);
				}
			}
		}) //ajax
});

//후기 수정 클릭시
$("#reviewsList").on("click",".collapse .btn-toolbar .btn-group .reviewModBtn",function(){
	
	let preHeader=$(this).parent().parent().parent().prev().children().children().eq(0).html();
	let preUserId=($(this).parent().parent().parent().prev().children().children().eq(1).text()).trim();
	let preContent=($(this).parent().parent().prev().text());
	let reveiwId=$(this).attr("id");
	
	if('${login.userId}'!=preUserId)
	{
		alert("작성자 본인만 수정 가능합니다");
		console.log(preUserId)
	}
	else if('${login.userId}'===preUserId)
	{
	$('#reviewModal').modal('show');
	console.log("리뷰수정 클릭됨"+preHeader)
	console.log("리뷰수정 클릭됨2"+preContent);
	
	$('#reviewModalBody div input').eq(0).val(preUserId);
	$('#reviewModalBody div input').eq(1).val(preHeader);
	$('#reviewModalBody div textarea').val(preContent);
	$.ajax({
		type : "PUT",
		url : "/shop1/review/modify",
		dataType : "text",
		headers : {
			"Content-type" : "application/json",
			"X-HTTP-Method-Override" : "PUT"
		},
		data : JSON.stringify({
			reviewId:$(this).attr("id"),
			content:$('#reviewModalBody div textarea').val(),
			header:	$('#reviewModalBody div input').eq(1).val(),
			productId:productId
		}),
		success : function(data) {
			if(data==='success')
				{
					alert('수정되었습니다');
					console.log("리뷰 수정됨");
					getReviews($('.current').attr('href'));
				}
			}
		}); //ajax	
	}//elseif
});

//후기 삭제 클릭시
$("#reviewsList").on("click",".collapse .btn-toolbar .btn-group .reviewDelBtn",function(e){
	console.log("리뷰삭제 클릭됨");
	
	let UserId=($(this).parent().parent().parent().prev().children().children().eq(1).html()).trim();

	if('${login.userId}'!=UserId)
	{
		alert("작성자 본인만 삭제가능합니다");
	}
	else if('${login.userId}'===UserId)
	{
		let res=confirm("삭제하시겠습니까?");
		if(res)
		{
		$.ajax({
			type : "DELETE",
			url : "/shop1/review/delete",
			dataType : "text",
			headers : {
				"Content-type" : "application/json",
				"X-HTTP-Method-Override" : "DELETE"
			},
			data : 
				 $(this).attr("id"),
			 
			success : function(data) {
				if(data==='success')
					{
						alert('삭제되었습니다');
						console.log("댓글 삭제됨");
						getReviews($('.current').attr('href'));
					}
				}
			}); //ajax
		}//if
	}//elseif
});

$('#addCart').on("click",function(){
	console.log("장바구니 클릭됨");
	if('${login.userId}'=='')
	{
		alert("로그인이 필요합니다");
	}
	
	else{
		$.ajax({
			type : "POST",
			url : "/shop1/cart/add",
			dataType : "text",
			headers : {
				"Content-type" : "application/json",
				"X-HTTP-Method-Override" : "POST"
			},
			data : JSON.stringify({
				count: $('#productCount').val(),
				productId:productId,
				userId:'${login.userId}'
			}),
			success : function(data) {
				if (data==='success')
					{
						console.log("장바구니 추가 성공");
						alert("장바구니에 담겼습니다");
					}
				}
			}) //ajax	
	}//else
})
	
   console.log = function(){}
	
</script>