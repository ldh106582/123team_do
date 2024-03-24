<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>매출 페이지</title>
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
                               <h1 class="col-md-12 card-title">나의 판매 내역</h1>
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
                                                                    이미지
                                                                    </th>
                                                                   <th class="text-center" tabindex="0" aria-controls="example" rowspan="1" colspan="1" aria-label="Product: activate to sort column descending" aria-sort="ascending" style="width: 177px;">
                                                                    상품이름
                                                                    </th>
                                                                   <th class="text-center" tabindex="0" aria-controls="example" rowspan="1" colspan="1" aria-label="Product: activate to sort column descending" aria-sort="ascending" style="width: 177px;">
                                                                    재고수 
                                                                    </th>                                                          
                                                                   <th class="text-center" tabindex="0" aria-controls="example" rowspan="1" colspan="1" aria-label="Business type: activate to sort column ascending" style="width: 210px;">
                                                                    단가
                                                                   </th>
																	<th class="text-center" tabindex="0" aria-controls="example" rowspan="1" colspan="1" aria-label="Business type: activate to sort column ascending" style="width: 210px;">
                                                                    비고
                                                                   </th>
                 
                                                               </tr>
                                                           </thead>
                                                           
                                                    <c:forEach items="${listOfOrder}" var="list">			
                                                           <tr>
                                                                ${nothing}
                                                               <td class="text-center m-0">    
                                                                ${list.productname}
                                                               </td>
                                                               <td class="text-center">
                                                                ${list.image}
                                                               </td>
                                                               <td class="text-center">
                                                                ${list.title}
                                                               </td>
                                                               <td class="text-center">
                                                                ${list.context}
                                                               </td>
                                                               <td class="text-center">
                                                                ${list.registDay}
                                                               </td>
                                                               <td class="text-center">
                                                               
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
     
</body>
</html>