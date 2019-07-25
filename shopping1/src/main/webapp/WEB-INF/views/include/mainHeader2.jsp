<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	
	<!-- 초기상태 내비바 -->
	<div class="container-fluid">

		<nav style="visibility: visible ;position:absolute;z-index:100;
					width:100%"
			 id="firstNav"
			class="navbar navbar-expand-lg navbar-dark bg-link ">
			 
			<div class="container">
				
				<a class='navbar-brand' href="<c:url value='/'/>">HOME</a>
 				
				<ul class="nav nav-pills">
					<li class="nav-item "><a class='nav-link animatescroll'
						href='<c:url value='/product/list?category=computer'/>'>desktop</a></li>
					<li class="nav-item"><a class='nav-link animatescroll'
						href='<c:url value='/product/list?category=NoteBook'/>'>Notebook</a></li>
				</ul>
				<button type='button' class='navbar-toggler' data-toggle='collapse'
					data-target='#users'>
					<span class="navbar-toggler-icon"></span>
				</button>	
				<c:if test="${login==null}">
						<div class='collapse navbar-collapse' id='users'>
							<ul class='navbar-nav text-right ml-auto'>
								<li class="nav-item">
									<a class=" text-white nav-link"
										href="<c:url value='/user/login'/>">로그인
									</a>
								</li>
								<li class="nav-item">
									<a class="text-white nav-link" href="<c:url value='/user'/>">회원가입
									</a>
								</li>
							</ul>
						</div>
					</c:if>
				<c:if test="${login.userId=='admin'}">
						<div class='collapse navbar-collapse' id='users'>
							<ul class='navbar-nav text-right ml-auto'>

								<li class="nav-item dropdown">
								<a class="nav-link dropdown-toggle" href="#" role="button"
									data-toggle="dropdown"> admin님
								</a>
									<div class="dropdown-menu">
										<a class="dropdown-item" href="<c:url value='/manager'/>">상품관리</a> 
										<a class="dropdown-item" href="<c:url value='/cart/info'/>">장바구니</a> 
										<a class="dropdown-item" href="<c:url value='/user/info'/>">정보수정</a> 
										<a class="dropdown-item" href="<c:url value='/user/logout'/>">로그아웃</a>

									</div>
							</ul>
						</div>
					</c:if>

					<c:if test="${login.userId!='admin' && login!=null}">

						<div class='collapse navbar-collapse' id='users'>
							<ul class='navbar-nav text-right ml-auto'>
								<li class="nav-item dropdown">
									<a class="nav-link dropdown-toggle" href="#" role="button"
									data-toggle="dropdown"> ${login.userId}님</a>
									<div class="dropdown-menu">
										<a class="dropdown-item" href="<c:url value='/user/info'/>">회원정보관리</a>
										<a class="dropdown-item" href="<c:url value='/cart/info'/>">장바구니</a> 
										<a class="dropdown-item" href="#">주문결제내역</a> 
										<a class="dropdown-item" href="<c:url value='/user/logout'/>">로그아웃</a>
									</div>
							</ul>
						</div>
					</c:if>
			</div>
		</nav>
	</div>
