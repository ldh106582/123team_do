<%@page import="com.springmvc.domain.Pet"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.4.1/dist/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
<head>
<meta charset="UTF-8">
<title>예약페이지</title>
</head>
<body>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="./resources/js/refreshing.js"></script>

<div id="header">
		<%@  include file="../module/header.jsp" %>
	</div>
 	<%
		List<Pet> petlist = (List<Pet>) session.getAttribute("petName");
	%>

	  <div class="container-fluid page-body-wrapper">
    	<%@  include file="../module/leftheader.jsp"%>
            <div class="content-wrapper d-flex align-items-center auth px-0">
                <div class="row w-100 mx-0">
                   <div class="col-lg-6 mx-auto">
                      <div class="auth-form-light text-left py-5 px-4 px-sm-5">
                         <div class="brand-logo">
                             <img src="resources/images/logo.jpg" alt="logo">
                         </div>
                         <p class="card-title">병원예약</p>
                         <form:form modelAttribute="booking" method="POST">
                            <input type="hidden" name="hospitalName" value="${hospital.name}">
                            <input type="hidden" name="hid" value="${hospital.hid}">
                            <input type="hidden" name="mid" value="${hospital.personId}">
                            <div class="form-group">
                            <p class="col-md-12 p-0" style="color: rgb(140, 58, 179);">예약가능시간 </p>  
							${hospital.runtime}

                            </div>
                            <div class="form-group">
                                <p class="col-md-12 p-0" style="color: rgb(140, 58, 179);">진료예약시간 </p>   
                                <form:input class="form-control form-control-lg" type="datetime-local" name="registDay" path="registDay" />
                            </div>
                            <div class="form-group">
                              <p class="col-md-12 p-0" style="color: rgb(140, 58, 179);">특이사항 </p>  
                              <form:input type="text" path="context" class="form-control form-control-lg" />
                            </div>
                            <div class="mt-3">
                               <p class="col-md-12 p-0" style="color: rgb(140, 58, 179);">나의반려동물 </p>
                                <% 
                                    for(int i=0;i<petlist.size();i++){
                                        request.setAttribute("name", petlist.get(i).getPetName());
                                        request.setAttribute("petId", petlist.get(i).getPetId());
                                        %>
                                        ${name} <form:checkbox value="${petId}" path="petId"/>
                                        ${petId}
                                <%
                                    }
                                %>
                                <input type="submit" class="btn btn-block btn-primary btn-lg font-weight-medium auth-form-btn mt-3" value="예약하기" id="login"/>
                             </div>
                         </form:form>
                      </div>
                   </div>
                </div>
             </div>
          </div>


    
<%@  include file="../module/footer.jsp" %>
  
  <%-- <form:form modelAttribute="booking" method="POST">
		<p>
		예약가능시간 : ${hospital.runtime}
		<p>
		예약시간 : <input type="datetime-local" name="registDay">
		<p>
		설명 : <form:input path="context"/>
		<p>
		동물 :
		<% 
			for(int i=0;i<petlist.size();i++){
				request.setAttribute("name", petlist.get(i).getPetName());
				request.setAttribute("petId", petlist.get(i).getPetId());
				%>
				${name} <form:checkbox value="${petId}" path="petId"/>
		<%
			}
		%>
		<p>
		<input type="hidden" name="hospitalName" value="${hospital.name}">
		<input type="hidden" name="hid" value="${hospital.hid}">
		<input type="hidden" name="mid" value="${hospital.personId}">
		<input type="submit" value="예약완료">
	</form:form> --%>
	
</body>
</html>