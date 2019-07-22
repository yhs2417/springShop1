<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!-- 상품등록 탭패널-->
<div class="tab-content col-md-10">
	<div class="tab-pane fade show active" id="register">

		<form action="<c:url value='manager/register'/>" method="post"
			enctype="multipart/form-data">

			<div class="list-group">
				<a href="#" class="list-group-item list-group-item-action"
					data-toggle="collapse"> 기본정보</a>

				<div class="collapse show mx-4 my-4">

					<div class="form-group row">
						<label for="productName" class="col-md-2 col-form-label">상품이름</label>

						<input type="text" class="form-control col-md-5" id="productName"
							required name="productName">
					</div>

					<div class="form-group row">
						<label for="price"
							class="col-md-2
           					 col-form-label">상품가격</label> <input
							type="text" class="form-control col-md-5" id="price" required
							name="price">
					</div>
					<div class="form-group row">
						<label for="category"
							class="col-md-2
           					 col-form-label">분류</label>
           				<select
							class="form-control col-md-5 categorySelect" name="category">
							<option selected>분류..</option>
							<c:forEach var="i" items="${category}">
								<option value='${i.category}'>${i.category}</option>
							</c:forEach>

						</select>
					</div>

					<div class="form-group row">
						<label for="company"
							class="col-md-2
          					 col-form-label">제조사</label> <select
							class="form-control col-md-5 companySelect" name="companyName">
							<option selected>제조사..</option>
						</select>
					</div>

					<div class="form-group row">
						<label for="thumNail" class="col-md-2"> 썸네일사진</label> <input
							type="file" class="form-control-file col-md-5" id="thumNail"
							required name="img">
					</div>

					<div class="form-group row">
						<label for="explain1"
							class="col-md-2
          					 col-form-label">간략 설명</label>

						<textarea rows=3 class="form-control col-md-5" placeholder=""
							required name="explain1"></textarea>
					</div>
				</div>	<!-- collapse end -->
			</div>	<!-- list-group end -->


			<div class="list-group">
				<a href="#" class="list-group-item list-group-item-action"
					data-toggle="collapse"> 제품 상세정보 </a>

				<div class="collapse show mx-4 my-4">
					<div class="form-group row">
						<label for="explain2"
							class="col-md-2
           					 col-form-label">상세 설명</label>


						<textarea class="form-control col-md-5 summerNote"
							id="summerNote1" placeholder="" required name="explain2"></textarea>
					</div>
					<div class="form-group row pt-4">
						<div class="col-md-9">

							<button type="submit" id="registerBtn" class="btn btn-white">등록하기</button>
						</div>
					</div>
				</div><!-- collapse end -->

			</div>	<!-- list-group end -->

		</form>
	</div><!-- tab-pane -->

<!-- 탭패널 1 끝 -->
