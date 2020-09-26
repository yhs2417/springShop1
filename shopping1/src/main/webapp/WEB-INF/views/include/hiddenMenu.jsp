<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<div id="hiddenMenu">
	<div>
		<c:if test="${login==null}">

            <a class="logSwitch" href="<c:url value='/user/login'/>" >
                 <img src='<c:url value="/resources/images/icons/power.png"/>' height="100%">
		    </a>
		</c:if>

		<c:if test="${login!=null}">
			
             <a class="logSwitch logoutBtn">
    	         <img src='<c:url value="/resources/images/icons/power.png"/>' height="100%">
 	         </a>
           
		</c:if> 
    	<a href="#" id="closeBtn">
    		<img src='<c:url value="/resources/images/icons/x1.png"/>' height="100%">
    	</a>
    </div>
    <div id="searchArea">
        
	        <input type="text">
	        <a href="#">
	            <img src='<c:url value="/resources/images/icons/searchicon.png"/>' >
	        </a>
        
    </div>  
    <ul id="menu" >
        <li>
            <a class="submenu">데스크탑</a>
            <dl>
                <dt><a href="#" >삼성</a> </dt>
                <dd><a href="#">Apple</a> </dd>
                <dt><a href="#">LG</a> </dt>
                <dd><a href="#">hp</a> </dd>                    
            </dl>
        </li>
        <li>
            <a href="#" class="submenu">노트북</a>
            <dl>
                <dt><a href="#">삼성</a> </dt>
                <dd><a href="#">Apple</a> </dd>
                <dt><a href="#">레노바</a> </dt>
                <dd><a href="#">LG</a> </dd>                    
            </dl>
        </li>
        <li>
            <a href="#" class="submenu">태블릿</a>
            <dl>
                <dt><a href="#">삼성</a> </dt>
                <dd><a href="#">Apple</a> </dd>
                <dt><a href="#">LG</a> </dt>
                <dd><a href="#">아마존</a> </dd>                    
            </dl>
        </li>
        <li>
            <a href="#" class="submenu">스마트폰</a>
            <dl>
                <dt><a href="#">삼성</a> </dt>
                <dd><a href="#">Apple</a> </dd>
                <dt><a href="#">샤오미</a> </dt>
                <dd><a href="#">LG</a> </dd>                    
            </dl>             
        </li>
        <li>
            <a href="#" class="submenu">TV</a>
            <dl>
                <dt><a href="#">삼성</a> </dt>
                <dd><a href="#">LG</a> </dd>
                <dt><a href="#">필립스</a> </dt>
                <dd><a href="#">소니</a> </dd>                  
            </dl>             
        </li>
    </ul>
</div> <!--END hiddenMenu -->


