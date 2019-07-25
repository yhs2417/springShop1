<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<div class="form-group row pt-2">
       		 		
		<select	class="form-control col-md-2 offset-md-8" id="reviewAlign">
			<option selected value=''>정렬기준</option>
			 
			<option value='regDateDesc'>최신등록순</option>
			<option value='regDateAsc'>오래된 등록순</option>
		</select>
		
		<input type="button" class="btn btn-secondary col-md-1 ml-3"
			value="후기작성" id="reviewRegister" > 
</div>

<!-- 리뷰 등록 모달 -->
<div class='modal fade' id="reviewModal">
		<div class='modal-dialog modal-dialog-centered'>
			<div class='modal-content'>
				<div class='modal-header'>
					<h4 class="modal-title">리뷰</h4>
					<button type='button' class='close' data-dismiss='modal'>
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class='modal-body' id='reviewModalBody'>
						<div class="form-group row">
							<label for="userId" class="col-md-3 col-form-label">작성자</label> 
							<input  
								class="form-control col-md-8" name="userId" readonly>
						</div>
						
						<!-- 사진 
						<div class="form-group row">
							<label class="col-md-2"> 후기사진</label> 
						<input type="file"
								class="form-control-file col-md-5" required name="img">
						</div>-->

						<div class="form-group row">
							<label for="header" class="col-md-3  col-form-label">제목</label>
							<input
								class="form-control col-md-8" name="header">
						</div>

						<div class="form-group row">
							<label for="content" class="col-md-3  col-form-label">
								상세 설명</label>

							<textarea rows="5" class="form-control col-md-8" required
								name=content></textarea>
						</div>
				</div>

				<div class="modal-footer">
					<button type="button" class="btn btn-default reviewModalBtn">작성</button>
					<button type="button" class="btn btn-default" data-dismiss="modal">닫기</button>
				</div>

			</div>
		</div>
</div><!-- 모달 끝 -->

<div class="accordion mx-5 pt-3" id="accordion1">
	<div class="card border">
		<div class="card-header bg-info px-0 py-0" id="headline">
			<div class="row">
				<div class="col-md-6 text-center  ">제목</div>
				<div
					class="col-md-3 text-center border-left border-right border-dark">
					작성자</div>
				<div class="col-md-3 text-center">작성일</div>
			</div>
		</div>

	<ul class='list-group' id="reviewsList">

		<!-- 리뷰 오는 곳 -->
	</ul>
	</div>
</div>

<!-- 페이징 -->
<ul class="pagination justify-content-center reviewsPaging pt-5">

</ul>

