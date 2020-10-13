<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<head>
	<meta charset="UTF-8">
	<title>Shopping</title>
	<meta name='viewport' content="width=device-width,initail-scale=1">	
	<!--현재쓰는 익스플로러를 최신버젼으로 처리함. -->
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/bxslider/4.2.12/jquery.bxslider.css">
	<link href="<c:url value='/resources/css/index.css'/>" rel="stylesheet">
    <link href="<c:url value='/resources/css/media.css'/>" rel="stylesheet">
	<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.6.3/css/all.css" integrity="sha384-UHRtZLI+pbxtHCWp1t77Bi1L4ZtiqrqD80Kn4Z8NTSRyMA2Fd33n5dQ8lWUE00s/" crossorigin="anonymous">
	<link rel="stylesheet" href="<c:url value='/resources/css/bootstrap.min.css'/>"/>
	<link href="https://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.12/summernote-bs4.css" rel="stylesheet">
	<script src="<c:url value='/resources/js/jquery.min.js'/>"></script>
	  <script src="https://cdn.jsdelivr.net/bxslider/4.2.12/jquery.bxslider.min.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js" integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49" crossorigin="anonymous"></script>
	<!--<script src="https://ssl.daumcdn.net/dmaps/map_js_init/postcode.v2.js?autoload=false"></script>-->
	<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script> 	
	<script src="https://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.12/summernote-bs4.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/handlebars.js/4.1.2/handlebars.min.js"></script>
	<script src="<c:url value='/resources/js/common.js'/>" defer></script>
	<script src="<c:url value='/resources/js/index.js'/>" defer></script>
 	<script src="<c:url value='/resources/js/bootstrap.min.js'/>"></script>
 	
<!--	<script src="https://cdnjs.cloudflare.com/ajax/libs/waypoints/4.0.1/jquery.waypoints.js"></script>
	<script src="<c:url value='/resources/js/animatescroll.js'/>"></script>
 -->	
 
 	<!-- [if lt IE 9]>
 	<script src="http://html5shiv.googlecode.com/svn/trunk/html5.js"></script>
 	<script src="<c:url value='/resources/js/respond.min.js'/>"></script> 	
 	<![endif] -->
</head>

