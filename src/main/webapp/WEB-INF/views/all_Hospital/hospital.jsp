<%@page import="com.springmvc.domain.Pet"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html>
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.3.1/dist/css/bootstrap.min.css"
	integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T"
	crossorigin="anonymous">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, user-scalable=no">

<title>병원 상세보기 페이지</title>

</head>
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
    <%@ include file="../module/leftheader.jsp"%>
    <div class="content-wrapper">
        <div class="card mx-auto col-md-12" style="width: 80rem;">
			<c:choose>
			    <c:when test="${not empty hospital.image}">
			        <img class="col-md-12 mt-2 rounded-lg"" src="/your-context-path/resources/images/${hospital.image}" height="200" width="150" alt="병원이미지">
			    </c:when>
			    <c:otherwise>
			        <img class="col-md-12 mt-2 rounded-lg"
                           src="https://i.ibb.co/gdq8PKg/pexels-tom-fisk-1692693.jpg"
                           alt="병원이미지" height="200" width="150" border="0">
			    </c:otherwise>
			</c:choose>

            <div class="card-body col-md-12">
                <h5 class="card-title col-md-12 p-0" style="font-size: 2vw;">${hospital.name}</h5>
                <p class="card-text" style="font-size: 1vw;"> ${hospital.description}</p>
                <p class="card-text" style="font-size: 1vw;">${hospital.runtime}</p>
                <p class="card-text" style="font-size: 1vw;">${hospital.number}</p>
                <p class="card-text" style="font-size: 1vw;"> ${hospital.addr}</p>
                
	          <div class="col-md-12 row">
	            <div class="col-md-6 row "> 
			<%
				List<Pet> petlist = (List<Pet>) session.getAttribute("petName");
			            request.setAttribute("petlist", petlist);
			%>
				  <c:if test="${loginId !=  hospital.personId && loginId != null && petlist != null}">
	              	<a href="addbook?hid=${hospital.hid}" class="btn btn-primary ">예약하기</a>
	              </c:if>
	              </div>
	              <c:if test="${loginId ==  hospital.personId}">
	                <div class="row d-flex justify-content-end col-md-6">
	                  <a class="btn btn-outline-success mr-2" href="update?hid=${hospital.hid}">병원수정</a>
	                  <a class="btn btn-outline-danger" href="delete?hid=${hospital.hid}" onclick="alert('정말 삭제하시겠습니까?')">병원삭제</a>
	                </div>
	             </c:if>
	           </div> 
                
                

                
             	<div class="col-md-12 mt-5 p-0 row" style="justify-content: center;">
             	   <div class="col-md-12 row" >
             	   	  <h3 class="col-md-12 p-0">병원 리뷰</h3>
             	   	  리뷰평점 : ${hospital.reviewScore }
             	   	  리뷰수 : ${hospital.reviewCount }
              	   	  <c:if test="${visited == true}">
	                    <div class="p-0 col-md-12 mt-3">
	                    	<div class="mb-2 ml-2">
	                    		<a class="btn btn-outline-info  btn-sm mt-2" href="addreview?hid=${hospital.hid}">리뷰작성</a>
	                    	</div>
	                    </div>
                		</c:if>
                	</div>
                      <c:forEach items="${reviews}" var="review">

                        <%
                            int i = 0;
                        if(i%2==0){
                        %>

                        <div class="col-md-6 p-0 ">
							<div class="review1 card mb-3" style="max-width: 540px;">
					          	<div class="row no-gutters form-group">
					          		<div class="col-md-4">	
						                <c:choose>
						                  <c:when test="${not empty review.reviewImage}">
						                    <img class="col-md-12 rounded-lg" src="<c:url value='/resources/images/${review.reviewImage}'/>" height="120"  alt="리뷰이미지">
						                  </c:when>
						                  <c:otherwise>
						                    <img class="col-md-12  rounded-lg" src="https://i.ibb.co/wyMqmJp/pexels-980859.jpg" alt="리뷰이미지" border="0" alt="리뷰이미지" height="160" border="0">
						                  </c:otherwise>
						                </c:choose>
					             	</div>
					             	<div class="col-md-8">
						                <div class="card-body ">
						                  <h5 class="card-title">${review.title}</h5>
						                  <p class="card-text">${review.context}</p>
						                  <p class="card-text">${review.registDay}</p>
						                  <p class="card-text text-muted"> ${review.reviewScore}</p>
						                </div>
						                <div class="col-md-12 px-0">
						                  <c:if test="${loginId ==  review.personId}">
						                    <a class="btn btn-outline-info btn-sm mr-1" href="editreview?reviewId=${review.reviewId}">리뷰수정</a> 
						                    <a class="btn btn-outline-info btn-sm mr-1" href="deletereview?reviewId=${review.reviewId} onclick="alert('정말 삭제하시겠습니까?')"">리뷰삭제</a>
						                  </c:if>
		                               </div>
		                            </div>
                             	 </div>
                               </div>
							</div>
							
	                       <%
	                        }else {
	                        %>
	                        <div class="col-md-6 p-0">
								<div class="review1 card mb-3" style="max-width: 540px;">
						          	<div class="row no-gutters form-group">
						          		<div class="col-md-4">	
							                <c:choose>
							                  <c:when test="${not empty review.reviewImage}">
							                    <img class="col-md-12 rounded-lg" src="<c:url value='/resources/images/${review.reviewImage}'/>" height="120"  alt="리뷰이미지">
							                  </c:when>
							                  <c:otherwise>
							                    <img class="col-md-12  rounded-lg" src="https://i.ibb.co/wyMqmJp/pexels-980859.jpg" alt="리뷰이미지" border="0" alt="리뷰이미지" height="160" border="0">
							                  </c:otherwise>
							                </c:choose>
						             	</div>
						             	<div class="col-md-8">
							                <div class="card-body ">
							                  <h5 class="card-title">${review.title}</h5>
							                  <p class="card-text">${review.context}</p>
							                  <p class="card-text">${review.registDay}</p>
							                  <p class="card-text text-muted"> ${review.reviewScore}</p>
							                </div>
							                <div class="col-md-12 px-0">
							                  <c:if test="${loginId ==  review.personId}">
							                    <a class="btn btn-outline-info btn-sm mr-1" href="editreview?reviewId=${review.reviewId}">리뷰수정</a> 
							                    <a class="btn btn-outline-info btn-sm mr-1" href="deletereview?reviewId=${review.reviewId}" onclick="alert('정말 삭제하시겠습니까?')">리뷰삭제</a>
							                  </c:if>
			                               </div>
			                            </div>
	                             	 </div>
	                               </div>
								</div>
	                        <%
	                        i++;
	                        }
	                        %>
                           </c:forEach>
	                        <div class="text-center col-md-12">
			           			<a href="">1</a>
			        		</div>
	        				<div class="col-md-12 row no-gutters show-gird mt-5">
							<!--병원 지도이미지 가져오기-->
								<div id="parkmap"  class="col-md-12 no-gutters">
									<h3 class="col-md-12 no-gutters">지도 띄우기</h3>
									<div id="map" style="width:100%;height:400px;">
										${hospital.y}, ${hospital.x}
				        			</div>
				        			<script type="text/javascript" src="https://oapi.map.naver.com/openapi/v3/maps.js?ncpClientId=peaxg064t9"></script>
									<script>
										var hospital = new naver.maps.LatLng(${hospital.y}, ${hospital.x}),
									    map = new naver.maps.Map('map', {
									        center: hospital.destinationPoint(0, 500),
									        zoom: 15
									    }),
									    marker = new naver.maps.Marker({
									        map: map,
									        position: hospital
									    });
										var contentString = [
									        '<div class="iw_inner">',
									        '   <h3>${hospital.name}',
									        '   <p>${hospital.addr}<br />',
									        '       <a href="hospital?hid=${hospital.hid}">상세보기</a>',
									        '   </p>',
									        '</div>'
									    ].join('');
								
										var infowindow = new naver.maps.InfoWindow({
										    content: contentString
										});
								
										naver.maps.Event.addListener(marker, "click", function(e) {
										    if (infowindow.getMap()) {
										        infowindow.close();
										    } else {
										        infowindow.open(map, marker);
										    }
										});
										infowindow.open(map, marker);
										</script>
									</div>
				            	</div>
				           </div>
		             	</div>
			 		</div>
				</div>
		    </div>
	 <%@  include file="../module/footer.jsp" %>

	<%-- 
<c:if test="${loginId ==  hospital.personId}">


	<%@ include file="../module/footer.jsp" %>
  
<a href="/123team/hospitals">돌아가기</a>

<div>

 <%@  include file="../module/headerinfo.jsp" %>
<a href="/123team/hospitals">돌아가기</a>
	<%
		request.setAttribute("loginId", session.getAttribute("personId"));
		request.setAttribute("type", session.getAttribute("type"));
	%>

<p>
병원 사진 : ${hospital.image}
<p>
병원 이름 : ${hospital.name}
<p>
병원 주소 : ${hospital.addr}
<p>
전화번호 : ${hospital.number}
<p>
진료시간 : ${hospital.runtime}
<p>
주차정보 : ${hospital.parking}
<p>
설명 : ${hospital.description}
<p>

<c:if test="${hospital.personId==loginId}">


<a href="update?hid=${hospital.hid}">병원수정</a>
<a href="delete?hid=${hospital.hid}">병원삭제</a>
</c:if>
<c:if test="${loginId != null}">
<a href="addbook?hid=${hospital.hid}">병원예약</a>
</c:if>	
<br>
<h3>reviews</h3>
<c:if test="${loginId != null}">
<a href="addreview?hid=${hospital.hid}">리뷰작성</a>
</c:if>

<c:forEach items="${reviews}" var="review">
<p>
	등록일 : ${review.registDay}
	<p>
	제목 : ${review.title}
	<p>
	리뷰 점수 : ${review.reviewScore}
	<p>
	사진 : ${review.reviewImage}
	<p>
	내용 : ${review.context}
	<p>
	<c:if test="${loginId ==  review.personId}">
	<a href="editreview?reviewId=${review.reviewId}">리뷰수정</a> || <a href="deletereview?reviewId=${review.reviewId}">리뷰삭제</a>
	</c:if>
</c:forEach>

<c:if test="${loginId ==  hospital.personId}">
>>>>>>> origin/yeonghoe
<a href="update?hid=${hospital.hid}">병원수정</a>
<a href="delete?hid=${hospital.hid}">병원삭제</a>
</c:if>
<a href="addbook?hid=${hospital.hid}">병원예약</a>
</div>



<c:forEach items="${reviews}" var="review">
<p>
	등록일 : ${review.registDay}
	<p>
	제목 : ${review.title}
	<p>
	리뷰 점수 : ${review.reviewScore}
	<p>
	사진 : ${review.reviewImage}
	<p>
	내용 : ${review.context}
	<p>
	<c:if test="${loginId ==  review.personId}">
	<a href="editreview?reviewId=${review.reviewId}">리뷰수정</a> || <a href="deletereview?reviewId=${review.reviewId}">리뷰삭제</a>
	</c:if>
</c:forEach>

<%@ include file="../module/footer.jsp" %>
<<<<<<< HEAD
=======
=======

	                    <div class="col-md-12">
	                    	<c:if test="${loginId ==  hospital.personId}">
	                        	<a href="update?hid=${hospital.hid}" class="btn btn-primary">수정하기</a>
	                        <a href="delete?hid=${hospital.hid}" class="btn btn-danger">삭제하기</a>
	                		</c:if>
	               			<c:if test="${loginId != null && type != checktype}">
	                        	<a href="addbook?hid=${hospital.hid}" class="btn btn-success">예약하기</a>
	                      	</c:if>
>>>>>>> origin/dohyeon
 --%>

</body>

</html>