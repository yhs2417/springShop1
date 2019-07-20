<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!-- 탭패널2 -->
<div class="tab-pane fade" id="manage">

	<ul class="nav nav-pills nav-fill" id="productMenu">

		<c:forEach var="i" items="${category}" varStatus="status">
			<li class="nav-item border"><a class="nav-link text-body"
				data-toggle="pill" href="#${i.category}">${i.category} </a></li>
		</c:forEach>
	</ul>
	<div class="tab-content pt-4">
		<!-- 각 탭 공통 ui -->
		<div class="btn-toolbar justify-content-end">
			<div class="btn-group btn-group-sm">

				<button type="button" class="btn btn-white dropdown-toggle"
					data-toggle="dropdown">정렬</button>
				<div class="dropdown-menu">
					<a class="dropdown-item" href="#">고가순</a> <a class="dropdown-item"
						href="#">저가순</a> <a class="dropdown-item" href="#">최신 등록순</a> <a
						class="dropdown-item" href="#">오래된 등록순</a>

				</div>
				<div class="btn-group pl-2 btn-group-sm">
					<button type="button" class="btn btn-white">선택상품 추천상품 등록</button>
					<button type="button" class="btn btn-danger">선택 삭제</button>
				</div>
			</div>
		</div><!-- btn-toolbar -->
		

		<c:forEach var="i" items="${category}" varStatus="status2">
			 
			<div class="tab-pane fade pt-3" id="${i.category}">
		 

			<div class='table-responsive'>
				<table class='table table-striped table-hover table-sm text-center'>
					<thead class='thead-light'>
						<tr>
							<th style="width: 2%" scope='col'><input type="checkbox"
								id="allCheck"></th>
							<th style="width: 1%" scope='col'>No</th>

							<th style="width: 10%" scope='col'>상품명</th>
							<th style="width: 10%" scope='col'>가격</th>
							<th style="width: 10%" scope='col'>분류</th>
							<th style="width: 10%" scope='col'>회사명</th>
							<th style="width: *%" scope='col'>간략설명</th>
							<th style="width: 10%" scope='col' hidden>상세설명</th>
							<th style="width: 52" scope='col'>썸네일</th>
							<th style="width: 3%" scope='col'></th>
						</tr>
					</thead>
					<!-- 각 분류별 내용 -->
					<tbody class="productList">

					</tbody>
				</table>
			</div>
			<!-- class='table-responsive'>끝 -->

			<!-- 페이징 오는 부분 -->
			
				<ul class="pagination justify-content-center productPaging">
					 
				</ul>
			
			</div><!--tab-pane 끝 -->
		</c:forEach>	
	
	</div>
	<!-- 텝content 끝 -->

	<!-- 공용 수정 모달 -->
	<div class='modal fade' id="productModModal">
		<div class='modal-dialog  modal-dialog-centered modal-lg'>
			<div class='modal-content'>
				<div class='modal-header'>
					<h4 class="modal-title">상품 수정</h4>
					<button type='button' class='close' data-dismiss='modal'>
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class='modal-body'>
					<form id="productModForm">
						<div class="form-group row">
							<input type="hidden" class="form-control col-md-5"
								name="productId"> <label class="col-md-2 col-form-label">상품이름</label>
							<input type="text" class="form-control col-md-5" required
								name="productName">
						</div>

						<div class="form-group row">
							<label class="col-md-2 col-form-label">상품가격</label> <input
								type="text" class="form-control col-md-5" required name="price">
						</div>
						<div class="form-group row">
							<label class="col-md-2 	col-form-label">분류</label> <input
								class="form-control col-md-5" name="category" readonly>
						</div>

						<div class="form-group row">
							<label class="col-md-2  col-form-label">제조사</label> <input
								class="form-control col-md-5" name="companyName" readonly>
						</div>

						<div class="form-group row">
							<label class="col-md-2"> 썸네일사진</label> <input type="file"
								class="form-control-file col-md-5" required name="img">
						</div>

						<div class="form-group row">
							<label class="col-md-2  col-form-label">간략설명</label>

							<textarea rows=3 class="form-control col-md-5" placeholder=""
								required name="explain1"></textarea>
						</div>

						<div class="form-group row">
							<label for="explain2" class="col-md-2  col-form-label">
								상세 설명</label>

							<textarea class="form-control col-md-5 summerNote" required
								name="explain2"></textarea>
						</div>
					</form>
				</div>

				<div class="modal-footer">
					<button type="button" class="btn btn-default productModBtn">수정</button>
					<button type="button" class="btn btn-default" data-dismiss="modal">닫기</button>
				</div>

			</div>
		</div>
	</div>
	<!-- 공용모달 끝 -->
</div>
<!-- 탭패널 2 끝 -->