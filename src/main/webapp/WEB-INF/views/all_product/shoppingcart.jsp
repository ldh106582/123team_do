<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html>
<head>
<!-- 부트스트랩 -->
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.4.1/dist/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
<!-- 폰트어썸 -->
<script src="https://kit.fontawesome.com/8759f784cf.js" crossorigin="anonymous"></script>
<!-- css -->
<link rel="stylesheet" href="../resources/css/shoppingcart.css">
<meta charset="UTF-8">
<style>
	 #alldelete{
	 	backgound-color : black;
	 }
	 #a_num{
	 	width: 15%
	 }
	 
	 #num{
	 width:100%;
	 }
	 #amount{
	 
	 width: 100%;
	 }
	 
</style>
<title>장바구니 페이지</title>
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
            <div class="row">
               <div class="col-lg-12">
                    <div class="card">
                        <div class="card-body">
                            <h4 class="card-title">장바구니</h4>
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
                                                                    카테고리
                                                                </th>
                                                                <th class="text-center" tabindex="0" aria-controls="example" rowspan="1" colspan="1" aria-label="Product: activate to sort column descending" aria-sort="ascending" style="width: 177px;">
                                                                    이미지
                                                                </th>
                                                                <th class="text-center" tabindex="0" aria-controls="example" rowspan="1" colspan="1" aria-label="Policy holder: activate to sort column ascending" style="width: 200px;">
                                                                    상품명
                                                                </th>
                                                                <th class="text-center" tabindex="0" aria-controls="example" rowspan="1" colspan="1" aria-label="Premium: activate to sort column ascending" style="width: 149px;">
                                                                    수량
                                                                </th>
                                                                <th class="text-center" tabindex="0" aria-controls="example" rowspan="1" colspan="1" aria-label="Status: activate to sort column ascending" style="width: 149px;">
                                                                    단가
                                                                </th>
                                                                <th class="text-center" tabindex="0" aria-controls="example" rowspan="1" colspan="1" aria-label="Status: activate to sort column ascending" style="width: 149px;">
                                                                    총금액
                                                                </th>
                                                                <th class="text-center" tabindex="0" aria-controls="example" rowspan="1" colspan="1" aria-label="Status: activate to sort column ascending" style="width: 149px;">
                                                                    삭제
                                                                </th>
                                                            </tr>
                                                        </thead>
                                                      <c:forEach items="${shoppingCart}" var="cart" varStatus="status">
                                                        <tr>

                                                           <form id="form" action="/123team/orders/o_create" method="post">
                                                                <input type="hidden" name="shoppingCartId" value="${cart.shoppingCartId}"> <!-- 카트 넘버 -->
                                                                <input type="hidden" name="productId" value="${cart.productId}"> <!-- 상품 아이디 -->
                                                                <input type="hidden" name="productName" value="${cart.productName}"> <!-- 상품이름 -->
                                                                <input type="hidden" name="amount" value="${cart.amount}"> <!-- 상품 양 -->
                                                                <input type="hidden" name="productPrice" value="${cart.productPrice}"> <!-- 상품 가격 -->
                                                                <input type="hidden" name="personId" value="${cart.personId}"> <!-- 주문자 아이디 -->
                                                            <div class="float-right mb-2">
                                                                <input class="btn btn-info btn-sm mr-4" type="submit" value="주문하기"></input>
                                                            </div>
                                                            </form>
                                                            <div>
                                                                <a href="/123team/products/alldelete?personId=${shoppingCart.get(0).personId}" class="btn border border-dark ml-5 btn-sm" id="alldelete" >전체삭제</a>
                                                            </div>

                                                            <td class="text-center">
                                                                ${cart.productCategory}
                                                            </td>

                                                            <td class="text-center">
	                                                             <c:choose>
												                    <c:when test="${not empty cart.productImage}">
												                      <img class="col-md-12" src="<c:url value='/resources/images/${cart.productImage}'/>" height="150" width="150" alt="상품이미지">
												                    </c:when>
												                    <c:otherwise>
												                        <img class="col-md-12" src="https://i.ibb.co/VDkQhqH/pexels-mart-production-8434641.jpg" alt="상품이미지" height="150" width="150" border="0">
												                    </c:otherwise>
												                  </c:choose>                        
                                                            </td>
                                                            
                                                            <td class="text-center">
                                                                ${cart.productName}
                                                            </td>
                                                            
                                                            <td class="text-center">
                                                                <input id="amount_${status.index}" class="form-group col-sm-12 m-0" type="number" name="amount" value="${cart.amount}">
                                                            </td>

                                                            <td class="text-center">
                                                                ${cart.productPrice} 원
                                                            </td>
        
                                                            <td class=" no-gutters p-0 text-center">
                                                                ${cart.amount * cart.productPrice} 원
                                                            </td>

                                                            <td class=" no-gutters p-0 text-center">
                                                                <a class="btn btn-danger btn-sm" href="/123team/products/cartdelete?shoppingCartId=${cart.shoppingCartId}&personId=${cart.personId}">삭제하기</a>
                                                            </td>
 
                                                        </tr>
                                                        </c:forEach>
                                                        <tr>
                                                            <td colspan="5" class="text-center" style="border-top: 1px solid silver;">총금액( 배송비 2,500원 포함)</td>
                                                            <td colspan="2" class="text-center" style="border-top: 1px solid silver; border-left: 1px solid silver;">${allprice}</td>
                                                        </tr>
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
      
      
     	<%@ include file="../module/footer.jsp" %>
 
<!-- 	<div class="jumbotron">
		<div class="contianer">
			<h2 class="dislpay-2"> <i class="fa-solid fa-truck-fast"></i> 내 장바구니 목록</h2>
		</div>
	</div>

	
	
 	<div class="container">
		<div class="">
			<table class="table text-center">
				<tr> 
				  <th class="border-right">카테고리
				  <th class="border-right">이미지
				  <th class="border-right">상품명
				  <th class="border-right">수량
				  <th class="border-right">단가
				  <th class="border-right">총금액
				  <th >비고
				</tr>
			    <c:forEach items="${shoppingCart}" var="cart" varStatus="status">
   				<form id="form" action="/123team/orders/o_create" method="post">
	   				<input type="hidden" name="shoppingCartId" value="${cart.shoppingCartId}"> <!-- 카트 넘버 -->
			      <!--  <input type="hidden" name="productId" value="${cart.productId}"> <!-- 상품 아이디 -->
			     <!--    <input type="hidden" name="productName" value="${cart.productName}"> <!-- 상품이름 -->
			    <!--     <input type="hidden" name="amount" value="${cart.amount}"> <!-- 상품 양 -->
   		      <!--       <input type="hidden" name="productPrice" value="${cart.productPrice}"> <!-- 상품 가격 -->
			    <!--     <input type="hidden" name="personId" value="${cart.personId}"> <!-- 주문자 아이디 -->
					<!-- 여기 버튼을 눌러서 제출 -->
			<!-- 		<div class="float-right mb-2">
						<input class="btn btn-info btn-sm mr-4" type="submit" value="주문하기"></input>
					</div>
					<div>
						<a href="/123team/products/alldelete?personId=${shoppingCart.get(0).personId}" class="btn border border-dark ml-5 btn-sm" id="alldelete" >전체삭제</a>
					</div>
			        <tr>
			            <td class="shop border-right">${cart.productCategory}</td>
			            <td class="shop border-right align-self-center">img</td>
			            <td class="shop border-right align-self-center">${cart.productName}</td>
			            <td id="a_num" class="shop border-right">
			                <div id="num"> 
			                    <input id="amount_${status.index}" class="form-group col-sm-12" type="number" name="amount" value="${cart.amount}">
			                </div>
			            </td>
			            <td class="shop border-right text-right">${cart.productPrice} 원</td>
			            <td class="shop border-right text-right">${cart.amount * cart.productPrice} 원</td>
			            <td class="form-group">
			                                                                                               
			                <a class="btn btn-danger btn-sm" href="/123team/products/cartdelete?shoppingCartId=${cart.shoppingCartId}&personId=${cart.personId}">삭제하기</a>
			            </td>
			        </tr>
		        </form>
		        
			    </c:forEach>
				
				<tr>
					<td colspan="4">전체 금액 (배송비2,500원 + 총 금액)</td>
	      			<td id="subtotal" class="border-left" colspan="3"> <c:out value="${allprice}" />원  <span>(2500원 배송비 포함)</span></td>
				</tr>
				<tr>
					<td colspan="4">
					<td colspan="2">
					<td>
				<tr>
			</table>
		</div>
	</div> -->
	

</body>

</html>