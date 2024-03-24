<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.4.1/dist/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
</head>
<body>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="./resources/js/refreshing.js"></script>

<div id="header">
		<%@  include file="../module/header.jsp" %>
	</div>
i
		<div class="container-fluid page-body-wrapper">
	 		<%@  include file="../module/leftheader.jsp" %>
		 		<div class="content-wrapper">
		     		<div class="col-12 grid-margin stretch-card">
	              <div class="card">
	                <div class="card-body">
	                  <h4 class="card-title">게시글 작성</h4>
	                  <form:form modelAttribute="updateBoard" action="update?boardId=${board.boardId}" method="POST" class="forms-sample">
	                    <div class="form-group">
	                      <label for="exampleInputName1">제목</label>
	                      <input type="text" class="form-control" id="title" name="title" value="${board.title}">
	                    </div>
	                    <div class="form-group">
	                      <label for="context">동물</label>
	                      <form:input path="animal" name="animal" class="form-control" value="${board.animal}"/>
	                    </div>
	                    <div class="form-group">
	                      <label for="context">체험</label>
	                      <form:input path="experience" name="experience" class="form-control" value="${board.experience}"/>
	                    </div>
	                    <div class="form-group">
	                      <label for="exampleTextarea1">내용</label>
	                      <form:input path="context" class="form-control"  id="context" name="context" style="height: 300px;" value="${board.context}"/>
	                    </div>
	                    <a href="/123team/Fboards" class="btn btn-light">돌아가기</a>
	                    <a href="/delete?boardId=${board.boardId}" class="btn btn-danger">삭제</a>
	                    <button type="submit" class="btn btn-primary mr-2">등록</button>
	                  </form:form>
	                </div>
	              </div>
	            </div>
	        </div>  
		</div>	
	</div>
	
	<%@ include file="../module/footer.jsp" %>
<%-- 	
	<div class="container my-3">
    <h1>체험글 수정 페이지</h1>
   <form:form modelAttribute="updateBoard" action="update?boardId=${board.boardId}" method="POST">
      <div class="form-group">
        <label for="title">제목 :</label>
        <form:input path="title" name="title" class="form-control" value="${board.title}" />
      </div>
      <div class="form-group">
        <label for="context">동물 :</label>
        <form:input path="animal" class="form-control" name="context" value="${board.animal}"/>
        <label for="context">체험 :</label>
        <form:input path="experience" class="form-control" name="context" value="${board.experience}"/>
      </div>
      <div class="form-group">
        <label for="context">내용 :</label>
        <form:input path="context" class="form-control" style="height: 300px;" name="context" value="${board.context}"/>
      </div>
      <a href="/delete?boardId=${board.boardId}" class="btn btn-danger">삭제</a>
      <button type="submit" class="btn btn-primary">등록</button>
    </form:form>
  </div>
  
  
  <%@ include file="../module/footer.jsp" %>
   --%>
  <%-- 
  <h1>공지글 수정 페이지</h1>
	<form:form modelAttribute="updateBoard" action="update?boardId=${board.boardId}" method="POST">
		제목 : <form:input path="title" name="title" value="${board.title}"/>
		내용 : <form:input path="context" name="context" value="${board.context}"/>
		동물 : <form:input path="animal" value="${board.animal}"/>
		체험 : <form:input path="experience" value="${board.experience}"/>
		<input type="submit" value="완료">
	</form:form>
	 --%>
	
</body>
</html>