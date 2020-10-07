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


//검색어 입력시
$('#hd_content1 #searchBar a img').on("click",function()
{
	var condition = $('#hd_content1 #searchBar #condition').val();
	var keyword = $('#hd_content1 #searchBar #keyword').val();
    location.href="/shop1/product/list?category=&condition=" + condition + "&keyword=" + keyword;
});
$('#hiddenMenu #searchArea a img').on("click",function()
{
	var condition = $('#hiddenMenu #searchArea #condition').val();
	var keyword = $('#hiddenMenu #searchArea #keyword').val();
    location.href="/shop1/product/list?category=&condition=" + condition + "&keyword=" + keyword;
});
$("#hiddenMenu #searchArea #keyword").keydown(function(key) {

	if (key.keyCode == 13) {
		condition = $('#hiddenMenu #searchArea #condition').val();
		keyword = $('#hiddenMenu #searchArea #keyword').val();
	    location.href="/shop1/product/list?category=&condition=" + condition + "&keyword=" + keyword;
	}
});
$("#hd_content1 #searchBar #keyword").keydown(function(key) {

	if (key.keyCode == 13) {
		condition = $('#hd_content1 #searchBar #condition').val();
		keyword = $('#hd_content1 #searchBar #keyword').val();
	    location.href="/shop1/product/list?category=&condition=" + condition + "&keyword=" + keyword;
	}
});

var event_rank_index = 0;
var index_random ;

setInterval(function(){
	 //console.log(event_rank_index);
	$('.event_ranking dl a').eq(event_rank_index).animate({
        opacity: '0%'
    }, 200, function() {
      $('.event_ranking dl a').eq(event_rank_index).animate( {
        opacity: '100%'
      },200 );});
	
	if (event_rank_index < 8) {	
		$('#events #inner li:nth-of-type(3) h2').text($('.event_ranking dl').children().eq(event_rank_index).text());
		setTimeout(function(){
			event_rank_index++;	
		},400)
	} else if (event_rank_index == 8) {
		setTimeout(function(){
			index_random = Math.floor(Math.random() * 8);
			if (index_random == 0) { index_random = 1};
			next_text = $('.event_ranking dl a').eq(index_random).text();
			pre_text = $('.event_ranking dl a').eq(index_random - 1).text();
			//$('.event_ranking dl a').eq(index_random).replaceWith($('.event_ranking dl a').eq(index_random - 1));
			$('.event_ranking dl a').eq(index_random - 1).text(next_text);
			$('.event_ranking dl a').eq(index_random).text(pre_text);
			event_rank_index = 0;			 
		},400)
	}
},800);

$('#events #inner li:nth-of-type(3) dl a').on('click',function(){
	alert("이벤트는 준비중입니다");
});

$('.bx_events').bxSlider({
	auto:'true',
	mode:'horizontal',
	speed:700,
	pause:2000
})

$('#events #inner li:nth-of-type(3) h2').on('click',
		function(){
			 
			$('#events #inner li:nth-of-type(3) dl').show();
});  
$('#events #inner li:nth-of-type(3) dl').on('click',
		function(){
			 
			$('#events #inner li:nth-of-type(3) dl').hide();
}); 
