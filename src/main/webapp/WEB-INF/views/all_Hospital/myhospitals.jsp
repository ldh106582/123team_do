<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.4.1/dist/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
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
                               <h1 class="col-md-12 card-title">내 병원 목록</h1>
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
                                                                       병원이름
                                                                   </th>
                                                                   <th class="text-center" tabindex="0" aria-controls="example" rowspan="1" colspan="1" aria-label="Product: activate to sort column descending" aria-sort="ascending" style="width: 177px;">
                                                                        이미지
                                                                    </th>
                                                                   <th class="text-center" tabindex="0" aria-controls="example" rowspan="1" colspan="1" aria-label="Product: activate to sort column descending" aria-sort="ascending" style="width: 177px;">
                                                                       병원주소
                                                                   </th>
                                                                   <th class="text-center" tabindex="0" aria-controls="example" rowspan="1" colspan="1" aria-label="Business type: activate to sort column ascending" style="width: 210px;">
                                                                       진료시간
                                                                   </th>
                                                                   <th class="text-center" tabindex="0" aria-controls="example" rowspan="1" colspan="1" aria-label="Policy holder: activate to sort column ascending" style="width: 200px;">
                                                                       주차유무
                                                                   </th>
                                                                   <th class="text-center" tabindex="0" aria-controls="example" rowspan="1" colspan="1" aria-label="Premium: activate to sort column ascending" style="width: 149px;">
                                                                       설명
                                                                   </th>
                                                                   <th class="text-center" tabindex="0" aria-controls="example" rowspan="1" colspan="1" aria-label="Status: activate to sort column ascending" style="width: 149px;">
                                                                       주문금액
                                                                   </th>
                                                                   <th class="text-center" tabindex="0" aria-controls="example" rowspan="1" colspan="1" aria-label="Status: activate to sort column ascending" style="width: 149px;">
                                                                        리뷰점수
                                                                   </th>
                                                                   <th class="text-center" tabindex="0" aria-controls="example" rowspan="1" colspan="1" aria-label="Status: activate to sort column ascending" style="width: 149px;">
                                                                    리뷰수
                                                                    </th>
                                                                    <th class="text-center" tabindex="0" aria-controls="example" rowspan="1" colspan="1" aria-label="Status: activate to sort column ascending" style="width: 149px;">
                                                                    수정
                                                                    </th>
                                                               </tr>
                                                           </thead>
                                                           
                                                    <c:forEach items="${hospitals}" var="hospital">			
                                                           <tr>

                                                               <td class="text-center">
                                                                    ${hospital.name}
                                                               </td>
                                                               <td class="text-center">
                                                                    ${hospital.image}
                                                               </td>
                                                               <td class="text-center">
                                                                 ${hospital.addr}
                                                               </td>
                                                               <td class="text-center">
                                                                    ${hospital.runtime}
                                                               </td>
                                                               <td class="text-center">
                                                                ${hospital.parking}
                                                               </td>
                                                               <td class="text-center">
                                                                ${hospital.description}
                                                                </td> 
                                                                <td class="text-center">
                                                                    ${hospital.reviewScore}
                                                                </td> 
                                                                <td class="text-center">
                                                                    ${hospital.reviewCount}
                                                                </td> 
                                                                <td class="text-center">
                                                                    <a href="/123team/hospitals/update?hid=${hospital.hid}"">병원 수정</a> <a href="/123team/hospitals/delete?hid=${hospital.hid}" onclick="alert('정말 삭제 하시겠습니까?')">병원 삭제</a> 
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
	<%@  include file="../module/footer.jsp" %>
</body>
</html>