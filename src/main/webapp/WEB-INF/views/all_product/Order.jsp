<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="utf-8"%>
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
<meta charset="utf-8">
<title>주문 페이지 입니다.</title>
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
                        <h4 class="card-title">주문완료페이지</h4>
                        <h4 clss="alert alert-danger">주문해 주셔서 감사합니다.</h4>
                        <p>소중한 상품 안전하게 배송해 드리겠습니다.</p>
                        <p>주문 번호 : ${order.oderNum}
                        <p>배송지 : ${order.addr}
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
                                                                상품명
                                                            </th>
                                                            <th class="text-center" tabindex="0" aria-controls="example" rowspan="1" colspan="1" aria-label="Product: activate to sort column descending" aria-sort="ascending" style="width: 177px;">
                                                                수량
                                                            </th>
                                                            <th class="text-center" tabindex="0" aria-controls="example" rowspan="1" colspan="1" aria-label="Policy holder: activate to sort column ascending" style="width: 200px;">
                                                                단가
                                                            </th>
                                                            <th class="text-center" tabindex="0" aria-controls="example" rowspan="1" colspan="1" aria-label="Premium: activate to sort column ascending" style="width: 149px;">
                                                                총금액
                                                            </th>
                                                            <th class="text-center" tabindex="0" aria-controls="example" rowspan="1" colspan="1" aria-label="Status: activate to sort column ascending" style="width: 149px;">
                                                                비고
                                                            </th>
                                                        </tr>
                                                    </thead>

                                                    <tr>

                                                        <td class="text-center m-0">    
                                                            <p class="useid m-0">${order.productName}</p>
                                                        </td>
                                                    
	                                                    <td class="text-center">
	                                                        ${order.amount}
	                                                    </td>
	                                                    
	                                                    <td class="text-center">
	                                                        ${order.price}
	                                                    </td>
	                                                    
	                                                    <td class="text-center">
	                                                        ${order.totalPrice}
	                                                    </td>
	
	                                                    <td class=" no-gutters p-0 text-center">
	                                                        
	                                                    </td>
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
</body>
</html>