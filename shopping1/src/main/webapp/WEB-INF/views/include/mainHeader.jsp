<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <header>
    <div id="hd_content1">
        <div id="content_inner"> 
            <ul>
                <li> 
                    <a href="<c:url value='/'/>">
                        <img src='<c:url value="/resources/images/logo.png"/>' width="110">
                    </a>
                </li>
                
            </ul>
            <div id="searchBar">
                <div>
                	<select id="condition">
						<option selected value='productName'>제품명</option>
						<option value='companyName'>제조사</option>
					</select>
	                <input type="text" id="keyword">
	                <a>
	                    <img src='<c:url value="/resources/images/icons/searchicon.png"/>' width="100%">
	                </a>
                </div>
            </div>
            <ul>
	           	<c:if test="${login==null}">
					
					<li>
	                    <a href="<c:url value='/user/login'/>">
	                        <span>로그인</span>
	                        <img src='<c:url value="/resources/images/icons/power.png"/>'>
	                    </a>
	                </li>
	             	<li style="width:0;margin-left:0"></li>
	                <li>
	                    <a href="<c:url value='/cart/info'/>">
	                        <span>장바구니</span>
	                        <img src='<c:url value="/resources/images/icons/carticon.png"/>'>
	                    </a>
	                </li>
	                <li>
	                    <a href="#" onclick="alert('주문내역은 준비중입니다');">
	                        <span>주문내역</span>
	                        <img src='<c:url value="/resources/images/icons/book_13.png"/>'>
	                    </a>
	                </li>
	                <li id="menuBtn">
	                    <a>
	                        <img src='<c:url value="/resources/images/icons/menu.png" />'/>
	                    </a>
	                </li>
				</c:if>
				<c:if test="${login.userId=='admin'}">
					<li>
	                    <a class="logoutBtn">
	                        <span>로그아웃</span>
	                        <img src='<c:url value="/resources/images/icons/power.png"/>'>
	                    </a>
	                </li>
					<li>
	                   <a href="<c:url value='/user/info'/>">
	                       <span>회원정보</span>
	                       <img src='<c:url value="/resources/images/icons/loginicon.png"/>'>
	                   </a>
	                </li>
	                <li>
	                    <a href="<c:url value='/manager'/>">
	                        <span>상품관리</span>
	                        <img src='<c:url value="/resources/images/icons/setting.png"/>'>
	                    </a>
	                </li>
	                  <li>
	                    <a href="<c:url value='/cart/info'/>">
	                        <span>장바구니</span>
	                        <img src='<c:url value="/resources/images/icons/carticon.png"/>'>
	                    </a>
	                </li>
	             <%--    <li>
	                    <a href="#" onclick="alert('주문내역은 준비중입니다');">
	                        <span>주문내역</span>
	                        <img src='<c:url value="/resources/images/icons/book_13.png"/>'>
	                    </a>
	                </li> --%>
	                <li id="menuBtn">
	                    <a>
	                        <img src='<c:url value="/resources/images/icons/menu.png"/>'  />
	                    </a>
	                </li>
				</c:if>
				<c:if test="${login.userId!='admin' && login!=null}">
					<li>
	                    <a class="logoutBtn">
	                        <span>로그아웃</span>
	                        <img src='<c:url value="/resources/images/icons/power.png"/>'>
	                    </a>
	                </li>
					<li>
	                   <a href="<c:url value='/user/info'/>">
	                       <span>회원정보</span>
	                       <img src='<c:url value="/resources/images/icons/loginicon.png"/>'>
	                   </a>
	                </li>
	                <li>
	                    <a href="<c:url value='/cart/info'/>">
	                        <span>장바구니</span>
	                        <img src='<c:url value="/resources/images/icons/carticon.png"/>'>
	                    </a>
	                </li>
	        <%--         <li>
	                    <a href="#" onclick="alert('주문내역은 준비중입니다');">
	                        <span>주문내역</span>
	                        <img src='<c:url value="/resources/images/icons/book_13.png"/>'>
	                    </a>
	                </li> --%>
	                <li id="menuBtn">
	                    <a>
	                        <img src='<c:url value="/resources/images/icons/menu.png" />'>
	                    </a>
	                </li>
				</c:if> 
            </ul>
            
        </div>
    </div> <!--end hd_content1-->
    
    <div id="hd_content2"> 
        <div id="content_inner"> 
            <ul>
                <c:if test="${login==null}">
	                <li><a href="<c:url value='/user/login'/>">LOGIN</a></li>
	                <li><a href="<c:url value='/user'/>">JOIN</a></li>
            	</c:if>
			
				<c:if test="${login.userId=='admin'}">
	                <li><a href="<c:url value='/user/info'/>">회원정보</a></li>
					<li><a class="logoutBtn">LOGOUT</a></li>			
				</c:if>

				<c:if test="${login.userId!='admin' && login!=null}">
	                <li><a href="<c:url value='/user/info'/>">회원정보</a></li>
					<li><a class="logoutBtn">LOGOUT</a></li>
				</c:if> 
            </ul>
            
           
            <ul>
                <li>
                    <a href="<c:url value='/product/list?category=computer&condition=&keyword='/>">데스크탑</a>
                    <div class="subMenu">
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
                    </div>
                </li>
                <li>
                    <a href="<c:url value='/product/list?category=NoteBook&condition=&keyword='/>">노트북</a>
                    <div class="subMenu">
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
                    </div>
                </li>
                <li>
                    <a href="<c:url value='/product/list?category=tablet&condition=&keyword='/>">테블릿</a>
                    <div class="subMenu">
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
                    </div>
                </li>
                <li>
                    <a href="<c:url value='/product/list?category=smartPhone&condition=&keyword='/>">스마트폰</a>
                    <div class="subMenu">
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
                    </div>
                </li>
                <li>
                    <a href="<c:url value='/product/list?category=refrigerator&condition=&keyword='/>">냉장고</a>
                    <div class="subMenu">
                        <dl>
                            <dt>
                                <a href="<c:url value='/product/list?category=refrigerator&condition=companyName&keyword=samsung'/>">삼성</a>
                            </dt>
                            <dd>
                                <a href="<c:url value='/product/list?category=refrigerator&condition=companyName&keyword=lg'/>">LG</a>
                            </dd>
                            <dt>
                                <a href="<c:url value='/product/list?category=refrigerator&condition=companyName&keyword=philips'/>">필립스</a>
                            </dt>
                            <dd>
                                <a href="<c:url value='/product/list?category=refrigerator&condition=companyName&keyword=daewoo'/>">위니아</a>
                            </dd>
                           
                        </dl>
                    </div>
                </li>
                <li>
                
                </li>
            </ul>  
        </div>
    </div> <!--end hd_content2-->
</header> 	