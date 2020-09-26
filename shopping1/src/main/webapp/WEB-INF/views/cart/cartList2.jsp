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

	<div class="subPageBanner" style="width:85%">
	   	<h2>장바구니</h2>
	   	<h4>Cart</h4>
	</div>

	<div class='container pt-3'  id="cartListContainer" style="min-height: 700px">

		<div class="card mt-5" >
			<div class="card-body">
				<div class="table-responsive px-2" style="min-height:500px">
					<table class="table table-hover">
						<thead class="border">
							<tr>
								<th scope="col" style="width: 10%"> </th>
								<th scope="col" style="width: 20%">제품명</th>
								<th scope="col" style="width: 15%">단가</th>
								<th scope="col" style="width: 20%">수량</th>
								<th scope="col" style="width: 15%">금액</th>
								<th scope="col" style="width: 10%"></th>
							</tr>
						</thead>
						<tbody id="cartLists" >
							
							<!-- 카트 내용 이 들어올곳 --> 

						</tbody>
					</table>
				</div>
			</div>
		</div> <!-- card -->
	</div>
	<!-- container end -->
	
	<jsp:include page="../include/mainFooter.jsp" />

<!-- 
cartId=1, userId, productId, count=103, 
productvo=ProductVO(productId, productName, companyName, explain1, explain2, thumNail=resources/images/uploads/bd2a5b43-b4e6-4cb5-8267-29f08848e2a1sec_SM-T800NZWKKOO_007_front_white.jpg, recommend=1)
-->

<script id="cartListTemplate" type="text/x-handlebars-template">
{{#cart}}
<tr class="item-rows">
	<td>
		<img src="<c:url value='/{{productvo.thumNail}}'/>"
				width=100% height=100%/>
	</td>
	<td>
		<a href="/shop1/product/detail?id={{productvo.productId}}"> 
		{{productvo.productName}} 
		</a>
	</td>
	<td>
	 	 {{#comma productvo.price}} {{/comma}}
	
	</td>

	<td class="row">
		<input type="text" style="width: 60px"
			class="form-control productCount" value='{{count}}' />
		<div class="btn-group ml-2">
			<button type="button"
					class="btn btn-white mr-1 productPlusCount">
				<i class="fas fa-plus"></i>
			</button>
			<button type="button"
					class="btn btn-white productMinusCount">
				<i class="fas fa-minus"></i>
			</button>
		</div>
	</td>
	<td class="productPrice"> 

		{{#multiply productvo.price count}}
		{{/multiply}}
			 
	</td>
	<td class="row">
		<div class="btn-group ">
			<button type="button" class="cartCountMod btn btn-link"
					id="{{cartId}}"	>
				변경저장
			</button>
			<button type="button" 
					class="btn btn-link cartDelRow">
				<i class="fas fa-trash-alt text-dark"></i>
			</button>
		</div>
	</td>
</tr>  
{{/cart}}

<tr>
	<td colspan="3"></td>
	<td class="font-weight-bold">합계금액</td>
	<td class="font-weight-bold text-danger" 
		id="totalPrice">
	</td>
	<td></td>
</tr>
<tr>
	<td colspan="5"></td>
	<td>
		<a href="#" class="btn btn-warning" id="order"
			 > 주문하기 </a>
	</td>
</tr>
</script>

<script>
//카트 내역 로드
function getCartList()		
{
	$.getJSON("/shop1/cart/list",function(data)
	{
		//console.log(data);
		let template = $('#cartListTemplate').html();
		let ctemplate = Handlebars.compile(template);
		let html = ctemplate(data);
		$("#cartLists").html(html);
		$("#totalPrice").text(data.totalPrice.toLocaleString())
		
	})//getjson
}		
		
getCartList();		

$('#cartLists').on("click","#order",function(){
	
let res=confirm("주문 하시겠습니까?");
	if( res )
	{
		self.location="/shop1/order/info" 
	} 
});

$('#cartLists').on("click",".productPlusCount", function() {
	
	console.log("더하기 버튼 클릭됨");
	
	let count = Number($(this).parent().prev().val());
	console.log("제품 수량 더하기 기존수량:" + count);
	count += 1;
	$(this).parent().prev().val(count);
	console.log("제품 수량 더하기 변경수량:" + count);
	
	let price=($(this).parent().parent().prev().text()).replace(/\D/g,'');
	let res=count*price;
	$(this).parent().parent().next().html(res.toLocaleString());
	
	totalPriceRenew();
})

//수량빼기 버튼
$('#cartLists').on("click",".productMinusCount", function() {
	let count = Number($(this).parent().prev().val());
	if (count != 1) {
		console.log("제품 수량 빼기 기존수량:" + count);
		count = count - 1;
		$(this).parent().prev().val(count);
		console.log("제품 수량 빼기 변경수량:" + count);
	
		let price=($(this).parent().parent().prev().text()).replace(/\D/g,'');
		let res=count*price;
		$(this).parent().parent().next().html(res.toLocaleString());
	
		totalPriceRenew();
	}
})

$('#cartLists').on("change",".productCount", function(){
	console.log("수량  변경됨");
	let count=Number($(this).val());
	let price=($(this).parent().prev().text()).replace(/\D/g,'');
	console.log("수량 폼 변경됨 수량"+count+"단가"+price);
	let res=count*price;
	console.log("수량 폼 변경됨 가격:"+res+"단가"+price);
	$(this).parent().next().html(res.toLocaleString());
	
	totalPriceRenew();
	
});

//총 가격 합 계산
function totalPriceRenew()
{
	let sumPrice=0;
	//console.log($("#cartLists #a1").text());
	 $("#cartLists .productPrice").each(function()
	 {
		sumPrice+=Number($(this).text().replace(/\D/g,''))
		});
	 console.log(sumPrice.toLocaleString());
	 $('#totalPrice').text(sumPrice.toLocaleString());
}

//각 행 수량 변경 수정 저장
$("#cartLists").on("click",".cartCountMod",function(){
	let cartId=$(this).attr("id");
	let count=$(this).parent().parent().prev().prev().children('input').val();
	console.log("수량 변경 저장 클릭됨. 카트번호:"+cartId+"수량:"+count);
	
	$.ajax({
		type : "PUT",
		url : "/shop1/cart/modCount",
		dataType : "text",
		headers : {
			"Content-type" : "application/json",
			"X-HTTP-Method-Override" : "PUT"
		},
		data : JSON.stringify({
			cartId: cartId,
			count:count
		}),
		success : function(data) {
			console.log(data);
			//getCartList();
			alert("반영되었습니다");
		}
	})//ajax
})

//각 행 삭제
$("#cartLists").on("click",".cartDelRow",function(){
	let res=confirm("해당 상품을 장바구니에서 삭제하시겠습니까?");
	if(res)
	{
	let cartId=$(this).prev().attr("id");
	console.log("카트 삭제 클릭됨. 카트번호:"+cartId);
	
	$.ajax({
		type : "DELETE",
		url : "/shop1/cart/delete",
		dataType : "text",
		headers : {
			"Content-type" : "application/json",
			"X-HTTP-Method-Override" : "DELETE"
		},
		data : cartId,
		success : function(data) {
			console.log(data);
			alert("삭제 되었습니다");
			getCartList();
		}
	})//ajax	
	}//if
});

console.log = function(){}

</script>