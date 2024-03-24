<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.4.1/dist/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
<link rel="stylesheet" href="/123team/resources/css/mypage.css">
<title>Insert title here</title>
</head>
<body style="font-family: KCC-Ganpan;">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="./resources/js/refreshing.js"></script>

<div id="header">
		<%@  include file="../module/header.jsp" %>
	</div>
	
<div class="container-fluid page-body-wrapper">
<%@  include file="../module/leftheader.jsp" %>
	<div id="container" class="container wrap naverid" style="height: 1100px">	
		<div id="wrap" class="wrap naverid ">
		    <header class="header" role="banner">
		        <div class="header_subindex">
		            <!--로고/Mypage-->
		            <div class="gnb_area">
		                <a href="#" class="text-decoration-none" >
		                    <h2 class="col-8" style="fontsize: 11px;">Hospital</h2>
		                </a>
		            </div>
		        </div>
		        <!--프로필-->
			      <div class="profile_area">
		            <div class="profile_inner">
		                <a onclick="changeImage()" class="photo">
		                   	<c:choose>
							<c:when test="${not empty id.image}">
							  <img src="<c:url value='/resources/images/${id.image}'/>" width="84" height="84" alt="프로필 이미지">
							</c:when>
							<c:otherwise>
							  <img src="https://static.nid.naver.com/images/web/user/default.png" width="84" height="84" alt="프로필 이미지">
							</c:otherwise>
							</c:choose>
		                    <span class="photo_edit"></span>
		                </a>
		                <div class="profile">
		                    <p class="useid">${ id.personId } 사장님 </p>
		                    <p class="usemail">${id.personEmail } 입니다. </p>
		                </div>
		            </div>
		        </div>
		        <div id="headerLeft" class="header_left" aria-hidden="false">
	               <ul class="left_menu" role="menu">
	                   <li>
	                       <a href="./pet/creatpet?id=${ id.personId }" class="left_item" role="menuitem" >
	                           <div class="menu_text ">반려동물 회원가입</div>
	                       </a>
	                    </li>
	                    <li>
	                       <a href="/123team/login/logout" class="left_item" role="menuitem" >
	                           <div class="menu_text ">로그아웃</div>
	                       </a>
	                    </li>
	                    <li>
			               <div class="left_item" role="menuitem" >
			                   <div class="menu_text ">펫 카드</div>
			               </div>
							<c:forEach items="${petName}" var="petName">
								<a href="/123team/login/petcard?petid=${petName.petId}" class="left_item" role="menuitem">
								<div>${petName.petName }</div>
								</a>
							</c:forEach>
		            	</li>
	               </ul>
		        </div>
		    </header>
	    
	        <div id="container" class="container ">
	            <!-- container -->
	            <div id="content" class="content">
	                <div class="subindex_wrap" role="main">
	                    <div id="headerTop" class="path_area" aria-hidden="false"></div>
	                </div>
	                <div class="subindex_item col-md-12">
	                    <div class="col-md-12 grid-margin transparent">
	                        <div class="row">
	                            <div class="col-md-6 stretch-card transparent">
	                                <div class="card card-tale">
	                                    <div class="card-body"  onclick="location.href='getmyhospitals'">
	                                        <p class="mb-4">내 병원 수</p>
	                                        <p class="fs-30 mb-2">${count}</p>
	                                         <p class="fs-28">병원 내역 / 수정 </p>
	                                    </div>
	                                </div>
	                            </div>
	                            <div class="col-md-6 stretch-card transparent">
	                                <div class="card card-dark-blue">
	                                    <div class="card-body">
	                                        <p class="mb-4">오늘 예약자 수</p>
	                                        <p class="fs-28 mb-2">${donthavetoday}</p>
	                                    </div>
	                                </div>
	                            </div>
	                        </div>
	                    </div>
	                </div>
	    
	                <div class="d-flex">
	                    <div class="col-12">
	                        <div class="card">
	                            <div class="card-body">
	                                <h1 class="col-md-12 card-title">오늘 예약 확인</h1>
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
	                                                                    예약번호
	                                                                </th>
	                                                                <th class="text-center" tabindex="0" aria-controls="example" rowspan="1" colspan="1" aria-label="Product: activate to sort column descending" aria-sort="ascending" style="width: 177px;">
	                                                                    예약시간
	                                                                </th>
	                                                                <th class="text-center" tabindex="0" aria-controls="example" rowspan="1" colspan="1" aria-label="Business type: activate to sort column ascending" style="width: 210px;">
	                                                                    예약자ID
	                                                                </th>
	                                                                <th class="text-center" tabindex="0" aria-controls="example" rowspan="1" colspan="1" aria-label="Policy holder: activate to sort column ascending" style="width: 200px;">
	                                                                    petcard 
	                                                                </th>
	                                                                <th class="text-center" tabindex="0" aria-controls="example" rowspan="1" colspan="1" aria-label="Premium: activate to sort column ascending" style="width: 149px;">
	                                                                    승인/거절
	                                                                </th>
	                                                            </tr>
	                                                        </thead>
	                                                        
	                                                            <c:forEach items="${todaybooklist}" var="list">		
	                                                        <tr>
	                                                            <td class="text-center m-0">    
	                                                                <p class="useid m-0">${list.bid}</p>
	                                                            </td>
	                                                            <td class="text-center">
	                                                                ${list.registDay}
	                                                            </td>
	                                                            <td class="text-center">
	                                                                ${list.personId}
	                                                            </td>
	                                                            <td class="text-center">
	                                                                <c:set var="petId" value="${list.petId}" />
	                                                                <% 
	                                                                    String petId = (String)pageContext.getAttribute("petId");
	                                                                    String[] petnamelist = petId.split(",");
	                                                                    for(int i=0;i<petnamelist.length;i++)
	                                                                    {
	                                                                        request.setAttribute("pet", petnamelist[i]);
	                                                                %>
	                                                                <td>
	                                                                    <a href="/123team/login/petcard?petid=${pet}">${pet} 정보 보기</a>   
	                                                                </td>
	                                                                <%
	                                                                    }
	                                                                %>
	                                                            </td>
	                                                            <td class="text-center">
	                                                                <a href="decision?dec=승인&num=${list.bid}">승인</a>
	                                                                <a href="decision?dec=거절&num=${list.bid}">거절</a>
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
				<br><br><hr>
		            <div class="d-flex">
		                <div class="col-12">
		                    <div class="card">
		                        <div class="card-body">
		                            <h1 class="col-md-12 card-title">전체 진료 내역 ${donthavebooklist}</h1>
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
		                                                                예약번호
		                                                            </th>
		                                                            <th class="text-center" tabindex="0" aria-controls="example" rowspan="1" colspan="1" aria-label="Product: activate to sort column descending" aria-sort="ascending" style="width: 177px;">
		                                                                예약시간
		                                                            </th>
		                                                            <th class="text-center" tabindex="0" aria-controls="example" rowspan="1" colspan="1" aria-label="Business type: activate to sort column ascending" style="width: 210px;">
		                                                                예약자ID
		                                                            </th>
		                                                            <th class="text-center" tabindex="0" aria-controls="example" rowspan="1" colspan="1" aria-label="Policy holder: activate to sort column ascending" style="width: 200px;">
		                                                                병원이름 
		                                                            </th>
		                                                            <th class="text-center" tabindex="0" aria-controls="example" rowspan="1" colspan="1" aria-label="Premium: activate to sort column ascending" style="width: 149px;">
		                                                                진료내역
		                                                            </th>
		                                                        </tr>
		                                                    </thead>
		                                                    
		                                                        <c:forEach items="${allbooklist}" var="list">		
		                                                    <tr>
		                                                        <td class="text-center m-0">    
		                                                            <p class="useid m-0">${list.productName}</p>
		                                                        </td>
		                                                        <td class="text-center">
		                                                            ${list.registDay}
		                                                        </td>
		                                                        <td class="text-center">
		                                                            ${list.personId}
		                                                        </td>
		                                                        <td class="text-center">
		                                                            ${list.hospitalName}
		                                                        </td>
		                                                        <td class="text-center">
		                                                            $${list.context}
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
 </div>
 </div>
     <%@ include file="../module/footer.jsp" %>
</body>
</html>

<!-- 내 병원 수 : ${count} ${donthavehospital}
 		<br>
 		${nothing}
		오늘 예약자 : ${donthavetoday}
		<c:forEach items="${todaybooklist}" var="list">
		<br>
		병원 이름 : ${list.hospitalName}
		예약 번호 : ${list.bid}
		예약 시간 : ${list.registDay}
		예약자 ID : ${list.personId}
		<c:set var="petId" value="${list.petId}" />
	       <% 
	          // String petId = (String)pageContext.getAttribute("petId");
	          // String[] petnamelist = petId.split(",");
	          // for(int i=0;i<petnamelist.length;i++)
	           //{
	            //   request.setAttribute("pet", petnamelist[i]);
	       %>
	       <td>
	           <a href="/123team/login/petcard?petid=${pet}">${pet} 정보 보기</a>   
	       </td>
	       <%
	        //   }
	       %>
		<a href="decision?dec=승인&num=${list.bid}">승인</a>
		<a href="decision?dec=거절&num=${list.bid}">거절</a>
	</c:forEach>
	<br>
	전체 진료 내역 : ${donthavebooklist}
	<c:forEach items="${allbooklist}" var="list">
		<br>
		예약 시간 : ${list.registDay}
		예약자 ID : ${list.personId}
		병원 이름 : ${list.hospitalName}
		병원 이름 : ${list.context}
	</c:forEach> -->