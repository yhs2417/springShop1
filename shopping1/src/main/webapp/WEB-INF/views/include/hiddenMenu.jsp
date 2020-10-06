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
        	<select id="condition">
				<option selected value='productName'>제품명</option>
				<option value='companyName'>제조사</option>
			</select>
	        <input type="text" id="keyword">
	        <a id="searchBtn">
	            <img src='<c:url value="/resources/images/icons/searchicon.png"/>' >
	        </a>
        
    </div>  
    <ul id="menu" >
        <li>
            <a class="submenu">
            	<img src='<c:url value="/resources/images/icons/select_green.png"/>'>
            	데스크탑</a>
            <dl>
                 <dt>
                     <a href="<c:url value='/product/list?category=computer&condition=companyName&keyword=samsung'/>">삼성</a>
                 </dt>
                 <dd>
                     <a href="<c:url value='/product/list?category=computer&condition=companyName&keyword=apple'/>">Apple</a>
                 </dd>
                 <dt>
                     <a href="<c:url value='/product/list?category=computer&condition=companyName&keyword=lg'/>">LG</a>
                 </dt>
                 <dd>
                     <a href="<c:url value='/product/list?category=computer&condition=companyName&keyword=hp'/>">hp</a>
                 </dd>
            </dl>
        </li>
        <li>
            <a href="#" class="submenu">
                  	<img src='<c:url value="/resources/images/icons/select_green.png"/>'>
            	노트북</a>
            <dl>
                 <dt>
                     <a href="<c:url value='/product/list?category=NoteBook&condition=companyName&keyword=samsung'/>">삼성</a>
                 </dt>
                 <dd>
                     <a href="<c:url value='/product/list?category=NoteBook&condition=companyName&keyword=apple'/>">Apple</a>
                 </dd>
                 <dt>
                     <a href="<c:url value='/product/list?category=NoteBook&condition=companyName&keyword=lenova'/>">레노바</a>
                 </dt>
                 <dd>
                     <a href="<c:url value='/product/list?category=NoteBook&condition=companyName&keyword=lg'/>">LG</a>
                 </dd>
            </dl>
        </li>
        <li>
            <a href="#" class="submenu"><img src='<c:url value="/resources/images/icons/select_green.png"/>'>
            태블릿</a>
            <dl>
                <dt>
                    <a href="<c:url value='/product/list?category=tablet&condition=companyName&keyword=samsung'/>">삼성</a>
                </dt>
                <dd>
                    <a href="<c:url value='/product/list?category=tablet&condition=companyName&keyword=apple'/>">Apple</a>
                </dd>
                <dt>
                    <a href="<c:url value='/product/list?category=tablet&condition=companyName&keyword=lg'/>">LG</a>
                </dt>
                <dd>
                    <a href="<c:url value='/product/list?category=tablet&condition=companyName&keyword=amazon'/>">아마존</a>
                </dd>
            </dl>
        </li>
        <li>
            <a href="#" class="submenu"><img src='<c:url value="/resources/images/icons/select_green.png"/>'>
            스마트폰</a>
            <dl>
               <dt>
                   <a href="<c:url value='/product/list?category=smartPhone&condition=companyName&keyword=samsung'/>">삼성</a>
               </dt>
               <dd>
                   <a href="<c:url value='/product/list?category=smartPhone&condition=companyName&keyword=apple'/>">Apple</a>
               </dd>
               <dt>
                   <a href="<c:url value='/product/list?category=smartPhone&condition=companyName&keyword=mi'/>">샤오미</a>
               </dt>
               <dd>
                   <a href="<c:url value='/product/list?category=smartPhone&condition=companyName&keyword=lg'/>">LG</a>
               </dd>
            </dl>             
        </li>
        <li>
            <a href="#" class="submenu"><img src='<c:url value="/resources/images/icons/select_green.png"/>'>
           	에어컨 </a>
            <dl>
                 <dt>
                    <a href="<c:url value='/product/list?category=aircon&condition=companyName&keyword=samsung'/>">삼성</a>
                </dt>
                <dd>
                    <a href="<c:url value='/product/list?category=aircon&condition=companyName&keyword=lg'/>">LG</a>
                </dd>
                <dt>
                    <a href="<c:url value='/product/list?category=aircon&condition=companyName&keyword=philips'/>">필립스</a>
                </dt>
                <dd>
                    <a href="<c:url value='/product/list?category=aircon&condition=companyName&keyword=daewoo'/>">위니아</a>
                </dd>
            </dl>             
        </li>
    </ul>
</div> <!--END hiddenMenu -->

<script>

</script>
