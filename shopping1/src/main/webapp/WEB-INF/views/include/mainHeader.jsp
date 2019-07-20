<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<!--  
<jsp:include page="../include/staticHead.jsp" />-->

<body>
	<!-- 
<jsp:include page="plugin-JS.jsp" /> -->


	<!-- Top으로 가는버튼 -->
	<div id="btn_top"
		style="position: fixed; bottom: 0; right: 0; width: 60px; height: 80px; z-index: 99; visibility: hidden">
		<a href="#wayPoint" class="animatescroll"> <i
			class="fas fa-arrow-up fa-2x text-body"></i>
		</a>
	</div>

	<!-- 초기상태 내비바 -->
	<div class="container-fluid">

		<div class="text-right text-body pb-2">
		
			<c:if test="${login==null}">
				<a class="text-body pr-2 border-right border-dark "
					href="<c:url value='/user/login'/>">로그인</a>
				<a class="text-body" href="<c:url value='/user'/>">회원가입</a>
			</c:if>
			<form>
				<input type="text" placeholder="제품검색" readonly>
			</form>
			

		</div>

		<nav style="visibility: visible" id="firstNav"
			class="navbar navbar-expand-lg navbar-dark bg-dark ">
			
			<!-- 이것만다름<nav id="secondNav" style="visibility: hidden" -->
			<div class="container">
				<button type='button' class='navbar-toggler' data-toggle='collapse'
					data-target='#navbar-collapse'>
					<span class="navbar-toggler-icon"></span>
				</button>
				<a class='navbar-brand' href="<c:url value='/'/>">HOME</a>

				<div class='collapse navbar-collapse' id='navbar-collapse'>
					<ul class='navbar-nav'>

						<li class="nav-item dropdown"><a
							class="nav-link dropdown-toggle" href="#" role="button"
							data-toggle="dropdown"> 1</a>
							<div class="dropdown-menu">
								<a class="dropdown-item" href="#">2</a> <a
									class="dropdown-item" href="#">3</a>

							</div>
						<li class='nav-item'><a class='nav-link' href=''>4</a></li>

					</ul>
				</div>

				<ul class="nav nav-pills">
					<li class="nav-item active"><a class='nav-link animatescroll'
						href='#studio'>메뉴1</a></li>
					<li class="nav-item"><a class='nav-link animatescroll'
						href='#site'>메뉴2</a></li>
					<li class="nav-item"><a class="nav-link animatescroll"
						href="#why">메뉴3</a></li>

					<c:if test="${login.userId=='admin'}">
						<div class='collapse navbar-collapse'>
							<ul class='navbar-nav'>

								<li class="nav-item dropdown"><a
									class="nav-link dropdown-toggle" href="#" role="button"
									data-toggle="dropdown"> admin님</a>
									<div class="dropdown-menu">
										<a class="dropdown-item" href="<c:url value='/manager'/>">상품관리</a> 
										<a class="dropdown-item" href="#">회원관리</a>
											
										<a class="dropdown-item" href="<c:url value='/user/info'/>">정보수정</a> 
										<a class="dropdown-item" href="<c:url value='/user/logout'/>">로그아웃</a>

									</div>
							</ul>
						</div>
					</c:if>

					<c:if test="${login.userId!='admin' && login!=null}">

						<div class='collapse navbar-collapse'>
							<ul class='navbar-nav'>

								<li class="nav-item dropdown"><a
									class="nav-link dropdown-toggle" href="#" role="button"
									data-toggle="dropdown"> ${login.userId}님</a>
									<div class="dropdown-menu">
										<a class="dropdown-item" href="<c:url value='/user/info'/>">회원정보관리</a>
										<a class="dropdown-item" href="#">장바구니</a> <a
											class="dropdown-item" href="#">주문결제내역</a> <a
											class="dropdown-item" href="<c:url value='/user/logout'/>">로그아웃</a>
									</div>
							</ul>
						</div>
					</c:if>
				</ul>
			</div>
		</nav>
	</div>

	<!-- 스크롤 내리면 나타나는 nav -->
	<div class="container-fluid">

		<nav id="secondNav" style="visibility: hidden"
			class="navbar navbar-expand-lg navbar-dark bg-dark fixed-top">
			<div class="container">
				<button type='button' class='navbar-toggler' data-toggle='collapse'
					data-target='#navbar-collapse2'>
					<span class="navbar-toggler-icon"></span>
				</button>
				<a class='navbar-brand' href="<c:url value='/user'/>">HOME</a>

				<div class='collapse navbar-collapse' id='navbar-collapse2'>
					<ul class='navbar-nav'>

						<li class="nav-item dropdown"><a
							class="nav-link dropdown-toggle" href="#" role="button"
							data-toggle="dropdown"> 1</a>
							<div class="dropdown-menu">
								<a class="dropdown-item" href="#">메뉴1</a> <a
									class="dropdown-item" href="#">메뉴2</a>

							</div>
						<li class='nav-item'><a class='nav-link' href=''>2</a></li>
						<li class='nav-item'><a class='nav-link' href=''>3</a></li>
					</ul>
				</div>

				<ul class="nav nav-pills">
					<li class="nav-item active"><a class='nav-link animatescroll'
						href='#studio'>메뉴1</a></li>
					<li class="nav-item"><a class='nav-link animatescroll'
						href='#site'>메뉴2</a></li>
					<li class="nav-item"><a class="nav-link animatescroll"
						href="#why">메뉴3</a></li>

				</ul>
			</div>
		</nav>
	</div>




	<!--  	
<nav class="navbar navbar-light bg-white fixed-top border-bottom border-dark">
	<div class="container" id="nav1">	
	<a class ='navbar-brand' href ='/board1/index.jsp' target="_top">
	<i class="fas fa-home text-body"></i>
	</a>
	<ul class="navbar-nav ml-3 mr-auto" id="ftp1">
	<li class="nav-item">
		<a class="nav-link text-body" href="ftp://hyunnn.kr" target="_blank">FTP</a>
	</li>
	</ul>
	<ul class ='nav nav-pills ml-auto' id="menu">
		<c:if test="${session_id==null}">
		<li class="nav-item">
			<a class="nav-link" href="../member/login.jsp" target="main">로그인</a>
		</li>
		<li class='nav-item'>
			<a class='nav-link' href='../member/signup.jsp' target="main">회원가입</a>
		</li>
		</c:if>
	
		<c:if test="${session_id !=null }">

		<li class="nav-item">
			<a class="nav-link" href="logout.do" target="_top">로그아웃</a>
		</li>
		<li class='nav-item'>
			<a class='nav-link' href='withdrawal.do' target="_top">회원탈퇴</a>
		</li>
		</c:if>
		
      </ul>  
	</div>
</nav>
-->
</body>
</html>