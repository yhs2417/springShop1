$(document).ready(function(){
	// 아아디 중복 확인 이벤트
	/*
	$("#user_id").on("keyup",function(){
	
		$.ajax({
			type:"POST",
			url:"/spring/user/idCheck",
			dataType:"json",
			headers:{
				"Content-type" : "application/json",
                "X-HTTP-Method-Override" : "POST" //put 같은거 인식못할시 post로 바꾸라는뜻
			},
			data: 
					$("#user_id").val()
					,//JSON.stringify
			
			success:function(data)
			{
				$("#idChk").text(data.confirm);
			}
		})//Ajax
		
	});//$("#user_id").on("keyup")
	
	
	
	$("#signup-btn").on("click",function()
	{
		console.log("회원가입 클릭됨.")
		$.ajax({
			type:"POST",
			url:"/spring/user/",
			dataType:"text",
			headers:{
				"Content-type" : "application/json",
                "X-HTTP-Method-Override" : "POST" //put 같은거 인식못할시 post로 바꾸라는뜻
			},
			data: JSON.stringify(
					{
						userId:$("#user_id").val(),
						userPwd:$("#password").val(),
						userName:$("#user_name").val()
					}),//JSON.stringify
			
			success:function(data)
			{
				if(data==="success")
					{
						$("#user_id").val("");
						$("#password").val("");
						$("#password_check").val("");
						$("#user_name").val("");
						
						alert("회원가입완료")
					}
				
			}
		})//Ajax
	})//#signup-btn
*/
	const getIdCheck= RegExp(/^[a-zA-Z0-9]{4,14}$/);
	   const getPwCheck= RegExp(/([a-zA-Z0-9].*[!,@,#,$,%,^,&,*,?,_,~])|([!,@,#,$,%,^,&,*,?,_,~].*[a-zA-Z0-9])/);
	   const getName= RegExp(/^[가-힣]+$/); //한글입력
	   const getMail = RegExp(/^[A-Za-z0-9_\.\-]+@[A-Za-z0-9\-]+\.[A-Za-z0-9\-]+/);
	   let chk1 = false, chk2 = false, chk3 = false, chk4 = false;  //4개 폼 다 true로 변환되야 가입됨.
	   
	   //회원가입 검증~~
	   //ID 입력값 검증.
	   $('#user_id').on('keyup', function() {
	      if($("#user_id").val() === ""){
	         $('#user_id').css("background-color", "pink");
	         $('#idChk').html('<b style="font-size:14px;color:red;">[아이디는 필수 정보에요!]</b>');
	         chk1 = false;
	      }
	      
	      //아이디 유효성검사
	      else if(!getIdCheck.test($("#user_id").val())){
	         $('#user_id').css("background-color", "pink");
	         $('#idChk').html('<b style="font-size:14px;color:red;">[영문자,숫자 4-14자]</b>');     
	         chk1 = false;
	      } 
	      //ID 중복확인 비동기 처리(유효성 검사후 )
	      else {
	         const userId = $('#user_id').val();
	         $.ajax({
	            type: "POST",
	            url: "/spring/user/idCheck",
	            headers: {
	                   "Content-Type": "application/json",
	                   "X-HTTP-Method-Override": "POST"
	               },
	            data: userId,
	            datatype: "json",
	            success: function(data) {
	               console.log(data);
	               if(data.confirm === "ok") {
	                  $('#user_id').css("background-color", "aqua");
	                  $('#idChk').html('<b style="font-size:14px;color:green;">[ID 사용 가능!]</b>');
	                  chk1 = true;
	               } else {
	                  $('#user_id').css("background-color", "pink");
	                  $('#idChk').html('<b style="font-size:14px;color:red;">[중복된 ID입니다!]</b>');
	                  chk1 = false;
	               }
	            },
	            error : function(error) {
	                   
	                   console.log("error : " + error);
	               }
	         });
	      }
	   });
	   
	   //패스워드 입력값 검증.
	   $('#password').on('keyup', function() {
	      //비밀번호 공백 확인
	      if($("#password").val() === ""){
	          $('#password').css("background-color", "pink");
	         $('#pwChk').html('<b style="font-size:14px;color:red;">[패스워드는 필수정보!]</b>');
	         chk2 = false;
	      }               
	      //비밀번호 유효성검사
	      else if(!getPwCheck.test($("#password").val()) || $("#password").val().length < 8){
	          $('#password').css("background-color", "pink");
	         $('#pwChk').html('<b style="font-size:14px;color:red;">[특수문자 포함 8자이상]</b>');
	         chk2 = false;
	      } else {
	         $('#password').css("background-color", "aqua");
	         $('#pwChk').html('<b style="font-size:14px;color:green;">[참 잘했어요]</b>');
	         chk2 = true;
	      }
	      
	   });
	   
	   //패스워드 확인란 입력값 검증.
	   $('#password_check').on('keyup', function() {
	      //비밀번호 확인란 공백 확인
	      if($("#password_check").val() === ""){
	          $('#password_check').css("background-color", "pink");
	         $('#pwChk2').html('<b style="font-size:14px;color:red;">[패스워드확인은 필수정보!]</b>');
	         chk3 = false;
	      }               
	      //비밀번호 확인란 유효성검사
	      else if($("#password").val() != $("#password_check").val()){
	          $('#password_check').css("background-color", "pink");
	         $('#pwChk2').html('<b style="font-size:14px;color:red;">[위에랑 똑같이!!]</b>');
	         chk3 = false;
	      } else {
	         $('#password_check').css("background-color", "aqua");
	         $('#pwChk2').html('<b style="font-size:14px;color:green;">[참 잘했어요]</b>');
	         chk3 = true;
	      }
	      
	   });
	   
	   //이름 입력값 검증.
	   $('#user_name').on('keyup', function() {
	      //이름값 공백 확인
	      if($("#user_name").val() === ""){
	          $('#user_name').css("background-color", "pink");
	         $('#nameChk').html('<b style="font-size:14px;color:red;">[이름은 필수정보!]</b>');
	         chk4 = false;
	      }               
	      //이름값 유효성검사
	      else if(!getName.test($("#user_name").val())){
	          $('#user_name').css("background-color", "pink");
	         $('#nameChk').html('<b style="font-size:14px;color:red;">[이름은 한글로 ~]</b>');
	         chk4 = false;
	      } else {
	         $('#user_name').css("background-color", "aqua");
	         $('#nameChk').html('<b style="font-size:14px;color:green;">[참 잘했어요]</b>');
	         chk4 = true;
	      }
	      
	   });

	   $('#signup-btn').click(function(e) {
		   console.log("회원가입 클릭됨.")
		   if(chk1 && chk2 && chk3 && chk4) { //4개다 유효성 통과 되었을때 submit
	         const id = $("#user_id").val();
	         const pw = $("#password").val();
	         const name = $("#user_name").val();
	         const user = {
	            userId: id,
	               userPwd: pw,
	               userName: name
	         };
	         console.log(user);
	         
	         $.ajax({
	            type: "POST",
	            url: "/spring/user",
	               headers: {
	                   "Content-Type": "application/json",
	                   "X-HTTP-Method-Override": "POST"
	               },
	               dataType: "text",
	               data: JSON.stringify(user),
	               success: function(result) {
	                  console.log("result: " + result);
	                  if(result === "success") {
	                     alert("회원가입 성공!");
	                     self.location = "/spring/user/login";
	                  }
	               }
	         });
	      } else {
	         alert('입력정보를 다시 확인하세요.');         
	      }
	   });
	   
	   ///////////////////////////////////////////////////////////////////////////////////////////
	   
	   //로그인 검증~~
	   //ID 입력값 검증.
	   $('#signInId').on('keyup', function() {
	      if($("#signInId").val() == ""){
	         $('#signInId').css("background-color", "pink");
	         $('#idCheck').html('<b style="font-size:14px;color:red;">[아이디는 필수!]</b>');
	         chk1 = false;
	      }      
	      
	      //아이디 유효성검사
	      else if(!getIdCheck.test($("#signInId").val())){
	         $('#signInId').css("background-color", "pink");
	         $('#idCheck').html('<b style="font-size:14px;color:red;">[영문자+숫자 4-14자로]</b>');     
	         chk1 = false;
	      } else {
	         $('#signInId').css("background-color", "aqua");
	         $('#idCheck').html('<b style="font-size:14px;color:green;">[참 잘했어요]</b>');
	         chk1 = true;
	      }
	   });
	   
	   //패스워드 입력값 검증.
	   $('#signInPw').on('keyup', function() {
	      //비밀번호 공백 확인
	      if($("#signInPw").val() === ""){
	          $('#signInPw').css("background-color", "pink");
	         $('#pwCheck').html('<b style="font-size:14px;color:red;">[패스워드는 필수!]</b>');
	         chk2 = false;
	      }               
	      //비밀번호 유효성검사
	      else if(!getPwCheck.test($("#signInPw").val()) || $("#signInPw").val().length < 8){
	          $('#signInPw').css("background-color", "pink");
	         $('#pwCheck').html('<b style="font-size:14px;color:red;">[특수문자 포함 8자이상]</b>');
	         chk2 = false;
	      } else {
	         $('#signInPw').css("background-color", "aqua");
	         $('#pwCheck').html('<b style="font-size:14px;color:green;">[참 잘했어요]</b>');
	         chk2 = true;
	      }
	      
	   });

	   //로그인 버튼 클릭 이벤트
	   $("#signIn-btn").click(function() {
		  console.log("로그인클릭");
		  const autoLogin=$("input[name=autoLogin]").is(":checked");
		  console.log(autoLogin);
	      if(chk1 && chk2) {
	         //ajax통신으로 서버에서 값 받아오기
	    	  $.ajax({
	    		  type:"post",
	    		  url:"/spring/user/loginCheck",
	    		  headers: {
	                   "Content-Type": "application/json",
	                   "X-HTTP-Method-Override": "POST"
	               },
	               dataType:"text",
	               data:JSON.stringify({
	            	   userId:$("#signInId").val(),
	            		 userPwd:$("#signInPw").val(),
	            		 autoLogin:autoLogin
	               }),
	               success:function(data)
	               {
	            	   console.log(data);
	            	  
	            	   if(data==="success")
	            	   {
	            		   alert("어서오세요");
	            		   self.location="/spring/";
	            	   }
	            	   
	            	   else if(data==="idFail")
	            	   {
	            		   $('#signInId').css("background-color", "pink");
	                       $('#idCheck').html('<b style="font-size:14px;color:red;">[회원가입 먼저~~]</b>');
	                       $('#signInPw').val("");
	                       $('#signInId').focus();
	                       chk2 = false;

	            		   }
	            	   
	            	   else if(data==="pwFail")
	            	   {
	            		   alert("암호가 일치하지 않습니다");
	            		   $('#signInPw').css("background-color", "pink");
	                       $('#signInPw').val("");
	                       $('#signInPw').focus();
	                       $('#pwCheck').html('<b style="font-size:14px;color:red;">[비밀번호가 틀렸어요!]</b>');
	                       chk2 = false;
	            	   }
	               }//success
	    	  })//ajax
	      } else {
	         alert('입력정보를 다시 확인하세요.');
	      }
	   
	   });
	  
}) //main
