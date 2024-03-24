<%@page import="java.time.LocalDate"%>
<%@page import="java.time.Period"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="../resources/css/petcard.css">
<!-- 폰트어썸 -->
<script src="https://kit.fontawesome.com/ddd0a6fba1.js" crossorigin="anonymous"></script>
<!-- js -->
<link href="<c:url value="/resources/js/petcard.js"/>" rel="stylesheet">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.4.1/dist/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
<link rel="stylesheet" href="/123team/resources/css/mypage.css">
<title>나의 동물 현황</title>
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
		      <div class="profile_area" style="margin-top: 20%;">
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
	                    <p class="useid">${ id.personId } 님 </p>
	                    <p class="usemail">${id.personEmail } 사장님 입니다. </p>
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
                 <li>
                   <div class="left_item" role="menuitem" >
                       <div class="menu_text ">펫 카드</div>	
                   </div>
                    <c:forEach items="${petName}" var="petName">
                        <a href="/123team/login/r_petcard?petid=${petName.petId}" class="left_item" role="menuitem">
                            <div>
                            	${petName.petName }
                            </div>
                        </a>
                    </c:forEach>
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
            <c:if test="${type eq p }">
	            <div class="title_link">
	                <a href="/123team/login/petcardupdate?petId=${petid.petId}"><span class="text">수정하기</span></a>
	            </div> 
            </c:if>
        </div>
    
        <div class="subindex_greenbox">
            <div class="myprofile">
                <ul class="myinfo_area ml-4">
                    <li>
	                  <c:choose>
		                <c:when test="${not empty petid.petImage}">
		                    <img src="<c:url value='/resources/images/${petid.petImage}'/>" width="56" height="56" alt="프로필 이미지">
		                </c:when>
		                <c:otherwise>
		                    <img id="petImage" src="https://static.nid.naver.com/images/web/user/default.png" width="56" height="56" alt="내 프로필 이미지">
		                </c:otherwise>
		            </c:choose>
                    </li>
                    <li>
                        <div class="myaccount">
                            <div class="myname">
                                <div class="name_text">
                                    <p>펫이름 : ${petid.petName}</p>
                                </div>
                            </div>
                        </div>
                    </li>
                </ul>
            </div>
            <ul class="subindex_row px-0">
                <li>
                    <div class="row_item other">
                        <p> 종 : ${petid.petVarity}</p>
                    </div>
                </li>
                <li>
                    <div class="row_item other">
                        <p id="petbirth"> 생년월일 : ${petid.petBirth} (나이 : <b> ${ageString} </b> )</p>
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
                                  <form action="/123team/login/petcard?num=${petWeight.petWeightNum}&petId=${petid.petId}" method="post" >
                                     <div class="border m-2" style=" position: relative;">
                                         <p class="m-2"> 몸무게 기록 : <input type="date" name="petWeightDate" /></p> 
                                         <p class="m-2"> 몸무게 : <input type="text" name="petWeight" maxlength="3" /> </p> 
                                     	<input class="btn btn-success btn-sm border-3 border-dark mt-2 mb-2 ml-1" type="submit" value="몸무게 기록하기"/>
                                     </div>
                                 </form>
                                 
                                <button type="button" class="bg-info text-white rounded p-1" id="ChartButton0" onclick="toggleDisplay('ChartDetails0', 'ChartButton0')">펼치기</button>
                                <div id="ChartDetails0"  style="display: none;">
                                    <c:forEach items="${listOfPetWeight}" var="petWeight">
                                    <div class="border m-2" style=" position: relative;">
                                        <p class="m-2"> 몸무게 기록 : ${petWeight.petWeightDate} </p> 
                                        <p class="m-2"> 몸무게 : ${petWeight.petWeight} </p> 
                                    </div>
                                    </c:forEach>                                    
                                </div>
                            </td>
                        </tr>
                        <tr>
                            <td>
                            <h4 class="d-flex align-self-center" id="ChartName">진료</h4>
                         	<form action="/123team/login/petcard?num=${petcard.petChartNum}&petId=${petid.petId}" method="post" >
                                <div class="border m-2" style=" position: relative;">
                                   <p class="m-2">진료일자: <input id="editDateField" type="date" name="petChartDate"/> 
                                   <p class="m-2">진료명: <input id="editName" type="text" name="petChart"/> </p>
                                   <p class="m-2">진료내용: <input id="editContentField" type="text" name="petChartContent"/></p>
                           		<input class="btn btn-success btn-sm border-3 border-dark mt-2 mb-2 ml-1" type="submit" value="진료 기록하기"/>
                                </div>
                             </form>   
	                         <button type="button" class="bg-info text-white rounded p-1" id="ChartButton1" onclick="toggleDisplay('ChartDetails1', 'ChartButton1')">펼치기</button>
	                            <div id="ChartDetails1" style="display: none;">
                                    <c:forEach items="${listOfPetChard}" var="petchart">
	                                    <div class="border" style="position: relative;">
	                                        <p class="m-2"> 진료일자 : ${petchart.petChartDate} </p> 
	                                        <p class="m-2"> 진료명 : ${petchart.petChart} </p> 
	                                        <p class="m-2"> 진료내용 : ${petchart.petChartContent} </p>
	                                    </div>
                                    </c:forEach>
                            	</div>
                            </td>
                        </tr>
                        <tr>
                            <td>
                            <h4 class="d-flex align-self-center" id="Vaccination">예방접종</h4>
                             <form action="/123team/login/petcard?num=${petcard.petVaccinationNum}&petId=${petid.petId}" method="post" >
                                    <div class="border m-2"  style="position: relative;">
                                        <p class="m-2">예방접종일자: <input id="editDateField" type="date" name="petVaccinationDate" /> </p>
                                        <p class="m-2">예방접종명: <input id="editName" type="text" name="petVaccination"/> </p>
                                        <p class="m-2">예방접종내용: <input id="editContentField" type="text" name="petVaccinationCotent"/> </p>
                                        <input class="btn btn-success btn-sm border-3 border-dark mt-2 mb-2 ml-1" type="submit" value="접종 기록하기"/>
                                    </div>
                            </form>
                            
                            <button type="button" class="bg-info text-white rounded p-1" id="ChartButton2" onclick="toggleDisplay('ChartDetails2', 'ChartButton2')">펼치기</button>
                            <div id="ChartDetails2" style="display: none;">
                                <c:forEach items="${listOfpetVaccination}" var="vaccination" varStatus="status">
                                    <div class="border" style="position: relative;">
                                        <p class="m-2"> 진료일자 : ${vaccination.petVaccinationDate} </p> 
                                        <p class="m-2"> 진료명 : ${vaccination.petVaccination} </p> 
                                        <p class="m-2"> 진료내용 : ${vaccination.petVaccinationCotent} </p> 
                                    </div>
                                </c:forEach>
                            </div>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <h4 class="d-flex align-self-center" id="Surgery">수술</h4>
								<form action="/123team/login/petcard?num=${petcard.petSurgeryNum}&petId=${petid.petId}" method="post" >
	                                <div class="border m-2" style=" position: relative;">
	                                    <p class="m-2">수술날짜: <input id="editDateField4" type="date" name="petSurgeryDate"/> </p>
	                                    <p class="m-2">수술명: <input id="editName4" type="text" name="petSurgeryName"/> </p>
	                                    <p class="m-2">수술내용: <input id="editContentField4" type="text" name="petSurgeryContent"/> </p>
	                                	<input class="btn btn-success btn-sm border-3 border-dark mt-2 mb-2 ml-1" type="submit" value="수술 기록하기"/>
	                                </div>
                                </form>
                                
                                <button type="button" class="bg-info text-white rounded p-1" id="ChartButton3" onclick="toggleDisplay('ChartDetails3', 'ChartButton3')">펼치기</button>
                                
                                <div id="ChartDetails3" style="display: none;">
                                    <c:forEach items="${listOfPetSurgery}" var="surgery" varStatus="status">
                                        <div class="border m-2" style=" position: relative;">
                                            <p class="m-2">수술날짜:${surgery.petSurgeryDate} </p>
                                            <p class="m-2">수술명: ${surgery.petSurgeryName} </p>
                                            <p class="m-2">수술내용: ${surgery.petSurgeryContent}" </p>
                                        </div>

                                    </c:forEach>
                                </div>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <h4 class="d-flex align-self-center" id="SurgeryAfter">수술경과</h4>
	                            <form action="/123team/login/petcard?num=${petcard.petSurgeryAfterNum}&petId=${petid.petId}" method="post" >
                                  <div class="border" style=" position: relative;">
                                        <p class="m-2">입원 기록일자: <input id="editDateField5" type="date" name="petSurgeryAfterDate"/> </p>
                                        <p class="m-2">입원 진료내용: <input id="editContentField5" type="text" name="petSurgeryAfterContent"/> </p>
                                  		<input class="btn btn-success btn-sm border-3 border-dark mt-2 mb-2 ml-1" type="submit" value="입원 기록하기"/>	
                                  </div>   
                                  </form>
                                  
		                            <button type="button" class="bg-info text-white rounded p-1" id="ChartButton4" onclick="toggleDisplay('ChartDetails4', 'ChartButton4')">펼치기</button>
		                            <div id="ChartDetails4" style="display: none;">
	                                <c:forEach items="${listOfPetSurgeryAfter}" var="surgeryAfter">
	                                        <div class="border m-2" style=" position: relative;">
	                                            <p class="m-2">입원기록:${surgeryAfter.petSurgeryAfterDate} </p>
	                                            <p class="m-2">입원 내용: ${surgeryAfter.petSurgeryAfterContent} </p>
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

function toggleDisplay(contentId, buttonId) {
    var element = document.getElementById(contentId);
    var button = document.getElementById(buttonId);
    
    if (element.style.display === 'none' || element.style.display === '') {
        element.style.display = 'block';
        button.innerText = '내용 닫기';
    } else {
        element.style.display = 'none';
        button.innerText = '진료기록';
    }
}
</script>
</html>