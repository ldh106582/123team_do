<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html>
<head>
<!-- 부트스트팹 -->
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.4.1/dist/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
<!-- js -->
<link href="<c:url value="/resources/js/petupdate.js"/>" rel="stylesheet">
<meta charset="UTF-8">
<title>펫 정보 수정 페이지</title>
</head>
<body>
 <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="./resources/js/refreshing.js"></script>

<div id="header">
		<%@  include file="../module/header.jsp" %>
	</div>
 
	<div class="container-fluid page-body-wrapper">
 		<%@  include file="../module/leftheader.jsp" %>	
 		
   
        <div class="content-wrapper d-flex align-items-center auth px-0">
        	<div class="row w-100 mx-0">
	            <div class="col-lg-6 mx-auto">
	                <div class="auth-form-light text-left py-5 px-4 px-sm-5">
	                    <div class="card mb-2">
	                        <p class="card-title"><b>소중한 반려동물 수정 페이지 입니다.</b></p>
	                    </div>
	                    	<form:form modelAttribute="pet_create" method="POST" enctype="multipart/form-data">
							<input type="hidden" name="personId" value="${id.personId}"/>
							<input type="hidden" name="s_image" value="petImage"/>
							
	                        <div class="form-group d-flex">
	                        	<div class="form-control form-control-lg col-md-12">${petId.petId}</div>							
	                        </div>
	                        
	                        <div class="form-group">
	                            <form:input class="form-control form-control-lg" type="text" path="petName"  value="${petId.petName}"/>
	                        </div>
	                        
	                        <div class="form-group">
								<div class="form-control form-control-lg col-md-12">${petId.petType}</div>							
	                        </div>
	                        
	                        <div class="form-group">
	                            <form:input class="form-control form-control-lg" type="text" path="petVarity"  value="${petId.petVarity }" />
	                        </div>
	
	                        <div class="form-group">
	                            <form:input class="form-control form-control-lg" type="text" path="petBirth"  placeholder="0000-00-00 으로 작성해주세요" value="${petId.petBirth }"/>
	                        </div>
	                       
	                        <div class="form-group">
	                            <input class="form-control form-control-lg" type="file" name="s_image" placeholder="[선택] 반려동물 사진을 첨부해주세요."/>
	                        </div>
	                        
	                        <div class="form-group">
							    <form:radiobutton class="col-3" path="petSex" value="남자"/>남자
			                    <form:radiobutton class="col-3" path="petSex" value="여자"/>여자
	                        </div>
	                        
	                        <div class="mt-3">
	                            <input type="submit" class="btn btn-block btn-primary btn-lg font-weight-medium auth-form-btn" id="storeAddr" onclick="combineAddr()" value="회원가입"  />
	                        </div>
	                        
	                    </form:form>
		                </div>
		            </div>
		        </div>
	        </div>
		</div>
          
	<%@ include file="../module/footer.jsp" %>
 	



</body>

</html>
