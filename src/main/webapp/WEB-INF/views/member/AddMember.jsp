<%@ page import="com.springmvc.domain.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.4.1/dist/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
<head>
<meta charset="UTF-8">
<title>소비자 회원가입</title>
</head>
<body>

	
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>


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
                        <p class="card-title"><b>일반 회원가입</b></p>
                    </div>
                    <form:form modelAttribute="Newmember" action="./add?${ _csrf.parameterName }=${ _csrf.token }" method="post" encType="multipart/form-data" id="form">
                        <input type="hidden" name="personAddress" id="fullAddr">
                        
						<div class="row mb-3">
							<div class="col-md-8">
							    <form:input id="personId" class="form-control form-control-lg" type="text" path="personId" placeholder="아이디"  required="required"/>
							</div>
							<div class="col-md-4 p-0 mx-0 mx-auto">
							    <a id="userId" onclick="idDuplicateCheck(event)" class="btn btn-outline-primary btn-block text-center">중복확인</a>
							</div>
						</div>

                        <div class="form-group">
                            <form:input class="form-control form-control-lg" type="password" path="personPw"  placeholder="비밀번호"  required="password"/>
                        </div>
                        <div class="form-group">
                            <form:input class="form-control form-control-lg" type="email" path="personEmail"  placeholder="이메일"/>
                        </div>
                        <div class="form-group">
                            <form:input class="form-control form-control-lg" type="text" path="personName"  placeholder="이름" required="required"/>
                        </div>
                        <div class="form-group">
                            <form:input class="form-control form-control-lg" type="text" path="personBirth"  placeholder="0000-00-00으로 입력해주세요" required="required"/>
                        </div>
                        
                       <div class="row mb-3">
							<div class="col-md-8">
							    <input type="text" id="sample4_postcode"  class="form-control form-control-lg" placeholder="우편번호"/>
							</div>
						<div class="col-md-4 p-0">
						    <input type="button" onclick="sample4_execDaumPostcode()" value="우편번호" class="btn btn-outline-primary btn-block text-center">
						    </div>
						</div>
						
                        <div class="form-group">
                            <input type="text" id="sample4_roadAddress" class="form-control form-control-lg col-md-12" placeholder="도로명주소">
                         </div>	

                         <div class="form-group">
                            <input type="text" id="sample4_detailAddress" class="form-control form-control-lg col-md-12" placeholder="상세주소">
                         </div>	
                       
                        <div class="form-group">
                            <form:input class="form-control form-control-lg" type="text" path="personPhone" placeholder="010-0000-0000으로 입력해주세요" required="required"/>
                        </div>
                        <div class="form-group">
                            <form:radiobutton path="personSex" value="남자" class="col-sm-1" required="required"/>남성
				            <form:radiobutton path="personSex" value="여자" class="col-sm-1"/>여성
                        </div>
						<div class="form-group">
						  <label>[선택] 프로필 사진등록</label>
						  <div class="input-group col-xs-12">
						  	<input type="file" name="s_file" class="form-control file-upload-info">
						   </div>
						</div>
                        <div class="mt-3">
                            <button class="btn btn-block btn-primary btn-lg font-weight-medium auth-form-btn" id="storeAddr" onclick="combineAddr(event)">회원가입</button>
                        </div>
                        
                    </form:form>
		                </div>
		            </div>
		        </div>
	        </div>
		</div>
	</div>
	
	<%@ include file="../module/footer.jsp" %>
</body>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script src="../resources/js/AddMember.js"></script>

</html>
<!-- <div class="form-group col-md-6">
	                        <input type="text" id="sample4_postcode" placeholder="우편번호">
	                        <input type="button" onclick="sample4_execDaumPostcode()" value="우편번호 찾기"><br>
						 </div>	
						<div class="form-group">
	                        <input type="text" id="sample4_roadAddress" placeholder="도로명주소">
						 </div>	
						 <div class="form-group">
	                        <input type="text" id="sample4_jibunAddress" placeholder="지번주소">
							<span id="guide" style="color:#999;display:none"></span>
						 </div>	
						 <div class="form-group">
	                        <input type="text" id="sample4_detailAddress" placeholder="상세주소">
						 </div>	
						 <div class="form-group">
	                       <input type="text" id="sample4_extraAddress" placeholder="참고항목">
						 </div>	 -->