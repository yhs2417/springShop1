<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<jsp:include page="../include/staticHead.jsp" />

<script>

function rewrite()
{	
	if ('${session_id}'=="")
	{ 
		location.href="/board1/member/login.jsp";
	}
	else if (('${session_id}'!= null) && ('${session_id}'!= '${bdto.author}')) 	
	{
		alert("작성자 본인만 수정이 가능합니다");
	}
	
	else if (('${session_id}'!= null) && ('${session_id}'== '${bdto.author}')) 	
	{	
		window.top.location.href="rewrite.do?seq=${bdto.seq}";	 	
	}
	return false;
}
function deleting()
{
	if ('${session_id}'=="")
	{
		location.href='/board1/member/login.jsp';
	}
	else if (('${session_id}'!= null) && ('${session_id}'!= '${bdto.author}')) 	
	{
		alert("작성자 본인만 삭제 가능합니다");
	}
	
	else if (('${session_id}'!= null) && ('${session_id}'== '${bdto.author}')) 	
	{	
		window.top.location.href="deleting.do?seq=${bdto.seq}";
	}
	return false;
}
</script>

<body>

<jsp:include page="../include/plugin-JS.jsp" />

<h4 class="border-bottom mx-5 pt-3">게시판 </h4>
<div class='container pt-3'>
	<div class="text-right">
	
	<a href="" onclick="return rewrite()">수정</a>
	<a href="" onclick="return deleting()">삭제</a>
	
	</div>
</div>
<div class="container pt-2">
<div class ='table-responsive '>	
	<table class="table table-striped table-hover table-sm 
				text-center table-bordered border-dark">
		<tbody>
		<tr>
			<th scope='row'>글제목</th>
			<td>${bdto.header}</td>
		</tr>
		<tr>
			<th scope='row'>글내용</th>
			<td>${bdto.content}</td>
		</tr>
		<tr>
			<th scope='row'>작성자</th>
			<td>${bdto.author}</td>
		</tr>
		<tr>
			<th scope='row'>작성일</th>
			<td>${bdto.logtime}</td>
		</tr>
		</tbody>
	</table>
</div>
</div>

</body>
</html>