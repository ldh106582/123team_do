<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="com.springmvc.domain.type" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.4.1/dist/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
<title>products 페이지</title>
</head>
<body>
		<%
		request.setAttribute("type", session.getAttribute("type"));
		request.setAttribute("checktype", "p");
	%>
	
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="./resources/js/refreshing.js"></script>

<div id="header">
		<%@  include file="../module/header.jsp" %>
</div>
    <div class="container-fluid page-body-wrapper">
    
      	<%@  include file="../module/leftheader.jsp" %>
      
    <div class="main-panel">
      <div class="content-wrapper">
         <div class="row">
              <!--여기서 복붙 시작-->
            <div class="show-gird no-gutters col-md-12 p-0 mb-4 row">
              <div class="col-md-12 row no-gutters" style="margin: 0 auto;">
                <div class="justify-content-end col-md-12">
                  	<c:if test="${type == checktype }">
						<a href="products/add" class="btn btn-outline-primary mb-2 float-right mr-5">상품추가</a>
					</c:if>
                </div>
              </div>

            <div class="col-md-9 p-0">
              <div class="p-0" style="border-left: 3px solid red;" > <h3 style="margin-left: 2%;"> 123 상점 판매</h3>
              </div>
              <br>

              <h5 style="border-left: 3px solid #FF7EA0; margin-bottom: 3%;"><span class="ml-4">강아지 상품</span></h5>
              <div class="col-md-12 row card-group no-gutters p-0" style="margin-bottom: 3%;">
                <c:forEach items="${productList}" var="productList">
                  <div class="col-md-4 row no-gutters mr-1 card mb-1 p-0">
                    <div class="col-md-12 card-body no-gutters">
                    <c:choose>
                        <c:when test="${not empty productList.productImage}">
                            <img class="col-md-12 p-0" src="<c:url value='/resources/images/${productList.productImage}'/>" height="300" width="200" alt="상품이미지">
                        </c:when>
                        <c:otherwise>
                            <img class="col-md-12 p-0" src="https://i.ibb.co/gdq8PKg/pexels-tom-fisk-1692693.jpg" alt="상품이미지" height="400" width="200" border="0">
                        </c:otherwise>
                    </c:choose>
                      <p class="card-title" style="margin-top: 7%;">상품명 : ${productList.productName}</p>
                      <p class="card-text" style="margin-top: 4%;">가격 : ${productList.productPrice}</p>
                      <p class="card-text" style="margin-top: 4%;">상품설명 : ${productList.productDescribe}</p>
                    </div>
                      <a href="products/product?productId=${productList.productId}" class="btn btn-outline-primary" >상세보기</a>
                      
                  </div>
                </c:forEach>
            </div>

          <h5 style="border-left: 3px solid #FFA07A; margin-bottom: 3%;"><span class="ml-4">고양이 상품</span></h5>
          <div class="col-md-12 row card-group no-gutters p-0" style="margin-bottom: 3%;">
            <c:forEach items="${productList}" var="productList">   
            <div class="col-md-4 row no-gutters mr-1 card mb-1 p-0">
              <div class="col-md-12 card-body no-gutters">
              <c:choose>
                <c:when test="${not empty productList.productImage}">
                  <img class="col-md-12 p-0" src="<c:url value='/resources/images/${productList.productImage}'/>" height="300" width="150" alt="고양이상품">
                </c:when>
                <c:otherwise>
                  <img class="col-md-12 p-0" src="https://i.ibb.co/gdq8PKg/pexels-tom-fisk-1692693.jpg" alt="고양이상품" height="300" width="150" border="0">
                </c:otherwise>
              </c:choose>
                <p class="card-title" style="margin-top: 7%;">상품명 : ${productList.productName}</p>
                <p class="card-text" style="margin-top: 4%;">가격 : ${productList.productPrice}</p>
                <p class="card-text" style="margin-top: 4%;">상품설명 : ${productList.productDescribe}</p>
              </div>
                <a href="products/product?productId=${productList.productId}" class="btn btn-outline-primary" >상세보기</a>
           	  </div>
            </c:forEach>           
          </div>

          <h5 style="border-left: 3px solid #FFCD63; margin-bottom: 3%;"> <span class="ml-4">토끼용품</span></h5>
          <div class="col-md-12 row card-group no-gutters p-0" style="margin-bottom: 3%;">
            <c:forEach items="${productList}" var="productList">   
            <div class="col-md-4 row no-gutters mr-1 card mb-1 p-0">
              <div class="col-md-12 card-body no-gutters">
              <c:choose>
                <c:when test="${not empty productList.productImage}">
                  <img class="col-md-12 p-0" src="<c:url value='/resources/images/${productList.productImage}'/>" height="300" width="150" alt="토끼상품">
                </c:when>
                <c:otherwise>
                  <img class="col-md-12 p-0" src="https://i.ibb.co/gdq8PKg/pexels-tom-fisk-1692693.jpg" alt="토끼상품" height="300" width="150" border="0">
                </c:otherwise>
              </c:choose>
                <p class="card-title" style="margin-top: 7%;">상품명 : ${productList.productName}</p>
                <p class="card-text" style="margin-top: 4%;">가격 : ${productList.productPrice}</p>
                <p class="card-text" style="margin-top: 4%;">상품설명 : ${productList.productDescribe}</p>
              </div>
                <a href="products/product?productId=${productList.productId}" class="btn btn-outline-primary" >상세보기</a>
           	  </div>
            </c:forEach>           
          </div>

        <h5 style="border-left: 3px solid #FFCD63; margin-bottom: 3%;"> <span class="ml-4">파충류용품</span></h5>
          <div class="col-md-12 row card-group no-gutters p-0" style="margin-bottom: 3%;">
            <c:forEach items="${productList}" var="productList">   
            <div class="col-md-4 row no-gutters mr-1 card mb-1 p-0">
              <div class="col-md-12 card-body no-gutters">
              <c:choose>
                <c:when test="${not empty productList.productImage}">
                  <img class="col-md-12 p-0" src="<c:url value='/resources/images/${productList.productImage}'/>" height="300" width="150" alt="파충류상품">
                </c:when>
                <c:otherwise>
                  <img class="col-md-12 p-0" src="https://i.ibb.co/gdq8PKg/pexels-tom-fisk-1692693.jpg" alt="파충류상품" height="300" width="150" border="0">
                </c:otherwise>
              </c:choose>
                <p class="card-title" style="margin-top: 7%;">상품명 : ${productList.productName}</p>
                <p class="card-text" style="margin-top: 4%;">가격 : ${productList.productPrice}</p>
                <p class="card-text" style="margin-top: 4%;">상품설명 : ${productList.productDescribe}</p>
              </div>
                <a href="products/product?productId=${productList.productId}" class="btn btn-outline-primary" >상세보기</a>
           	  </div>
            </c:forEach>           
          </div>

        <h5 style="border-left: 3px solid #FFCD63; margin-bottom: 3%;"> <span class="ml-4">기타반려동물용품</span></h5>
          <div class="col-md-12 row card-group no-gutters p-0" style="margin-bottom: 3%;">
            <c:forEach items="${productList}" var="productList">   
            <div class="col-md-4 row no-gutters mr-1 card mb-1 p-0">
              <div class="col-md-12 card-body no-gutters">
              <c:choose>
                <c:when test="${not empty productList.productImage}">
                  <img class="col-md-12 p-0" src="<c:url value='/resources/images/${productList.productImage}'/>" height="300" width="150" alt="기타상품">
                </c:when>
                <c:otherwise>
                  <img class="col-md-12 p-0" src="https://i.ibb.co/gdq8PKg/pexels-tom-fisk-1692693.jpg" alt="기타상품" height="300" width="150" border="0">
                </c:otherwise>
              </c:choose>
                <p class="card-title" style="margin-top: 7%;">상품명 : ${productList.productName}</p>
                <p class="card-text" style="margin-top: 4%;">가격 : ${productList.productPrice}</p>
                <p class="card-text" style="margin-top: 4%;">상품설명 : ${productList.productDescribe}</p>
              </div>
                <a href="products/product?productId=${productList.productId}" class="btn btn-outline-primary" >상세보기</a>
           	  </div>
            </c:forEach>           
          </div>
	</div>
          <!-- 베스트 리뷰 -->                 
          <div class="col-md-3 no-gutters p-0">
            <div class="no-gutters col-md-12 p-0" style="border-left: 3px solid red;"><h4 class="ml-3" >best 리뷰 </h4>    
            </div>
            <br>
            
            <h5 style="border-left: 3px solid red; margin-bottom: 3%;"> <span class="ml-4 mt-3 mb-2">별점 5점(강아지)</span></h5>           
              <c:forEach items="${productList}" var="productList">
              <div class="card col-md-12 no-gutters mt-2" style="max-width: 540px; ">
                <div class="col-md-12 p-0 d-flex p-0">
                  <c:choose>
                    <c:when test="${not empty productList.productImage}">
                      <img class="col-md-4 p-0r" src="<c:url value='/resources/images/${productList.productImage}'/>.jpg" alt="강아지상품">
                    </c:when>
                    <c:otherwise>
                        <img class="col-md-4 p-0" src="https://i.ibb.co/CKyMy7Y/22.jpg" alt="강아지상품" border="0">
                    </c:otherwise>
                  </c:choose>
                  <div class="col-md-8  p-0">
                    <div class="card-body">
                      <p class="card-text">상품명 : ${productList.productName} </p>
                      <p class="card-text">리 뷰 : </p>
                      <a href="products/product?productId=${productList.productId}" class="btn btn-outline-primary btn-sm rounded-pill" style="font-size: 75%; height: 10%; width: 40%;"> 상세보기</a>
                    </div>
                  </div>
                </div>
              </div>
            </c:forEach>
            <br>
                                  
            <h5 style="border-left: 3px solid red; margin-bottom: 3%;"> <span class="ml-4">별점 5점(고양이)</span></h5>           
              <c:forEach items="${productList}" var="productList">
              <div class="card col-md-12 no-gutters mt-2" style="max-width: 540px; ">
                <div class="col-md-12 p-0 d-flex p-0">
                  <c:choose>
                    <c:when test="${not empty productList.productImage}">
                      <img class="col-md-4 p-0" src="<c:url value='/resources/images/${productList.productImage}'/>" alt="고양이상품">
                    </c:when>
                    <c:otherwise>
                        <img class="col-md-4 p-0" src="https://i.ibb.co/gdq8PKg/pexels-tom-fisk-1692693.jpg" alt="고양이상품" border="0">
                    </c:otherwise>
                  </c:choose>
                  <div class="col-md-8 p-0">
                    <div class="card-body">
                      <p class="card-text">상품명 : ${productList.productName} </p>
                      <p class="card-text">리 뷰 : </p>
                      <a href="products/product?productId=${productList.productId}" class="btn btn-outline-primary btn-sm rounded-pill" style="font-size: 75%; height: 10%; width: 40%;"> 상세보기</a>
                    </div>
                  </div>
                </div>
              </div>
            </c:forEach>
			<br>
			
          <h5 style="border-left: 3px solid red; margin-bottom: 3%;"> <span class="ml-4">별점 5점(토끼)</span></h5>        
                        <c:forEach items="${productList}" var="productList">
              <div class="card col-md-12 no-gutters mt-2" style="max-width: 540px; ">
                <div class="col-md-12 p-0 d-flex p-0">
                  <c:choose>
                    <c:when test="${not empty productList.productImage}">
                      <img class="col-md-4 p-0" src="<c:url value='/resources/images/${productList.productImage}'/>" alt="토끼상품">
                    </c:when>
                    <c:otherwise>
                        <img class="col-md-4 p-0" src="https://i.ibb.co/gdq8PKg/pexels-tom-fisk-1692693.jpg" alt="토끼상품" border="0">
                    </c:otherwise>
                  </c:choose>
                  <div class="col-md-8 p-0">
                    <div class="card-body">
                      <p class="card-text">상품명 : ${productList.productName} </p>
                      <p class="card-text">리 뷰 : </p>
                      <a href="products/product?productId=${productList.productId}" class="btn btn-outline-primary btn-sm rounded-pill" style="font-size: 75%; height: 10%; width: 40%;"> 상세보기</a>
                    </div>
                  </div>
                </div>
              </div>
            </c:forEach>
             <br>
  		
        <h5 style="border-left: 3px solid red; margin-bottom: 3%;"> <span class="ml-4">별점 5점(파충류)</span></h5>           
          <c:forEach items="${productList}" var="productList">
              <div class="card col-md-12 no-gutters mt-2" style="max-width: 540px; ">
                <div class="col-md-12 p-0 d-flex p-0">
                  <c:choose>
                    <c:when test="${not empty productList.productImage}">
                      <img class="col-md-4 p-0" src="<c:url value='/resources/images/${productList.productImage}'/>" alt="파충류상품">
                    </c:when>
                    <c:otherwise>
                        <img class="col-md-4 p-0" src="https://i.ibb.co/gdq8PKg/pexels-tom-fisk-1692693.jpg" alt="파충류상품"  border="0">
                    </c:otherwise>
                  </c:choose>
                  <div class="col-md-8 p-0">
                    <div class="card-body">
                      <p class="card-text">상품명 : ${productList.productName} </p>
                      <p class="card-text">리 뷰 : </p>
                      <a href="products/product?productId=${productList.productId}" class="btn btn-outline-primary btn-sm rounded-pill" style="font-size: 75%; height: 10%; width: 40%;"> 상세보기</a>
                    </div>
                  </div>
                </div>
              </div>
            </c:forEach>
		<br>
		
	      <h5 style="border-left: 3px solid red; margin-bottom: 3%;"> <span class="ml-4">별점 5점(기타)</span></h5>           
	         <c:forEach items="${productList}" var="productList">
	              <div class="card col-md-12 no-gutters mt-2" style="max-width: 540px; ">
	                <div class="col-md-12 p-0 d-flex p-0">
	                  <c:choose>
	                    <c:when test="${not empty productList.productImage}">
	                      <img class="col-md-4 p-0" src="<c:url value='/resources/images/${productList.productImage}'/>" alt="기타상품">
	                    </c:when>
	                    <c:otherwise>
	                        <img class="col-md-4 p-0" src="https://i.ibb.co/gdq8PKg/pexels-tom-fisk-1692693.jpg" alt="기타상품"  border="0">
	                    </c:otherwise>
	                  </c:choose>
	                  <div class="col-md-8 p-0">
	                    <div class="card-body">
	                      <p class="card-text">상품명 : ${productList.productName} </p>
	                      <p class="card-text">리 뷰 : </p>
	                      <a href="products/product?productId=${productList.productId}" class="btn btn-outline-primary btn-sm rounded-pill" style="font-size: 75%; height: 10%; width: 40%;"> 상세보기</a>
	                    </div>
	                  </div>
	                </div>
	              </div>
	            </c:forEach>
	            <br>
	        </div>
	      </div>
	    </div>
	  </div>
	</div>
  </div>
 	<%@ include file="../module/footer.jsp" %>
<%-- =======
 	<c:if test="${type == checktype }">
		<a href="products/add">상품추가</a>
	</c:if>
    <div class="contianer">
        <div class="show-gird no-gutters">
            <div class="col-md-12 border border-dark no-gutters">
                <div class="col-md-10 row no-gutters" style="margin: 0 auto;">
                    <div class="col-md-7 border border-dark ">
                        <div style="border-left: 3px solid red; margin-left: 3%;"> <h4 style="margin-left: 2%;"> 123 상점 상품 보기 </h4>
                        </div>
                        <br>
                        
                        <h5 style="border-left: 3px solid #FF7EA0; margin-left: 3%; margin-bottom: 3%;">강아지 상품</h5>
                        
                        <div class="col-md-12 no-gutters row card-group">
                            <div class="col-md-4 row no-gutters card">
                                <img class="card-img-top">상품이미지 들어가는 공간
                                <div class="col-md-12 card-body">
                                    <p class="card-title">상품명 : </p>
                                    <p class="card-text"> 가격 : </p>
                                    <p class="card-text">상품설명 : </p>
                                </div>
                            </div>

                            <div class="col-md-4 row no-gutters card">
                                <img class="card-img-top">상품이미지 들어가는 공간
                                <div class="col-md-12 card-body">
                                    <p class="card-title">상품명 : </p>
                                    <p class="card-text"> 가격 : </p>
                                    <p class="card-text">상품설명 : </p>
                                </div>
                            </div>

                            <div class="col-md-4 row no-gutters card">
                                <img class="card-img-top">상품이미지 들어가는 공간
                                <div class="col-md-12 card-body">
                                    <p class="card-title">상품명 : </p>
                                    <p class="card-text"> 가격 : </p>
                                    <p class="card-text">상품설명 : </p>
                                </div>
                            </div>
                        </div>

                        <h5 style="border-left: 3px solid #FFA07A; margin: 3%;">고양이 상품</h5>

                        <div class="col-md-12 no-gutters row card-group">
                            <div class="col-md-4 row no-gutters card">
                                <img class="card-img-top">상품이미지 들어가는 공간
                                <div class="col-md-12 card-body">
                                    <p class="card-title">상품명 : </p>
                                    <p class="card-text"> 가격 : </p>
                                    <p class="card-text">상품설명 : </p>
                                </div>
                            </div>

                            <div class="col-md-4 row no-gutters card">
                                <img class="card-img-top">상품이미지 들어가는 공간
                                <div class="col-md-12 card-body">
                                    <p class="card-title">상품명 : </p>
                                    <p class="card-text"> 가격 : </p>
                                    <p class="card-text">상품설명 : </p>
                                </div>
                            </div>

                            <div class="col-md-4 row no-gutters card">
                                <img class="card-img-top">상품이미지 들어가는 공간
                                <div class="col-md-12 card-body">
                                    <p class="card-title">상품명 : </p>
                                    <p class="card-text"> 가격 : </p>
                                    <p class="card-text">상품설명 : </p>
                                </div>
                            </div>
                        </div>

                        <h5 style="border-left: 3px solid #FFCD63; margin: 3%;">토끼 상품</h5>

                        <div class="col-md-12 no-gutters row card-group">
                            <div class="col-md-4 row no-gutters card">
                                <img class="card-img-top">상품이미지 들어가는 공간
                                <div class="col-md-12 card-body">
                                    <p class="card-title">상품명 : </p>
                                    <p class="card-text"> 가격 : </p>
                                    <p class="card-text">상품설명 : </p>
                                </div>
                            </div>

                            <div class="col-md-4 row no-gutters card">
                                <img class="card-img-top">상품이미지 들어가는 공간
                                <div class="col-md-12 card-body">
                                    <p class="card-title">상품명 : </p>
                                    <p class="card-text"> 가격 : </p>
                                    <p class="card-text">상품설명 : </p>
                                </div>
                            </div>

                            <div class="col-md-4 row no-gutters card">
                                <img class="card-img-top">상품이미지 들어가는 공간
                                <div class="col-md-12 card-body">
                                    <p class="card-title">상품명 : </p>
                                    <p class="card-text"> 가격 : </p>
                                    <p class="card-text">상품설명 : </p>
                                </div>
                            </div>
                        </div>

                        <h5 style="border-left: 3px solid #D5CABD; margin: 3%;">기니피그 상품</h5>

                        <div class="col-md-12 no-gutters row card-group">
                            <div class="col-md-4 row no-gutters card">
                                <img class="card-img-top">상품이미지 들어가는 공간
                                <div class="col-md-12 card-body">
                                    <p class="card-title">상품명 : </p>
                                    <p class="card-text"> 가격 : </p>
                                    <p class="card-text">상품설명 : </p>
                                </div>
                            </div>

                            <div class="col-md-4 row no-gutters card">
                                <img class="card-img-top">상품이미지 들어가는 공간
                                <div class="col-md-12 card-body">
                                    <p class="card-title">상품명 : </p>
                                    <p class="card-text"> 가격 : </p>
                                    <p class="card-text">상품설명 : </p>
                                </div>
                            </div>

                            <div class="col-md-4 row no-gutters card">
                                <img class="card-img-top">상품이미지 들어가는 공간
                                <div class="col-md-12 card-body">
                                    <p class="card-title">상품명 : </p>
                                    <p class="card-text"> 가격 : </p>
                                    <p class="card-text">상품설명 : </p>
                                </div>
                            </div>
                        </div>

                        <h5 style="border-left: 3px solid #65BAA9; margin: 3%;">파충류 상품</h5>

                        <div class="col-md-12 no-gutters row card-group">
                            <div class="col-md-4 row no-gutters card">
                                <img class="card-img-top">상품이미지 들어가는 공간
                                <div class="col-md-12 card-body">
                                    <p class="card-title">상품명 : </p>
                                    <p class="card-text"> 가격 : </p>
                                    <p class="card-text">상품설명 : </p>
                                </div>
                            </div>

                            <div class="col-md-4 row no-gutters card">
                                <img class="card-img-top">상품이미지 들어가는 공간
                                <div class="col-md-12 card-body">
                                    <p class="card-title">상품명 : </p>
                                    <p class="card-text"> 가격 : </p>
                                    <p class="card-text">상품설명 : </p>
                                </div>
                            </div>

                            <div class="col-md-4 row no-gutters card">
                                <img class="card-img-top">상품이미지 들어가는 공간
                                <div class="col-md-12 card-body">
                                    <p class="card-title">상품명 : </p>
                                    <p class="card-text"> 가격 : </p>
                                    <p class="card-text">상품설명 : </p>
                                </div>
                            </div>
                        </div>

                        <h5 style="border-left: 3px solid #1E0764; margin: 3%;">기타 반려동물 상품</h5>

                        <div class="col-md-12 no-gutters row card-group">
                            <div class="col-md-4 row no-gutters card">
                                <img class="card-img-top">상품이미지 들어가는 공간
                                <div class="col-md-12 card-body">
                                    <p class="card-title">상품명 : </p>
                                    <p class="card-text"> 가격 : </p>
                                    <p class="card-text">상품설명 : </p>
                                </div>
                            </div>

                            <div class="col-md-4 row no-gutters card">
                                <img class="card-img-top">상품이미지 들어가는 공간
                                <div class="col-md-12 card-body">
                                    <p class="card-title">상품명 : </p>
                                    <p class="card-text"> 가격 : </p>
                                    <p class="card-text">상품설명 : </p>
                                </div>
                            </div>

                            <div class="col-md-4 row no-gutters card">
                                <img class="card-img-top">상품이미지 들어가는 공간
                                <div class="col-md-12 card-body">
                                    <p class="card-title">상품명 : </p>
                                    <p class="card-text"> 가격 : </p>
                                    <p class="card-text">상품설명 : </p>
                                </div>
                            </div>
                        </div>
                    </div>
            </div>
        </div>
    </div>
>>>>>>> origin/hanui
</div>
  --%>

</body>
</html>