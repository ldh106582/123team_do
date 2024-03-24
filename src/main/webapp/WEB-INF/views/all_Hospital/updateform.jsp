<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%> 
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.4.1/dist/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">  
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="./resources/js/refreshing.js"></script>

<div id="header">
		<%@  include file="../module/header.jsp" %>
	</div>
     <!-- partial -->
    <div class="container-fluid page-body-wrapper">
 <%@  include file="../module/leftheader.jsp" %>

         
             <div class="content-wrapper d-flex auth px-0">
                <div class="row w-100 mx-0">
                      <div class="col-lg-6 mx-auto">
                          <div class="auth-form-light text-left py-5 px-4 px-sm-5">
                              <div class="brand-logo">
                                  <img src="resources/images/logo.jpg" alt="logo">
                              </div>
                              <p class="card-title">병원정보 수정</p>
                           		<form:form modelAttribute="hospital" method="POST" enctype="multipart/form-data">
                                  <div class="form-group">
                                     <label for="exampleInputUsername1">병원명</label>
                                      <form:input class="form-control form-control-lg" type="text" path="name" value="${hospital.name}" />
                                  </div>
                                  <div class="form-group">
                                     <label for="exampleInputUsername1">병원주소</label>
                                      <form:input class="form-control form-control-lg" type="text" path="addr"  value="${hospital.addr}" />
                                  </div>
                                  <div class="form-group">
                                     <label for="exampleInputUsername1">진료시간</label>
                                      <form:input class="form-control form-control-lg" type="registDay" path="runtime" value="${hospital.runtime}"/>
                                  </div>
                                  <div class="form-group">
                                     <label for="exampleInputUsername1">전화번호</label>
                                      <form:input class="form-control form-control-lg" type="text" path="number" value="${hospital.number}" />
                                  </div>
                                  <div class="form-group">
                                     <label for="exampleInputUsername1">주차안내</label>
                                      <form:input class="form-control form-control-lg" type="text" path="parking" value="${hospital.parking}" />
                                  </div>
                                  <div class="form-group">
                                     <label for="exampleInputUsername1">설명</label>
                                      <form:input class="form-control form-control-lg" type="text" path="description" value="${hospital.description}" />
                                  </div>
                                 <div class="form-group">
                                   <label>병원이미지</label>
                                   <div class="input-group col-xs-12">
                                        <input type="file" name="img[]" class="file-upload-default">
                                        <input type="file" class="form-control file-upload-info" placeholder="Upload Image">
                                    </div>
                                 </div>
                                  <div class="mt-3">
                                      <input type="submit" class="btn btn-block btn-primary btn-lg font-weight-medium auth-form-btn" value="병원정보수정" />
                                  </div>
                              </form:form>
                          </div>
                      </div>
                  </div>
               </div>
            </div>


<%@  include file="../module/footer.jsp" %>

<!-- 
	<div class="container my-3">
    <h1>병원 수정 페이지</h1>
   <form:form modelAttribute="hospital" method="POST">
      <div class="form-group">
        <label for="title">병원명 :</label>
        <form:input path="name" value="${hospital.name}" class="form-control"/>
      </div>
      <div class="form-group">
        <label for="title">병원 주소 :</label>
        <form:input path="addr" value="${hospital.addr}" class="form-control"/>
      </div>
      <div class="form-group">
        <label for="title">진료시간 :</label>
        <form:input path="runtime" value="${hospital.runtime}" class="form-control"/>
      </div>
      <div class="form-group">
        <label for="title">전화번호 :</label>
        <form:input path="number" value="${hospital.number}" class="form-control"/>
      </div>
      <div class="form-group">
        <label for="title">주차정보 :</label>
        <form:input path="parking" value="${hospital.parking}" class="form-control"/>
      </div>
      <div class="form-group">
        <label for="context">설명 :</label>
        <%-- <form:input path="description" class="form-control" style="height: 300px;" name="description" value="${board.description}"/> --%>
        <form:input path="description" value="${hospital.description}" class="form-control"/>
      </div>
      <div class="form-group">
        <label for="title">병원이미지 :</label>
        <form:input path="image" type="file" class="form-control"/>
      </div>
      <button type="submit" class="btn btn-primary">등록</button>
      <a href="/delete?boardId=${board.boardId}" class="btn btn-danger">삭제</a>
    </form:form>
  </div>
  
 -->
<%-- 
<form:form modelAttribute="hospital" method="POST">
	<p>
		병원 이름 : <form:input path="name" value="${hospital.name}"/>
		<p>
		병원 주소 : <form:input path="addr" value="${hospital.addr}"/>
		<p>
		전화번호 : <form:input path="number" value="${hospital.number}"/>
		<p>
		진료시간 : <form:input path="runtime" value="${hospital.runtime}"/>
		<p>
		설명 : <form:input path="description" value="${hospital.description}"/>
		<p>
		주차정보 : <form:input path="parking" value="${hospital.parking}"/>
		<p>
		사진 : <form:input path="image" value="${hospital.image}"/>
		<p>
		<input type="hidden" value="${hospital.hid}">
		<input type="submit" value="수정완료">
	</form:form>

 --%>
</body>
</html>