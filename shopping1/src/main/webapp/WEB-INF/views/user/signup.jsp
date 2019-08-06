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
    회원가입</h4>

  <div class='container pt-3'>

    <!--회원가입 폼.-->
    <form action="" method="post" name="signUpForm">

      <fieldset class="form-group">
        <div class="row">
          <legend class="col-md-3 col-form-label pt-0 pr-5 text-right">

            <strong>ID</strong>
          </legend>
          <!--아이디, 비밀번호 폼-->
          <div class="col-md-9 border-left">
            <div class="form-group">
              <label for="userId">아이디</label>

              <input type="text" class="form-control" id="userId" required="required" placeholder="영문자 ,숫자  4~14자" name="userId">

                <div class="valid-feedback">적절한 아이디입니다</div>
                <div class="invalid-feedback">부적절한 아이디입니다</div>

              </div>
              <div class="form-group">
                <label for="userPwd">암호</label>
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
              <div class="row">
                <legend class="col-md-3 col-form-label pt-0 pr-5 text-right">
                  <strong>주소</strong>
                </legend>
                <!--주소 폼-->
                <div class="col-md-9 border-left">
                  <div class="form-group row">

                    <input type="text" class="form-control col-md-2 ml-3" placeholder="우편번호" id="addrNum" name="addrNum" readonly="readonly">
                      <button type="button" class="btn btn-white col-md-2 ml-2" onclick="execPostCode();">우편번호검색</button>
                    </div>
                    <div class="form-group">
                      <input type="text" class="form-control" id="addr1" readonly="readonly" name="addr1" placeholder="기본주소"></div>
                      <div class="form-group">
                        <input type="text" class="form-control" id="addr2" required="required" placeholder="상세주소" name="addr2"></div>
                      </div>
                    </div>
                  </fieldset>
                  <!--제출 버튼-->
                  <div class="form-group row">
                    <div class="col-md-9 offset-md-3">
                      <button type="reset" class="btn btn-white">다시작성</button>
                      <button type="button" id="signUpBtn" class="btn btn-danger">회원가입</button>
                    </div>
                  </div>
                </form>
              </div>

<jsp:include page="../include/mainFooter.jsp"/>

<script src="<c:url value='/resources/js/common.js'/>"></script>
<script src="<c:url value='/resources/js/addrNum.js'/>"></script>

<script>

  $('#userId').focus();

  //입력값 정규식
  const getIdCheck = RegExp(/^[a-zA-Z0-9]{4,14}$/);
  const getPwCheck = RegExp(/([a-zA-Z0-9].*[!,@,#,$,%,^,&,*,?,_,~])|([!,@,#,$,%,^,&,*,?,_,~].*[a-zA-Z0-9])/);
  //폼 다 true로 변환되야 가입됨.
 	chk1 = false,
    chk2 = false;

  //ID 입력값 검증.
  $('#userId').on('keyup', function () {
    if ($("#userId").val() === "") {
      $('#userId').removeClass("is-invalid");
      console.log($('#userId').attr("class"));
      chk1 = false;
    }

    //아이디 유효성검사
    if (!getIdCheck.test($("#userId").val())) {

      $('#userId').removeClass("is-valid")
      $('#userId').addClass("is-invalid")
      //ID 중복확인 비동기 처리(유효성 검사후 )
      chk1 =  false;
    
    } 
    else 
    {
      $.ajax({
        type: "POST",
        url: "/shop1/user/idCheck",
        headers: {
          "Content-Type": "application/json",
          "X-HTTP-Method-Override": "POST"
        },
        data: $('#userId').val(),
        datatype: "text",
        success: function (data) {
          console.log(data);
          if (data === "ok") {
            $('#userId').removeClass("is-invalid")
            $('#userId').addClass("is-valid")

            chk1 = true;
          } else {
            $('#userId').removeClass("is-valid")
            $('#userId').addClass("is-invalid")

            chk1 = false;
          }
        },
        error: function (error) {
          console.log("error : " + error);
        }
      }); //ajax 끝
    }
  }); //keyup끝

  //패스워드 입력값 검증.
  $('#userPwd').on('keyup', function () {
    //비밀번호 공백 확인
    if ($("#userPwd").val() === "") {
      $('#userPwd').removeClass("is-invalid");
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
      chk3 =//비밀번호 확인란 유효성검사
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

  $('#signUpBtn').on("click", function () {

    //다 유효성 통과 되었을때 submit
    if (chk1 && chk2 && chk3) {
      const user = {
        userId: $("#userId").val(),
        userPwd: $("#userPwd").val(),
        addrNum: $("#addrNum").val(),
        addr1: $("#addr1").val(),
        addr2: $("#addr2").val()
      };
      console.log(user);

      $.ajax({
        type: "POST",
        url: "/shop1/user",
        headers: {
          "Content-Type": "application/json",
          "X-HTTP-Method-Override": "POST"
        },
        dataType: "text",
        data: JSON.stringify(user),
        success: function (result) {
          console.log("result: " + result);
          if (result === "success") {
            alert("회원가입 되었습니다");
            self.location = "/shop1";
          }
        }
      }); //ajax끝
    } else {
      alert('입력정보를 다시 확인하세요.');
    }
  }); //signupbtn 끝
  
  console.log = function(){}
</script>
</body>
</html>
