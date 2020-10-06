<!DOCTYPE html>

<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>

<html lang="ko">
	<jsp:include page="include/htmlHeader.jsp" />
 
<body>
	 
	<jsp:include page="include/hiddenMenu.jsp" />
  
    <div id="wrap" class="horizon-center">
      
    	<jsp:include page="include/mainHeader.jsp" />

       
        <section id="slide">
             
            <div class="imgs"></div>
            <div class="imgs"></div>
            <div class="imgs"></div>

            <span> <img src='<c:url value="/resources/images/icons/left.png" />' width="45"> </span>
            <span> <img src='<c:url value="/resources/images/icons/right.png" />' width="45"> </span>

            <div class="dots">
                <a class="select"></a>
                <a></a>
                <a></a>
            </div>
        </section>

        <section id="events">
            <ul id="inner">
                <li>
                    <strong>new & event</strong>
                </li>
                <li>
                    <strong>HYUN MALL의 다양한 혜택과<br>
                    이벤트 그리고 신제품
                    </strong>
                    <p>have a good time;</p>
                    
                </li>
                <li class="event_ranking">
                		<strong>실시간 <i style="color:#f9b234; font-size:20px;">Hot</i> 이벤트 순위</strong>
                	<dl>
                		<dt><span>1.</span><a>회원가입시 무료쿠폰! </a></dt>
                		<dd><span>2.</span><a>기계식 키보드 증정 룰렛돌리기</a></dd>
                		<dt><span>3.</span><a>애플 iphone10s 체험단 모집</a></dt>
                		<dd><span>4.</span><a>삼성 갤럭시 10 선착순 할인!</a></dd>
                		<dt><span>5.</span><a>ipad 구매후기 이벤트!</a></dt>
                		<dd><span>6.</span><a>삼성 데스크탑 출시 기념!</a></dd>
                		<dt><span>7.</span><a>레노바 신모델을 30만원에</a></dt>
                		<dd><span>8.</span><a>샤오미 미노트 출시임박!</a></dd>
                 
                	
                	</dl>
                </li>
                <span>
                    <a href="#" onclick="alert('이벤트는 준비중입니다');">전체 이벤트 보기</a>
                </span>
               
            </ul>
            <div id="inner2">
                <h1>MD'S PICK</h1>
                <div id="recommand_area">
                
                </div>
          
            <div class="dots">
                    <a class="select"></a>
                    <a></a>
                    <a></a>
            </div>
        </div>
        </section>

        <section id="scroll_img1">
            <div class="circle_section">
                <div>
                    <h2>가을바람의 <br> 냉장고</h2>
                    <p>합리적 가격의<br>
                        HYUN 매장에서 만나보세요
                    </p>
                    <a href="<c:url value='/product/list?category=aircon&condition=&keyword='/>">more</a>
                </div>
            </div>
            <div class="span_section">
                <div>
                    <h2>가을바람의 냉장고</h2>
                    <p>합리적 가격의<br>
                        HYUN 매장을 만나보세요
                    </p>
                    <a href="<c:url value='/product/list?category=aircon&condition=&keyword='/>">more</a>
                </div>
            </div>
        </section>
        <section id="sns">
            <p><strong>SNS</strong></p>
            <p><span>HYUN's 함께하는 sns</span></p>
            <ul>
                <li>
                    <a href="">
                    <img src='<c:url value="/resources/images/icons/sns1.png"/>'>   
                    </a>
                </li>

                <li>
                    <a href="">
                    <img src='<c:url value="/resources/images/icons/sns2.png"/>'>   
                    </a>
                </li>
                <li>
                    <a href="">
                    <img src='<c:url value="/resources/images/icons/sns3.png"/>'>  
                    </a>
                </li>
                <li>
                    <a href="">
                    <img src='<c:url value="/resources/images/icons/sns4.png"/>'>  
                    </a>
                </li>
                 
            </ul>
        </section>
        <section id="img_row">
            <ul>
                <li>
                    <img src='<c:url value="/resources/images/footer_07.jpg"/>'>
                    <a href="">
                        <span>데스크탑 <br>바로 보러가기</span>
                    </a>
                </li>
                <li>
                    <img src='<c:url value="/resources/images/footer_21.jpg"/>'>
                    <a href="">
                        <span>스마트폰<br> 바로 보러가기</span>
                    </a>
                </li>
                <li>
                    <img src='<c:url value="/resources/images/footer_13.jpg"/>'>
                    <a href="">
                        <span>태블릿 <br>바로 보러가기</span>
                    </a>
                </li>
                <li>
                    <img src='<c:url value="/resources/images/footer_16.gif"/>'>
                    <a href="">
                        <span>TV <br>바로 보러가기</span>
                    </a>
                </li>
                <li>
                    <img src='<c:url value="/resources/images/footer_19.jpg"/>'>
                    <a href="">
                        <span>노트북 <br>바로 보러가기</span>
                    </a>
                </li>
                
                
            </ul>
        </section>
        
        <jsp:include page="include/mainFooter.jsp" />
    
    </div> <!--wrap-->

<!--md's pick template -->
<script id="recommandItem" type="text/x-handlebars-template">
<ul class="card_events">
{{#recommend}}   {{!--0~3번 인덱스까지 루프 --}}
	{{#loopCheck @index 0 3}}
		 
	<li id={{productId}}>
        <dl >
        	<dt>
        		<img src='{{thumNail}}'>
        	</dt>
        	<dd>[{{companyName}}] <br>{{productName}}</dd>
        	<dt> <span style="color:white; background-color:red;font-size:17px;"> 특가! 
				 {{#comma price}} {{/comma}} 원  </span>
			<br> {{{explain1}}} 
			</dt>
         
        </dl>
    </li>
 
	{{/loopCheck}}
{{/recommend}}
</ul>

<ul class="card_events">
{{#recommend}}  {{!--4~7번 루프까지해당 --}}
	{{#loopCheck @index 4 7}}
 		
		<li id={{productId}}>
        	<dl>
        		<dt>
        			<img src='{{thumNail}}'>
        		</dt>
        		<dd> 
					 [{{companyName}}]<br>{{productName}}</dd>
        		<dt>
					<span style="color:white; background-color:red;font-size:17px;"> 특가!  
					{{price}}원</span><br>{{{explain1}}} </dt>
        		<dd></dd>
        	</dl>
    	</li>
	{{/loopCheck}}
{{/recommend}}
</ul>
<ul class="card_events">
{{#recommend}}  {{!--8~11번 루프까지해당 --}}
	{{#loopCheck @index 8 11}} 
 
		<li id={{productId}}>
        	<dl>
        		<dt>
        			<img src='{{thumNail}}'>
        		</dt>
        		<dd>
					 [{{companyName}}]<br> {{productName}}
				</dd>
        		<dt>
					<span style="color:white; background-color:red;font-size:17px;"> 특가!  
					{{price}}원</span>
					<br>{{{explain1}}}
				 </dt>
        		<dd></dd>
        	</dl>
    	</li>
	{{/loopCheck}}
{{/recommend}}
</ul>
 
</script>


<!-- 노트북 추천란 template -->
<!--
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
-->
<script type="text/javascript">
 
$.getJSON("/shop1/manager/recommended",function(data)
		{
			console.log(data);
			let template = $('#recommandItem').html();
			let ctemplate = Handlebars.compile(template);
			let html = ctemplate(data);
			$("#recommand_area").html(html);	
			
			/* let template2 = $('#recommandedNotebook').html();
			let ctemplate2 = Handlebars.compile(template2);
			let html2 = ctemplate2(data);
			$("#carouselNote").html(html2);	 */
			
}) 
$('#recommand_area').on("click", "li", function(){
	let productId=$(this).attr('id');
	console.log("제품 자세히 보기 클릭됨 id="+productId);
	
	self.location="product/detail?id="+productId
});

$(window).on('scroll' , function(){
	var hd = $('#scroll_img1').offset().top - 550;
	 //console.log("offset="+hd);
	
    var sc = $(window).scrollTop(); // 스크롤 위 공간 높이
    //console.log("scrollTOP="+sc);
    if (sc < hd) {
    	$('#scroll_img1 .span_section').removeClass('on2');
        $('#scroll_img1 span:nth-of-type(1)').removeClass('scroll_left');
        $('#scroll_img1 span:nth-of-type(2)').removeClass('scroll_right');
        $('#scroll_img1 .circle_section').removeClass('on');
    }
    else if (sc >= hd) {
        $('#scroll_img1 .span_section').addClass('on2');
        $('#scroll_img1 span:nth-of-type(1)').addClass('scroll_left');
        $('#scroll_img1 span:nth-of-type(2)').addClass('scroll_right');
        $('#scroll_img1 .circle_section').addClass('on');
    }   
}); 

/* $('#carouselNote').on("click",".card",function(){
	let productId=$(this).attr('id');
	console.log("제품 자세히 보기 클릭됨 id="+productId);
	
	self.location="product/detail?id="+productId 
}) */
</script>
</body>
</html>
