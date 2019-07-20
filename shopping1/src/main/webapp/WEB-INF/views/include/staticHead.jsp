<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" trimDirectiveWhitespaces="true" %>
  <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
  <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<head>
<meta charset="UTF-8">
<title>Shopping</title>
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.6.3/css/all.css" integrity="sha384-UHRtZLI+pbxtHCWp1t77Bi1L4ZtiqrqD80Kn4Z8NTSRyMA2Fd33n5dQ8lWUE00s/" crossorigin="anonymous">
<link rel="stylesheet" href="<c:url value='/resources/css/bootstrap.min.css'/>"/>

  <link href="https://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.12/summernote-bs4.css" rel="stylesheet">
<meta name='viewport' content="width=device-width,initail-scale=1">	

<style>
body {
	font-family: 'Helvetica Neue', Helvetica, Arial, "맑은 고딕",
	"Malgun gothic", sans-serif;
	padding-top: 10px
}
.tooltip-inner {
	background-color: white;
	color: black;
	Border: 1px black solid
}
#secondNav li .active {
	background-color: red
}

 
#manage ul a.active
{ 	background-color: white; 
	font-weight : bold;
	text-decoration:underline
}
#carousel2 .card:hover {
	border: 1px solid red;
}
.navbar {
	margin-left: -15px;
	margin-right: -15px
}

.current { color : red }

#pages { color : black }
	
    @media (max-width: 767px)
    {
	    #ftp1 .nav-item .nav-link {padding-left:1px;}
	    #menu .nav-item .nav-link {padding-left:5px; padding-right:5px}
	    #nav1 {padding-left:1px ; padding-right:1px ;}
    }
    @media (min-width: 768px)
    {
       #ftp1 { padding-left: 20px}
    }
 	
</style>

</head>

