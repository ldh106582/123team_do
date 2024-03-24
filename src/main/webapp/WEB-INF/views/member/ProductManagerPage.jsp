<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="/123team/resources/css/mypage.css">
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
<div id="wrap" class="wrap naverid ">
    <header class="header" role="banner">
        <div class="header_subindex">
            <!--로고/Mypage-->
            <div class="gnb_area">
                <a href="#" class="text-decoration-none" >
                    <h1 class="">Product</h2>
                </a>
            </div>
        </div>
        <!--프로필-->
        <div class="profile_area mt-5">
            <div class="profile_inner">
				<c:choose>
					<c:when test="${not empty id.image}">
						<img src="<c:url value='/resources/images/${id.image}'/>" width="84" height="84" alt="프로필 이미지">
					</c:when>
					<c:otherwise>
						<img src="https://static.nid.naver.com/images/web/user/default.png" width="84" height="84" alt="프로필 이미지">
					</c:otherwise>
				</c:choose>
                <div class="profile">
                    <p class="useid">${ id.personId } 사장님 </p>
                    <p class="usemail">${id.personEmail }  입니다. </p>
                </div>
            </div>
        </div>
        
        <div id="headerLeft" class="header_left" aria-hidden="false">
            <ul class="left_menu" role="menu">
                <li>
                   <a href="./pet?id=${ id }" class="left_item" role="menuitem" >
                       <div class="menu_text ">반려동물 회원가입</div>
                   </a>
                </li>
                <li>
                   <a href="" class="left_item" role="menuitem" >
                       <div class="menu_text ">로그아웃</div>
                   </a>
                </li>
                <li>
                    <a href="./login/petcard" class="left_item" role="menuitem" >
                        <div class="menu_text ">펫 카드</div>
                    </a>
                 </li>
            </ul>
        </div>
    </header>

        <div id="container" class="container ">
            <!-- container -->
            <div id="content" class="content">
                <div class="subindex_wrap" role="main">
                    <div id="headerTop" class="path_area" aria-hidden="false"></div>
                </div>
                <div class="subindex_item col-md-12">
                    <div class="col-md-12 grid-margin transparent">
                        <div class="row">

                            	<a href="/123team/products/sales" class="col-md-6 stretch-card transparent">
	                                <div class="card card-tale">
	                                    <div class="card-body">
	                                        <p class="mb-4">매출</p>
	                                        <p class="fs-30 mb-2"> ${sales} ${nothing}</p>
	                                    </div>
	                                </div>
                                </a>
                            <a class="col-md-6 stretch-card transparent">
                                <div class="card card-dark-blue">
                                    <div class="card-body">
                                        <p class="mb-4">주문수</p>
                                        <p class="fs-30 mb-2">${orders}</p>
                                        <p class="fs-20">클릭해서 주문확인하기</p>
                                    </div>
                                </div>
                            </a>
                        </div>
                    </div>
                </div>


                <div class="d-flex">
                    <div class="col-12">
                        <div class="card">
                            <div class="card-body">
                                <h1 class="col-md-12 card-title">내가 올린 상품 : ${numofproduct}</h1>
                                <div class="row">
                                    <div class="col-12">

                                        <div class="table-responsive">
                                            <div id="example_wrapper" class="dataTables_wrapper dt-bootstrap4 no-footer">
                                                <div class="row">
                                                    <div class="col-sm-12">
                                                        <table id="example" class="display expandable-table dataTable no-footer" style="width: 100%;" role="grid">
                                                        <thead>
                                                            <tr role="row">
                                                                <th class="sorting_disabled text-center" rowspan="1" aria-label="Quote#" style="width: 153px;">
                                                                    상품번호
                                                                </th>
                                                                <th class="text-center" tabindex="0" aria-controls="example" rowspan="1" colspan="1" aria-label="Product: activate to sort column descending" aria-sort="ascending" style="width: 177px;">
                                                                    상품이름
                                                                </th>
                                                                <th class="text-center" tabindex="0" aria-controls="example" rowspan="1" colspan="1" aria-label="Premium: activate to sort column ascending" style="width: 149px;">
                                                                    등록일자
                                                                </th>
                                                                <th class="text-center" tabindex="0" aria-controls="example" rowspan="1" colspan="1" aria-label="Business type: activate to sort column ascending" style="width: 210px;">
                                                                    재고수
                                                                </th>
                                                                <th class="text-center" tabindex="0" aria-controls="example" rowspan="1" colspan="1" aria-label="Policy holder: activate to sort column ascending" style="width: 200px;">
                                                                    상품가격 
                                                                </th>
                                                            </tr>
                                                        </thead>
                                                        
                                                            <c:forEach items="${listOfproduct}" var="list">		
                                                        <tr>
                                                        	${nothing}
                                                            <td class="text-center m-0">    
                                                                <p class="useid m-0">${list.personId}</p>
                                                            </td>
                                                            <td class="text-center">
                                                                ${list.productName}
                                                            </td>
                                                            <td class="text-center">
                                                                ${list.releaseDate}
                                                            </td>
                                                            <td class="text-center">
                                                                ${list.productUnitStock}
                                                            </td>
                                                            <td class="text-center">
                                                                ${list.productPrice}
                                                            </td>                               
                                                        </tr>
                                                            </c:forEach>   
                                                    </table>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>

    </div>
</div>
</div>
<%@  include file="../module/footer.jsp" %>
</body>
</html>

<!-- 
 		${nothing}
 			매출 : ${sales}
	주문수 : ${orders}
	내가 올린 상품 수 : ${numofproduct}
		<c:forEach items="${permissionlist}" var="list">
		<br>
		상품 이름 : ${list.productName}
		상품 ID : ${list.productId}
		주문 갯수 : ${list.amount}
		상품 가격 : ${list.price}
		총 가격  : ${list.totalPrice}
		주문자 이름 : ${list.personId}
		배송지 주소 : ${list.personAddress}
		주문일 : ${list.orderDate}
		
		<a href="permit?dec=승인&num=${list.oderNum}">승인</a>
		<a href="permit?dec=거절&num=${list.oderNum}">거절</a>
	</c:forEach>
<<<<<<< HEAD
<!-- </div> -->

<!-- </div> --> 
