<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>product Q&A페이지</title>
</head>
<body>
<div id="header">
		<%@  include file="../module/header.jsp" %>
	</div>

    <div class="container-fluid page-body-wrapper">
    
 	<%@  include file="../module/leftheader.jsp" %>
 	 <div class="content-wrapper d-flex align-items-center auth px-0">
        <div class="row w-100 mx-0">
          <div class="col-lg-6 mx-auto">
            <div class="col-md-7 no-gutters" style="margin-left: 25%;">
              <p class="col-md-12 card-title mb-5">Q&A페이지</p>
              <div class="show-gird col-md-12 mb-4">
                   <form:form modelAttribute="qna" method="POST" enctype="multipart/form-data" >
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

                            <input type="file" class="col-md-12 p-1  form-control form-control-lg " name="s_image" />

                        </div>
                      <div class="col-md-12 mt-3 p-0">
                          <input class="btn btn col-md-12 p-2" type="submit" value="질문하기" style="background-color: blueviolet; color: white;">
                      </div>
                      <input type="hidden" name="productId" value="${productId}"/>
                      <input type="hidden" name="personId" value="${personId}"/>

					  <input type="hidden" name="s_image"/>

                  </form:form>
              </div>
            </div>
          </div>
        </div>
      </div>
   </div> 
    <%@ include file="../module/footer.jsp" %>
</body>
</html>