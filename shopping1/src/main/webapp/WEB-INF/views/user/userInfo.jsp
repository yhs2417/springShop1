<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<jsp:include page="../include/staticHead.jsp" />

<body>

	<jsp:include page="../include/plugin-JS.jsp" />
	<jsp:include page="../include/mainHeader.jsp" />

	<h4 class="border-bottom mx-5 py-3" id="wayPoint">
	회원정보 관리</h4>


	<div class='container pt-3' style="height: 800px">

		<div class="row">
			<div class="col-md-2 list-group list-group-flush" id="user_info_menu">
				<a
					class="list-group-item list-group-item-action 
						active list-group-item-light"
					data-toggle="list" href="#infoModify">회원정보수정</a> <a
					class="list-group-item list-group-item-action 
					list-group-item-light"
					data-toggle="list" href="#orders">주문조회</a> <a
					class="list-group-item list-group-item-action 
						list-group-item-light"
					data-toggle="list" href="#withdrawal">회원탈퇴</a>
			</div>


			<!-- 탭패널 -->
			<div class="tab-content col-md-10">
				<div class="tab-pane fade show active" id="infoModify">
					<form action="" method="post" name="modifyInfoForm">

						<div class="list-group">
							<a href="#" class="list-group-item list-group-item-action"
								data-toggle="collapse"> Id</a>
							<div class="collapse show mx-4 my-4">

								<div class="form-group row">
									<label for="userId"
										class="col-md-2
                   		 col-form-label">아이디</label>

									<input type="text"
										class="form-control
                   		 col-md-5"
										id="userId" required readonly value="${login.userId}"
										name="userId">
								</div>
							</div>
							<!-- collapse end -->
						</div>
						<!-- list-group end -->

						<div class="list-group">
							<a href="#" class="list-group-item list-group-item-action"
								data-toggle="collapse"> Password</a>
							<div class="collapse show mx-4 my-4">

								<div class="form-group row">
									<label for="userPwd"
										class="col-md-2
                   		 col-form-label">암호</label>

									<input type="password"
										class="form-control
                   		 col-md-5"		placeholder="특수문자 포함 8자이상"
										id="userPwd" required value="${login.userPwd}" name="userPwd">
								</div>
								<div class="valid-feedback">사용가능한 비밀번호입니다</div>
								<div class="invalid-feedback">적절하지 않은 비밀번호입니다</div>

								<div class="form-group row">
									<label for="userPwd2"
										class="col-md-2
                   		 col-form-label">암호확인</label>

									<input type="password"
										class="form-control
                   		 col-md-5"		placeholder="특수문자 포함 8자이상"
										id="userPwd2" required value="${login.userPwd}"
										name="userPwd2">
								</div>
								<div class="valid-feedback">일치하는 비밀번호입니다</div>
								<div class="invalid-feedback">비밀번호가 일치하지 않습니다</div>

							</div>
							<!-- collapse end -->
						</div>

						<div class="list-group">
							<a href="#" class="list-group-item list-group-item-action"
								data-toggle="collapse"> 주소</a>
							
							<div class="collapse show mx-4 my-4">

								<div class="form-group row">

									<input type="text" class="form-control col-md-2 ml-3"
										placeholder="우편번호" id="addrNum" name="addrNum" 
										value='${login.addrNum}' readonly>
									<button type="button" class="btn btn-white col-md-2 ml-2"
										onclick="execPostCode();">우편번호검색</button>
								</div>
								<div class="form-group">
									<input type="text" class="form-control" id="addr1" readonly
										name="addr1" value="${login.addr1}" placeholder="기본주소">
								</div>
								<div class="form-group">
									<input type="text" class="form-control" id="addr2" required
										placeholder="상세주소" value="${login.addr2}" name="addr2">
								</div>
								
								<div class="form-group row pt-4">
							        <div class="col-md-9">
							         
							            <button type="button" id="modifyUserBtn" class="btn btn-white">수정하기</button>
							        </div>
							    </div>
								
							</div>
							<!-- collapse end -->
						</div>
						<!-- list-group end -->
					</form>
				</div>
				
				<!-- 탭패널1 -->
				<div class="tab-pane fade show" id="orders">${login.userId}</div>
				<!-- 탭패널2 -->
				<div class="tab-pane fade show" id="withdrawal">
				
						<div class="list-group">
							<a href="#" class="list-group-item list-group-item-action"
								data-toggle="collapse"> 회원탈퇴 </a>
							<div class="collapse show mx-4 my-4">

								<div class="form-group row">
									<label for="withdrawal"
										class="col-md-2
                   		 col-form-label">아이디</label>

									<input type="text"
										class="form-control  col-md-5"
                   		
										id="userId" required readonly value="${login.userId}"
										name="userId" >
										
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
	<script src="<c:url value='/resources/js/addrNum.js'/>"></script>
	
<script>
const getIdCheck= RegExp(/^[a-zA-Z0-9]{4,14}$/);
const getPwCheck= RegExp(/([a-zA-Z0-9].*[!,@,#,$,%,^,&,*,?,_,~])|([!,@,#,$,%,^,&,*,?,_,~].*[a-zA-Z0-9])/);
chk2 = true ;chk3= true //비번 아무 수정 안할수 있음

//패스워드 입력값 검증.
$('#userPwd').on('keyup', function() {
   //비밀번호 공백 확인
   if($("#userPwd").val() === ""){
	  $('#userPwd').removeClass("is-invalid");
      chk2 = false;
   }               
   //비밀번호 유효성검사
   else if(!getPwCheck.test($("#userPwd").val()) || $("#userPwd").val().length < 8){
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
   if($("#userPwd2").val() === ""){
	  $('#userPwd2').removeClass("is-invalid");
      chk3 = false;
   }               
   //비밀번호 확인란 유효성검사
   else if($("#userPwd2").val() != $("#userPwd").val()){
	   $('#userPwd2').removeClass("is-valid");
	   $('#userPwd2').addClass("is-invalid");
      chk3 = false;
   } else {
	   $('#userPwd2').removeClass("is-invalid");
	   $('#userPwd2').addClass("is-valid");
      chk3 = true;
   }
   });//#userPwd2
   
$('#modifyUserBtn').on("click",function() 
{
 console.log(chk2+","+chk3)
  console.log($('#userId').val())
   console.log($('#userPwd2').val())
 if(chk2 && chk3 ) 
 { 
      const user = 
      {
            userId: $("#userId").val(),
            userPwd: $("#userPwd").val(),
            addrNum: $("#addrNum").val(),
            addr1: $("#addr1").val(),
            addr2: $("#addr2").val()
      };
      console.log(user);
      
      $.ajax({
         type: "POST",
         url: "/shop1/user/info",
            headers: {
                "Content-Type": "application/json",
                "X-HTTP-Method-Override": "POST"
            },
            dataType: "text",
            data: JSON.stringify(user),
            success: function(result) 
            {
               console.log("result: " + result);
               if(result === "success") {
                  alert("업데이트 되었습니다");
                  self.location = "/shop1/user/info";
               }
            }
      });//ajax끝
   } 
 else {
      alert('입력정보를 다시 확인하세요.');         
   }
}); //signupbtn 끝

$('#withdrawalBtn').on("click",function(){
	let x=confirm("회원 탈퇴 하시겠습니까?");
	console.log(x)
	if (x == true)
		{
		
		  $.ajax({
		         type: "DELETE",
		         url: "/shop1/user/withdrawal",
		            headers: {
		                "Content-Type": "application/json",
		                "X-HTTP-Method-Override": "DELETE"
		            },
		            dataType: "text",
		            data: "${login.userNum}",
		            success: function(result) 
		            {
		               console.log("result: " + result);
		               if(result === "success") {
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