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
			    <div class="card">
			        <div class="card-body ">
			            <p class="card-title">체험단 신청 목록</p>
			            <a href="/123team/ENboards" class="btn btn-primary">체험단 공고글 목록으로 돌아가기</a>
			            <div class="table-responsive">
			                <table class="table table-striped table-borderless">
			                    <thead>
			                    <tr>
			                        <th>체험명</th>
			                        <th>신청자 ID</th>
			                        <th>동물</th>
			                        <th>예약일</th>
			                        <th>승인</th>
			                        <th>거절</th>
			                    </tr>  
			                    </thead>
			                    <tbody>
			                        <c:forEach items="${applists}" var="app">
			                            <tr>
			                                <td class="font-weight-bold"><a href="/123team/ENboards/ENboard?boardId=${app.boardId}">${app.experience}</a></td>
			                                <td class="font-weight-bold"><p class="card-text">${app.personId}</p></td>
			                                <td class="font-weight-bold"><p class="card-text">${app.animal}</p></td>
			                                <td class="font-weight-bold"><p class="card-text" id="willdelete${app.eid}"><span>${app.registDay}</span></p></td>
			                                <td class="font-weight-medium"><a href="decision?dec=승인&eid=${app.eid}"class="badge badge-success">승인</a>
											<td class="font-weight-medium"><a href="decision?dec=거부&eid=${app.eid}"class="badge badge-danger">거부</a></td>
			                            </tr>
			                        </c:forEach>
			                    </tbody>
			                </table>
			            </div>
			        </div>
			    </div>
			</div>
		</div>
	</div>		
	
	<%@ include file="../module/footer.jsp" %>
	<%-- 
 	<div class="container my-3">
        <h1>체험 신청관리 페이지</h1>
        <c:forEach items="${applists}" var="app">
	        <div class="row">
	            <div class="col-md-12">
	                <h1 class="mt-4">${app.title}</h1>
	                <hr>
	                <div class="col-md-12">
	                	<h5> 신청자 ID : ${app.personId} &emsp;&emsp; 예약일 : ${app.registDay}</h5>
	                </div>
	                <hr>
	                <div class="col-md-12" style="height: 200px;">
	                    <p class="">${board.context}</p>
	                </div>
	                <hr>
	                <a href="decision?dec=승인&eid=${app.eid}"class="btn btn-primary">승인</a>
	                <a href="decision?dec=거부&eid=${app.eid}"class="btn btn-danger">거부</a>
	            </div>
	        </div>
        </c:forEach>
        ${nothing}
	</div>
 	
 	<%@ include file="../module/footer.jsp" %>
 	 --%>
 	<%-- 
	<h2>체험 신청관리 페이지</h2>
	<c:forEach items="${applists}" var="app">
		<div>
			<p>
	 	신청자 ID : ${app.personId}
	 	<p>
	 	신청한 체험 제목 : ${app.title}
	 	<p>
	 	예약일 : ${app.registDay}
	 	<p>
	 	<a href="decision?dec=승인&eid=${app.eid}"><button>승인</button></a> || <a href="decision?dec=거부&eid=${app.eid}"><button>거부</button></a>
		</div>
	</c:forEach>
	 --%>
	
</body>
</html>