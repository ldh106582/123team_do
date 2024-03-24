<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.4.1/dist/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
<meta charset="UTF-8">
<link rel="stylesheet" href="../resources/css/addReviewform.css">
<title>병원 리뷰페이지</title>
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
		          <div class="col-md-7 no-gutters" style="margin-left: 25%;">
		            <p class="col-md-12 card-title">리뷰 등록</p>
		            <div class="show-gird col-md-12 mb-4">
						 <form:form modelAttribute="review" method="POST" enctype="multipart/form-data">
						    <div class="rating text-center col-md-12 mb-2">
						        <form:radiobutton path="reviewScore" value="5" id="star5"/>
						        <label for="star5">★</label>
						        <form:radiobutton path="reviewScore" value="4" id="star4"/>
						        <label for="star4">★</label>
						        <form:radiobutton path="reviewScore" value="3" id="star3"/>
						        <label for="star3">★</label>
						        <form:radiobutton path="reviewScore" value="2" id="star2"/>
						        <label for="star2">★</label>
						        <form:radiobutton path="reviewScore" value="1" id="star1"/>
						        <label for="star1">★</label>
						    </div>
						    <div class="col-md-12 p-0 mb-3">
						        <h4 class="col-md-12 p-0" style="color: rgb(140, 58, 179);">제목</h4>
						        <form:input class="form-control form-control-lg col-md-12" style="justify-content: center;" path="title"/>
						    </div>
						    <div class="col-md-12 no-gutters p-0 mb-3">
						        <h4 class=" col-md-12 p-0" style="color: rgb(140, 58, 179);">내용</h4>
						        <form:input class="form-control form-control-lg col-md-12" path="context" />
						    </div>
						    <div class="col-md-12 p-0 mb-3">
						        <h4 class=" col-md-12 p-0" style="color: rgb(140, 58, 179);">사진첨부</h4>
						        <input type="file" class="col-md-12 p-1 form-control form-control-lg " name="s_file"/>
						    </div>
						    <div class="col-md-12 mt-3 p-0">
						        <input class="btn btn col-md-12 p-2" type="submit" value="작성완료" style="background-color: blueviolet; color: white;">
						    </div>
						</form:form>
		            </div>
		          </div>
		        </div>
		      </div>
		    </div>
	     </div> 
          
<%@  include file="../module/footer.jsp" %>

</body>
</html>