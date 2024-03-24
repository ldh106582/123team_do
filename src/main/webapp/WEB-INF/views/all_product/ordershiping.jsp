<%@page import="java.time.LocalDate"%>
<%@page import="java.time.format.DateTimeFormatter"%>
<%@page import="java.time.LocalDateTime"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html>
<head>
<!-- 부트스트랩 -->
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.4.1/dist/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
<!-- 폰트어썸 -->
<script src="https://kit.fontawesome.com/8759f784cf.js" crossorigin="anonymous"></script>
<!-- css  수정 필요-->
<link rel="stylesheet" href="/resources/css/shoppingcart.css">
<meta charset="UTF-8">
<title>배송정보 페이지</title>
</head>
<body>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="./resources/js/refreshing.js"></script>

<div id="header">
		<%@  include file="../module/header.jsp" %>
</div>

  <div class="container-fluid page-body-wrapper">
      
     <%@  include file="../module/leftheader.jsp" %>
     <%
	  	LocalDateTime time = LocalDateTime.now();
	 	DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd");
	 	String noewfomatter = LocalDateTime.now().format(formatter);
	  	LocalDate newDate = LocalDate.now().plusDays(3);
	  %>
     <div class="content-wrapper d-flex align-items-center auth px-0">
        <div class="row w-100 mx-0">
           <div class="col-lg-8 mx-auto">
                <div class="auth-form-light text-left py-5 px-4 px-sm-5">
                    <div class="content-wrapper">
                        <div class="col-12 grid-margin stretch-card">
                            <div class="card">
                                <div class="card-body">
                                    <h4 class="card-title">주문완료 페이지</h4>
                                    <form action="/123team/orders/o_complete" method="POST" enctype="multipart/form-data">
                                    <input type="hidden" name="personId" value="${person.personId }"/>
                                    <input type="hidden" name="personName" value="${person.personName}"/> <!-- 이름 -->
                                    <input type="hidden" name="personPhone" value="${person.personPhone}"/> <!-- 연락처 -->
                                    <input type="hidden" name="addr" id="fullAddr"/> <!-- 주소 -->
                                    
                                    <div class="form-group">
                                        <h4 class="col-md-12 p-0" style="color: rgb(140, 58, 179);">성명 </h4>  
                                        <input class="form-control form-control-lg" type="text" value="${person.personName}"/>
                                    </div>
                                    <div class="form-group">
                                        <h4 class="col-md-12 p-0" style="color: rgb(140, 58, 179);">연락처 </h4>   
                                        <input class="form-control form-control-lg" type="text" value="${person.personPhone}"/>
                                    </div>
                                    <div class="form-group">
                                    <h4 class="col-md-12 p-0" style="color: rgb(140, 58, 179);">주문일 </h4>  
                                    	<input type="text" class="form-control form-control-lg" value="<%= noewfomatter %> "/>
                                    </div>
                                    <div class="form-group">
                                        <h4 class="col-md-12 p-0" style="color: rgb(140, 58, 179);">배송예정 </h4>  
                                        <input type="text" class="form-control form-control-lg" value="<%= newDate %>" />
                                    </div>
									<div class="form-group show-grid r d-flex">
										<input type="text" id="post" class="form-control form-control-lg col-md-8 mr-3" placeholder="우편번호">
										<input type="button" onclick="execDaumPostcode()" value="우편번호" class="btn btn-outline-primary col-md-3 font-weight-medium auth-form-btn text-center">
									</div>	
									<div class="form-group">
										<input type="text" id="roadAddress" class="form-control form-control-lg col-md-12" placeholder="도로명주소">
									</div>	
											
									<div class="form-group">
									<input type="text" id="detailAddress" class="form-control form-control-lg col-md-12" placeholder="상세주소">
									</div>

                                    <div class="mt-3">
                                        <input onclick="combineAddr()" type="submit" class="btn btn-block btn-primary btn-lg font-weight-medium auth-form-btn mt-3" value="주문완료"/>
                                    </div>
                                    </form>
                                    <button class="btn btn-outline-danger mt-3 float-right" onclick="goBack()">주문취소</button>
									
									<script>
									function goBack() {
									  history.back();
									}
									</script>
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
           
	<!--   <div class="jumbotron">
		  <div class="contianer">
			 <h2 class="dislpay-2"> <i class="fa-solid fa-truck-fast"></i> 배송 정보 확인</h2>
		  </div>
	  </div>
	  
	  <br>
	  
      <div class="container">
        <form action="/123team/orders/o_complete" class="form-horizontal" method="post">
        <input type="hidden" name="personId" value="${person.personId }"/>
        <input type="hidden" name="personName" value="${person.personName}"/> <!-- 이름 -->
    <!--    <input type="hidden" name="personPhone" value="${person.personPhone}"/> 연락처 
        <input type="hidden" name="personAddress" value="${person.personAddress}"/> <!-- 주소 -
            <div class="form-group row">
                <label class="col-sm-2"> <i class="fa-solid fa-user col-sm-1"></i> 성명</label>
                <div class="col-sm-3">
                    <input name="" type="text" class="form-control" value="${person.personName}">
                </div>
            </div>
            <div class="form-group row">
                <label class="col-sm-2"> <i class="fa-solid fa-phone col-sm-1"></i> 연락처</label>
                <div class="col-sm-3">
                    <input name="" type="text" class="form-control" value="${person.personPhone}">
                </div>
            </div>
            <div class="form-group row">
                <label class="col-sm-2"> <i class="fa-solid fa-clock col-sm-1"></i> 주문일</label>
                <div class="col-sm-3">
                    <input name="" type="text" class="form-control" value="<%= noewfomatter %>"/>
                </div>
            </div>
            <div class="form-group row">
                <label class="col-sm-2"> <i class="fa-solid fa-calendar-days col-sm-1"></i> 배송예정</label>
                <div class="col-sm-3">
                    <input name="" type="text" class="form-control" value="<%= newDate %>"/>
                </div>
            </div>

            <div class="form-group row">
                <label class="col-sm-2"> <i class="fa-solid fa-location-dot col-sm-1"></i> 주소</label>
                <div class="col-sm-3">
                    <input name="" type="text" class="form-control" value="${person.personAddress}">
                </div>
            </div>
            <br><br>
            <div class="form-group row">
                <div class="col-sm-4 col-sm-6">
                    <a href="#" class="btn btn-success col-sm-3" style="font-size: 15px">이전</a>
                    <a href="#" class="btn btn-success col-sm-3" style="font-size: 15px">취소</a>
                    <input type="submit" value="주문완료" class="btn btn-info col-sm-3" style="font-size: 15px"/>
                </div>
                
            </div>
        </form>
	  </div> -->
	  
</body>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script src="../resources/js/orderShippng.js"></script>
</html>