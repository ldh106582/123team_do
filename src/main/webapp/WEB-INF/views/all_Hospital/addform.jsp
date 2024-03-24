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
 
    <div class="container-fluid page-body-wrapper">
	
	 <%@  include file="../module/leftheader.jsp" %>
      
        <div class="content-wrapper d-flex auth px-0">
            <div class="row w-100 mx-0">
                  <div class="col-lg-6 mx-auto">
                       <div class="auth-form-light text-left py-5 px-4 px-sm-5">
		                    <div class="card mb-2">
		                        <p class="card-title"><b>병원 추가하기</b></p>
		                    </div>
                        <form:form modelAttribute="hospital" method="POST" enctype="multipart/form-data">
                               <div class="form-group">
                                  <label for="exampleInputUsername1">병원명</label>
                                   <form:input class="form-control form-control-lg" type="text" path="name"  />
                               </div>
                               <div class="form-group">
                                  <label for="exampleInputUsername1">병원주소</label>
                                   <form:input class="form-control form-control-lg" type="text" path="addr" />
                               </div>
                               <div class="form-group">
                                  <label for="exampleInputUsername1">진료시간</label>
                                   <form:input class="form-control form-control-lg" type="text" path="runtime"/>
                               </div>
                               <div class="form-group">
                                  <label for="exampleInputUsername1">전화번호</label>
                                   <form:input class="form-control form-control-lg" type="text" path="number"  />
                               </div>
                               <div class="form-group">
                                  <label for="exampleInputUsername1">주차정보</label>
                                   <form:input class="form-control form-control-lg" type="text" path="parking" />
                               </div>
                               <div class="form-group">
                                  <label for="exampleInputUsername1">설명</label>
                                   <form:input class="form-control form-control-lg" type="text" path="description"/>
                               </div>
                              <div class="form-group">
                                <label>병원이미지</label>
                                <div class="input-group col-xs-12">
                                   <input type="file" name="s_file" class="file-upload-default">
                                  <input type="file" class="form-control file-upload-info" placeholder="Upload Image">
                                 </div>
                              </div>
                               <div class="mt-3">
                                   <input type="submit" class="btn btn-block btn-primary btn-lg font-weight-medium auth-form-btn" value="병원등록" />
                               </div>
                           </form:form>
                       </div>
                    </div>
                 </div>
             </div>
          </div>

          
<%@  include file="../module/footer.jsp" %>

</body>
</html>