<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<jsp:include page="../include/htmlHeader.jsp" />

<body onload="form1.header.focus()">

<jsp:include page="../include/plugin-JS.jsp" />

<h4 class="border-bottom mx-5 pt-3"> 글 작성 </h4>

<div class='container pt-3'>

<form class="form" method='post' action='writing.do' target="_top" name="form1">

	<div class="form-group row">
		<label for="header" class="col-sm-2 col-md-2 text-center">제목</label>
		<input class="form-control form-control-sm col-sm-6 col-md-6" 
				type='text' name='header' value='${data}' required>
	</div>
	
	<div class="form-group row">
		<label for="content" class="col-sm-2 col-md-2 text-center">내용</label>
	 	<textarea class="form-control form-control-sm col-sm-6 col-md-6" 
	 			rows="10" name='content' value="123" required> </textarea>	
	</div>
	
	<div class="form-group row">
		
		<input class="form-control form-control-sm col-sm-8 col-md-8 text-center" 
				type="submit" value='작성하기'>
	</div>
	 
</form>
</div>

</body>
</html>