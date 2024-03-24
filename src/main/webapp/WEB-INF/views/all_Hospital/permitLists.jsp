<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.4.1/dist/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
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
                            <p class="card-title">예약자 정보 확인</p>
                        <div class="row">
                            <div class="col-12">
                            <div class="table-responsive">
                                <div id="example_wrapper" class="dataTables_wrapper dt-bootstrap4 no-footer">
                                    <div class="row">
                                        <div class="col-sm-12 col-md-6"></div>
                                        <div class="col-sm-12 col-md-6"></div>
                                    </div>
                                    <div class="row">
                                        <div class="col-sm-12">
                            <table id="example" class="display expandable-table dataTable no-footer" style="width: 100%;" role="grid">
                                <thead>
                                    <tr role="row">
                                        <th class="sorting_disabled" rowspan="1" aria-label="Quote#" style="width: 153px;">
                                            예약자ID
                                        </th>
                                        <th tabindex="0" aria-controls="example" rowspan="1" colspan="1" aria-label="Product: activate to sort column descending" aria-sort="ascending" style="width: 177px;">
                                            예약일자
                                        </th>
                                        <th tabindex="0" aria-controls="example" rowspan="1" colspan="1" aria-label="Business type: activate to sort column ascending" style="width: 210px;">
                                            진료 내용
                                        </th>
                                        <th tabindex="0" aria-controls="example" rowspan="1" colspan="1" aria-label="Policy holder: activate to sort column ascending" style="width: 200px;">
                                            비고
                                        </th>
                                        <th tabindex="0" aria-controls="example" rowspan="1" colspan="1" aria-label="Premium: activate to sort column ascending" style="width: 149px;">
                                            승인
                                        </th>
                                        <th tabindex="0" aria-controls="example" rowspan="1" colspan="1" aria-label="Status: activate to sort column ascending" style="width: 149px;">
                                            거부
                                        </th>
                                        <th tabindex="0" aria-controls="example" rowspan="1" colspan="1" aria-label="Updated at: activate to sort column ascending" style="width: 177px;">
                                            펫정보
                                        </th>
                                    </tr>
                                </thead>
                                ${nothing}
                         		
                         		<c:forEach items="${applists}" var="app">
                                <tr class="odd"> 
                                    <td class=" select-checkbox">
                                        <p class="useid">${ id.personId }</p>
                                    </td>
                                    <td class="sorting_1">
                                        ${app.registDay}
                                    </td>
                                    <td>
                                        ${app.context}
                                    </td>
                                    <td>
                                        
                                    </td>
                                    <td>
                                        <a href="decision?dec=승인&bid=${app.bid}"class="btn btn-primary">승인</a>
                                    </td>
                                    <td>
                                        <a href="decision?dec=거부&bid=${app.bid}"class="btn btn-danger">거부</a>
                                    </td>
                  					<c:forEach items="${pet}" var="pet">
                                    <td>
                                        <a href="/123team/login/petcard?petid=${pet}">${pet} 정보 보기</a>   
                                    </td>
 									</c:forEach>
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
 	<%@ include file="../module/footer.jsp" %>
	
</body>
</html>