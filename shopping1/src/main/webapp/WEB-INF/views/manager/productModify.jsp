<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!-- 탭패널 (상품관리(수정, 삭제, 추천상품 등록)).-->
<content id="productModify" style="display:none">
	<!-- 검색어 등 ui -->
	<div class="form-group row " id="row1">
      	<select	class="form-control" id="category">	 
	      	<!-- <option selected value=''>제품분류</option> -->
	      	
	      	<c:forEach var="i" items="${category}" varStatus="status">
				<option value='${i.category}'>${i.category}</option>
			</c:forEach>
      	</select>	 
  		<select	class="form-control" id="Align">
			<option selected value=''>정렬기준</option>
			<option value='recommend'>추천순</option>
			<option value='priceDesc'>고가순</option>
			<option value='priceAsc'>저가순</option>
			<option value='regDateDesc'>최신등록순</option>
			<option value='regDateAsc'>오래된 등록순</option>
		</select>
		
		<div class="btn-group">
			<button type="button" id="recommendAddBtn" 
				class="btn btn-white">추천상품 추가
			</button>
			<button type="button" id="recommendDelBtn" 
				class="btn btn-danger">추천상품 제거
			</button>
		</div> 
	</div>
	<div class="form-group row" id="row2">
    	<select	class="form-control" id="condition1">
			<option selected value='productName'>제품명</option>
			<option value='companyName'>제조사</option>
		</select>
		<input type="text" placeholder="검색어" class="keyword1 form-control">
		<input type="button"  value="검색" class="form-control searchingBtn"> 		
	
	</div>	<!--end UI -->
	
	 
	
	<table class='table table-hover text-center'>
		<thead class='thead-light'>
			<tr>
				<th style="width: 2%" scope='col'><input type="checkbox"
					class="allCheck">
				</th>
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
		<tbody class="productList">
		
		</tbody>
	</table>
	
	<div>
		<!-- 페이징 오는 부분 -->
		<ul class="pagination justify-content-center productPaging">

		</ul>
	</div>
 

<!-- 팝업 수정 모달 -->
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
	<!-- 팝업모달 끝 -->


</content>

