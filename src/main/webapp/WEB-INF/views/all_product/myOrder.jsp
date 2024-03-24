<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>나의 전체 주문내역 페이지</title>
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
                                                                    주문상품
                                                                </th>
                                                                <th class="text-center" tabindex="0" aria-controls="example" rowspan="1" colspan="1" aria-label="Product: activate to sort column descending" aria-sort="ascending" style="width: 177px;">
                                                                    상품이미지
                                                                </th>
                                                                <th class="text-center" tabindex="0" aria-controls="example" rowspan="1" colspan="1" aria-label="Business type: activate to sort column ascending" style="width: 210px;">
                                                                    주문일자
                                                                </th>
                                                                <th class="text-center" tabindex="0" aria-controls="example" rowspan="1" colspan="1" aria-label="Policy holder: activate to sort column ascending" style="width: 200px;">
                                                                    주문수량
                                                                </th>
                                                                <th class="text-center" tabindex="0" aria-controls="example" rowspan="1" colspan="1" aria-label="Premium: activate to sort column ascending" style="width: 149px;">
                                                                    상품단가
                                                                </th>
                                                                <th class="text-center" tabindex="0" aria-controls="example" rowspan="1" colspan="1" aria-label="Status: activate to sort column ascending" style="width: 149px;">
                                                                    주문금액
                                                                </th>
                                                            </tr>
                                                        </thead>
                                                        
												 <c:forEach items="${booklist}" var="book">			
                                                        <tr>

													        <td class="text-center m-0">    
													            <p class="useid m-0">${book.bid}</p>
													        </td>
													        <td class="text-center">
													            ${book.hospitalName}
													        </td>
													        <td class="text-center">
													            ${book.registDay}
													            <button onclick="changed('${book.bid}','${book.registDay}')" id="addp${book.bid}" class="btn btn-outline-primary mr-2" style="margin: 0% 6.5% 0% 0%;">날짜 변경</button>
													        </td>
													        <td class="text-center">
													            ${book.context}
													        </td>
													        <td class="text-center">
													            <a class="btn btn-outline-danger" href="deletebook?bid=${book.bid}">예약취소</a>
													        </td>
													        <td class="text-center">
													            ${book.state}
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

</body>
</html>