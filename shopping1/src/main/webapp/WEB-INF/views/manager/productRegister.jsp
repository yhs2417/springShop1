<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!-- 상품등록 탭패널.-->
<content style="display:block" id="register">
  	<form action="<c:url value='manager/register'/>" method="post" enctype="multipart/form-data">

     	<fieldset class="form-group">
    		<div class="row">
       			<legend class="col-md-3 col-form-label pt-0 pr-5 text-right">

         			<strong>기본정보</strong>
       			</legend>
       		
       			<div class="col-md-9 border-left">
         			<div class="form-group">
           				<label for="productName">상품이름</label>
           				<input type="text" class="form-control" id="productName" required="required" name="productName">
         			</div>
         			<div class="form-group">
            			<label for="price">상품가격</label>
            			<input type="text" class="form-control" id="price" required="required" name="price">
              		 
          			</div>
            		<div class="form-group">
                    	<label for="category">분류</label>
                   		<select class="form-control categorySelect" name="category">
				
						<option selected>분류..</option>
						<c:forEach var="i" items="${category}">
							<option value='${i.category}'>${i.category}</option>
						</c:forEach>

						</select>
            		</div>
            		<div class="form-group">
                    	<label for="company">제조사</label>
            
                    	<select class="form-control companySelect" name="companyName">
				
						<option selected>제조사..</option>
					

						</select>
            		</div>
            		<div class="form-group">
                    	<label for="thumNail">썸네일</label>
            
                   		<input type="file" class="form-control-file" id="thumNail" required name="img">
            		</div>
            		<div class="form-group">
                    	<label for="explain1">간략설명</label>
            			<textarea rows=3 class="form-control" placeholder=""
							required name="explain1"></textarea>
            		</div>
         		</div>
           	</div>
        </fieldset>

        <fieldset class="form-group">
          	<div class="row" >
           		<legend class="col-md-3 col-form-label pt-0 pr-5 text-right">
             		 <strong>상세정보</strong>
            	</legend>
               
               	<div class="col-md-9 border-left">
                  	<div class="form-group">
			             
			            <textarea class="form-control summerNote" id="summerNote1" 
			            		 placeholder="" required name="explain2">
						</textarea>
               		</div>
             
                	<button type="submit" id="registerBtn" class="btn btn-danger">
                 		등록하기
                 	</button>
           			 
	            </div>
            </div>
       </fieldset>   
   </form>
</content>

<!-- 탭패널 1 끝 -->
