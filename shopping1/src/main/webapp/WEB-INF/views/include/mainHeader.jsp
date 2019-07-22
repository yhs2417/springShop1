<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
	
	<!-- Top으로 가는버튼 -->
	<div id="btn_top"
		style="position: fixed; bottom: 0; right: 0; width: 60px; height: 80px; z-index: 99; visibility: hidden">
		<a href="#wayPoint" class="animatescroll"> <i
			class="fas fa-arrow-up fa-2x text-body"></i>
		</a>
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
				<a class='navbar-brand' href="<c:url value='/'/>">HOME</a>

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

