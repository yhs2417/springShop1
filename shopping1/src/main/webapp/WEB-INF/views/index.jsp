<!DOCTYPE html>

<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>

<html lang="ko">
	<jsp:include page="include/htmlHeader.jsp" />
 
<body>
	 
	<jsp:include page="include/hiddenMenu.jsp" />
  
    <div id="wrap">
      
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
                <li>
                    <span><a href="#" onclick="alert('이벤트는 준비중입니다');">바로 보러가기</a></span>
                </li>
                <span>
                    <a href="#" onclick="alert('이벤트는 준비중입니다');">전체 이벤트 보기</a>
                </span>
               
            </ul>
            <div id="inner2">
                <h1>MD'S PICK</h1>
                <div id="recommand_area">
                
                </div>
                <%-- <ul class="card_events">
                    <li>
                        <dl>
                            <dt>
                                <img src='<c:url value="/resources/images/gal1.gif"/>'>
                            </dt>
                            <dd>메모1</dd>
                            <dt>부메모11111</dt>
                            <dd></dd>
                        </dl>
                    </li>
                    <li>
                        <dl>
                            <dt>
                                <img src='<c:url value="/resources/images/gal2.gif"/>'>
                            </dt>
                            <dd>메모2</dd>
                            <dt>부메모2222</dt>
                            <dd></dd>
                        </dl>
                    </li>
                    <li>
                        <dl>
                            <dt>
                                <img src="/resources/images/han_note1.gif">
                            </dt>
                            <dd>메모3</dd>
                            <dt>부메모33333</dt>
                            <dd></dd>
                        </dl>
                    </li>
                    <li>
                        <dl>
                            <dt>
                                <img src="/resources/images/lg_note1.gif">
                            </dt>
                            <dd>메모4</dd>
                            <dt>부메모444444</dt>
                            <dd></dd>
                        </dl>
                    </li>
                </ul>
                
                <ul class="card_events">
                    <li>
                        <dl>
                            <dt>
                                <img src="/resources/images/lg_tv1.gif">
                            </dt>
                            <dd>메모1</dd>
                            <dt>부메모11111</dt>
                            <dd></dd>
                        </dl>
                    </li>
                    <li>
                        <dl>
                            <dt>
                                <img src="/resources/images/refre1.gif">
                            </dt>
                            <dd>메모2</dd>
                            <dt>부메모2222</dt>
                            <dd></dd>
                        </dl>
                    </li>
                    <li>
                        <dl>
                            <dt>
                                <img src="/resources/images/refre2.gif">
                            </dt>
                            <dd>메모3</dd>
                            <dt>부메모33333</dt>
                            <dd></dd>
                        </dl>
                    </li>
                    <li>
                        <dl>
                            <dt>
                                <img src="/resources/images/refre2.gif">
                            </dt>
                            <dd>메모4</dd>
                            <dt>부메모444444</dt>
                            <dd></dd>
                        </dl>
                    </li>
                </ul>
                <ul class="card_events">
                    <li>
                        <dl>
                            <dt>
                                <img src="/resources/images/sam_tv2.gif">
                            </dt>
                            <dd>메모1</dd>
                            <dt>부메모11111</dt>
                            <dd></dd>
                        </dl>
                    </li>
                    <li>
                        <dl>
                            <dt>
                                <img src="images/tab1.gif">
                            </dt>
                            <dd>메모2</dd>
                            <dt>부메모2222</dt>
                            <dd></dd>
                        </dl>
                    </li>
                    <li>
                        <dl>
                            <dt>
                                <img src="/resources/images/tab2.gif">
                            </dt>
                            <dd>메모3</dd>
                            <dt>부메모33333</dt>
                            <dd></dd>
                        </dl>
                    </li>
                    <li>
                        <dl>
                            <dt>
                                <img src="/resources/images/tab2.gif">
                            </dt>
                            <dd>메모4</dd>
                            <dt>부메모444444</dt>
                            <dd></dd>
                        </dl>
                    </li>
                </ul> --%>
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
                    <h2>매장찾기</h2>
                    <p>합리적 가격의<br>
                        HYUN 매장을 만나보세요
                    </p>
                    <a href="#">more</a>
                </div>
            </div>
            <div class="span_section">
                <div>
                    <h2>매장찾기</h2>
                    <p>합리적 가격의<br>
                        HYUN 매장을 만나보세요
                    </p>
                    <a href="#">more</a>
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
{{#computer}}   {{!--0~3번 인덱스까지 루프 --}}
	{{#loopCheck @index 0 3}}
		 
	<li>
        <dl id={{productId}}>
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
{{/computer}}
</ul>

<ul class="card_events">
{{#computer}}  {{!--4~7번 루프까지해당 --}}
	{{#loopCheck @index 4 7}}
 		
		<li id={{productId}}>
        	<dl>
        		<dt>
        			<img src='{{thumNail}}'>
        		</dt>
        		<dd> 
					[{{companyName}}] <br>{{productName}}</dd>
        		<dt>
					<span style="color:white; background-color:red;font-size:17px;"> 특가!  
					{{price}}원</span><br>{{{explain1}}} </dt>
        		<dd></dd>
        	</dl>
    	</li>
	{{/loopCheck}}
{{/computer}}
</ul>
<ul class="card_events">
{{#computer}}  {{!--8~11번 루프까지해당 --}}
	{{#loopCheck @index 8 11}} 
 
		<li id={{productId}}>
        	<dl>
        		<dt>
        			<img src='{{thumNail}}'>
        		</dt>
        		<dd>
					[{{companyName}}] <br> {{productName}}
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
{{/computer}}
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
$('#recommand_area').on("click", "dl", function(){
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
