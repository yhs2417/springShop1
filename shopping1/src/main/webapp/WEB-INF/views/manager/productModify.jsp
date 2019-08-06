<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!-- 탭패널 (상품관리(수정, 삭제, 추천상품 등록)).-->

<div class="tab-pane fade" id="manage">
	<!--카테고리 리스트-->
	<ul class="nav nav-pills nav-fill" id="productMenu">

		<c:forEach var="i" items="${category}" varStatus="status">
			<li class="nav-item border">
				<a class="nav-link text-body"
					data-toggle="pill" href="#${i.category}">${i.category}
				</a>
			</li>
		</c:forEach>
	</ul>

	<!--각 카테고리 리스트-->
	<div class="tab-content pt-4">
		<!-- 각 탭 공통 ui -->
		
		<div class="form-group row pt-2 pl-3">
       		 		
			<select	class="form-control col-md-2" id="Align">
				<option selected value=''>정렬기준</option>
				<option value='recommend'>추천순</option>
				<option value='priceDesc'>고가순</option>
				<option value='priceAsc'>저가순</option>
				<option value='regDateDesc'>최신등록순</option>
				<option value='regDateAsc'>오래된 등록순</option>
			</select>
			 
			<div class="btn-group btn-group-sm offset-md-5">
				<div class="btn-group btn-group-sm pl-5">
					<button type="button" id="recommendAddBtn" 
						class="btn btn-white">선택을 추천(최대10개)로 추가
					</button>
					<button type="button" id="recommendDelBtn" 
						class="btn btn-danger">추천상품에서 제거
					</button>
 				</div>
			</div>
		</div>	
		<!-- 각 탭 공통 ui 끝 -->

		<!--각 카테고리 리스트(폼만 만들어 놓고, 각 카테로리 버튼 클릭시
		데이터 불러오고 반영되게 수정하는 게 나을듯...)-->

		<c:forEach var="i" items="${category}" varStatus="status2">

			<div class="tab-pane fade pt-3" id="${i.category}">

			<div class='table-responsive'>
				<table class='table table-striped table-hover table-sm text-center'>
					<thead class='thead-light'>
						<tr>
							<th style="width: 2%" scope='col'><input type="checkbox"
								class="allCheck"></th>
							<th style="width: 1%" scope='col'>No</th>
							<th style="width: 8%" scope='col'>추천</th>

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
			
			<!-- 검색어 -->
			<div class="form-group row pt-5">
       		 		
				<select	class="form-control col-md-1 offset-md-3" id="condition1">
					<option selected value='productName'>제품명</option>
					<option value='companyName'>제조사</option>
				</select>
				<input type="text" placeholder="검색어"
						class="keyword1 form-control col-md-4 mr-2">
				<input type="button"  value="검색"
				class="form-control col-md-1 searchingBtn">
			</div>
			
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
