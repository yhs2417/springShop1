<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html>
<jsp:include page="../include/staticHead.jsp" />

<body class="wayPoint">

<jsp:include page="../include/plugin-JS.jsp" />
<jsp:include page="../include/mainHeader.jsp" />

<h4 class="border-bottom mx-5 py-3 ">장바구니</h4>

<div class='container pt-3' style="min-height: 500px">

'${cart[0].productId}'

<div class="card mt-5">
	<div class="card-header bg-warning text-white py-1">장바구니</div>
	<div class="card-body">
		<div class="table-responsive px-2">
			<table class="table table-sm">
				<thead>
					<tr>
						<th scope="col">썸네일/th>
						<th scope="col">제품명</th>
						<th scope="col">단가</th>
						<th scope="col">수량</th>
						<th scope="col" style="width: 15%">금액</th>
				</tr>
			</thead>
			<tbody>
				<tr>
					<td>a123</td>
					<td>aaaaaa12412512</td>
					<td>10,000</td>
					<td>1</td>
					<td>50,000원</td>
				</tr>
				<tr style="border-bottom: 2px black solid">

							<td>b123</td>
							<td>bbbbb12412512</td>
							<td>20,000</td>
							<td>5</td>
							<td>120,000원</td>
						</tr>
						<tr>
							<td colspan="3"></td>

							<td class="font-weight-bold">합계</td>
							<td>250,000원</td>
						</tr>
					</tbody>
				</table>
			</div>
		</div>
	</div>








</div>
<!-- container end -->



<jsp:include page="../include/mainFooter.jsp" />

<script src="<c:url value='/resources/js/common.js'/>"></script>