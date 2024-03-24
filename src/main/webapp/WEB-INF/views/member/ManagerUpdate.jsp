<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<%@page import="com.springmvc.domain.*"%>
<!--  부트스트랩 -->
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.4.1/dist/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
<meta charset="UTF-8">
<title>관리자 회원 수정 페이지</title>
</head>
<body>
<%
String type = (String) session.getAttribute("type");
request.setAttribute("type", type);
%>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="./resources/js/refreshing.js"></script>

<div id="header">
		<%@  include file="../module/header.jsp" %>
	</div>
	<div class="container-fluid page-body-wrapper">
 		<%@  include file="../module/leftheader.jsp" %>
 			<c:choose>
				<c:when test="${type eq 'p' }" >
					<div class="content-wrapper d-flex align-items-center auth px-0">
						<div class="row w-100 mx-0">
				            <div class="col-lg-6 mx-auto">
				                <div class="auth-form-light text-left py-5 px-4 px-sm-5">
										<div class="card mb-2">
										    <p class="card-title"><b>상품관리자 회원수정</b></p>
										</div>
				     				<form:form modelAttribute="managerupdate" action="/123team/login/update" method="post" enctype="Multipart/form-data">
				     					<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
				     					<input type="hidden" name="personId" value="${u_productMember.personId}"/>
				                        <input type="hidden" name="s_file">
				                        <input type="hidden" name="c_file">
				                        <input type="hidden" name="h_file">
				                        
				                        <div class="form-group">
				                            <div class="form-control form-control-lg" >${u_productMember.personId}</div>
				                        </div>
				                        <div class="form-group">
				                            <form:input class="form-control form-control-lg" type="password" path="personPw" />
				                        </div>
				                        <div class="form-group">
				                            <form:input class="form-control form-control-lg" type="email" path="personEmail" value="${u_productMember.personEmail}"/>
				                        </div>
				                        <div class="form-group">
				                            <form:input class="form-control form-control-lg" type="text" path="personName"  value="${u_productMember.personName}"/>
				                        </div>
				                        <div class="form-group">
				                            <form:input class="form-control form-control-lg" type="text" path="personBirth"  value="${u_productMember.personBirth}"/>
				                        </div>
				                        <div class="form-group">
				                            <form:input class="form-control form-control-lg" type="text" path="personAddress" value="${u_productMember.personAddress}"/>
				                        </div>
				                        <div class="form-group">
				                            <form:input class="form-control form-control-lg" type="text" path="personPhone" value="${u_productMember.personPhone}"/>
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
				                        <div class="form-group">
				                            <form:input class="form-control form-control-lg" type="text" path="companyName" value="${u_productMember.companyName}"/>
				                        </div>
				                        <div class="form-group">
				                            <form:input class="form-control form-control-lg" type="text" path="companyAddress" value="${u_productMember.companyAddress}"/>
				                        </div>
				                        <div class="form-group">
				                            <form:input class="form-control form-control-lg" type="text" path="companyPhone" value="${u_productMember.companyPhone}"/>
				                        </div>	
				                        <div class="form-group">
										  <label>[변경] 사업자등록증</label>
										  <div class="input-group col-xs-12">
										  	<input type="file" name="c_file" class="form-control file-upload-info">
										   </div>
										</div>
										                        
				                        <div class="mt-3">
				                            <input type="submit" class="btn btn-block btn-primary btn-lg font-weight-medium auth-form-btn" value="수정" />
				                        </div>

				                    </form:form>
				                </div>
				            </div>
				        </div>
					</div>
				</c:when>
				<c:when test="${type eq 'e' }" >
					<div class="content-wrapper d-flex align-items-center auth px-0">
						<div class="row w-100 mx-0">
				            <div class="col-lg-6 mx-auto">
				            	<div class="auth-form-light text-left py-5 px-4 px-sm-5">
									<div class="card mb-2">
								    	<p class="card-title"><b>체험단관리자 회원수정</b></p>
									</div>
				     				<form:form modelAttribute="ex_manager" action="/123team/login/update" method="post" enctype="Multipart/form-data">
				     					<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
				                        <input type="hidden" name="personId" value="${ex_person.personId}"/>
				                        <input type="hidden" name="s_file" />
				                        <div class="form-group">
				                            <div class="form-control form-control-lg" >${ex_person.personId}</div>
				                        </div>
				                        <div class="form-group">
				                            <form:input class="form-control form-control-lg" type="password" path="personPw"/>
				                        </div>
				                        <div class="form-group">
				                            <form:input class="form-control form-control-lg" type="email" path="personEmail" value="${ex_person.personEmail}"/>
				                        </div>
				                        <div class="form-group">
				                            <form:input class="form-control form-control-lg" type="text" path="personName" value="${ex_person.personName}"/>
				                        </div>
				                        <div class="form-group">
				                            <form:input class="form-control form-control-lg" type="text" path="personBirth"  value="${ex_person.personBirth}"/>
				                        </div>
				                        <div class="form-group">
				                            <form:input class="form-control form-control-lg" type="text" path="personAddress" value="${ex_person.personAddress}"/>
				                        </div>
				                        <div class="form-group">
				                            <form:input class="form-control form-control-lg" type="text" path="personPhone"  value="${ex_person.personPhone}"/>
				                        </div>
				                        <div class="form-group">
				                            <form:radiobutton path="personSex" value="남자" class="col-sm-1" required="requried"/>남성
								            <form:radiobutton path="personSex" value="여자" class="col-sm-1"/>여성
				                        </div>
				                  
				                        <div class="form-group">
										  <label>[선택] 프로필 사진등록</label>
										  <div class="input-group col-xs-12">
										  	<input type="file" name="s_file" class="form-control file-upload-info">
										   </div>
										</div>
										
				                        <div class="form-group">
				                            <form:input class="form-control form-control-lg" type="text" path="ex_Name" value="${ex_Manager.ex_Name}"/>
				                        </div>
				                        <div class="form-group">
				                            <form:input class="form-control form-control-lg" type="text" path="ex_Address" value="${ex_Manager.ex_Address}"/>
				                        </div>
				                        <div class="form-group">
				                            <form:input class="form-control form-control-lg" type="text" path="ex_Phone" value="${ex_Manager.ex_Phone}"/>
				                        </div>
				                        <div class="form-group">
										  <label>[변경] 사업자등록증</label>
										  <div class="input-group col-xs-12">
										  	<input type="file" name="c_file" class="form-control file-upload-info">
										   </div>
										</div>
				                        <div class="mt-3">
				                            <input type="submit" class="btn btn-block btn-primary btn-lg font-weight-medium auth-form-btn" value="수정" />
				                        </div>
				                    </form:form>
				                </div>
				            </div>
				        </div>
				        </div>
				</c:when>
				<c:otherwise>
					<div class="content-wrapper d-flex align-items-center auth px-0">
						<div class="row w-100 mx-0">
				            <div class="col-lg-6 mx-auto">
				                <div class="auth-form-light text-left py-5 px-4 px-sm-5">
										<div class="card mb-2">
										    <p class="card-title"><b>병원관리자 회원수정</b></p>
										</div>
				     				<form:form modelAttribute="hospitalupdate" action="/123team/login/update" method="post" enctype="Multipart/form-data">
				     					<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
				     					<input type="hidden" name="personId" value="${u_hospitalMember.personId}"/>
				                        <input type="hidden" name="s_file" />
				                        <input type="hidden" name="c_file" />
				                        
				                        <div class="form-group">
				                            <div class="form-control form-control-lg">${u_hospitalMember.personId}</div>
				                        </div>
				                        <div class="form-group">
				                            <form:input class="form-control form-control-lg" type="password" path="personPw"/>
				                        </div>
				                        <div class="form-group">
				                            <form:input class="form-control form-control-lg" type="email" path="personEmail" value="${u_hospitalMember.personEmail}"/>
				                        </div>
				 	  				    <div class="form-group">
				                            <form:input class="form-control form-control-lg" type="text" path="personName"  value="${u_hospitalMember.personName}"/>
				                        </div>
				                        <div class="form-group">
				                            <form:input class="form-control form-control-lg" type="text" path="personAddress" value="${u_hospitalMember.personAddress}"/>
				                        </div>
				                        <div class="form-group">
				                            <form:input class="form-control form-control-lg" type="text" path="personBirth"  value="${u_hospitalMember.personBirth}"/>
				                        </div>
				                        <div class="form-group">
				                            <form:input class="form-control form-control-lg" type="text" path="personAddress" value="${u_hospitalMember.personAddress}"/>
				                        </div>
				                        <div class="form-group">
				                            <form:input class="form-control form-control-lg" type="text" path="personPhone"  value="${u_hospitalMember.personPhone}"/>
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
										
				                        <div class="form-group">
				                            <form:input class="form-control form-control-lg" type="text" path="hospitalName" value="${u_hospitalMember.hospitalName}"/>
				                        </div>
				                        <div class="form-group">
				                            <form:input class="form-control form-control-lg" type="text" path="hospitalAddress" value="${u_hospitalMember.hospitalAddress}"/>
				                        </div>
				                        <div class="form-group">
				                            <form:input class="form-control form-control-lg" type="text" path="hospitalPhone" value="${u_hospitalMember.hospitalPhone}"/>
				                        </div>
										<div class="form-group">
										  <label>[변경] 사업자등록증</label>
										  <div class="input-group col-xs-12">
										  	<input type="file" name="c_file" class="form-control file-upload-info">
										   </div>
										</div>
				                        
				                        <div class="mt-3">
				                            <input type="submit" class="btn btn-block btn-primary btn-lg font-weight-medium auth-form-btn" value="수정" />
				                        </div>
				                    </form:form>
				                </div>
				            </div>
				        </div>
					</div>
				</c:otherwise>
			</c:choose>
		</div>
	</div>
	
	<%@ include file="../module/footer.jsp" %>
<%-- 	
  <!-- container-scroller -->	
	<c:choose>
		<c:when test="${type eq 'p' }" >
		
		    <div class="jumbotron">
		        <div class="container">
		            <legend id="id"><h2>product 관리자 회원수정 페이지 입니다.</h2></legend>
		        </div>
		    </div>
		    
		    <div class="container">
			<form:form modelAttribute="managerupdate" action="/123team/login/update" method="post" enctype="Multipart/form-data">
	    	<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
			<fieldset>
				<div class="form-group row">
			   		<label class="col-sm-2 control-label"> 아이디  </label>
			   		<div class="col-5"> ${u_productMember.personId}
					    <form:hidden path="personId" value="${u_productMember.personId}" class="rounded"/>
					</div>
				</div>
				
				<div class="form-group row">
					<label class="col-sm-2 control-label"> 비밀번호 </label> 
					<div class="col-4">
						<form:input class="border border-success rounded" type="password" path="personPw" value="${u_productMember.personPw}"/>
					</div>
				</div>
				
				<div class="form-group row"> 
					<label class="col-sm-2 control-label"> 이메일 </label> 
					<div class="col-4">
						<form:input class="border border-success rounded" type="email" path="personEmail" value="${u_productMember.personEmail}"/>
					</div>
				</div>
				
				<div class="form-group row">
					<label class="col-sm-2 control-label"> 이름 </label> 
					<div class="col-4">
						<form:input class="border border-success rounded" type="text" path="personName" value="${u_productMember.personName}"/>
					</div>
				</div>
				
				<div class="form-group row">
					<label class="col-sm-2 control-label"> 주소 </label> 
					<div class="col-4">
						<form:input class="border border-success rounded" type="text" path="personAddress" value="${u_productMember.personAddress}"/>
					</div>
				</div>
				
				<div class="form-group row">
					<label class="col-sm-2 control-label"> 날짜 </label> 
					<div class="col-4">
						<form:input class="border border-success rounded" type="date" path="personBirth" value="${u_productMember.personBirth}"/>
					</div>
				</div>
	
				<div class="form-group row"> 
					<label class="col-sm-2 control-label"> 개인번호 </label> 
					<div class="col-4">
						<form:input class="border border-success rounded" type="text" path="personPhone"  value=" ${u_productMember.personPhone}" />
					</div>
				</div>
				
				<div class="form-group row"> 
					<label class="col-sm-2 control-label"> 성별 </label> 
					<div class="col-4">
						<form:input class="border border-success rounded" path="personSex"  value=" ${u_productMember.personSex}" />
					</div>
				</div>
				
				<div class="form-group row"> 
					<label class="col-sm-2 control-label"> 회사명 </label> 
					<div class="col-4">
						<form:input class="border border-success rounded" path="companyName" value="${u_productMember.companyName}" />
					</div>
				</div>
				
				<div class="form-group row"> 
					<label class="col-sm-2 control-label"> 회사주소 </label> 
					<div class="col-4">
						<form:input class="border border-success rounded" path="companyAddress" value="${u_productMember.companyAddress}" />
					</div>
				</div>
				
				<div class="form-group row">
					<label class="col-sm-2 control-label"> 회사번호 </label>
					<div class="col-4">
						<form:input class="border border-success rounded" type="text" path="companyPhone" value="${u_productMember.companyPhone}" />
					</div>
				</div>
				
				<div class="form-group row">
					<label class="col-sm-2 control-label"> 사업자등록증 </label>
					<div class="col-4">
						<input class="border border-success rounded" type="file" name="s_file" />
					</div>
				</div>
				
				<div class="form-group row">
					<div class="col-sm-offset-2 col-sm-10">
						<input type="submit" class="btn btn-primary" value="회원정보수정"/>
					</div>
				</div>
				
			</fieldset>
			</form:form>
			</div>
			<hr>
			</c:when>
			
			<c:when test="${type eq 'e' }" >
			 <div class="jumbotron">
			    		<!-- 체험단 관리자 update -->
		        <div class="container">
		            <legend id="id"><h2>체험단 담당자님 회원수정 페이지 입니다.</h2></legend>
		        </div>
		    </div>
		    
		    <div class="container">
			<form:form modelAttribute="ex_manager" action="/123team/login/update" method="post" enctype="Multipart/form-data">
	    	<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
			<fieldset>
			
				<div class="form-group row">
			   		<label class="col-sm-2 control-label"> 아이디  </label>
			   		<div class="col-5"> ${ex_person.personId}
					    <form:hidden path="personId" value="${ex_person.personId}" class="rounded"/>
					</div>
				</div>
				
				<div class="form-group row">
					<label class="col-sm-2 control-label"> 비밀번호 </label> 
					<div class="col-4">
						<form:input class="border border-success rounded" type="password" path="personPw" value="${ex_person.personPw}"/>
					</div>
				</div>
				
				<div class="form-group row"> 
					<label class="col-sm-2 control-label"> 이메일 </label> 
					<div class="col-4">
						<form:input class="border border-success rounded" type="email" path="personEmail" value="${ex_person.personEmail}"/>
					</div>
				</div>
				
				<div class="form-group row"> 
					<label class="col-sm-2 control-label"> 주소 </label> 
					<div class="col-4">
						<form:input class="border border-success rounded" type="text" path="personAddress" value="${ex_person.personAddress}"/>
					</div>
				</div>
				
				<div class="form-group row">
					<label class="col-sm-2 control-label"> 이름 </label> 
					<div class="col-4">
						<form:input class="border border-success rounded" type="text" path="personName" value="${ex_person.personName}"/>
					</div>
				</div>
	
				<div class="form-group row"> 
					<label class="col-sm-2 control-label"> 개인번호 </label> 
					<div class="col-4">
						<form:input class="border border-success rounded" type="text" path="personPhone"  value="${ex_person.personPhone}" />
					</div>
				</div>
				
				<div class="form-group row"> 
					<label class="col-sm-2 control-label"> 생년월일 </label> 
					<div class="col-4">
						<form:input class="border border-success rounded" type="date" path="personBirth"  value=" ${ex_person.personBirth}" />
					</div>
				</div>
				
				<div class="form-group row"> 
					<label class="col-sm-2 control-label"> 성별 </label> 
					<div class="col-4">
						<form:input class="border border-success rounded" path="personSex"  value="${ex_person.personSex}" />
					</div>
				</div>
				
				<div class="form-group row"> 
					<label class="col-sm-2 control-label"> 체험단명 </label> 
					<div class="col-4">
						<form:input class="border border-success rounded" path="ex_Name" value="${ex_Manager.ex_Name}" />
					</div>
				</div>
				
				<div class="form-group row"> 
					<label class="col-sm-2 control-label"> 체험단주소 </label> 
					<div class="col-4">
						<form:input class="border border-success rounded" path="ex_Address" value="${ex_Manager.ex_Address}" />
					</div>
				</div>
				
				<div class="form-group row">
					<label class="col-sm-2 control-label"> 체험단번호 </label>
					<div class="col-4">
						<form:input class="border border-success rounded" type="text" path="ex_Phone" value="${ex_Manager.ex_Phone}" />
					</div>
				</div>
				<div class="form-group row">
					<label class="col-sm-2 control-label"> 사업자등록증 </label>
					<div class="col-4">
						<input class="border border-success rounded" type="file" name="s_file" />
					</div>
				</div>
				
				
				<div class="form-group row">
					<div class="col-sm-offset-2 col-sm-10">
						<input type="submit" class="btn btn-primary" value="회원정보수정"/>
					</div>
				</div>
			</fieldset>
			</form:form>
			</div>
			</c:when>

	
		<c:otherwise>
			    <div class="jumbotron">
			    		<!-- 병원 관리자 update -->
		        <div class="container">
		            <legend id="id"><h2>병원 의사선생님 회원수정 페이지 입니다.</h2></legend>
		        </div>
		    </div>
		    
		    <div class="container">
			<form:form modelAttribute="hospitalupdate" action="/123team/login/update" method="post" enctype="Multipart/form-data">
	    	<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
			<fieldset>
			
				<div class="form-group row">
			   		<label class="col-sm-2 control-label"> 아이디  </label>
			   		<div class="col-5"> ${u_hospitalMember.personId}
					    <form:hidden path="personId" value="${u_hospitalMember.personId}" class="rounded"/>
					</div>
				</div>
				
				<div class="form-group row">
					<label class="col-sm-2 control-label"> 비밀번호 </label> 
					<div class="col-4">
						<form:input class="border border-success rounded" type="password" path="personPw" value="${u_hospitalMember.personPw}"/>
					</div>
				</div>
				
				<div class="form-group row"> 
					<label class="col-sm-2 control-label"> 이메일 </label> 
					<div class="col-4">
						<form:input class="border border-success rounded" type="email" path="personEmail" value="${u_hospitalMember.personEmail}"/>
					</div>
				</div>
				
				<div class="form-group row"> 
					<label class="col-sm-2 control-label"> 주소 </label> 
					<div class="col-4">
						<form:input class="border border-success rounded" type="text" path="personAddress" value="${u_hospitalMember.personAddress}"/>
					</div>
				</div>
				
				<div class="form-group row">
					<label class="col-sm-2 control-label"> 이름 </label> 
					<div class="col-4">
						<form:input class="border border-success rounded" type="text" path="personName" value="${u_hospitalMember.personName}"/>
					</div>
				</div>
	
				<div class="form-group row"> 
					<label class="col-sm-2 control-label"> 개인번호 </label> 
					<div class="col-4">
						<form:input class="border border-success rounded" type="text" path="personPhone"  value="${u_hospitalMember.personPhone}" />
					</div>
				</div>
				
				<div class="form-group row"> 
					<label class="col-sm-2 control-label"> 생년월일 </label> 
					<div class="col-4">
						<form:input class="border border-success rounded" type="date" path="personBirth"  value=" ${u_hospitalMember.personBirth}" />
					</div>
				</div>
				
				<div class="form-group row"> 
					<label class="col-sm-2 control-label"> 성별 </label> 
					<div class="col-4">
						<form:input class="border border-success rounded" path="personSex"  value="${u_hospitalMember.personSex}" />
					</div>
				</div>
				
				<div class="form-group row"> 
					<label class="col-sm-2 control-label"> 병원명 </label> 
					<div class="col-4">
						<form:input class="border border-success rounded" path="hospitalName" value="${u_hospitalMember.hospitalName}" />
					</div>
				</div>
				
				<div class="form-group row"> 
					<label class="col-sm-2 control-label"> 병원주소 </label> 
					<div class="col-4">
						<form:input class="border border-success rounded" path="hospitalAddress" value="${u_hospitalMember.hospitalAddress}" />
					</div>
				</div>
				
				<div class="form-group row">
					<label class="col-sm-2 control-label"> 병원번호 </label>
					<div class="col-4">
						<form:input class="border border-success rounded" type="text" path="hospitalPhone" value="${u_hospitalMember.hospitalPhone}" />
					</div>
				</div>
				<div class="form-group row">
					<label class="col-sm-2 control-label"> 사업자등록증 </label>
					<div class="col-4">
						<input class="border border-success rounded" type="file" name="s_file" />
					</div>
				</div>
				
				
				<div class="form-group row">
					<div class="col-sm-offset-2 col-sm-10">
						<input type="submit" class="btn btn-primary" value="회원정보수정"/>
					</div>
				</div>
			</fieldset>
			</form:form>
			</div>
			<hr>
		</c:otherwise>
		</c:choose>
	<%@ include file="../module/footer.jsp" %> --%>
</body>
</html>