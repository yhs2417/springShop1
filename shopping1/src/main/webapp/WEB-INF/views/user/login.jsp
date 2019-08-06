<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
  <jsp:include page="../include/staticHead.jsp"/>

  <body>

    <jsp:include page="../include/plugin-JS.jsp"/>
    <jsp:include page="../include/mainHeader.jsp"/>

    <h4 class="border-bottom mx-5 py-3" id="wayPoint">
    
      로그인</h4>

    <div class='container pt-3' style="height:400px">

      <!--login form.-->
      <form action="" method="post" name="loginForm">

        <div class="form-row">

          <div class="form-group col-md-3 border-right"></div>

          <!--아이디 -->
          <div class="form-group col-md-6 px-3">
            <label for="userId" class="col-form-label">아이디</label>

            <input type="text" class="form-control" id="userId" required="required" placeholder="영문자 ,숫자  4~14자" name="userId">

              <div class="invalid-feedback">아이디를 확인해주세요</div>

              <label for="userPwd" class="col-form-label">암호</label>
              <input type="password" class="form-control" id="userPwd" required="required" placeholder="특수문자 포함 8자이상" name="userPwd">

                <div class="invalid-feedback">비밀번호를 확인해주세요</div>

              </div>
              <div class="form-group col-md-3 border-left"></div>

            </div>
            <!--자동로그인과 제출버튼.-->
            <div class="form-row py-3 text-center">
              <div class="form-group col-md-6 offset-md-3">

                <div class="custom-control custom-checkbox">
                  <input type="checkbox" class="custom-control-input" checked="checked" id="autoLogin" name="autoLogin">
                    <label class="custom-control-label" for="autoLogin">자동로그인</label>
					<!--  
                    <a href="#">
                      <img src="<c:url value='/resources/images/facebook.png'/>">
                     </a>-->

                      <button type="button" id="loginBtn" class="ml-3 btn btn-danger">로그인</button>

                    </div>
                  </div>
                </div>
              </form>

<jsp:include page="../include/mainFooter.jsp"/>

<script src="<c:url value='/resources/js/common.js'/>"></script>

<script>

$('#userId').focus();

let chk1 = false,
  chk2 = false;

//ID 입력값 검증.
$('#userId').on('keyup', function () {
  if ($("#userId").val() === "") {
    $('#userId').removeClass("is-valid");
    $('#userId').addClass("is-invalid");
    chk1 = false;
  } else {
    $('#userId').removeClass("is-invalid");
    $('#userId').addClass("is-valid");
    chk1 = true;

  }
}); //keyup끝

$('#userPwd').on('keyup', function () {
  if ($("#userPwd").val() === "") {
    $('#userPwd').removeClass("is-valid");
    $('#userPwd').addClass("is-invalid");
    chk2 = false;
  } else {
    $('#userPwd').removeClass("is-invalid");
    $('#userPwd').addClass("is-valid");
    chk2 = true;
  }
}); //keyup끝'
//로그인 버튼 클릭
$('#loginBtn').on("click", function () {

  if (chk1 && chk2) {
    const autoLogin = $("input[name=autoLogin]").is(":checked");
    console.log(autoLogin);

    $.ajax({
      type: "post",
      url: "/shop1/user/loginCheck",
      headers: {
        "Content-Type": "application/json",
        "X-HTTP-Method-Override": "POST"
      },
      dataType: "text",
      data: JSON.stringify({userId: $("#userId").val(), userPwd: $("#userPwd").val(), autoLogin: autoLogin}),
      success: function (data) {
        console.log(data);

        if (data === "success") {
          //alert("어서오세요");
          self.location = "/shop1/";
        } else if (data === "idFail") {
          $('#userId').removeClass("is-valid");
          $('#userId').addClass("is-invalid");
          $('#userId').focus();
          chk1 = false;
          alert("일치하는 아이디가 없습니다");
        } else if (data === "pwFail") {
          alert("암호가 일치하지 않습니다");
          $('#userPwd').removeClass("is-valid");
          $('#userPwd').addClass("is-invalid");
          $('#userPwd').focus();

          chk2 = false;
        }
      } //success
    }) //ajax
  } else {
    alert('입력정보를 다시 확인하세요.');
  }
}); //signupbtn 끝

console.log = function(){}

</script>
</body>
</html>
