<!DOCTYPE html>

<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>

<html>

<jsp:include page="include/staticHead.jsp" />

<!-- 
<frameset rows="90px,*" frameborder="0">
	<frame name="header" src="<c:url value='/include/header.jsp'/>">
	<frame name="main" src="<c:url value='/board/boardList.jsp'/>">	
</frameset>
  -->

<body data-spy="scroll" data-target="#secondNav">

	<jsp:include page="include/plugin-JS.jsp" />
	<jsp:include page="include/mainHeader.jsp" />

	<div class="container-fruid" id="wayPoint">

		<div id="carousel1" class="carousel slide carousel-fade"
			style="width: 100%; padding-top: 10px; margin-right:-10px">

			<div class="carousel-inner">
				<div class="carousel-item active">
					<img src="<c:url value='/resources/images/pic1.jpg'/>"
						style="width: 100%; max-height: 350px">
				</div>
				<div class="carousel-item">
					<img src="<c:url value='/resources/images/pic2.jpg'/>"
						style="width: 100%; max-height: 350px">
				</div>
				<div class="carousel-item">
					<img src="<c:url value='/resources/images/pic3.jpg'/>"
						style="width: 100%; max-height: 350px">
				</div>
				<div class="carousel-item">
					<img src="<c:url value='/resources/images/pic4.jpg'/>"
						style="width: 100%; max-height: 350px">
				</div>
				<div class="carousel-item">
					<img src="<c:url value='/resources/images/pic5.jpg'/>"
						style="width: 100%; max-height: 350px">
				</div>
			</div>
			<a class="carousel-control-prev" href="#carousel1" role="button"
				data-slide="prev"> <i class="fas fa-angle-left fa-4x text-body"></i>
			</a> <a class="carousel-control-next" href="#carousel1" role="button"
				data-slide="next"> <i class="fas fa-angle-right fa-4x text-body"></i>
			</a>
		</div>

		<ul id="indicatior1" class="nav bg-dark nav-pills nav-fill">
			<li class="nav-item "><a href="#carousel1" data-slide-to="0"
				data-toggle='tab' class="nav-link active rounded-0"> 메뉴1</a></li>

			<li class="nav-item"><a href="#carousel1" data-slide-to="1"
				data-toggle='tab' class="nav-link rounded-0"> 메뉴2</a></li>

			<li class="nav-item"><a href="#carousel1" data-slide-to="2"
				data-toggle='tab' class="nav-link rounded-0"> 메뉴3</a></li>

			<li class="nav-item"><a href="#carousel1" data-slide-to="3"
				data-toggle='tab' class="nav-link rounded-0">메뉴4</a></li>
			<li class="nav-item"><a href="#carousel1" data-slide-to="4"
				data-toggle='tab' class="nav-link rounded-0"> 메뉴5</a></li>
		</ul>



		<div class="pt-5" id="studio">
			<div class="row">
				<div class=" col-sm-6 col-md-3 border-left border-dark text-center">
					<a href="" data-toggle="tooltip" data-placement="bottom"
						title="eeeeeeeees"><i class="fas fa-apple-alt fa-7x  "></i></a> <br>
					<br>회사소개
				</div>
				<div
					class=" col-sm-6 col-md-3 border-left border-dark 
		text-center pt-3">
					<a href=""><i class="fas fa-baby-carriage fa-7x  "></i></a> <br>
					<br>Contact
				</div>
				<div
					class=" col-sm-6 col-md-3 border-left 
border-dark text-center pt-3">
					<a href=""><i class="fas fa-arrow-alt-circle-down fa-7x  "></i></a>
					<br> <br>공지사항
				</div>
				<div
					class=" col-sm-6 col-md-3 border-left 
border-dark text-center pt-3">
					<a href=""><i class="fas fa-baseball-ball fa-7x  "></i></a> <br>
					<br>.
				</div>
			</div>
		</div>

		<div class="mt-5 px-5" id="site">

			<div style="width: 100%" class="my-5 border-top" id="why">
				<h3 class="text-secondary pt-2">sites</h3>
				<br>
				<div id="carousel2" class="carousel" data-ride="carousel">

					<div class="carousel-inner">
						<div class="carousel-item active">
							<div class="card-deck">
								<div class="card" style="max-height: 250px">
									<div class="card-header">헤더1</div>
									<div class="card-body">바디</div>
								</div>
								<div class="card" style="max-height: 250px">
									<div class="card-header">헤더2</div>
									<div class="card-body">바디</div>
								</div>
								<div class="card" style="max-height: 250px">
									<div class="card-header">헤더3</div>
									<div class="card-body">바디</div>
								</div>
								<div class="card" style="max-height: 250px">
									<div class="card-header">헤더4</div>
									<div class="card-body">바디</div>
								</div>
								<div class="card" style="max-height: 250px">
									<div class="card-header">헤더5</div>
									<div class="card-body">바디</div>
								</div>
							</div>
						</div>
						<div class="carousel-item">
							<div class="card-deck">
								<div class="card" style="max-height: 250px">
									<div class="card-header">헤더4</div>
									<div class="card-body">바디</div>
								</div>
								<div class="card" style="max-height: 250px">
									<div class="card-header">헤더5</div>
									<div class="card-body">바디</div>
								</div>
								<div class="card" style="max-height: 250px">
									<div class="card-header">헤더6</div>
									<div class="card-body">바디</div>
								</div>
								<div class="card" style="max-height: 250px">
									<div class="card-header">헤더7</div>
									<div class="card-body">바디</div>
								</div>
								<div class="card" style="max-height: 250px">
									<div class="card-header">헤더5</div>
									<div class="card-body">바디</div>
								</div>
							</div>
						</div>
						<div class="carousel-item">
							<div class="card-deck">
								<div class="card" style="max-height: 250px">
									<div class="card-header">헤더7</div>
									<div class="card-body">바디</div>
								</div>
								<div class="card" style="max-height: 250px">
									<div class="card-header">헤더8</div>
									<div class="card-body">바디</div>
								</div>
								<div class="card" style="max-height: 250px">
									<div class="card-header">헤더39</div>
									<div class="card-body">바디</div>
								</div>
								<div class="card" style="max-height: 250px">
									<div class="card-header">헤더14</div>
									<div class="card-body">바디</div>
								</div>
								<div class="card" style="max-height: 250px">
									<div class="card-header">헤더16</div>
									<div class="card-body">바디</div>
								</div>
							</div>
						</div>
					</div>

					<a class="carousel-control-prev" href="#carousel2" role="button"
						data-slide="prev"> <i
						class="fas fa-angle-double-left text-dark fa-lg"></i>
					</a> <a class="carousel-control-next" href="#carousel2" role="button"
						data-slide="next"> <i
						class="fas fa-angle-double-right text-dark fa-lg"></i>
					</a>
				</div>
			</div>

			<div class="pt-4">
				<div class="row">
					<div class="col-md-6 border-right">
						<h5 class="text-secondary">why??</h5>
						<br>

						<div class="list-group list-group-flush">
							<a href="#" class="list-group-item list-group-item-action"
								data-toggle="collapse"> 소제목1</a>
							<div class="collapse show mx-4 my-4" id="cl1">내용1</div>
							<a href="#" class="list-group-item list-group-item-action"
								data-toggle="collapse"> 소제목2</a>
							<div class="collapse show mx-4 my-4" id="id2">내용2</div>
							<a href="#" class="list-group-item list-group-item-action"
								data-toggle="collapse"> 소제목3</a>
							<div class="collapse show mx-4 my-4" id="id3">내용3</div>

						</div>
					</div>
					<div id="book" class="col-md-5 offset-md-1">

						<h5 class="text-dark">books</h5>
					</div>
				</div>
			</div>
		</div>
	</div>
	<jsp:include page="include/mainFooter.jsp" />

	<script src="<c:url value='/resources/js/common.js'/>"></script>

	<script type="text/javascript">
		$(document).ready(function() {
			$('#carousel1').on('slide.bs.carousel', function() {
				$('#indicatior1 li a').removeClass('active')

			});
			$('#carousel1').on('slid.bs.carousel', function() {
				let current = $('.carousel-item.active').index();

				$('#indicatior1 li a').eq(current).addClass('active')
				//$('#indicatior1>li>a[data-slide-to=current]').addClass('active')
			});
		})
	</script>
</body>
</html>
