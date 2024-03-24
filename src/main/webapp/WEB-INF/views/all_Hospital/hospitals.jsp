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

<style>

img{
	border-radius: 1%;
}

</style>

<body>

	<%
		request.setAttribute("type", session.getAttribute("type"));
		request.setAttribute("checktype", "h");
	%>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="./resources/js/refreshing.js"></script>

<div id="header">
		<%@  include file="../module/header.jsp" %>
	</div>


     <div class="container-fluid page-body-wrapper">

      <%@  include file="../module/leftheader.jsp" %>
               
                   
            <div class="main-panel ">
              <div class="content-wrapper ">
                 <div class="row mx-0 mx-auto">
                      <!--여기서 복붙 시작-->
                  <div class="show-gird no-gutters col-md-12 p-0 mb-4">
                    <div class="col-md-12 row no-gutters" style="margin: 0 auto;">
                      <div class="justify-content-end col-md-12">
                        <c:if test="${type == checktype}">
                          <a href="hospitals/create" class="btn btn-outline-primary float-right mr-2 btn-sm">병원 추가</a>
                          <a href="hospitals/manageapps?personId=${loginId}" class="btn btn-outline-primary float-right mr-3 btn-sm">모든예약보기</a>
                        </c:if>
                        <c:if test="${loginId != null && type!=checktype}">
                          <a href="hospitals/mybookList?personId=${loginId} " class="btn btn-outline-primary float-right mr-3 btn-sm">내 예약 보기</a>            
                        </c:if>
                      </div>
                    </div>
                  </div>

                  <div class="col-md-7 p-0 mr-3">
                    <div class="p-0" style="border-left: 3px solid red;" > <h3 style="margin-left: 2%;"> 우리 병원 현황</h3>
                    </div>
                    <br>
                    <h5 style="border-left: 3px solid #FF7EA0; margin-bottom: 3%;"><span class="ml-4">가장 가까운 병원</span></h5>
                    <div class="col-md-12 row card-group no-gutters p-0" style="margin-bottom: 3%;">
                      <c:forEach items="${hospitals}" var="hospital">
                        <div class="col-md-4 row no-gutters mr-1 card mb-1">
                          <div class="col-md-12 card-body no-gutters">
                          <c:choose>
                              <c:when test="${not empty hospital.image}">
                                  <img class="col-md-12 " src="<c:url value='/resources/images/${hospital.image}'/>" height="250" width="150" alt="병원이미지">
                              </c:when>
                              <c:otherwise>
                                  <img class="col-md-12" src="https://i.ibb.co/gdq8PKg/pexels-tom-fisk-1692693.jpg" alt="병원이미지" height="250" width="150" border="0">
                              </c:otherwise>
                          </c:choose>
                            <p class="card-title" style="margin-top: 7%;">병원명 : ${hospital.name}</p>
                            <p class="card-text" style="margin-top: 4%;">병원안내 : ${hospital.description}</p>
                          </div>
                            <a href="hospitals/hospital?hid=${hospital.hid}" class="btn btn-outline-primary" >병원 상세보기</a>
                        </div>
                      </c:forEach>
                      
                      <div class="col-md-12 text-center">
						<c:forEach items="${pageNumbers}" var="pageNumber" varStatus="loop">
	                      	<a href="hospitals?page=${pageNumber}">${pageNumber}</a>
                       </c:forEach>
                     </div>
                    </div>
					
                  <h5 style="border-left: 3px solid #FFA07A; margin-bottom: 3%;"><span class="ml-4">주차장 있는 병원</span></h5>
                  <div class="col-md-12 row card-group no-gutters p-0" style="margin-bottom: 3%;">
                    <c:forEach items="${hospitals}" var="hospital">   
                    <div class="col-md-4 row no-gutters mr-1 card mb-1">
                      <div class="col-md-12 card-body no-gutters">
                      <c:choose>
                        <c:when test="${not empty hospital.image}">
                          <img class="col-md-12" src="<c:url value='/resources/images/${hospital.image}'/>" height="250" width="150" alt="병원이미지">
                        </c:when>
                        <c:otherwise>
                          <img class="col-md-12" src="https://i.ibb.co/gdq8PKg/pexels-tom-fisk-1692693.jpg" alt="병원이미지" height="250" width="150" border="0">
                        </c:otherwise>
                      </c:choose>
                        <p class="card-title" style="margin-top: 7%;">병원명 : ${hospital.name}</p>
                        <p class="card-text" style="margin-top: 4%;">병원안내 : ${hospital.description}</p>
                      </div>
                        <a href="hospitals/hospital?hid=${hospital.hid}" class="btn btn-outline-primary">병원 상세보기</a>
                    </div>
                    </c:forEach>           
                  </div>

                  <h5 style="border-left: 3px solid #FFCD63; margin-bottom: 3%;" class="mb-3"> <span class="ml-4">우리동네 전체 병원</span></h5>
                  <div class="col-md-12 row card-group no-gutters p-0" style="margin-bottom: 3%;">
                    <c:forEach items="${hospitals}" var="hospital">
                      <div class="col-md-4 row no-gutters mr-1 card mb-1">
                        <div class="col-md-12 card-body no-gutters">
                          <c:choose>
                          <c:when test="${not empty hospital.image}">
                              <img class="col-md-12" src="<c:url value='/resources/images/${hospital.image}'/>" alt="병원이미지">
                          </c:when>
                          <c:otherwise>
                              <img class="col-md-12" src="https://i.ibb.co/gdq8PKg/pexels-tom-fisk-1692693.jpg" alt="병원이미지" border="0">
                          </c:otherwise>
                          </c:choose>
                          <p class="card-title" style="margin-top: 7%;">병원명 : ${hospital.name}</p>
                          <p class="card-text" style="margin-top: 4%;">병원안내 : ${hospital.description}</p>
                        </div>
                          <a href="hospitals/hospital?hid=${hospital.hid}" class="btn btn-outline-primary">병원 상세보기</a>
                      </div>
                      </c:forEach>
                  </div>
                </div>

                  <div class="col-md-4 no-gutters ml-4">
                    <div class="no-gutters col-md-12 p-0" style="border-left: 3px solid red;"><h4 class="ml-3" >best 별점 </h4>    
                    </div>
                    <br>
                    <h5 style="border-left: 3px solid red; margin-bottom: 3%;" class="mb-4"> <span class="ml-4">별점 4.5점 이상</span></h5>           
                      <c:forEach items="${fiveScore}" var="hospital">
                      <div class="card col-md-12 mb-3" style="max-width: 540px; ">
                        <div class="col-md-12 d-flex">
                          <c:choose>
                            <c:when test="${not empty hospital.image}">
                              <img  style="border-radius: 12% ; height: 80%" class="col-md-5 align-self-center" src="<c:url value='/resources/images/${hospital.image}'/>" alt="병원이미지">
                            </c:when>
                            <c:otherwise>
                                <img  style="border-radius: 12% ; height: 80%" class="col-md-5 align-self-center" src="https://i.ibb.co/gdq8PKg/pexels-tom-fisk-1692693.jpg" alt="병원이미지" border="0">
                            </c:otherwise>
                          </c:choose>
                          <div class="col-md-7 p-0" style="border-left: 1px solid silver">
                            <div class="card-body">
                              <p class="card-text">병원명 : ${hospital.name}</p>
                              <p class="card-text">주소 : ${hospital.addr}</p>
                              <a href="hospitals/hospital?hid=${hospital.hid}" class="btn btn-outline-primary btn-sm rounded-pill" style="font-size: 75%; height: 10%; width: 40%;"> 상세보기</a>
                            </div>
                          </div>
                        </div>
                      </div>
                    </c:forEach>
                                          
                    <h5 style="border-left: 3px solid red; margin-bottom: 3%; margin-top: 8%;" class="mb-4 mt-5"> <span class="ml-4">별점 4점 이상</span></h5>           
                      <c:forEach items="${fourScore}" var="hospital">
                      <div class="card col-md-12 mb-3" style="max-width: 540px; ">
                        <div class="col-md-12 d-flex">
                          <c:choose>
                            <c:when test="${not empty hospital.image}">
                              <img  style="border-radius: 12% ; height: 80%" class="col-md-5 align-self-center" src="<c:url value='/resources/images/${hospital.image}'/>" alt="병원이미지">
                            </c:when>
                            <c:otherwise>
                                <img  style="border-radius: 12% ; height: 80%" class="col-md-5 align-self-center" src="https://i.ibb.co/gdq8PKg/pexels-tom-fisk-1692693.jpg" alt="병원이미지" border="0">
                            </c:otherwise>
                          </c:choose>
                          <div class="col-md-7 p-0" style="border-left: 1px solid silver">
                            <div class="card-body">
                              <p class="card-text">병원명 : ${hospital.name}</p>
                              <p class="card-text">주소 : ${hospital.addr}</p>
                              <a href="hospitals/hospital?hid=${hospital.hid}" class="btn btn-outline-primary btn-sm rounded-pill" style="font-size: 75%; height: 10%; width: 40%;"> 상세보기</a>
                            </div>
                          </div>
                        </div>
                      </div>
                    </c:forEach>

                    <h5 style="border-left: 3px solid red; margin-bottom: 3%; margin-top: 8%;" class="mb-4 "> <span class="ml-4">별점 3점 이상</span></h5>           
                      <c:forEach items="${threeScore}" var="hospital">
                      <div class="card col-md-12 mb-3" style="max-width: 540px; ">
                        <div class="col-md-12 d-flex">
                          <c:choose>
                            <c:when test="${not empty hospital.image}">
                              <img  style="border-radius: 12% ; height: 80%" class="col-md-5 align-self-center" src="<c:url value='/resources/images/${hospital.image}'/>" alt="병원이미지">
                            </c:when>
                            <c:otherwise>
                                <img  style="border-radius: 12% ; height: 80%" class="col-md-5 align-self-center" src="https://i.ibb.co/gdq8PKg/pexels-tom-fisk-1692693.jpg" alt="병원이미지" border="0">
                            </c:otherwise>
                          </c:choose>
                          <div class="col-md-7 p-0" style="border-left: 1px solid silver">
                            <div class="card-body">
                              <p class="card-text">병원명 : ${hospital.name}</p>
                              <p class="card-text">주소 : ${hospital.addr}</p>
                              <a href="hospitals/hospital?hid=${hospital.hid}" class="btn btn-outline-primary btn-sm rounded-pill" style="font-size: 75%; height: 10%; width: 40%;"> 상세보기</a>
                            </div>
                          </div>
                        </div>
                      </div>
                    </c:forEach>
                  </div>
                </div>
              </div>
            </div>
          </div>
                        
<%@  include file="../module/footer.jsp" %>
 
 <!-- 
    <div class="container my-3">
        <div class="d-flex justify-content-between">
            <div>
                <h1><img width="50" height="50" src="https://img.icons8.com/ios/50/hospital.png" alt="hospital"/>병원목록</h1>
            </div>
            <c:if test="${type == checktype}">
            <div class="justify-content-end">
                <a href="hospitals/create" class="btn btn-primary ">병원 추가</a>
                <a href="hospitals/manageapps" class="btn btn-primary">모든신청보기</a>
            </c:if>
            <c:if test="${loginId != null && type!=checktype}">
            	<a href="hospitals/mybookList?personId=${loginId}" class="btn btn-primary">내 예약 보기</a>            
            </c:if>
            </div>
        </div>
        <br>
        <div class="row" >
            <c:forEach items="${hospitals}" var="hospital">
                <div class="col" style="padding: 15px;">
                    <div class="border border-secondary rounded " style="width: 350px; height: 300px;">
                        <div class="detail-box">
                            <div class="options">
                                <a href="hospitals/hospital?hid=${hospital.hid}">
                                <img src="${hospital.image}" alt="" width="100%" height="210">
                                </a>
                            </div>
                            <a href="hospitals/hospital?hid=${hospital.hid}" class="text-decoration-none">
                                <h5>${hospital.name}</h5>
                                <p>${hospital.description}</p>
                            </a>
                        </div>
                    </div>
                </div>
            </c:forEach>
        </div>
        </div>
        <br>
        <form action="/123team/hospitals/selectbytitle" class="form-inline my-2 justify-content-center ">
            <input type="text" name="title" placeholder="병원 이름 입력" class="form-control mr-3" />
            <button type="submit" class="btn btn-primary">검색</button>
        </form>
 -->

<%-- 
<a href="search">병원검색</a>	
 --%>
</body>
<script src="./resources/js/hospitals.js"></script>
</html>