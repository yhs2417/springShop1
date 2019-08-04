<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html>
<jsp:include page="../include/staticHead.jsp" />

<body id="wayPoint">

	<jsp:include page="../include/plugin-JS.jsp" />
	<jsp:include page="../include/mainHeader.jsp" />

	<h4 class="border-bottom mx-5 py-3 ">주문확인</h4>

	<div class='container pt-3' style="min-height: 700px">

		<div class="card mt-5">
			<div class="card-header bg-primary text-white py-1">주문확인</div>
			<div class="card-body">
				<div class="table-responsive px-2">
					<table class="table table-hover">
						<thead class="border">
							<tr>
								<th scope="col" style="width: 15%"></th>
								<th scope="col" style="width: *%">제품명</th>
								<th scope="col" style="width: 15%">단가</th>
								<th scope="col" style="width: 10%">수량</th>
								<th scope="col" style="width: 15%">금액</th>
							</tr>
						</thead>
						<tbody id="orderLists">

							<!-- 주문내용 올곳 -->
						</tbody>
					</table>
				</div>
			</div>
		</div>
		<!-- card -->

		<div class="card mt-5">
			<div class="card-header bg-primary text-white py-1">배송주소 확인</div>
			<div class="card-body">
				<div class="table-responsive px-2">
					<table class="table table-hover">
					 
						<tbody id="address">
							<tr>
								<td class="text-center border-right w-25">
								아이디</td>
								<td>${login.userId}님</td>
							</tr>
							<tr>
								<td class="text-center border-right w-25">
								우편번호</td>
								<td>${login.addrNum}</td>
							</tr>
							<tr>
								<td class="text-center border-right w-25">
								기본주소</td>
								<td>${login.addr1}</td>
							</tr>
							<tr>
								<td class="text-center border-right w-25">
								상세주소</td>
								<td>${login.addr2}</td>
							</tr>
						</tbody>
					</table>
				</div>
			</div>
		</div>
		<!-- card -->
		<div class="text-right pt-4 mb-5">
		<button href="#" class="btn btn-warning" id="order"> 결제하기 </button>
		</div>
		
	</div>
	<!-- container end -->

	<jsp:include page="../include/mainFooter.jsp" />

	<script src="<c:url value='/resources/js/common.js'/>"></script>
	<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>
	
	<!-- 
cartId=1, userId, productId, count=103, 
productvo=ProductVO(productId, productName, companyName, explain1, explain2, thumNail=resources/images/uploads/bd2a5b43-b4e6-4cb5-8267-29f08848e2a1sec_SM-T800NZWKKOO_007_front_white.jpg, recommend=1)
-->
	<script id="orderListTemplate" type="text/x-handlebars-template">
{{#cart}}
<tr>
	<td>
		<img src="<c:url value='/{{productvo.thumNail}}'/>"
				width=100% height=100%/>
	</td>
	<td>
		{{productvo.productName}} 
	</td>
	<td>
	 	 {{#comma productvo.price}}
		{{/comma}}
	</td>
	<td>
		{{count}}
	</td>
	<td class="productPrice"> 

			{{#multiply productvo.price count}}
			{{/multiply}}
			 
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
</script>

<script type="text/javascript">
totalPrice="";

function getorderList() {
	$.getJSON("/shop1/order/list", function(data) {
		console.log(data);
		//div에 반영
		let template = $('#orderListTemplate').html();
		let ctemplate = Handlebars.compile(template);
		let html = ctemplate(data);
		$("#orderLists").html(html);
		totalPrice=data.totalPrice;
		$("#totalPrice").text(totalPrice.toLocaleString());
	})//getjson
}

getorderList();

$('#order').on("click", function() {

	let res = confirm("결제 하시겠습니까?");
	if (res) {
		IMP.init('imp16579383');

		IMP.request_pay({
			pg : ' html5_inicis',
			pay_method : 'card',
			merchant_uid : 'merchant_' + new Date().getTime(),
			name : '주문 결제',
			amount : Number(totalPrice),
			buyer_email : 'exam@x.com',
			buyer_name : '${login.userId}',
			buyer_tel : '010-1234-5678',
			buyer_addr : '${login.addr1} ${login.addr2}',
			buyer_postcode : '${login.addrNum}',
			m_redirect_url : '/shop1/order/complete'
		}, function(rsp) 
		{
			if (rsp.success) 
			{
				//서버에 결과 전송
				$.ajax({
					url : "/shop1/order/complete", 
					type : 'POST',
					dataType : 'text',
					headers : {
						"Content-type" : "application/json",
						"X-HTTP-Method-Override" : "POST"
					},
					data : JSON.stringify({ 
						payNo : rsp.imp_uid,
						totalPrice : totalPrice					
					}),
					success : function(data) 
					{
						if (data==="success") 
						{
							let msg = '결제가 완료되었습니다.';
							//msg += '\n고유ID : ' + rsp.imp_uid;
							//msg += '\n상점 거래ID : ' + rsp.merchant_uid;
							//msg += '\결제 금액 : ' + rsp.paid_amount;
							//msg += '카드 승인번호 : ' + rsp.apply_num;

							//alert(msg);
							self.location="complete"
						} else {
							//[3] 아직 제대로 결제가 되지 않았습니다.
							//[4] 결제된 금액이 요청한 금액과 달라 결제를 자동취소처리하였습니다.
							alert("결제가 되지 않았습니다.");
							self.location="/shop1/cart/info";
						}
					}
				})//ajax
			}//if
			else {
				var msg = '결제에 실패하였습니다.';
				msg += '에러내용 : ' + rsp.error_msg;
			}
			//alert(msg);
		} //function(rsp)
		)//request_pay

	}//if
})
</script>