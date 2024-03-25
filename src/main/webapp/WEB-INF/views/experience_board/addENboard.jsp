<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.4.1/dist/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
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
		 		<div class="content-wrapper">
		     		<div class="col-12 grid-margin stretch-card">
	              <div class="card">
	                <div class="card-body">
	                  <h4 class="card-title">체험단 작성</h4>
	                  <form:form modelAttribute="board" method="POST" class="forms-sample">
	                    <div class="form-group">
	                      <label for="title">제목</label>
	                      <form:input path="title" name="title" class="form-control" placeholder="제목"/>
	                    </div>
	                    <div class="form-group">
	                      <label for="context">동물</label>
	                      <form:input path="animal" name="animal" class="form-control" placeholder="동물"/>
	                    </div>
	                    <div class="form-group">
	                      <label for="context">체험</label>
	                      <form:input path="experience" name="experience" class="form-control" placeholder="체험"/>
	                    </div>
	                    <div class="form-group">
	                      <label for="exampleTextarea1">내용</label>
	                      <textarea class="form-control" id="context" name="context" rows="10" placeholder="자세한 내용을 기입해주세요 :)"></textarea>
	                    </div>
	                    <a href="/123team/ENboards" class="btn btn-light">돌아가기</a>
	                    <button type="submit" class="btn btn-primary mr-2">등록</button>
                      </div>
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
	    <h1>체험글 등록 페이지</h1>
	    <form:form modelAttribute="board" method="POST">
			<div class="form-group">
			  <label for="title">제목 :</label>
			  <form:input path="title" name="title" class="form-control"/>
			</div>
			<div class="form-group">
			  <label for="context">동물 :</label>
			  <form:input path="animal" class="form-control"/>
			</div>
			<div class="form-group">
			  <label for="context">체험 :</label>
			  <form:input path="experience" class="form-control"/>
			</div>
			<div class="form-group">
			  <label for="context">내용 :</label>
			  <textarea class="form-control " id="context" name="context" style="height: 300px;"></textarea>
			</div>
			<button type="submit" class="btn btn-primary">등록</button>
		</form:form>
	</div>

	
	<%@ include file="../module/footer.jsp" %>

 --%>

</body>
</html>
