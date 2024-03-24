<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page import="com.springmvc.domain.*" %>
<!DOCTYPE html>
<html>
<head>
<!-- 부트스트랩 -->
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.4.1/dist/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
<!-- css -->
<link rel="stylesheet" href="../resources/css/Mypage.css">
<meta charset="UTF-8">
<title>manager My page</title>
</head>
<body>


<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="./resources/js/refreshing.js"></script>

<div id="header">
		<%@  include file="../module/header.jsp" %>
	</div>

    <div class="container-fluid page-body-wrapper">
      <nav class="sidebar sidebar-offcanvas" id="sidebar">
        <ul class="nav">
          <li class="nav-item">
            <a class="nav-link" href="/123team/hospitals">
              <i class="fa-solid fa-hospital"></i>
              <span class="menu-title ml-3">반려동물 병원</span>
               <i class="menu-arrow"></i>
            </a>
          </li>
          <li class="nav-item">
            <a class="nav-link" data-toggle="collapse" href="/123team/products" aria-expanded="false" aria-controls="ui-basic">
              <i class="fa-solid fa-gift"></i>
              <span class="menu-title ml-3">반려동물 상품</span>
              <i class="menu-arrow"></i>
            </a>
          </li>
          <li class="nav-item">
            <a class="nav-link" data-toggle="collapse" href="#form-elements" aria-expanded="false" aria-controls="form-elements">
              <i class="fa-solid fa-cart-shopping"></i>
              <span class="menu-title ml-3">장바구니</span>
              <i class="menu-arrow"></i>
            </a>
          </li>
          <li class="nav-item">
            <a class="nav-link" data-toggle="collapse" href="/123team/ENboards" aria-expanded="false" aria-controls="charts">
              <i class="fa-solid fa-dog"></i>
              <span class="menu-title ml-3">체험단</span>
              <i class="menu-arrow"></i>
            </a>
          </li>
          <li class="nav-item">
            <a class="nav-link" data-toggle="collapse" href="/123team/Fboards" aria-expanded="false" aria-controls="tables">
              <i class="fa-solid fa-clipboard-question"></i>
              <span class="menu-title ml-3">자유게시판</span>
              <i class="menu-arrow"></i>
            </a>
          </li>
          <li class="nav-item">
            <a class="nav-link" data-toggle="collapse" href="#auth" aria-expanded="false" aria-controls="auth">
              <i class="fa-solid fa-user"></i>
              <span class="menu-title  ml-3">My Pages</span>
              <i class="menu-arrow"></i>
            </a>
          </li>
          <li class="nav-item">
            <a class="nav-link" data-toggle="collapse" href="/123team/Nboards" aria-expanded="false" aria-controls="error">
              <i class="fa-solid fa-clipboard"></i>
              <span class="menu-title ml-3">공지사항</span>
              <i class="menu-arrow"></i>
            </a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="/123team/login">
              <i class="fa-solid fa-key"></i>
              <span class="menu-title ml-3">로그인</span>
              <i class="menu-arrow"></i>
            
              <i class="fa-solid fa-right-from-bracket"></i>
              <span class="menu-title ml-3">로그아웃</span>
              <i class="menu-arrow"></i>
            </a>
          </li>
        </ul>
      </nav>
     
         <!-- partial -->
      <div class="main-panel">
        <div class="content-wrapper">
          <div class="row">
            <div class="col-md-12 grid-margin">
              <div class="row">
                <div class="col-12 col-xl-8 mb-4 mb-xl-0">
                  <h3 class="font-weight-bold"> </h3>
                  <h6 class="font-weight-normal mb-0"></h6>
                </div>
                <div class="col-12 col-xl-4">
                 <div class="justify-content-end d-flex">
                  <div class="dropdown flex-md-grow-1 flex-xl-grow-0">
                  </div>
                 </div>
                </div>
              </div>
            </div>
          </div>
          
        <footer class="footer">
          <div class="d-sm-flex justify-content-center justify-content-sm-between">
            <span class="text-muted text-center text-sm-left d-block d-sm-inline-block">Copyright © 2021.  Premium <a href="https://www.bootstrapdash.com/" target="_blank">Bootstrap admin template</a> from BootstrapDash. All rights reserved.</span>
            <span class="float-none float-sm-right d-block mt-1 mt-sm-0 text-center">Hand-crafted & made with <i class="ti-heart text-danger ml-1"></i></span>
          </div>
          <div class="d-sm-flex justify-content-center justify-content-sm-between">
            <span class="text-muted text-center text-sm-left d-block d-sm-inline-block">Distributed by <a href="https://www.themewagon.com/" target="_blank">Themewagon</a></span> 
          </div>
        </footer> 
        <!-- partial -->
      </div>
      <!-- main-panel ends -->
    </div>   
    <!-- page-body-wrapper ends -->
  </div>
  <!-- container-scroller -->
  <%
    HttpSession sessions = request.getSession();
    String type = (String) session.getAttribute("type");
    System.out.println("mypage type : " + type);
   %>
   
<!-- 관리자 구분 -->
   <div id="wrap" class="wrap naverid ">
      <header class="header" role="banner">
          <div class="header_subindex">
              <!--로고/Mypage-->
              <div class="gnb_area">
                  <a href="#" class="text-decoration-none" >
                      <h2 class="">ManagerPage</h2>
                  </a>
              </div>
          </div>
          <!--프로필-->
          <div class="profile_area">
              <div class="profile_inner">
                 <a href="#" onclick="changeImage()" class="photo">
                     <img src="https://static.nid.naver.com/images/web/user/default.png" width="84" height="84" alt="프로필 이미지">
                     <span class="photo_edit"></span>
                  </a>
                  <div class="profile">
                      <p class="useid">${ productMember.personId } 님 </p>
                      <p class="usemail">${productMember.companyName } 사장님</p>
                  </div>
              </div>
          </div>
          
          <div id="headerLeft" class="header_left" aria-hidden="false">
              <ul class="left_menu" role="menu">
                  <li>
                     <a href="" class="left_item" role="menuitem">
                         <div class="menu_text">내정보</div>
                     </a>
                  </li>
                  <li>
      
                     <a href="./login/petcard" class="left_item" role="menuitem" >
                         <div class="menu_text ">펫 카드</div>
                     </a>
      
                      <a href="login/petcard" class="left_item" role="menuitem" >
                          <div class="menu_text ">펫 카드</div>
                      </a>
      
                  </li>
                  <li>
                     <a href="./pet?id=${ productMember.personId }" class="left_item" role="menuitem" >
                         <div class="menu_text ">반려동물 회원가입</div>
                     </a>
                  </li>
                  <li>
                     <a href="../login/logout" class="left_item" role="menuitem" >
                         <div class="menu_text " id="logout">로그아웃</div>
                     </a>
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
               <div class="subindex_item">
                   <div class="head_title">
                       <h2 class="subindex_title">내 정보 수정</h2>
                   </div>
               </div>
               <div class="subindex_greenbox">
                   <ul class="subindex_row">
                       <li>
                           <div class="row_item other">
                               <a href="/123team/managerlogin/managerudpate?personId=${ productMember.personId }" class="text-decoration-none"><span class="item_text">내 정보 수정</span></a>
                           </div>
                       </li>
                       <li>
                           <div class="row_item other">
                               <a href="/123team/managerlogin/ManagerDelete?managerid=${ productMember.personId }" class="text-decoration-none" id="delete"><span class="item_text">회원 탈퇴</span></a>
                           </div>
                       </li>
                   </ul>
               </div>
        
          		<hr>
	           <!--병원 예약 정보-->
	           <div class="subindex_item">
	               <div class="head_title">
	                   <h2 class="subindex_title">병원 예약 정보</h2>
	               </div>
	               <div class="subindex_greenbox">
	                   <ul class="subindex_row">
	                       <li>
	                           <div class="row_item other">
	                               <a href="" class="text-decoration-none"><span class="item_text">예약 확인</span></a>
	                           </div>
	                       </li>
	                   </ul>
	               </div>
	           </div>
	           
	          <!--상품관리자 상품 정보-->
	            <div class="subindex_item">
	                <div class="head_title">
	                    <h2 class="subindex_title">상품 관리</h2>
	                </div>
	                <div class="subindex_greenbox">
	                    <ul class="subindex_row">
	                        <li>
	                            <div class="row_item other">
	                                <a href="" class="text-decoration-none"><span class="item_text">상품 조회/수정</span></a>
	                            </div>
	                        </li>
	                        <li>
	                            <div class="row_item other">
	                                <a href="" class="text-decoration-none"><span class="item_text">상품등록</span></a>
	                            </div>
	                        </li>
	                        <li>
	                            <div class="row_item other">
	                                <a href="" class="text-decoration-none"><span class="item_text">주문 내역 조회</span></a>
	                            </div>
	                        </li>
	                    </ul>
	                </div>
	            </div>    
	           <!--주문 정보-->
	           <div class="subindex_item">
	               <div class="head_title">
	                   <h2 class="subindex_title">주문목록</h2>
	               </div>
	               <div class="subindex_greenbox">
	                   <ul class="subindex_row">
	                       <li>
	                           <div class="row_item other">
	                               <a href="" class="text-decoration-none"><span class="item_text">주문 내역 확인</span></a>
	                           </div>
	                       </li>
	                   </ul>
	               </div>
	           </div>
	           <!--게시판-->
	           <div class="subindex_item">
	               <div class="head_title">
	                   <h2 class="subindex_title">게시판</h2>
	               </div>
	               <div class="subindex_greenbox">
	                   <ul class="subindex_row">
	                       <li>
	                           <div class="row_item other">
	                          	 <a href="" class="text-decoration-none"><span class="item_text">작성 글 확인</span></a>
	                           </div>
	                       </li>
	                   </ul>
	               </div>
	           </div>
	           <!--Q&A-->
	           <div class="subindex_item">
	               <div class="head_title">
	                   <h2 class="subindex_title">Q&A</h2>
	               </div>
	               <div class="subindex_greenbox">
	                   <ul class="subindex_row">
	                       <li>
	                           <div class="row_item other">
	                               <a href="" class="text-decoration-none"><span class="item_text">작성 Q&A 확인</span></a>
	                           </div>
	                       </li>
	                   </ul>
	               </div>
	           </div>
	           <!--체험단-->
	           <div class="subindex_item">
	               <div class="head_title">
	                   <h2 class="subindex_title">체험단</h2>
	               </div>
	               <div class="subindex_greenbox">
	                   <ul class="subindex_row">
	                       <li>
	                           <div class="row_item other">
	                               <a href="" class="text-decoration-none"><span class="item_text">체험 신청 글 확인</span></a>
	                           </div>
	                       </li>
	                   </ul>
	               </div>
	           </div>
       		</div>
		</div>
	
	<%@ include file="../module/footer.jsp" %>
</body>
<!-- js -->
<script src="../resources/js/Mypage.js"></script>
</html>