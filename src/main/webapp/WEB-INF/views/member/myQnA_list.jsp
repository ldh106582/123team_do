<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.4.1/dist/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
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
                               <h1 class="col-md-12 card-title">나의 Q&A</h1>
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
                                                                    이미지
                                                                    </th>
                                                                   <th class="text-center" tabindex="0" aria-controls="example" rowspan="1" colspan="1" aria-label="Product: activate to sort column descending" aria-sort="ascending" style="width: 177px;">
                                                                        제목
                                                                    </th>
                                                                   <th class="text-center" tabindex="0" aria-controls="example" rowspan="1" colspan="1" aria-label="Product: activate to sort column descending" aria-sort="ascending" style="width: 177px;">
                                                                       내용
                                                                   </th>
                                                                   <th class="text-center" tabindex="0" aria-controls="example" rowspan="1" colspan="1" aria-label="Business type: activate to sort column ascending" style="width: 210px;">
                                                                       등록일
                                                                   </th>
                 
                                                               </tr>
                                                           </thead>
                                                           
                                                    <c:forEach items="${QNA}" var="list">			
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
           <%@ include file="../module/footer.jsp" %>
</body>
</html>

<%
	//int i=0;
%>
 <!-- 작성한 QNA없을때 출력할 문구 -->
<!-- 	<c:forEach items="${QNA}" var="list">
	<div>
	QNA내용
		${list.productname}
		${list.title}
		${list.context}
		${list.registDay}
		${list.image}
		<br>
	답변
		<c:forEach items="${list.commentlist}" var="list2">
		${list2.comment}
		${list2.registDay}
		${nothing+i}<!-- 답변이 없을때 출력할 문구 -->
		<%
			// i++;
		%>
<!--		</c:forEach>
	</div>
	</c:forEach> -->
