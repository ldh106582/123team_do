<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
 
		존재하지 않는 게시글 제목 입니다.
		<a href="/123team/ENboards">돌아가기</a>
	</div>
	<%@ include file="../module/footer.jsp" %>
</body>
</html>