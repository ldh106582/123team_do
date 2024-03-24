<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
		<div class="container-fluid page-body-wrapper">
	 		<%@  include file="../module/leftheader.jsp" %>
		 		<div class="content-wrapper">
		     		<div class="col-12 grid-margin stretch-card">
	              <div class="card">
	                <div class="card-body">
	                  <h4 class="card-title">게시글 작성</h4>
	                  <form:form modelAttribute="board" method="POST" class="forms-sample">
	                    <div class="form-group">
	                      <label for="exampleInputName1">제목</label>
	                      <input type="text" class="form-control" id="title" name="title" placeholder="제목">
	                    </div>
	                    <div class="form-group">
	                      <label for="exampleTextarea1">내용</label>
	                      <textarea class="form-control" id="context" name="context" rows="10"></textarea>
	                    </div>
	                    <a href="/123team/Fboards" class="btn btn-light">돌아가기</a>
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
    <h1>게시글 등록 페이지</h1>
    <form:form modelAttribute="board" method="POST">
      <div class="form-group">
        <label for="title">제목 :</label>
        <input type="text" class="form-control" id="title" name="title">
      </div>
      <div class="form-group">
        <label for="context">내용 :</label>
        <textarea class="form-control " id="context" name="context" style="height: 300px;"></textarea>
      </div>
      <button type="submit" class="btn btn-primary">등록</button>
    </form:form>
  </div>
   --%>
</body>
</html>