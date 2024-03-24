<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>나의 주문이 들어온 페이지</title>
</head>
<body>
<div id="header">
		<%@  include file="../module/header.jsp" %>
	</div>
<div class="container-fluid page-body-wrapper">
 		<%@  include file="../module/leftheader.jsp" %>

	<div class="d-flex">
	    <div class="col-12 border">
	        <div class="card">
	            <div class="card-body">
	                <h1 class="col-md-12 card-title">주문확인</h1>
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
	                                                    상품이름
	                                                </th>
	                                                <th class="text-center" tabindex="0" aria-controls="example" rowspan="1" colspan="1" aria-label="Product: activate to sort column descending" aria-sort="ascending" style="width: 177px;">
	                                                    상품 ID
	                                                </th>
	                                                <th class="text-center" tabindex="0" aria-controls="example" rowspan="1" colspan="1" aria-label="Business type: activate to sort column ascending" style="width: 210px;">
	                                                    주문 갯수
	                                                </th>
	                                                <th class="text-center" tabindex="0" aria-controls="example" rowspan="1" colspan="1" aria-label="Policy holder: activate to sort column ascending" style="width: 200px;">
	                                                    상품 가격 
	                                                </th>
	                                                <th class="text-center" tabindex="0" aria-controls="example" rowspan="1" colspan="1" aria-label="Premium: activate to sort column ascending" style="width: 149px;">
	                                                    총 가격
	                                                </th>
	                                                <th class="text-center" tabindex="0" aria-controls="example" rowspan="1" colspan="1" aria-label="Premium: activate to sort column ascending" style="width: 149px;">
	                                                    주문자 이름
	                                                </th>
	                                                <th class="text-center" tabindex="0" aria-controls="example" rowspan="1" colspan="1" aria-label="Premium: activate to sort column ascending" style="width: 149px;">
	                                                    배송지 주소
	                                                </th>
	                                                <th class="text-center" tabindex="0" aria-controls="example" rowspan="1" colspan="1" aria-label="Premium: activate to sort column ascending" style="width: 149px;">
	                                                    주문일
	                                                </th>
	                                                <th class="text-center" tabindex="0" aria-controls="example" rowspan="1" colspan="1" aria-label="Premium: activate to sort column ascending" style="width: 149px;">
	                                                    승인/거절
	                                                </th>
	                                            </tr>
	                                        </thead>
	                                        
	                                            <c:forEach items="${permissionlist}" var="list">		
	                                        <tr>
	                                            <td class="text-center m-0">    
	                                                <p class="useid m-0">${list.productName}</p>
	                                            </td>
	                                            <td class="text-center">
	                                                ${list.productId}
	                                            </td>
	                                            <td class="text-center">
	                                                ${list.amount}
	                                            </td>
	                                            <td class="text-center">
	                                                ${list.price}
	                                            </td>
	                                            <td class="text-center">
	                                                ${list.totalPrice}
	                                            </td>
	                                            <td class="text-center">
	                                                ${list.personId}
	                                            </td>
	                                            <td class="text-center">
	                                                ${list.personAddress}
	                                            </td>
	                                            <td class="text-center">
	                                                ${list.orderDate}
	                                            </td>
	                                            <td class="text-center">
	                                                <a href="permit?dec=승인&num=${list.oderNum}">승인</a>
	                                                <a href="permit?dec=거절&num=${list.oderNum}">거절</a>
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
 <%@ include file="../module/footer.jsp" %>
</div>

</body>
</html>