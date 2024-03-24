<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.4.1/dist/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
<head>
<meta charset="UTF-8">
<title>통합관리자 회원가입 페이지</title>
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
        <br>
        <br>
        <br>
        <br>
        <br>
        <br>
        <br>
        <div class="mt-5 d-flex justify-content-center" >
            <div class="col ">
                <div class="col-12 row m-0 text-center justify-content-center">
                    <a href="/123team/managerlogin/Member?type=h" class="p-4  card card-tale col-5 m-1 text-decoration-none" id="hopital">병원관리자 회원가입</a>
                </div>
                <div class="col row m-0 text-center justify-content-center">
                    <a href="/123team/managerlogin/Member?type=p" class="p-4  card card-dark-blue col-5 m-1 text-decoration-none" id="product">상품관리자 회원가입</a>
                </div>
                <div class="col row m-0 text-center justify-content-center">
                    <a href="/123team/managerlogin/Member?type=e" class="p-4  card card-light-blue col-5 m-1 text-decoration-none" id="exprience">체험단관리자 회원가입</a>
                </div>
                <div class="col row m-0 text-center justify-content-center">
                    <a href="/123team/login/add?type=c" class="p-4  card card-light-danger col-5 m-1 text-decoration-none" id="customer">일반 회원가입</a>                </div>
            </div>
        </div>
   	 </div>
          
  </div>
  <!-- container-scroller -->
    <div class="jumbotron">
        <div class="container">
            <h4> 관리자를 위한 회원가입 페이지 입니다.</h4>
        </div>
    </div>

    <br><br><br><br><br>
    
        <div class="mt-5" >
            <div class="col ">
                <div class="col-12 row m-0 text-center justify-content-center">
                    <a href="/123team/managerlogin/Member?type=h" class="p-4  border border-dark col-5 m-1 bg-info text-white rounded" id="hopital">병원관리자 회원가입</a>
                    <a href="/123team/managerlogin/Member?type=p" class="p-4  border border-dark col-5 m-1 bg-danger text-white rounded" id="product">상품관리자 회원가입</a>
                </div>
                
                <div class="col row m-0 text-center justify-content-center">
                    <a href="/123team/managerlogin/Member?type=e" class="p-4  border border-dark col-5 m-1 bg-success text-white rounded" id="exprience">체험단관리자 회원가입</a>
                    <a href="/123team/login/add?type=c" class="p-4  border border-dark col-5 m-1 rounded" id="customer">일반 회원가입</a>
                </div>
            </div>
        </div>
	
	<%@ include file="../module/footer.jsp" %>
</body>
<!-- js -->
<script>
document.addEventListener("DOMContentLoaded", function(){
	 
	var hopital = document.getElementById("hopital");
	var product = document.getElementById("product");
	var exprience = document.getElementById("exprience");
	var customer = document.getElementById("customer");
	
	if(hopital) {
		hopital.addEventListener("click", function(){
			alert("병원관리자 회원가입 페이지로 이동합니다.");
		});
	} 
	
	if(product) {
		product.addEventListener("click", function(){
			alert("상품관리자 회원가입 페이지로 이동합니다.")
		});
	} 
	
	if(exprience){
		exprience.addEventListener("click", function(){
			alert("체험단 회원가입 페이지로 이동합니다.");
		});
	}
	
	if(customer){
		customer.addEventListener("click", function(){
			alert("일반 회원가입 페이지로 이동합니다.");
		})
	}
});
</script>
<
</html>