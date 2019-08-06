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

	<h4 class="border-bottom mx-5 py-3 ">주문완료</h4>

	<div class='container pt-3' style="min-height: 700px">
		<div class="text-center pt-5">
		
			<h1>
			감사합니다</h1> <br><br>
			<h3 class="text-muted">
			주문이 완료되었습니다</h3><br><br>
			
			<a class="btn btn-warning" href="/shop1"> 홈으로</a>
			<a class="btn btn-warning" onclick="alert('준비중입니다.')"> 주문내역조회</a>
					
		</div> 
	


	</div><!-- container -->
	
	
<jsp:include page="../include/mainFooter.jsp" />

<script src="<c:url value='/resources/js/common.js'/>"></script>

	