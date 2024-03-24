<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.4.1/dist/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
<!-- 폰트어썸 -->
<script src="https://kit.fontawesome.com/8759f784cf.js" crossorigin="anonymous"></script>
<!-- css -->
<link href="<c:url value="/resources/css/index.css"/>" rel="stylesheet">
<!-- 이미지 -->
<link href="<c:url value="/resources/pet/"/>" rel="stylesheet">
<!-- Required meta tags -->
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<title>Skydash Admin</title>
<!-- plugins:css -->
<link href="<c:url value="/resources/css/vendors/feather/feather.css"/>" rel="stylesheet">
<link href="<c:url value="resources/css/vendors/ti-icons/css/themify-icons.css"/>" rel="stylesheet">
<link href="<c:url value="/resources/css/vendors/css/vendor.bundle.base.css"/>" rel="stylesheet">
 <!-- endinject -->
<link href="<c:url value="/resources/css/vendors/datatables.net-bs4/dataTables.bootstrap4.css"/>" rel="stylesheet">
<link href="<c:url value="/resources/css/vendors/ti-icons/css/themify-icons.css"/>" rel="stylesheet">
<link href="<c:url value="/resources/css/text/css"/>">
 <!-- inject:css -->
<link href="<c:url value="/resources/css/vertical-layout-light/style.css"/>" rel="stylesheet">
<!-- End plugin css for this page -->
<!-- endinject -->
 <link href="<c:url value="/resources/css/images/favicon.png"/>" rel="stylesheet">
<link rel="shortcut icon" href="images/favicon.png" />
<title>Insert title here</title>
 <!-- endinject -->
<link href="<c:url value="/resources/css/vendors/datatables.net-bs4/dataTables.bootstrap4.css"/>" rel="stylesheet">
<style type="text/css">
</style>
</head>
<body>
        <!-- partial -->
        <nav class="sidebar sidebar-offcanvas" id="sidebar">
            <ul class="nav">
                <li class="nav-item">
                    <a class="nav-link" href="/123team/hospitals">
                        <i class="fa-solid fa-hospital"></i>
                        <span class="menu-title ml-3">반려동물 병원</span>
                        <i class="menu-arrow"></i>
                    </a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" data-toggle="collapse" href="/123team/products" aria-expanded="false" aria-controls="ui-basic">
                        <i class="fa-solid fa-gift"></i>
                        <span class="menu-title ml-3">반려동물 상품</span>
                        <i class="menu-arrow"></i>
                    </a>
                </li>
                <c:if test="${loginId != null}">
                <li class="nav-item">
                    <a class="nav-link" data-toggle="collapse" href="/123team/products/readcart" aria-expanded="false" aria-controls="form-elements">
                        <i class="fa-solid fa-cart-shopping"></i>
                        <span class="menu-title ml-3">장바구니</span>
                        <i class="menu-arrow"></i>
                    </a>
                </li>
                </c:if>
                <li class="nav-item">
                    <a class="nav-link" data-toggle="collapse" href="/123team/ENboards" aria-expanded="false" aria-controls="charts">
                        <i class="fa-solid fa-dog"></i>
                        <span class="menu-title ml-3">체험단</span>
                        <i class="menu-arrow"></i>
                    </a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" data-toggle="collapse" href="/123team/Fboards" aria-expanded="false" aria-controls="tables">
                        <i class="fa-solid fa-clipboard-question"></i>
                        <span class="menu-title ml-3">자유게시판</span>
                        <i class="menu-arrow"></i>
                    </a>
                </li>
                <c:if test="${loginId != null}">
                <li class="nav-item">
                    <a class="nav-link" data-toggle="collapse" href="/123team/login/mypage" aria-expanded="false" aria-controls="auth">
                        <i class="fa-solid fa-user"></i>
                        <span class="menu-title  ml-3">My Pages</span>
                        <i class="menu-arrow"></i>
                    </a>
                </li>
                </c:if>
                <li class="nav-item">
                    <a class="nav-link" data-toggle="collapse" href="/123team/Nboards" aria-expanded="false" aria-controls="error">
                        <i class="fa-solid fa-clipboard"></i>
                        <span class="menu-title ml-3">공지사항</span>
                        <i class="menu-arrow"></i>
                    </a>
                </li>

                <c:choose>
                	<c:when test="${loginId == null}">
	                <li class="nav-item">
	                    <a class="nav-link" href="/123team/login">
	                        <i class="fa-solid fa-key"></i>
	                        <span class="menu-title ml-3">로그인</span>
	                        <i class="menu-arrow"></i>
	                    </a>
	                </li>
                	</c:when>
                	<c:otherwise>
	                <li class="nav-item">
	                    <a class="nav-link" href="/123team/login/logout">
	                        <i class="fa-solid fa-right-from-bracket"></i>
	                        <span class="menu-title ml-3">로그아웃</span>
	                        <i class="menu-arrow"></i>
	                    </a>
	                </li>
	                </c:otherwise>
                </c:choose>
            </ul>
        </nav>

</body>
</html>