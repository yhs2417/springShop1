<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<jsp:include page="../include/staticHead.jsp" />

<body>

	<jsp:include page="../include/plugin-JS.jsp" />
	<jsp:include page="../include/mainHeader.jsp" />

	<h4 class="border-bottom mx-5 py-3" id="wayPoint">상품 관리</h4>


	<div class='container pt-3'>

		<div class="row">
			<div class="col-md-2 list-group list-group-flush">
				<a
					class="list-group-item list-group-item-action 
						active list-group-item-light"
					data-toggle="list" href="#register">상품등록</a> <a
					class="list-group-item list-group-item-action 
					list-group-item-light"
					data-toggle="list" href="#manage">상품관리</a> <a
					class="list-group-item list-group-item-action 
						list-group-item-light"
					data-toggle="list" href="#orders">주문조회</a>
			</div>


			<!-- 탭패널1 -->
			<div class="tab-content col-md-10">
				<div class="tab-pane fade show active" id="register">
					<form action="manager/register" method="post" enctype="multipart/form-data">

						<div class="list-group">
							<a href="#" class="list-group-item list-group-item-action"
								data-toggle="collapse"> 기본정보</a>
							<div class="collapse show mx-4 my-4">

								<div class="form-group row">
									<label for="productName"
										class="col-md-2
                   					 col-form-label">상품이름</label>

									<input type="text" class="form-control col-md-5"
										id="productName" required name="productName">
								</div>

								<div class="form-group row">
									<label for="price"
										class="col-md-2
                   					 col-form-label">상품가격</label>

									<input type="text" class="form-control col-md-5" id="price"
										required name="price">
								</div>
								<div class="form-group row">
									<label for="category"
										class="col-md-2
                   					 col-form-label">분류</label>

									<select class="form-control col-md-5" id="category"
										name="category">
										<option selected>분류..</option>
										<c:forEach var="i" items="${category}">
											<option value='${i.category}'>${i.category}</option>
										</c:forEach>

									</select>
								</div>

								<div class="form-group row">
									<label for="company"
										class="col-md-2
                   					 col-form-label">제조사</label>

									<select class="form-control col-md-5" id="company"
										name="company">
										<option selected>제조사..</option>
									</select>
								</div>

								<div class="form-group row">
									<label for="thumNail" class="col-md-2">
										썸네일사진</label> 
									<input type="file" class="form-control-file col-md-5"
										id="thumNail" required name="img">
								</div>
					
								<div class="form-group row">
									<label for="explain1"
										class="col-md-2
                   					 col-form-label">간략 설명</label>

									<textarea rows=3 class="form-control col-md-5"
										placeholder="" required name="explain1"></textarea>
								</div>
							</div>
							<!-- collapse end -->
						</div>
						<!-- list-group end -->
						
						<div class="list-group">
							<a href="#" class="list-group-item list-group-item-action"
								data-toggle="collapse"> 제품 상세정보 </a>

							<div class="collapse show mx-4 my-4">
								<div class="form-group row">
								<label for="explain2" class="col-md-2
                   					 col-form-label" >상세 설명</label>
										

								<textarea class="form-control col-md-5" id="summerNote1"
										placeholder="" required name="explain2"></textarea>
								</div>
								<div class="form-group row pt-4">
									<div class="col-md-9">
										
										<button type="button" id="registerBtn" class="btn btn-white">등록하기</button>
									</div>
								</div>

							</div>
							<!-- collapse end -->
						</div>
						<!-- list-group end -->
					</form>
				</div>

				<!-- 탭패널2 -->
				<div class="tab-pane fade show" id="manage">${login.userId}</div>
				<!-- 탭패널3 -->
				<div class="tab-pane fade show" id="orders">

					<div class="list-group">
						<a href="#" class="list-group-item list-group-item-action"
							data-toggle="collapse"> abc </a>
						<div class="collapse show mx-4 my-4">

							<div class="form-group row">
								<label for="withdrawal"
									class="col-md-2
                   		 col-form-label">아이디</label>

								<input type="text" class="form-control  col-md-5" id="userId"
									required readonly value="${login.userId}" name="userId">

								<button type="button" id="withdrawalBtn"
									class="btn btn-danger offset-md-1">탈퇴</button>
							</div>


						</div>
						<!-- collapse end -->
					</div>

				</div>
				<!-- 탭패널3-->
			</div>
			<!-- 탭끝 -->
		</div>
	</div>
	<jsp:include page="../include/mainFooter.jsp" />

	<script src="<c:url value='/resources/js/common.js'/>"></script>


	<script>
		$('#summerNote1').summernote({
			height : 300,
			lang : 'ko-KR',
			focus : true,

			callbacks : {
				onImageUpload : function(files, editor, welEditable) {
					for (var i = files.length - 1; i >= 0; i--) {
						sendFile(files[i], this);
					}
				}
			}

		});

		function sendFile(file, el) {
			let form_data = new FormData();
			form_data.append('file', file);
			$.ajax({
				data : form_data,
				type : "POST",
				url : '/shop1/image',
				cache : false,
				contentType : false,
				enctype : 'multipart/form-data',
				processData : false,
				dataType : "text",
				success : function(url) {
					console.log(url);
					$(el).summernote('editor.insertImage', url);
				}
			});
		}

		$('#category').on("change", function()
		{
			console.log($(this).val());
			$.getJSON("/shop1/manager/companies/"+$(this).val(),
			function(data)
			{
				console.log(data)
				let str="";
				$(data).each(function(){
					str+="<option value='"+this.companyName+"'>"
						+this.companyName+"</option>"
				});
				
				$('#company').append(str);
			});//getjson
		}) //#category.change()끝

		const getIdCheck = RegExp(/^[a-zA-Z0-9]{4,14}$/);
		const getPwCheck = RegExp(/([a-zA-Z0-9].*[!,@,#,$,%,^,&,*,?,_,~])|([!,@,#,$,%,^,&,*,?,_,~].*[a-zA-Z0-9])/);
		chk2 = true;
		chk3 = true //비번 아무 수정 안할수 있음

		//패스워드 입력값 검증.
		$('#userPwd').on(
				'keyup',
				function() {
					//비밀번호 공백 확인
					if ($("#userPwd").val() === "") {
						$('#userPwd').removeClass("is-invalid");
						chk2 = false;
					}
					//비밀번호 유효성검사
					else if (!getPwCheck.test($("#userPwd").val())
							|| $("#userPwd").val().length < 8) {
						$('#userPwd').removeClass("is-valid");
						$('#userPwd').addClass("is-invalid");
						chk2 = false;
					} else {
						$('#userPwd').removeClass("is-invalid");
						$('#userPwd').addClass("is-valid");
						chk2 = true;
					}

				});

		//패스워드 확인란 입력값 검증.
		$('#userPwd2').on('keyup', function() {
			//비밀번호 확인란 공백 확인
			if ($("#userPwd2").val() === "") {
				$('#userPwd2').removeClass("is-invalid");
				chk3 = false;
			}
			//비밀번호 확인란 유효성검사
			else if ($("#userPwd2").val() != $("#userPwd").val()) {
				$('#userPwd2').removeClass("is-valid");
				$('#userPwd2').addClass("is-invalid");
				chk3 = false;
			} else {
				$('#userPwd2').removeClass("is-invalid");
				$('#userPwd2').addClass("is-valid");
				chk3 = true;
			}
		});//#userPwd2

		$('#modifyUserBtn').on("click", function() {
			console.log(chk2 + "," + chk3)
			console.log($('#userId').val())
			console.log($('#userPwd2').val())
			if (chk2 && chk3) {
				const user = {
					userId : $("#userId").val(),
					userPwd : $("#userPwd").val(),
					addrNum : $("#addrNum").val(),
					addr1 : $("#addr1").val(),
					addr2 : $("#addr2").val()
				};
				console.log(user);

				$.ajax({
					type : "POST",
					url : "/shop1/user/info",
					headers : {
						"Content-Type" : "application/json",
						"X-HTTP-Method-Override" : "POST"
					},
					dataType : "text",
					data : JSON.stringify(user),
					success : function(result) {
						console.log("result: " + result);
						if (result === "success") {
							alert("업데이트 되었습니다");
							self.location = "/shop1/user/info";
						}
					}
				});//ajax끝
			} else {
				alert('입력정보를 다시 확인하세요.');
			}
		}); //signupbtn 끝

		$('#withdrawalBtn').on("click", function() {
			let x = confirm("회원 탈퇴 하시겠습니까?");
			console.log(x)
			if (x == true) {

				$.ajax({
					type : "DELETE",
					url : "/shop1/user/withdrawal",
					headers : {
						"Content-Type" : "application/json",
						"X-HTTP-Method-Override" : "DELETE"
					},
					dataType : "text",
					data : "${login.userNum}",
					success : function(result) {
						console.log("result: " + result);
						if (result === "success") {
							alert("탈퇴처리 되셨습니다");
							self.location = "/shop1";
						}
					}
				});//ajax
			}
		})//withdrawalBtn 끝
	</script>
</body>
</html>