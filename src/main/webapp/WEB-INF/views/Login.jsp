<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page import="com.springmvc.domain.*" %>
<!DOCTYPE html>
<html>
<head>
<!-- 폰트어썸 -->
<script src="https://kit.fontawesome.com/8759f784cf.js" crossorigin="anonymous"></script>
<!-- css -->
<link href="<c:url value="/resources/css/index.css"/>" rel="stylesheet">
<link href="<c:url value="/resources/pet/"/>" rel="stylesheet">
<!-- Required meta tags -->
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<title>Login</title>
<!-- plugins:css -->
<link href="<c:url value="/resources/css/vendors/feather/feather.css"/>" rel="stylesheet">
<link href="<c:url value="/resources/css/vendors/ti-icons/css/themify-icons.css"/>" rel="stylesheet">
<link href="<c:url value="/resources/css/vendors/css/vendor.bundle.base.css"/>" rel="stylesheet">
<link href="<c:url value="/resources/css/vendors/ti-icons/css/themify-icons.css"/>" rel="stylesheet">
<link href="<c:url value="/resources/css/text/css"/>">
<!-- inject:css -->
<link href="<c:url value="/resources/css/vertical-layout-light/style.css"/>" rel="stylesheet">
<!-- End plugin css for this page -->
<!-- endinject -->
<link href="<c:url value="/resources/css/images/favicon.png"/>" rel="stylesheet">
<link rel="shortcut icon" href="images/favicon.png" />
<!-- endinject -->
<link href="<c:url value="/resources/css/vendors/datatables.net-bs4/dataTables.bootstrap4.css"/>" rel="stylesheet">
<title>로그인</title>
</head>
<body>


<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="./resources/js/refreshing.js"></script>

<div id="header">
		<%@  include file="./module/header.jsp" %>
	</div>
 	<div class="container-fluid page-body-wrapper">
  <%@  include file="./module/leftheader.jsp" %>

		<div class="content-wrapper d-flex auth px-0">
			<div class="row w-100 mx-0">
				<div class="col-lg-6 mx-auto">
					<div class="auth-form-light text-left py-5 px-4 px-sm-5">
						<div class="brand-logo">
						    <img src="resources/images/logo.jpg" alt="logo">
						</div>
						${noId}
						${faild}
						<form:form id="loginForm" class="pt-3" modelAttribute="success" method="POST">
							<div class="form-group">
								<form:input class="form-control form-control-lg" type="text" path="personId" id="id" placeholder="아이디" />
							</div>
							<div class="form-group">
								<form:input class="form-control form-control-lg" type="password" path="personPw" id="pw" placeholder="비밀번호"/>
							</div>
							<div class="mt-3">
								<input onclick="idDuplicateCheck(event)" type="submit" class="btn btn-block btn-primary btn-lg font-weight-medium auth-form-btn" value="로그인" id="login"/>
							</div>
							<div class="text-center mt-4 font-weight-light">
								<a href="./login/Allmember" class="text-primary">회원가입</a>
							</div>
						</form:form>
					</div>
				</div>
			</div>
		</div>
    </div>

     
  	<%@  include file="./module/footer.jsp" %>
<%--  
	<div class="jumbotron">
		<div class="container">
			<h2>로그인 페이지</h2>
		</div>
	</div>
	<div class="container">
		<div class="container col-md-5">
			<div class="text-center">
				<h4>아이디 / 비밀번호 입력해주세요</h4>
				<p>(${noId})</p>	
			</div>
								
			<form:form id="loginForm" class="form-signin mx-auto mt-5" modelAttribute="success" method="POST" style="max-width: 400px;">
	
				<div class="form-group text-center">아이디를 입력하세요
					<form:input class="form-control border border-dark " type="text" path="personId" id="id" />
				</div>
				<div class="form-group text-center mt-3">비밀번호를 입력하세요
					<form:input class="form-control border border-dark" type="password" path="personPw" id="pw"/>
				</div>
				<div class="form-group mt-3">
					<input type="submit" class="btn btn-lg btn-success btn-block" value="로그인" id="login"/>
				</div>
			</form:form>

			<div class="mt-5 text-center">
				<a href="#">아이디 찾기</a> | 
				<a href="#">비밀번호 찾기</a> | 
				<a href="./login/Allmember">회원가입</a>
			</div>

			<hr>
		</div>
	</div>
 --%>


</body>
<!-- js -->
<script src="./resources/js/Login.js"></script>
</html>
<!-- 2024-03-12 -->
<!-- 2024-03-13 -->
<!-- 2024-03-13(2) -->
<!-- 2024-03-13(3) -->
<!-- 2024-03-14 -->
<!-- 2024-03-14(2) -->
<!-- 2024-03-15(1) -->
<!-- 2024-03-17 -->
<!-- 2024-03-17(2) -->
<!-- 2024-03-18 -->