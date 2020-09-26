<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<jsp:include page="../include/htmlHeader.jsp"/>

<body>
	<jsp:include page="../include/hiddenMenu.jsp" />
	<jsp:include page="../include/mainHeader.jsp"/>

<div class="subPageBanner" style="width:85%">
   	<h2> 회원정보관리 </h2>
   	<h4> member info</h4>
</div>

<!--회원의 개인관리 -->
<div class='container pt-3' id="userInfo">

		<aside id="user_info_menu">		
			<ul>
				<li class="active">
					개인정보수정
				</li>
				<li>
					주문조회
				</li>
				<li>
					회원탈퇴
				</li>				
			</ul>
		</aside>


		<!-- 탭패널. (회원정보 수정)-->
		<content style="display:block">

			<div id="infoModify">
			
	  			<form action="" method="post" name="modifyInfoForm" id="modifyInfoForm">

      				<fieldset class="form-group">
	       				<div class="row">
	          				<legend class="col-md-3 col-form-label pt-0 pr-5 text-right">
	
	            				<strong>기본정보</strong>
	          				</legend>
	          				<!--아이디, 비밀번호 폼-->
	          				<div class="col-md-9 border-left">
	            				<div class="form-group">
	              					<label for="userId">아이디</label>
	
	              					<input type="text" class="form-control" id="userId" required="required" readonly="readonly" value="${login.userId}" name="userId">
	
	            				</div>
	            				<div class="form-group">
		              				<label for="userPwd">암호변경</label>
		              				<input type="password" class="form-control" id="userPwd" required="required" placeholder="특수문자 포함 8자이상" name="userPwd">
		                			<div class="valid-feedback">사용가능한 비밀번호입니다</div>
		                			<div class="invalid-feedback">적절하지 않은 비밀번호입니다</div>
	             				</div>
	               				<div class="form-group">
				                    <label for="userPwd2">암호확인</label>
				                    <input type="password" class="form-control" id="userPwd2" required="required" placeholder="특수문자 포함 8자이상" name="userPwd2">
				                    <div class="valid-feedback">일치하는 비밀번호입니다</div>
				                    <div class="invalid-feedback">비밀번호가 일치하지 않습니다</div>
	               				</div>
	            			</div>
	              		</div>
            		</fieldset>

            		<fieldset class="form-group">
              			<div class="row" >
               				<legend class="col-md-3 col-form-label pt-0 pr-5 text-right">
                 		 		<strong>주소</strong>
                			</legend>
                	<!--주소 폼-->
                			<div class="col-md-9 border-left">
	                  			<div class="form-group row" style="margin-right:0; margin-left:0;">
	
		                    		<input type="text" class="form-control col-md-3 col-sm-5" placeholder="우편번호" value='${login.addrNum}' id="addrNum" name="addrNum" readonly="readonly">
		                      		<button type="button" class="btn btn-white col-md-4 col-sm-5 " onclick="execPostCode();">우편번호검색</button>
	                    		</div>
		                    	<div class="form-group">
		                    		<input type="text" class="form-control" id="addr1" readonly="readonly" name="addr1" placeholder="기본주소"  value="${login.addr1}">
		                    	</div>
		                      	<div class="form-group">
		                        	<input type="text" class="form-control" id="addr2" required="required" placeholder="상세주소" name="addr2" value="${login.addr2}">
		                        </div>
                		 
                     		<button type="button" id="modifyUserBtn" class="btn btn-danger">
                      		수정하기
                      		</button>
            			 
		                    </div>
                		</div>
            		</fieldset>
                <!--제출 버튼-->
            
        	</form>
        </div>
	</content>
			<!-- 탭패널 (회원주문 조회)-->
	<content id="orders" style="display:none">		
			준비중입니다
	</content>
			<!-- 탭패널 (회원 탈퇴)-->
	<content id="withdrawal"style="display:none">
		
		<fieldset class="form-group">
              <div class="row" >
               		<legend class="col-md-3 col-form-label pt-0 pr-5 text-right">
                 		 <strong>회원탈퇴</strong>
                	</legend>
                	
                	<div class="col-md-9 border-left">
	                  	<div class="form-group row" style="margin-right:0; margin-left:0;">
	
		                    <label for="withdrawal" class="col-md-2 col-form-label">아이디</label>
   							<input type="text" class="form-control  col-md-5" id="userId" required="required" readonly="readonly" value="${login.userId}" name="userId">
	                    </div>
                     	<button type="button" id="withdrawalBtn" class="btn btn-danger">
                      		회원탈퇴
                      	</button>
            			 
		             </div>
            </div>
        </fieldset>
	
	</content>
 
</div>


<jsp:include page="../include/mainFooter.jsp"/>
<script>
const getIdCheck = RegExp(/^[a-zA-Z0-9]{4,14}$/);
const getPwCheck = RegExp(/([a-zA-Z0-9].*[!,@,#,$,%,^,&,*,?,_,~])|([!,@,#,$,%,^,&,*,?,_,~].*[a-zA-Z0-9])/);
chk2 = false;
chk3 = false

//패스워드 입력값 검증.
$('#userPwd').on('keyup', function () {
	//비밀번호 공백 확인
	if ($("#userPwd").val() === "") {
		$('#userPwd').removeClass("is-invalid");
		$('#userPwd').removeClass("is-valid");
		chk2 =//비밀번호 유효성검사
		false;
	} else if (!getPwCheck.test($("#userPwd").val()) || $("#userPwd").val().length < 8) {
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
$('#userPwd2').on('keyup', function () {
	//비밀번호 확인란 공백 확인
	if ($("#userPwd2").val() === "") {
		$('#userPwd2').removeClass("is-invalid");
		$('#userPwd2').removeClass("is-valid");
		chk3 = false;//비밀번호 확인란 유효성검사
		false;
	} else if ($("#userPwd2").val() != $("#userPwd").val()) {
		$('#userPwd2').removeClass("is-valid");
		$('#userPwd2').addClass("is-invalid");
		chk3 = false;
	} else {
		$('#userPwd2').removeClass("is-invalid");
		$('#userPwd2').addClass("is-valid");
		chk3 = true;
	}
}); //#userPwd2

$('#modifyUserBtn').on("click", function () {

	if (chk2 && chk3) {
		const user = {
			userId: $("#userId").val(),
			userPwd: $("#userPwd").val(),
			addrNum: $("#addrNum").val(),
			addr1: $("#addr1").val(),
			addr2: $("#addr2").val()
		};
		//console.log(user);

		$.ajax({
			type: "POST",
			url: "/shop1/user/info",
			headers: {
				"Content-Type": "application/json",
				"X-HTTP-Method-Override": "POST"
			},
			dataType: "text",
			data: JSON.stringify(user),
			success: function (result) {
				console.log("result: " + result);
				if (result === "success") {
					alert("수정되었습니다");
					self.location = "/shop1";
					console.log('${login.addr2}');

				}
			}
		}); //ajax끝
	} else {
		alert('입력정보를 다시 확인하세요.');
	}
}); //signupbtn 끝

$('#withdrawalBtn').on("click", function () {
	let x = confirm("회원 탈퇴 하시겠습니까?");
	if (x == true) {

		$.ajax({
			type: "DELETE",
			url: "/shop1/user/withdrawal",
			headers: {
				"Content-Type": "application/json",
				"X-HTTP-Method-Override": "DELETE"
			},
			dataType: "text",
			data: "${login.userNum}",
			success: function (result) {
				console.log("result: " + result);
				if (result === "success") {
					alert("탈퇴처리 되셨습니다");
					self.location = "/shop1";
				}
			}
		}); //ajax
	}
}) //withdrawalBtn 끝

$('#user_info_menu li').on("click", function(){
	$(this).addClass("active");
	var index = $(this).index() + 1;
	 
	$('#userInfo content:nth-of-type(' + index + ')').css("display","block");
	$('#userInfo content:not(:nth-of-type(' + index + '))').css("display","none");	
	$('#userInfo aside li:not(:nth-of-type(' + index + '))').removeClass("active");	
});

</script>
</body>
</html>
