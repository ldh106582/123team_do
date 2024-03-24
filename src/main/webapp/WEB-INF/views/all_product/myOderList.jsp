<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.4.1/dist/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

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
                            	<h1 class="col-md-12 card-title">나의 주문 내역</h1>
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
                                                                    주문상품이름
                                                                </th>
                                                                <th class="text-center" tabindex="0" aria-controls="example" rowspan="1" colspan="1" aria-label="Product: activate to sort column descending" aria-sort="ascending" style="width: 177px;">
                                                                    주문갯수
                                                                </th>
                                                                <th class="text-center" tabindex="0" aria-controls="example" rowspan="1" colspan="1" aria-label="Business type: activate to sort column ascending" style="width: 210px;">
                                                                    상품단가
                                                                </th>
                                                                <th class="text-center" tabindex="0" aria-controls="example" rowspan="1" colspan="1" aria-label="Policy holder: activate to sort column ascending" style="width: 200px;">
                                                                    총가격 
                                                                </th>
                                                                <th class="text-center" tabindex="0" aria-controls="example" rowspan="1" colspan="1" aria-label="Premium: activate to sort column ascending" style="width: 149px;">
                                                                    배송지 주소
                                                                </th>
                                                                <th class="text-center" tabindex="0" aria-controls="example" rowspan="1" colspan="1" aria-label="Status: activate to sort column ascending" style="width: 149px;">
                                                                    주문일
                                                                </th>
                                                                <th class="text-center" tabindex="0" aria-controls="example" rowspan="1" colspan="1" aria-label="Status: activate to sort column ascending" style="width: 149px;">
                                                                    상태
                                                                </th>
                                                            </tr>
                                                        </thead>
                                                        
												 		<c:forEach items="${mylist}" var="list">		
                                                        <tr>
													        <td class="text-center m-0">    
													            <p class="useid m-0">${list.productName}</p>
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
													            ${list.personAddress}
													        </td>
													        <td class="text-center">
													           ${list.orderDate}
													        </td>    
													        <td class="text-center">
													           ${list.state}
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

<%@  include file="../module/footer.jsp" %>

<%-- 	/*	<br>
		상품 이름 : ${list.productName}
		상품 ID : ${list.productId}
		주문 갯수 : ${list.amount}
		상품 가격 : ${list.price}
		총 가격  : ${list.totalPrice}
		주문자 이름 : ${list.personId}
		배송지 주소 : ${list.personAddress}
		주문일 : ${list.orderDate}
		상태 : ${list.state} */ --%>

</body>
</html>