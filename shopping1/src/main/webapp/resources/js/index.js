slide_index = 0;

//header slide - to left click
$('#slide span:nth-of-type(1)').on('click', function(){
    $('#slide .imgs').eq(slide_index).html(
        "<style>#slide .imgs:nth-of-type(" + (slide_index + 1)+ ")::before { width: 0; }"
        + "#slide .imgs:nth-of-type(" + (slide_index + 1)+ ")::after { width: 0; }"
        + "</style>");
    
    $('#slide .dots a').eq(slide_index).removeClass('select');

    slide_index = ((slide_index - 1) == -1)? 2 : slide_index - 1;
    //console.log(slide_index); 
    $('#slide .imgs').eq(slide_index).html(
        "<style>#slide .imgs:nth-of-type(" + (slide_index + 1) + ")::before { width: 100%; transition: all 0.1s;}</style>");

    $('#slide .dots a').eq(slide_index).addClass('select');

});

//header slide to right click
$('#slide span:nth-of-type(2)').on('click', function(){
    //이전 슬라이드의 html 변경
    $('#slide .imgs').eq(slide_index).html(
        "<style>#slide .imgs:nth-of-type(" + (slide_index + 1)+ ")::before { width: 0; }"
        + "#slide .imgs:nth-of-type(" + (slide_index + 1)+ ")::after { width: 0; }"
        + "</style>");
    //슬라이드 인덱스 바꾸고 이 슬라이드 변경
    $('#slide .dots a').eq(slide_index).removeClass('select');

    slide_index = ((slide_index + 1) == 3)? 0 : slide_index + 1;
    $('#slide .imgs').eq(slide_index).html(
        "<style>#slide .imgs:nth-of-type(" + (slide_index + 1) + ")::after { width: 100%; transition: all 0.1s;}</style>");
        
    $('#slide .dots a').eq(slide_index).addClass('select');
});

//slide dots click
$('#slide .dots a').on('click', function(){
    
    //이전 dots의 인덱스
    var pre_index = $("#slide .dots a[class='select']").index();
    $('#slide .dots a').eq(pre_index).removeClass('select');
    $('#slide .imgs').eq(pre_index).html(
        "<style>#slide .imgs:nth-of-type(" + (pre_index + 1)+ ")::before { width: 0; }"
        + "#slide .imgs:nth-of-type(" + (pre_index + 1)+ ")::after { width: 0; }"
        + "</style>");

    //클릭한 dots의 인덱스
    var now_index = Number($(this).index());
    
    $(this).addClass('select');
    
    $('#slide .imgs').eq(now_index).html(
        "<style>#slide .imgs:nth-of-type(" + (now_index + 1) + ")::after { width: 100%; transition: all 0.1s;}</style>");   
});

//card events dots click
$('#events .dots a').on('click', function(){
     
    //이전 dots의 인덱스
    var pre_index = $("#events .dots a[class='select']").index();
    $('#events .dots a').eq(pre_index).removeClass('select');
    $('#events .card_events').eq(pre_index).css("width", "0%");

    //클릭한 dots의 인덱스
    var now_index = Number($(this).index());
    //console.log(now_index);
    
    $('#events .card_events').eq(now_index).css("width", "100%");
    $(this).addClass('select');
   
});

$('header #menuBtn').on("click",function(){
    
    $('#hiddenMenu').css("width","60%");
    
});
$('#hiddenMenu #closeBtn').on("click",function(){
    $('#hiddenMenu').css("width","0%");
});

$('#hiddenMenu #menu li').on("click",function(){
    //alert($(this).next().css('height'));
    var height = $(this).children('dl').css('height');
    var index = $(this).index() + 1 ;
    if (height == '0px') { //추가 메뉴 닫혀있는 경우
    	$(this).children('dl').css('height','auto');
        $('#hiddenMenu #menu li:not(:nth-of-type(' + index + ')').children('dl').css('height','0');
    } else {
    	$(this).children('dl').css('height','0');
       
    }
});

$('#hiddenMenu #searchBtn').on("click", function(){
	//alert("Aaaa");
});

$('.logoutBtn').on("click",function(){
	if (confirm("로그아웃 하시겠습니까?")) {
		location.href='/shop1/user/logout';
	}
});

 