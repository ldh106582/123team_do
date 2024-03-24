<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="com.springmvc.domain.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.4.1/dist/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
<title>Insert title here</title>
<script type="text/javascript">
	function changed(eid,registday) {
			var container = document.getElementById("container"+eid);
			var delp = document.getElementById("willdelete"+eid);
			var addp = document.getElementById("addp"+eid);
			
			console.log(eid);
			container.removeChild(delp);
			container.removeChild(addp);
			
			var form = document.createElement("form");
			form.setAttribute("action","/123team/ENboards/updateapp");
			form.setAttribute("method","POST");
			
			var inputT = document.createElement("input");
			inputT.setAttribute("type","hidden");
			inputT.setAttribute("name","eid");
			inputT.setAttribute("value",eid);
			
			var inputD = document.createElement("input");
			inputD.setAttribute("type","datetime-local");
			inputD.setAttribute("name","registDay");
			inputD.setAttribute("value",registday);
			
			var inputO = document.createElement("input");
			inputO.setAttribute("type","hidden");
			inputO.setAttribute("name","originday");
			inputO.setAttribute("value",registday);
			
			var inputs = document.createElement("input");
			inputs.setAttribute("type","submit");
			inputs.setAttribute("value","변경하기");
			
			var button = document.createElement("button");
			button.setAttribute("onclick",cancelForm());
			var buttonText = document.createTextNode("취소");
			button.appendChild(buttonText);
			
			form.appendChild(inputT);
			form.appendChild(inputD);
			form.appendChild(inputs);
			form.appendChild(inputO);
			form.appendChild(button);
			
			container.appendChild(form);
	}
	function cancelForm() {
         var form = document.querySelector("form");
         if (form) {
             form.remove();
         }
     }
</script>
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
			                        <th>동물</th>
			                        <th>예약일</th>
			                        <th>상태</th>
			                        <th>예약취소</th>
			                    </tr>  
			                    </thead>
			                    <tbody>
			                        <c:forEach items="${applist}" var="app">
			                            <tr>
			                                <td class="font-weight-bold"><a href="/123team/ENboards/ENboard?boardId=${app.boardId}">${app.experience}</a></td>
			                                <td class="font-weight-bold"><p class="card-text">${app.animal}</p></td>
			                                <td class="font-weight-bold"><p class="card-text" id="willdelete${app.eid}"><span>${app.registDay}</span></p></td>
			                                <c:choose>
												<c:when test="${app.state eq '승인'}">
													<td class="font-weight-medium"><div class="badge badge-success">예약완료</div></td>
												</c:when>
												<c:when test="${app.state eq '거절'}">
													<td class="font-weight-medium"><div class="badge badge-danger">예약취소</div></td>
												</c:when>
												<c:otherwise>
													<td class="font-weight-medium"><div class="badge badge-warning">처리중</div></td>
												</c:otherwise>
											</c:choose>
											<td class="font-weight-medium"><a href="deleteapp?eid=${app.eid}" class="badge badge-danger">예약 취소</a></td>
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
 <div class="container">
    <h2 class="my-3">내 체험단 예약현황</h2>
    <a href="/123team/ENboards" class="btn btn-primary mb-3">체험단 공고글 목록으로 돌아가기</a>

    <c:forEach items="${applist}" var="app">
        <div class="card mb-3">
            <div class="card-body" id="container${app.eid}">
                <h5 class="card-title">${app.title}</h5>
                <p class="card-text">${app.experience}</p>
                <p class="card-text">${app.animal}</p>
                <p class="card-text">${app.state}</p>
                <p class="card-text" id="willdelete${app.eid}">예약일 : <span >${app.registDay}</span></p>
              	<button class="btn btn-primary" onclick="changed('${app.eid}','${app.registDay}')" id="addp${app.eid}" >날짜 변경</button>
            </div>
            <div class="card-body" >
            <a href="deleteapp?eid=${app.eid}" class="btn btn-danger">예약 삭제</a>
            </div>
            
        </div>
    </c:forEach>
</div>

	<%@ include file="../module/footer.jsp" %> --%>
 <%-- 
=======
   <nav class="navbar navbar-expand navbar-dark bg-success">
        <div class="container">
            <div class="navbar-header">
                <a class="navbar-brand" href="/123team">Home</a>
            </div>
            <div class="collapse navbar-collapse justify-content-end" id="navbarNav">
              <ul class="navbar-nav">
                <li class="nav-item">
                  <a class="nav-link" href="/123team/hospital">병원</a>
                </li>
                <li class="nav-item">
                  <a class="nav-link" href="/123team/products">동물상품</a>
                </li>
                <li class="nav-item">
                  <a class="nav-link" href="/123team/Fboards">게시판</a>
                </li>
 				<c:choose>             
	            <c:when test="${not empty managerId }">
	                	
	                <li class="nav-item">
	                  <a class="nav-link" href="/123team/managerlogin/manager_page?personId=${managerId.personId}">마이페이지</a>
	                </li>
	                
	            </c:when>
	               	<c:otherwise>
		                <li class="nav-item">
		                  <a class="nav-link" href="/123team/login">로그인</a>
		                </li>
	                </c:otherwise>
                </c:choose>
>>>>>>> fa9e400f8ceb5c1826ec622c185d981968432be3
	<h2>내 체험단 예약현황</h2>
	<a href="/123team/ENboards">체험단 공고글 목록으로 돌아가기</a>
	<p>
	-------------------------------------------------------------------------------
	<c:forEach items="${applist}" var="app">
			<p>
			체험 제목 :${app.title}
			<p>
			체험 :${app.experience}
			<p>
			동물 :${app.animal}
			<p>
			처리상태 :${app.state}
			
		<div id="container">
			<b id="willdelete${app.eid}">예약일 : ${app.registDay}</b>
			<button onclick="changed('${app.eid}','${app.registDay}')" id="addp${app.eid}" >날짜 변경</button>
		</div>
		<p>
		<a href="deleteapp?eid=${app.eid}"><button>예약 삭제</button></a>
		<p>
		-------------------------------------------------------------------------------
	</c:forEach>
	 --%>
	

<%--  
 <div class="container">
    <h2 class="my-3">내 체험단 예약현황</h2>
    <a href="/123team/ENboards" class="btn btn-primary mb-3">체험단 공고글 목록으로 돌아가기</a>

    <c:forEach items="${applist}" var="app">
        <div class="card mb-3">
            <div class="card-body" id="container${app.eid}">
                <h5 class="card-title">${app.title}</h5>
                <p class="card-text">${app.experience}</p>
                <p class="card-text">${app.animal}</p>
                <p class="card-text">${app.state}</p>
                <p class="card-text" id="willdelete${app.eid}">예약일 : <span >${app.registDay}</span></p>
              	<button class="btn btn-primary" onclick="changed('${app.eid}','${app.registDay}')" id="addp${app.eid}" >날짜 변경</button>
            </div>
            <div class="card-body" >
            <a href="deleteapp?eid=${app.eid}" class="btn btn-danger">예약 삭제</a>
            </div>
            
        </div>
    </c:forEach>
</div>

	<%@ include file="../module/footer.jsp" %> --%>
 <%-- 
=======
   <nav class="navbar navbar-expand navbar-dark bg-success">
        <div class="container">
            <div class="navbar-header">
                <a class="navbar-brand" href="/123team">Home</a>
            </div>
            <div class="collapse navbar-collapse justify-content-end" id="navbarNav">
              <ul class="navbar-nav">
                <li class="nav-item">
                  <a class="nav-link" href="/123team/hospital">병원</a>
                </li>
                <li class="nav-item">
                  <a class="nav-link" href="/123team/products">동물상품</a>
                </li>
                <li class="nav-item">
                  <a class="nav-link" href="/123team/Fboards">게시판</a>
                </li>
 				<c:choose>             
	            <c:when test="${not empty managerId }">
	                	
	                <li class="nav-item">
	                  <a class="nav-link" href="/123team/managerlogin/manager_page?personId=${managerId.personId}">마이페이지</a>
	                </li>
	                
	            </c:when>
	               	<c:otherwise>
		                <li class="nav-item">
		                  <a class="nav-link" href="/123team/login">로그인</a>
		                </li>
	                </c:otherwise>
                </c:choose>
>>>>>>> fa9e400f8ceb5c1826ec622c185d981968432be3
	<h2>내 체험단 예약현황</h2>
	<a href="/123team/ENboards">체험단 공고글 목록으로 돌아가기</a>
	<p>
	-------------------------------------------------------------------------------
	<c:forEach items="${applist}" var="app">
			<p>
			체험 제목 :${app.title}
			<p>
			체험 :${app.experience}
			<p>
			동물 :${app.animal}
			<p>
			처리상태 :${app.state}
			
		<div id="container">
			<b id="willdelete${app.eid}">예약일 : ${app.registDay}</b>
			<button onclick="changed('${app.eid}','${app.registDay}')" id="addp${app.eid}" >날짜 변경</button>
		</div>
		<p>
		<a href="deleteapp?eid=${app.eid}"><button>예약 삭제</button></a>
		<p>
		-------------------------------------------------------------------------------
	</c:forEach>
	 --%>
	

<%--  
 <div class="container">
    <h2 class="my-3">내 체험단 예약현황</h2>
    <a href="/123team/ENboards" class="btn btn-primary mb-3">체험단 공고글 목록으로 돌아가기</a>

    <c:forEach items="${applist}" var="app">
        <div class="card mb-3">
            <div class="card-body" id="container${app.eid}">
                <h5 class="card-title">${app.title}</h5>
                <p class="card-text">${app.experience}</p>
                <p class="card-text">${app.animal}</p>
                <p class="card-text">${app.state}</p>
                <p class="card-text" id="willdelete${app.eid}">예약일 : <span >${app.registDay}</span></p>
              	<button class="btn btn-primary" onclick="changed('${app.eid}','${app.registDay}')" id="addp${app.eid}" >날짜 변경</button>
            </div>
            <div class="card-body" >
            <a href="deleteapp?eid=${app.eid}" class="btn btn-danger">예약 삭제</a>
            </div>
            
        </div>
    </c:forEach>
</div>

	<%@ include file="../module/footer.jsp" %> --%>
 <%-- 
=======
   <nav class="navbar navbar-expand navbar-dark bg-success">
        <div class="container">
            <div class="navbar-header">
                <a class="navbar-brand" href="/123team">Home</a>
            </div>
            <div class="collapse navbar-collapse justify-content-end" id="navbarNav">
              <ul class="navbar-nav">
                <li class="nav-item">
                  <a class="nav-link" href="/123team/hospital">병원</a>
                </li>
                <li class="nav-item">
                  <a class="nav-link" href="/123team/products">동물상품</a>
                </li>
                <li class="nav-item">
                  <a class="nav-link" href="/123team/Fboards">게시판</a>
                </li>
 				<c:choose>             
	            <c:when test="${not empty managerId }">
	                	
	                <li class="nav-item">
	                  <a class="nav-link" href="/123team/managerlogin/manager_page?personId=${managerId.personId}">마이페이지</a>
	                </li>
	                
	            </c:when>
	               	<c:otherwise>
		                <li class="nav-item">
		                  <a class="nav-link" href="/123team/login">로그인</a>
		                </li>
	                </c:otherwise>
                </c:choose>
>>>>>>> fa9e400f8ceb5c1826ec622c185d981968432be3
	<h2>내 체험단 예약현황</h2>
	<a href="/123team/ENboards">체험단 공고글 목록으로 돌아가기</a>
	<p>
	-------------------------------------------------------------------------------
	<c:forEach items="${applist}" var="app">
			<p>
			체험 제목 :${app.title}
			<p>
			체험 :${app.experience}
			<p>
			동물 :${app.animal}
			<p>
			처리상태 :${app.state}
			
		<div id="container">
			<b id="willdelete${app.eid}">예약일 : ${app.registDay}</b>
			<button onclick="changed('${app.eid}','${app.registDay}')" id="addp${app.eid}" >날짜 변경</button>
		</div>
		<p>
		<a href="deleteapp?eid=${app.eid}"><button>예약 삭제</button></a>
		<p>
		-------------------------------------------------------------------------------
	</c:forEach>
	 --%>
	
</body>
</html>