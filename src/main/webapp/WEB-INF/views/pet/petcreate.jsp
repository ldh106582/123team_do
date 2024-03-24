<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html>
<head>
<!-- 부트스트랩 -->
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.4.1/dist/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
<!-- js -->
<%-- <link href="<c:url value="/resources/js/petcreate.js"/>" rel="stylesheet"> --%>
<meta charset="UTF-8">
<title>반려동물 회원가입</title>
</head>
<body>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="./resources/js/refreshing.js"></script>
<div id="header">
		<%@  include file="../module/header.jsp" %>
	</div>
	<div class="container-fluid page-body-wrapper">
 		<%@  include file="../module/leftheader.jsp" %>	
      <div class="content-wrapper d-flex auth px-0">
        <div class="row w-100 mx-0">
            <div class="col-lg-6 mx-auto">
                <div class="auth-form-light text-left py-5 px-4 px-sm-5">
                    <div class="card mb-2">
                        <p class="card-title"><b>소중한 반려동물 회원가입 페이지 입니다.</b></p>
                    </div>
                    	<form:form modelAttribute="pet_create" action="./creatpet?id=${id.personId}" method="POST" enctype="multipart/form-data">
						<form:hidden path="personId" value="${id}"/>
						<form:hidden path="petImage" value="petImage"/>
						
						<div class="row mb-3">
						    <div class="col-md-8">
						        <form:input id="petId" class="form-control form-control-lg" type="text" path="petId" placeholder="아이디"  required="required"/>
						    </div>
						    <div class="col-md-4">
						        <a id="userId" onclick="idDuplicateCheck(event)" class="btn btn-outline-primary btn-block">중복확인</a>
						    </div>
						</div>

                        
                        <div class="form-group">
                            <form:input class="form-control form-control-lg" type="text" path="petName"  placeholder="동물의 이름" required="required"/>
                        </div>
                        
                        <div class="form-group">
		                    <form:select class="col-12" style="height: 50px;" id="petVarity" path="petType">
		                        <form:option value="dog">강아지</form:option>
		                        <form:option value="cat">고양이</form:option>
		                        <form:option value="bird">새</form:option>
		                        <form:option value="rabbit">토끼</form:option>
		                        <form:option value="guineapig">기니피그</form:option>
		                        <form:option value="reptile">파충류</form:option>
		                        <form:option value="reptile">기타</form:option>
		                    </form:select>
                        </div>
                        
                        <div class="form-group">
                            <form:input class="form-control form-control-lg" type="text" path="petVarity"  placeholder="동물의종"/>
                        </div>

                        <div class="form-group">
                            <form:input class="form-control form-control-lg" type="text" path="petBirth"  placeholder="0000-00-00 양식으로 입력해주세요" required="required"/>
                        </div>
                       
                        <div class="form-group">
                            <input class="form-control form-control-lg" type="file" name="s_image" placeholder="[선택] 반려동물 사진을 첨부해주세요."/>
                        </div>
                        
                        <div class="form-group">
						    <form:radiobutton class="col-3" path="petSex" value="남자" required="required"/>남자
		                    <form:radiobutton class="col-3" path="petSex" value="여자"/>여자
                        </div>
                        
                        <div class="mt-3">
                            <input type="submit" class="pt-2 btn btn-block btn-primary btn-lg font-weight-medium auth-form-btn" id="storeAddr" onclick="combineAddr(event)" value="회원가입"  />
                        </div>
                        
                    </form:form>
		                </div>
		            </div>
		        </div>
	        </div>
		</div>
	</div>
	
	<%@ include file="../module/footer.jsp" %>
 	


  <!--   <div class="container">
		<form:form modelAttribute="pet_create" action="./creatpet?id=${id.personId}" method="POST" enctype="multipart/form-data">
		<form:hidden path="personId" value="${id}"/>
		<form:hidden path="personId" value="petImage"/>

			<div class="form-group row"> 반려동물 아이디 :
                <div class="col-4">
				    <form:input class="control-label" type="text" path="petId"/>
                </div>
            </div>
			<div class="form-group row"> 반려동물이름 : 
                <div class="col-4">
                    <form:input type="text" path="petName" />
                </div>
            </div>

			<div class="form-group row"> 반려동물 종류 :
                <div class="col-4">
                    <form:select class="col-12" style="height: 50px;" id="petVarity" path="petType">
                        <form:option class="col-3" id="dog" value="dog">강아지</form:option>
                        <form:option class="col-3" id="cat" value="cat">고양이</form:option>
                        <form:option class="col-3" id="bird" value="bird">새</form:option>
                        <form:option class="col-3" id="rabbit" value="rabbit">토끼</form:option>
                        <form:option class="col-3" id="guineapig" value="guineapig">기니피그</form:option>
                        <form:option class="col-3" id="reptile" value="reptile">파충류</form:option>
                        <form:option class="col-3" id="Etc" value="reptile">기타</form:option>
                    </form:select>
                </div>
            </div>

            <div class="form-group row"> 반려동물 종 :
                <div class="col-4">
                	<form:input type="text" path="petVarity" />
                </div>
			</div>
			
            <div class="form-group row"> 반려동물성별 :
                <div class="col-4">
				    <form:radiobutton class="col-3" path="petSex" value="남자"/>남자
                    <form:radiobutton class="col-3" path="petSex" value="여자"/>여자
                </div>
            </div>

			<div class="form-group row"> 반려동물생일 :
                <div class="col-4">
				    <form:input type="date" path="petBirth"/>
                </div>
            </div>
            <div class="form-group row"> [선택] 반려동물이미지 : 
            	<div class="col-4">
            		<input type="file" name="pet_Image"/>
            	</div>
            </div>

			<div class="form-group row">
				<div >
					<input type="submit" class="btn btn-primary" onclick="getform:form:selectedValue()"/>
				</div>
			</div>
		</form:form>
    </div>

</body> -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script src="../resources/js/petcreate.js"></script>
</html>