<!DOCTYPE html>

<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>

<html>

<jsp:include page="include/staticHead.jsp" />

<body data-spy="scroll" data-target="#secondNav">

	<jsp:include page="include/plugin-JS.jsp" />
	<jsp:include page="include/mainHeader.jsp" />
	<jsp:include page="include/mainHeader2.jsp" />
	

	<div class="container-fruid">

		<!-- 메인 캐러셀 -->
		<div id="carousel1" class="carousel slide carousel-fade"
			style="width: 100%; padding-top: -1px; margin-right:-10px">
			<!-- 캐러셀 이미지 -->
			<div class="carousel-inner  ">
				<div class="carousel-item active">
					<img src="<c:url value='/resources/images/pic1.jpg'/>"
						style="width: 100%; max-height: 450px">
				</div>
				<div class="carousel-item">
					<img src="<c:url value='/resources/images/pic2.jpg'/>"
						style="width: 100%; max-height: 450px">
				</div>
				<div class="carousel-item">
					<img src="<c:url value='/resources/images/pic3.jpg'/>"
						style="width: 100%; max-height: 450px">
				</div>
				<div class="carousel-item">
					<img src="<c:url value='/resources/images/pic4.jpg'/>"
						style="width: 100%; max-height: 450px">
				</div>
				<div class="carousel-item">
					<img src="<c:url value='/resources/images/pic5.jpg'/>"
						style="width: 100%; max-height: 450px">
				</div>
			</div>
			<a class="carousel-control-prev" href="#carousel1" role="button"
				data-slide="prev"> <i class="fas fa-angle-left fa-4x text-body"></i>
			</a> <a class="carousel-control-next" href="#carousel1" role="button"
				data-slide="next"> <i class="fas fa-angle-right fa-4x text-body"></i>
			</a>
		</div>

		<ul id="indicatior1" class="nav bg-dark nav-pills nav-fill">
			<li class="nav-item"   ><a href="#carousel1" data-slide-to="0"
				data-toggle='tab' class="nav-link active text-white rounded-0"> 문구1</a></li>

			<li class="nav-item"><a href="#carousel1" data-slide-to="1"
				data-toggle='tab' class="nav-link text-white rounded-0"> 문구2</a></li>

			<li class="nav-item"><a href="#carousel1" data-slide-to="2"
				data-toggle='tab' class="nav-link text-white rounded-0"> 문구3</a></li>

			<li class="nav-item"><a href="#carousel1" data-slide-to="3"
				data-toggle='tab' class="nav-link text-white rounded-0">문구4</a></li>
			<li class="nav-item"><a href="#carousel1" data-slide-to="4"
				data-toggle='tab' class="nav-link text-white rounded-0"> 문구5</a></li>
		</ul>
 
		<div class="pt-5 wayPoint"  >
		
			<div class="row">
				<div class=" col-sm-6 col-md-3 border-left border-dark pt-3 text-center">
					<a href="#introduce" class="animatescroll" ><i class="fas fa-home fa-5x text-body  "></i></a><br>
					<br>회사 소개
				</div>
				<div
					class=" col-sm-6 col-md-3 border-left border-dark
		text-center pt-3">
					<a href="#contact" class="animatescroll"><i class="fas fa-comments fa-5x text-body "></i></a> <br>
					<br>Contact
				</div>
				<div
					class=" col-sm-6 col-md-3 border-left
border-dark text-center pt-3">
					<a href="" onclick="alert('준비중입니다.')"><i class="fas fa-edit fa-5x text-body "></i></a>
					<br> <br>공지사항
				</div>
				<div
					class=" col-sm-6 col-md-3 border-left
border-dark text-center pt-3">
					<a href=""><i class="fas fa-address-book fa-5x text-body "></i></a> <br>
					<br>.
				</div>
			</div>
		</div>

		<!-- 컴퓨터 추천 -->
		<div class="mt-5 px-5 " id="desktop">

			<div style="width: 100%" class="my-5  border-top border-dark">
				<h3 class="text-secondary pt-2">추천 desktop &nbsp;&nbsp;
				
					<a href="#carouselCom" data-slide="prev">
						<i class="fas fa-angle-left text-body"></i>
					</a>
					<a href="#carouselCom" data-slide="next">
					<i class="fas fa-angle-right text-body"></i>
					</a>
				
				</h3>
				
				<h5 class="text-right">	
					
					<a href="<c:url value='/product/list?category=computer'/>"> 
					<small class="text-primary">상품 더 보기</small> </a>
				 </h5>
				<br>

				<div id="carouselCom" class="carousel" data-ride="carousel">
					<!-- 추천제품 올곳 -->

				</div>
			</div>

			<!-- 노트북 추천 -->
				<div style="width: 100%" class="my-5 border-top border-dark">
				<h3 class="text-secondary pt-2">추천 NoteBook  &nbsp;&nbsp;
					<a href="#carouselNote" data-slide="prev">
						<i class="fas fa-angle-left text-body"></i>
					</a>
					<a href="#carouselNote" data-slide="next">
					<i class="fas fa-angle-right text-body"></i>
					</a>
				 </h3>
				
				<h5 class="text-right">
					<a href="<c:url value='/product/list?category=NoteBook'/>"> 
					<small class="text-primary">상품 더 보기</small> </a>
				</h5>
				<br>
				<div id="carouselNote" class="carousel" data-ride="carousel">
  					<!-- 추천제품 올곳 -->

				</div>
			</div>

			<!-- 회사 소개란 -->
			<div class="pt-4 border-top border-dark" id="introduce">
				<div class="row">
					<div class="col-md-6 border-right">
						<h3 class="text-secondary">회사소개</h3>
						<br>

						<div class="list-group list-group-flush">
							<a href="#" class="list-group-item list-group-item-action"
								data-toggle="collapse"> 제목1</a>
							<div class="collapse show mx-4 my-4" id="cl1">내용1</div>
							<a href="#" class="list-group-item list-group-item-action"
								data-toggle="collapse"> 제목2</a>
							<div class="collapse show mx-4 my-4" id="id2">내용2</div>
						</div>
					</div>
					
					<div  class="col-md-6">
						<h5 class="text-secondary"> </h5>
						<br>
						<div class="list-group list-group-flush pt-4">
							<a href="#" class="list-group-item list-group-item-action"
								data-toggle="collapse"> 제목3</a>
							<div class="collapse show mx-4 my-4" id="cl1">내용3</div>
							<a href="#" class="list-group-item list-group-item-action"
								data-toggle="collapse"> 제목4</a>
							<div class="collapse show mx-4 my-4" id="id2">내용4</div>
						</div>
					</div>
				</div>
			</div> <!-- 회사소개 끝 -->
		
			<!-- contact -->
			<div class="pt-4 mb-5 border-top border-bottom border-dark" id="contact">
				<h3 class="text-secondary ">Contact</h3>
				
				<div class="form-group row pl-3 pt-3">
					<label class="col-md-2 col-form-label">회사 이메일</label>

					<input type="text" class="form-control col-md-5" 
							value="example@company.com">
				</div>
				<div class="form-group row pl-3 ">
					<label class="col-md-2 col-form-label">제목</label>

					<input type="text" class="form-control col-md-5" >  
							
				</div>
				<div class="form-group row pl-3 ">
					<label class="col-md-2 col-form-label">내용</label>

					<textarea rows="8" class="form-control col-md-5" >
					</textarea>	  
				</div>
						
			</div> <!-- contact 끝 -->
		
	
	</div>
</div>

<jsp:include page="include/mainFooter.jsp" />

<script src="<c:url value='/resources/js/common.js'/>"></script>

<!-- 데스크톱 추천란 template -->
<script id="recommandedComputer" type="text/x-handlebars-template">
<div class="carousel-inner">
<div class="carousel-item active">
<div class="card-deck row">
{{#computer}}   {{!--5번 인덱스까지지 루프 --}}
	{{#loopCheck @index}}
			
		<div class="card col-md-2" id={{productId}}>
			<img src="{{thumNail}}"  class="card-img-top">

			<div class="card-body">
			  <h5 class="card-title">{{companyName}}</h5>
			  <h6 class="card-subtitle mb-2 text-muted">제품명 {{productName}}</h6>
			  <h6 class="card-subtitle mb-2 text-danger">
				{{#comma price}} {{/comma}} 원</h6>
			  {{{explain1}}} 
			  
			</div>
		</div>
	{{/loopCheck}}
{{/computer}}
</div>
</div>

<div class="carousel-item">
<div class="card-deck row">
{{#computer}}  {{!--6~10번 루프까지해당 --}}
		{{#loopCheck @index}}

		{{else}}
		<div class="card col-md-2" id={{productId}}>
			<img src="{{thumNail}}" class="card-img-top">

			<div class="card-body"> 
			  <h5 class="card-title">{{companyName}}</h5>
			  <h6 class="card-subtitle mb-2 text-muted">제품명 : {{productName}}</h6>
			  <h6 class="card-subtitle mb-2 text-danger">
				{{#comma price}} {{/comma}} 원
			 </h6>
			   {{{explain1}}}
		 
			</div>
		</div>		
		{{/loopCheck}}
{{/computer}}
</div>
</div>
</div>	
</script>

<!-- 노트북 추천란 template -->

<script id="recommandedNotebook" type="text/x-handlebars-template">
<div class="carousel-inner">

<div class="carousel-item active">
<div class="card-deck row">
{{#notebook}}   {{!--5번 인덱스까지지해당 --}}
	{{#loopCheck @index}}		
		<div class="card col-md-2" id={{productId}}>
			<img src="{{thumNail}}"  class="card-img-top">

			<div class="card-body">
			  <h5 class="card-title">{{companyName}}</h5>
			  <h6 class="card-subtitle mb-2 text-muted">제품명 : {{productName}}</h6>
			  <h6 class="card-subtitle mb-2 text-danger">
				{{#comma price}} {{/comma}} 원
				</h6>
			  {{{explain1}}}
			</div>
		</div>
	{{/loopCheck}}
{{/notebook}}
</div>
</div>

<div class="carousel-item">
<div class="card-deck row">
{{#notebook}}  {{!--6~10번 루프까지해당 --}}
		{{#loopCheck @index}}

		{{else}}
		<div class="card col-md-2" id={{productId}}>
			<img src="{{thumNail}}" class="card-img-top">

			<div class="card-body"> 
			  <h5 class="card-title">{{companyName}}</h5>
			  <h6 class="card-subtitle mb-2 text-muted">제품명 : {{productName}}</h6>
			  <h6 class="card-subtitle mb-2 text-danger">
				{{#comma price}} {{/comma}} 원
				</h6>
			   {{{explain1}}}
			</div>
		</div>		
		{{/loopCheck}}
{{/notebook}}
</script>

<script type="text/javascript">
$(document).ready(function(){
	
//if문 헬퍼
Handlebars.registerHelper("loopCheck",function(index,options)
	{
	if(index <= 4)
		{
			return options.fn(this);
		}
	else
	{
		return options.inverse(this);
		}
});

$.getJSON("/shop1/manager/recommended",function(data)
		{
			let template = $('#recommandedComputer').html();
			let ctemplate = Handlebars.compile(template);
			let html = ctemplate(data);
			$("#carouselCom").html(html);	
			
			let template2 = $('#recommandedNotebook').html();
			let ctemplate2 = Handlebars.compile(template2);
			let html2 = ctemplate2(data);
			$("#carouselNote").html(html2);	
			
})//getjson

$('#carousel1').on('slide.bs.carousel', function() {
	$('#indicatior1 li a').removeClass('active')

});
	
$('#carousel1').on('slid.bs.carousel', function()
{
	let current = $('.carousel-item.active').index();
	$('#indicatior1 li a').eq(current).addClass('active')
});

$('#carouselCom').on("click",".card",function(){
	let productId=$(this).attr('id');
	console.log("제품 자세히 보기 클릭됨 id="+productId);
	
	self.location="product/detail?id="+productId
})

$('#carouselNote').on("click",".card",function(){
	let productId=$(this).attr('id');
	console.log("제품 자세히 보기 클릭됨 id="+productId);
	
	self.location="product/detail?id="+productId 
})

})//readyfunction

console.log = function(){}

</script>
</body>
</html>
