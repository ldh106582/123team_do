<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page import="com.springmvc.domain.*" %>
<%@ page import="com.springmvc.controller.*" %>
<!DOCTYPE html>
<html>
<head>
	<!-- 부트스트랩 -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.4.1/dist/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
<meta charset="utf-8">
<title>병원관리자 회원가입 페이지</title>
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
                        <p class="card-title"><b>병원관리자 회원가입</b></p>
                    </div>
     				<form:form modelAttribute="hospitalMember" action="./productmanager?${ _csrf.parameterName }=${ _csrf.token }" method="post" enctype="multipart/form-data">
                     <input type="hidden" name="personAddress" id="fullAddress" />
                     <input type="hidden" name="hospitalAddress"  id="h_fullAddress"/>
                     <input type="hidden" name="s_file" />
					 <input type="hidden" name="h_file" />
                     <input type="hidden" name="c_file" />
                     
						<div class="row mb-3">
						    <div class="col-md-8">
						        <form:input id="personId" class="form-control form-control-lg" type="text" path="personId" placeholder="아이디" />
						    </div>
						    <div class="col-md-4">
						        <a id="userId" onclick="idDuplicateCheck(event)" class="btn btn-outline-primary btn-block">중복확인</a>
						    </div>
						</div>
						
						
                        <div class="form-group">
                            <form:input class="form-control form-control-lg" type="password" path="personPw"  placeholder="비밀번호" required="required"/>
                        </div>
                        <div class="form-group">
                            <form:input class="form-control form-control-lg" type="email" path="personEmail"  placeholder="이메일"/>
                        </div>
                        <div class="form-group">
                            <form:input class="form-control form-control-lg" type="text" path="personName"  placeholder="이름" required="required"/>
                        </div>
                        <div class="form-group">
                            <form:input class="form-control form-control-lg" type="text" path="personBirth"  placeholder="생년월일 0000-00-00으로 입력해주세요" required="required"/>
                        </div>
                       
						<div class="row mb-3">
							<div class="col-md-8">
							    <input type="text" id="post"  class="form-control form-control-lg" placeholder="우편번호"/>
							</div>
							<div class="col-md-4 p-0">
						    	<input type="button" onclick="execDaumPostcode()" value="우편번호" class="btn btn-outline-primary btn-block text-center">
						    </div>
						</div>
						                       
                       <div class="form-group">
                           <input type="text" id="roadAddress" class="form-control form-control-lg col-md-12" placeholder="도로명주소">
                        </div>	
                        <div class="form-group">
                           <input type="text" id="detailAddress" class="form-control form-control-lg col-md-12" placeholder="상세주소">
                        </div>	
                        
                        <div class="form-group">
                            <form:input class="form-control form-control-lg" type="text" path="personPhone" placeholder="전화번호"/>
                        </div>
                        <div class="form-group">
                            <form:radiobutton path="personSex" value="남자" class="col-sm-1" required="required"/>남성
				            <form:radiobutton path="personSex" value="여자" class="col-sm-1"/>여성
                        </div>
                        
                         <div class="form-group">
	                      <label>프로필사진</label>
	                      <div class="input-group col-xs-12">
	                        <input type="file" name="c_file" class="form-control file-upload-info" placeholder="Upload Image">
	                       </div>
	                    </div>
                        
                        <div class="form-group">
                            <form:input class="form-control form-control-lg" type="text" path="hospitalName" placeholder="병원명" required="required"/>
                        </div>
                               
                       	<div class="row mb-3">
							<div class="col-md-8">
							    <input type="text" id="h_post"  class="form-control form-control-lg" placeholder="우편번호"/>
							</div>
							<div class="col-md-4 p-0">
						    	<input type="button" onclick="h_execDaumPostcode()" value="우편번호" class="btn btn-outline-primary btn-block text-center">
						    </div>
						</div>
						
                       <div class="form-group">
                           <input type="text" id="h_roadAddress" class="form-control form-control-lg col-md-12" placeholder="도로명주소">
                        </div>	
                        <div class="form-group">
                           <input type="text" id="h_detailAddress" class="form-control form-control-lg col-md-12" placeholder="상세주소">
                        </div>	
                        
                        <div class="form-group">
                   	    	<form:input class="form-control form-control-lg" type="text" path="hospitalPhone" placeholder="병원번호"/>
                        </div>
                        <div class="form-group">
	                      <label>사업자 등록증</label>
	                      <div class="input-group col-xs-12">
	                        <input type="file" name="s_file" class="form-control file-upload-info" placeholder="Upload Image" required="required"/>
	                       </div>
	                    </div>
                        <div class="form-group">
	                      <label>의사면허증</label>
	                      <div class="input-group col-xs-12">
	                        <input type="file" name="h_file" class="form-control file-upload-info" placeholder="Upload Image" required="required"/>
	                       </div>
	                    </div>
                        <div class="mt-3">
                            <input  id="storeAddr" onclick="combineAddr(event)" type="submit" class="btn btn-block btn-primary btn-lg font-weight-medium auth-form-btn" value="회원가입" />
                        </div>
                    </form:form>
		                </div>
		            </div>
		        </div>
	        </div>
		</div>
	</div>
	
	<%@ include file="../module/footer.jsp" %>
        
        
  <%-- <!-- container-scroller -->
    <div class="jumbotron">
        <div class="container">
            <legend id="id"><h2>병원관리자 회원가입 페이지입니다.</h2></legend>
        </div>
    </div>
    <div class="container">
     <form:form modelAttribute="hospitalMember" action="./productmanager?${ _csrf.parameterName }=${ _csrf.token }" method="post" enctype="multipart/form-data">
     <fieldset>
        <div class="form-group row">
            <label class="col-sm-2 control-label"> 아이디 </label>  
            <div class="col-3">
                <form:input id="userId" type="text" path="personId" class="control-label"/>
            </div>
			<div id="confirm" class="col-2"> 
			    <button onclick="idDuplicateCheck(event)" id="idConfirmBtn" class="btn btn-secondary">중복확인</button>
			</div>
        </div>    
        <div class="form-group row">
            <label class="col-sm-2 control-label"> 비밀번호 </label>  
            <div class="col-4">
                <form:input type="password" path="personPw" class="control-label"/>
            </div>
        </div>
        <div class="form-group row">
             <label class="col-sm-2 control-label"> 이메일 </label>  
            <div class="col-4">
                <form:input type="text" path="personEmail" class="control-label" />
            </div>
        </div>
        <div class="form-group row">
            <label class="col-sm-2 control-label"> 이름 </label>  
            <div class="col-4">
                <form:input type="text" path="personName" class="control-label"/>
            </div>
        </div>
        <div class="form-group row"> 
           <label class="col-sm-2 control-label">  생년월일 </label>
		   <div class="col-4">
			  <form:input type="date" path="personBirth" class="control-label"/>
			</div>
		</div>
		<div class="form-group row">
			<label class="col-sm-2 control-label"> 주소 </label>
            <div class="col-4">
				<form:input type="text" path="personAddress" class="control-label"/>
			</div>
		</div>
        <div class="form-group row">
            <label class="col-sm-2 control-label"> 개인번호 </label>  
            <div class="col-4">
                <form:input type="text" path="personPhone" class="control-label"/>
            </div>
        </div>
        
        <div class="form-group row">
            <label class="col-sm-2 control-label"> 동물병원명  </label>  
            <div class="col-4">
                <form:input type="text" path="hospitalName" class="control-label"/>
            </div>
        </div>
        <div class="form-group row">
              <label class="col-sm-2 control-label"> 병원주소 </label>  
            <div class="col-4">
                <form:input type="text" path="hospitalAddress" class="control-label"/>
            </div>
        </div>
        <div class="form-group row">
            <label class="col-sm-2 control-label"> 병원번호 </label>  
            <div class="col-4">
                <form:input type="text" path="hospitalPhone" class="control-label"/>
            </div>
        </div>
        <div class="form-group row">
            <label class="col-sm-2 control-label"> 사업자등록증 </label>  
            <div class="col-4">
                <input type="file" name="s_file" class="control-label" required="required"/>
            </div>
        </div>
        <div class="form-group row">
            <label class="col-sm-2 control-label"> 의사면허증 </label>  
            <div class="col-4">
                <input type="file" name="h_file" class="control-label" required="required"/>
            </div>
        </div>
       	<div class="form-group row">
            <label class="col-sm-2 ccontrol-label"> 성별 </label>
			<div class="col-4">
				<form:radiobutton path="personSex" value="남자" class="col-sm-1"/>남자
				<form:radiobutton path="personSex" value="여자" class="ml-3"/>여자
			</div>
		</div>
        <%
        String type = request.getParameter("type");
                System.out.println("jsp페이지 : " + type);
                session.setAttribute("type", type);
        %>
        
        <div class="form-group row">
            <input type="submit" class="btn btn-primary"/>
        </div> 
		</div>
    </fieldset>
    </form:form>
     --%>

</body>
<!-- js -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script src="../resources/js/Hospitalmanager.js"></script>
</html>