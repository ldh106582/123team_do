<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="resources/css/petcard.css">
<!-- 부트스트랩 -->
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.3.1/dist/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
<!-- 폰트어썸 -->
<script src="https://kit.fontawesome.com/ddd0a6fba1.js" crossorigin="anonymous"></script>
<!-- js -->
<link href="<c:url value="/resources/js/PetCardUpdate.js"/>" rel="stylesheet">
<link rel="stylesheet" href="/123team/resources/css/mypage.css">
<meta charset="UTF-8">
<title>펫카드 수정페이지</title>
</head>
<body>
 <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="./resources/js/refreshing.js"></script>

<div id="header">
	<%@  include file="../module/header.jsp" %>
</div>

	<div class="container-fluid page-body-wrapper">
 <%@  include file="../module/leftheader.jsp" %>
 

    <div id="container" class="container wrap naverid">
    <header class="header" role="banner">
        <div class="header_home">
        <div class="gnb_area"></div>
        <div class="profile_area">
            <div class="profile_inner">
              <c:choose>
                <c:when test="${not empty id.image}">
                    <img src="<c:url value='/resources/images/${id.image}'/>" width="84" height="84" alt="프로필 이미지">
                </c:when>
                <c:otherwise>
                    <img src="https://static.nid.naver.com/images/web/user/default.png" width="84" height="84" alt="프로필 이미지">
                </c:otherwise>
            </c:choose>
                
                <div class="profile">
                    <p class="useid">${id.personId}</p> 
                    <p class="usemail">${id.personEmail}</p>
                </div>
            </div>
        </div>
        <div id="headerLeft" class="header_left" aria-hidden="false">
            <ul class="left_menu" role="menu">
                <li>
                    <a href="/123team/pet/petread?petId=${ petid.petId }" class="left_item" role="menuitem" onclick="nclk(this,'lnb.info','','',event)" aria-current="">
                        <div class="menu_text ">반려동물 정보수정</div>
                    </a>
                </li>
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
            </ul>
        </div>
    </header>
    <div id="content" class="content">
    <div class="subindex_wrap" role="main">
        <div id="headerTop" class="path_area" aria-hidden="false"></div>
    </div>                        
    <div class="subindex_item">
        <div class="head_title">
            <h2 class="subindex_title">동물 정보</h2>
	        <div class="title_link">
	            <a href="/123team/login/back?petid=${pet.petId}" ><span class="text">수정완료</span></a>
	        </div> 
        </div>

        <div class="subindex_greenbox">
            <div class="myprofile">
                <ul class="myinfo_area ml-5">
                    <li>
                        <div class="myphoto">
                            <c:choose>
				                <c:when test="${not empty pet.petImage}">
				                    <img src="<c:url value='/resources/images/${pet.petImage}'/>" width="56" height="56" alt="프로필 이미지">
				                </c:when>
				                <c:otherwise>
				                    <img id="petImage" src="https://static.nid.naver.com/images/web/user/default.png" width="56" height="56" alt="내 프로필 이미지">
				                </c:otherwise>
				            </c:choose>
                        </div>
                    </li>
                    <li>
                        <div class="myaccount">
                            <div class="myname">
                                <div class="name_text">
                                    <p>펫이름 : ${pet.petName}</p>
                                </div>
                            </div>
                        </div>
                    </li>
                </ul>
            </div>
            <ul class="subindex_row px-0">
                <li>
                    <div class="row_item other">
                        <p> 종 : ${pet.petVarity}</p>
                    </div>
                </li>
                <li>
                    <div class="row_item other">
                        <p id="petbirth"> 생년월일 : ${pet.petBirth} (나이 : <b id="petAge"> </b>)</p>
                    </div>
                </li>
            </ul>
        </div>
    </div>
    <div class="subindex_item">
        <div class="head_title">
            <h2 class="subindex_title">동물 진찰 기록부</h2>
        </div>
           <div class="subindex_greenbox">
            <ul class="subindex_row p-0"> 
                <table class="table">
                    <tbody>
                        <tr>
                            <td>
                                <h4 class="d-flex align-self-center" id="ChartName">나의 동물 몸무게</h4>
                                <button type="button" class="bg-info text-white rounded p-1" id="ChartButton0" onclick="toggleDisplay('ChartDetails0', 'ChartButton0')">펼치기</button>
                                <div id="ChartDetails0"  style="display: none;">
                                    <c:forEach items="${listOfPetWeight}" var="petWeight">
                                        <form action="/123team/login/petcardupdate?num=${petWeight.petWeightNum}&petId=${petWeight.petId}" method="post" >
                                            <input type="hidden" name="type" value="weight" />
                                            <div class="border m-2" style=" position: relative;">
                                                <input type="hidden" name="petId" value="${pet.petId}" />
                                                <p class="m-2"> 몸무게 기록 : <input type="date" name="petWeightDate" value="${petWeight.petWeightDate}" /></p> 
                                                <p class="m-2"> 몸무게 : <input type="text" name="petWeight" value="${petWeight.petWeight}" maxlength="3" /> </p> 
                                            </div>
                                            <input class="btn btn-success btn-sm border-3 border-dark mt-2 mb-2" type="submit" value="수정완료"/>
                              			        <div class="col-sm-1" style="position: absolute; top: ${35 + status.index}%; left: ${75 + status.index}%;">
	                                        	 <a  href="${pageContext.request.contextPath}/login/deleteWeghit?petId=${petWeight.petId}&petWeightNum=${petWeight.petWeightNum}" style="position: absolute; top: 51%; left: 85%" class="p-3 border text-secondary">
	                                            	<i class="fa-solid fa-trash-can"></i>
	                                            </a>
                                            </div>
                                        </form>
                                        
                        

                                       
                                    </c:forEach>
                                </div>
                            </td>
                        </tr>
                        <tr>
                            <td>
                            <h4 class="d-flex align-self-center" id="ChartName" style="position: relative;">진료</h4>
                            <button type="button" class="bg-info text-white rounded p-1" id="ChartButton1" onclick="toggleDisplay('ChartDetails1', 'ChartButton1')">펼치기</button>
                            <div id="ChartDetails1" class=" col-md-12 border" style="display: none;">
							<c:forEach items="${listOfPetChard}" var="petcard" varStatus="status">
							    <div class="border m-2" style="position: relative;">
							        <input type="hidden" name="type" value="chart" />
							        <p>진료일자: <input id="editDateField${status.index}" type="date" name="petChartDate" value="${petcard.petChartDate}"/> </p>
							        <p>진료명: <input id="editName${status.index}" type="text" name="petChart" value="${petcard.petChart}"/> </p>
							        <p>진료내용: <input id="editContentField${status.index}" type="text" name="petChartContent" value="${petcard.petChartContent}"/></p>
							        <input class="btn btn-success btn-sm border-3 border-dark mt-2 mb-2" type="submit" value="수정완료"/>
							        <div class="col-sm-1" style="position: absolute; top: ${35 + status.index}%; left: ${75 + status.index}%;">
							            <a href="${pageContext.request.contextPath}/login/deletetPetChart?petId=${petcard.petId}&petChartNum=${petcard.petChartNum}" class="p-3 border-danger text-secondary" > <i class="fa-solid fa-trash-can"></i> </a>
							        </div>
							    </div>
							</c:forEach>
                            </div>
                            </td>
                        </tr>
                        <tr>
                            <td>
                            <h4 class="d-flex align-self-center" id="Vaccination">예방접종</h4>
                            <button type="button" class="bg-info text-white rounded p-1" id="ChartButton2" onclick="toggleDisplay('ChartDetails2', 'ChartButton2')">펼치기</button>
                            
                            <div id="ChartDetails2" style="display: none;">
                                <c:forEach items="${listOfpetVaccination}" var="petcard" varStatus="status">
                                    <form action="/123team/login/petcardupdate?num=${petcard.petVaccinationNum}&petId=${petcard.petId}" method="post" >
                                    <div class="border m-2"  style="position: relative;">
                                        <input type="hidden" name="type" value="vaccin" />
                                        <p>예방접종일자: <input id="editDateField${status.index}" type="date" name="petVaccinationDate" value="${petcard.petVaccinationDate}"/> </p>
                                        <p>예방접종명: <input id="editName${status.index}" type="text" name="petVaccination" value="${petcard.petVaccination}"/> </p>
                                        <p>예방접종내용: <input id="editContentField${status.index}" type="text" name="petVaccinationCotent" value="${petcard.petVaccinationCotent}"/> </p>
                                    </div>
                                    <input class="btn btn-success btn-sm border-3 border-dark mt-2 mb-2" type="submit" value="수정완료"/>
                                    </form>
							       <div class="col-sm-1" style="position: absolute; top: ${35 + status.index}%; left: ${75 + status.index}%;">
                                        <a href="${pageContext.request.contextPath}/login/deleteVaccination?petId=${petid.petId}&petVaccinationNum=${petcard.petVaccinationNum}" class="p-3 border-danger text-secondary" ><i class="fa-solid fa-trash-can"></i></a>
                                    </div>
                                </c:forEach>
                            </div>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <h4 class="d-flex align-self-center" id="Surgery">수술</h4>
                                <button type="button" class="bg-info text-white rounded p-1" id="ChartButton3" onclick="toggleDisplay('ChartDetails3', 'ChartButton3')">펼치기</button>
                                
                                <div id="ChartDetails3" style="display: none;">
                                    <c:forEach items="${listOfPetSurgery}" var="petcard" varStatus="status">
                                        <form action="/123team/login/petcardupdate?num=${petcard.petSurgeryNum}&petId=${petcard.petId}" method="post" >
                                        <div class="border m-2" style=" position: relative;">
                                            <input type="hidden" name="type" value="surgery" />
                                            <p>수술날짜: <input id="editDateField4${status.index}" type="date" name="petSurgeryDate" value="${petcard.petSurgeryDate}"/> </p>
                                            <p>수술명: <input id="editName4${status.index}" type="text" name="petSurgeryName" value="${petcard.petSurgeryName}"/> </p>
                                            <p>수술내용: <input id="editContentField4${status.index}" type="text" name="petSurgeryContent" value="${petcard.petSurgeryContent}"/> </p>
                                        </div>
                                        <input class="btn btn-success btn-sm border-3 border-dark mt-2 mb-2" type="submit" value="수정완료"/>
                        			 	</form>
                			        <div class="col-sm-1" style="position: absolute; top: ${35 + status.index}%; left: ${75 + status.index}%;">
                                        <a href="${pageContext.request.contextPath}/login/deletetSurgery?petId=${petid.petId}&petSurgeryNum=${petcard.petSurgeryNum}" class="p-3 border-danger text-secondary" ><i class="fa-solid fa-trash-can"></i></a>
                                    </div>
                                    </c:forEach>
                                </div>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <h4 class="d-flex align-self-center" id="SurgeryAfter">수술경과</h4>
                            <button type="button" class="bg-info text-white rounded p-1" id="ChartButton4" onclick="toggleDisplay('ChartDetails4', 'ChartButton4')">펼치기</button>
                            
                            <div id="ChartDetails4" style="display: none;">
                                <c:forEach items="${listOfPetSurgeryAfter}" var="petcard" varStatus="status">
                                    <form action="/123team/login/petcardupdate?num=${petcard.petSurgeryAfterNum}&petId=${petcard.petId}" method="post" >
                                    <div class="border" style=" position: relative;">
                                        <input type="hidden" name="type" value="sergeryAfter" />
                                        <p class="mt-2">수술 후 기록일자: <input id="editDateField5${status.index}" type="date" name="petSurgeryAfterDate" value="${petcard.petSurgeryAfterDate}"/> </p>
                                        <p>수술 후 진료내용: <input id="editContentField5${status.index}" type="text" name="petSurgeryAfterContent" value="${petcard.petSurgeryAfterContent}"/> </p>
                                    </div>
                                    <input class="btn btn-success btn-sm border-3 border-dark m-2" type="submit" value="수정완료"/>
                                    </form>
                          	        <div class="col-sm-1" style="position: absolute; top: ${35 + status.index}%; left: ${75 + status.index}%;">
                                        <a href="${pageContext.request.contextPath}/login/deletetSurgeryAfter?petId=${petid.petId}&petSurgeryAfterNum=${petcard.petSurgeryAfterNum}" class="p-3 border-danger text-secondary" ><i class="fa-solid fa-trash-can"></i></a>
                                    </div>
                                </c:forEach>
                            </div>
                        </tr>
                    </tbody>
                 </table>
            	</ul>
          	</div>
    	  </div>
	   </div>
	</div>
</div> 
 
	
	<%@  include file="../module/footer.jsp" %>   
</body>
<script>
window.onload = function(){
	var birthday = new Date("${pet.petBirth}");
	var age = calculateAge(birthday);
	document.getElementById('petAge').innerText = age;
};

function calculateAge(birthday){
    var diff_ms = Date.now() - birthday.getTime();
    var age_dt = new Date(diff_ms);
    return Math.abs(age_dt.getUTCFullYear()-1970);
}

function toggleDisplay(contentId, buttonId) {
	   var element = document.getElementById(contentId);
	   var button = document.getElementById(buttonId);
	   if (element.style.display === 'none') {
	       element.style.display = 'block';
	       button.innerText = '내용 닫기';
	   } else {
	       element.style.display = 'none';
	       button.innerText = '펼치기';
	   }
	}
	
var leftPosition = 85; // 기본 가정치
var topPosition = 51; // 기본 가정치

// 인덱스나 다른 값에 따라 leftPosition과 topPosition을 조정합니다.
leftPosition += status.index * someValue; // someValue는 조정값입니다.
topPosition += status.index * someOtherValue; // someOtherValue는 다른 조정값입니다.
</script>
</html>