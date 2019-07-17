<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<jsp:include page="../include/staticHead.jsp" />



<body>

<jsp:include page="../include/plugin-JS.jsp" />

<script type="text/javascript">

function writing()
{
	if ('${session_id}' == "")
	{
		window.self.location.href="/board1/member/login.jsp";		
	}
	else if ('${session_id}' != null)	
	{
		window.self.location.href="writing.jsp";
	}
	return false;
}
</script>

<h4 class="border-bottom mx-5 pt-3">게시판 </h4>

<div class='container pt-3'>
	<div class="text-right">
		<c:if test="${session_id !=null }">
        	<span class="text-muted">${session_id}님 안녕하세요</span> <br>
        </c:if>
		
		<a href="" onclick="return writing()" >글작성</a> 
	
	</div>

	<div class ='table-responsive pt-2'>
		<table class ='table table-striped table-hover table-sm text-center'>
			<thead class='thead-dark'>
				<tr> 
					<th style="width:10%" scope='col'>글번호</th>
					<th style="width:30%" scope='col'>제목</th>
					<th style="width:20%" scope='col'>글쓴이</th>
					<th style="width:30%" scope='col'>날짜</th>
				</tr>
			</thead>
			
			<tbody>
		  		<c:forEach var="i" items="${boardlist}">
				<tr>
					<td>${i.num}</td>
					<td><a href="boardDetail.do?seq=${i.seq}">${i.header}</a></td>
					<td>${i.author}</td>
					<td>${i.logtime}</td>
				</tr>
				</c:forEach>
			</tbody>	
		</table>
	</div>
</div>

<div class='container pt-3'>
	<nav>
	<ul class="pagination justify-content-center">
	
	<c:if test="${startpg >5 }">
		<li class="page-item">
			<a class="page-link" href="boardlist.do?page=${startpg-1}">
		        <i class="fas fa-angle-left text-body"></i>
		    </a>
		</li>
	</c:if>

	<c:forEach var="i" begin="${startpg}" end="${endpg}" step="1">
		<c:if test="${page == i}">
			<li class="page-item">
	       	<a id="current" class="page-link" href="boardlist.do?page=${i}">${i}</a>
			</li>
		</c:if>
		<c:if test="${page != i}">
			<li class="page-item">
	       	<a id="pages" class="page-link" href="boardlist.do?page=${i}">${i}</a>
			</li>
		</c:if>
	</c:forEach>		 
			
	<c:if test="${endpg<totalP }">
		<li class="page-item">
	    	<a class="page-link" href="boardlist.do?page=${endpg+1}">
	    	<i class="fas fa-angle-right text-body"></i></a>
	    </li>
	</c:if>
	</ul>
	</nav>
</div>

</body>
</html>