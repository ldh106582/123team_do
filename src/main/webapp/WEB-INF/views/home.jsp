<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<meta charset="UTF-8">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page import="java.util.List"%>
<%@ page import="java.sql.*" %>
<html>
<head>
<!--  부트스트랩 -->
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.3.1/dist/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
<!-- 폰트어썸 -->
<script src="https://kit.fontawesome.com/8759f784cf.js" crossorigin="anonymous"></script>
<!-- css -->
<link href="<c:url value="/resources/css/index.css"/>" rel="stylesheet">
<link href="<c:url value="/resources/pet/"/>" rel="stylesheet">
<link href="<c:url value="/resources/css/home.css"/>" rel="stylesheet">
<!-- Required meta tags -->
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<title>Skydash Admin</title>
<!-- plugins:css -->
<link href="<c:url value="/resources/css/vendors/feather/feather.css"/>" rel="stylesheet">
<link href="<c:url value="resources/css/vendors/ti-icons/css/themify-icons.css"/>" rel="stylesheet">
<link href="<c:url value="/resources/css/vendors/css/vendor.bundle.base.css"/>" rel="stylesheet">
<!-- endinject -->
<link href="<c:url value="/resources/css/vendors/datatables.net-bs4/dataTables.bootstrap4.css"/>" rel="stylesheet">
<link href="<c:url value="/resources/css/vendors/ti-icons/css/themify-icons.css"/>" rel="stylesheet">
<link href="<c:url value="/resources/css/text/css"/>">
<!-- inject:css -->
<link href="<c:url value="/resources/css/vertical-layout-light/style.css"/>" rel="stylesheet">
<!-- End plugin css for this page -->
<!-- endinject -->
<link href="<c:url value="/resources/css/images/favicon.png"/>" rel="stylesheet">
<link rel="shortcut icon" href="images/favicon.png" />
</head>
<body>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="./resources/js/refreshing.js"></script>

 <div id="header">
	<%@  include file="./module/header.jsp" %>
</div>
	
   <div class="container-fluid page-body-wrapper">
 <%@  include file="./module/leftheader.jsp" %>
  
      <div class="main-panel">
        <div class="content-wrapper">
           <div class="row mx-auto">
                     <!--여기서 복붙 시작-->
		    <div class="slider mx-0 mx-auto ">
		        <div class="slide">
		            <img src="https://i.ibb.co/gdq8PKg/pexels-tom-fisk-1692693.jpg" width="100%" height="100%" alt="병원이미지01" />
		        </div>
		        <div class="slide">
		        	<img src="https://i.ibb.co/TB696jj/pexels-mikhail-nilov-7469213.jpg" width="100%" height="100%" alt="병원이미지02" border="0">
		        </div>
		        <div class="slide">
		        	<img src="https://i.ibb.co/c1F1kf8/pexels-karolina-grabowska-4386495.jpg" width="100%" height="100%" alt="병원이미지03">
		        </div>
		    </div>

            <div class="center col-md-12 row p-0 no-gutters mx-0 mx-auto">
                <div class="col-md-9 mx-0 mx-auto">
                    <div style="border-left: 3px solid red;"> <h4 style="margin-left: 2%;"> 우리 홈페이지 현황</h4>
                    </div>
                    <br>

                    <h5 style="border-left: 3px solid #FF7EA0; margin-bottom: 3%;"><span class="ml-4">best 별점 병원</span></h5>
                     <div class="col-md-12 row card-group no-gutters p-0" style="margin-bottom: 3%;">
                       <div class="col-md-12  card-group no-gutters p-0 d-felx">
	                       <%
							Connection conn = null;
						   	Statement stmt = null;
						  	ResultSet rs = null;
						   
						   try {
						      // JDBC 드라이버를 로드합니다.
						      Class.forName("com.mysql.jdbc.Driver");
						      
						      // DB에 연결합니다.
						      String url = "jdbc:mysql://localhost:3306/123team_db";
						      String username = "root";
						      String password = "1234";
						      conn = DriverManager.getConnection(url, username, password);
						      
						      // SQL 쿼리를 실행합니다.
						      String sql = "SELECT * FROM hospital order by reviewScore desc limit 3";
						      stmt = conn.createStatement();
						      rs = stmt.executeQuery(sql);
						      // 결과를 처리합니다.
						      while (rs.next()) {
						         // 각 행의 데이터를 가져옵니다.
						         String name = rs.getString(1);
						         String addr = rs.getString(2);
						         String hid = rs.getString(5);
						         String description = rs.getString(7);
						         String image = rs.getString(9);
						         float reviewScore = rs.getFloat(12);
						         int reviewCount = rs.getInt(13);
						         
						         request.setAttribute("name", name);
						         request.setAttribute("addr", addr);
						         request.setAttribute("description", description);
						         request.setAttribute("hid", hid);
						         request.setAttribute("image", image);
						         request.setAttribute("reviewScore", reviewScore);
						         request.setAttribute("reviewCount", reviewCount);
						         
							 %>
                                   	
                                   		
	                 <div class="col-md-12 row no-gutters mr-1 card mb-1">
	                    <div class="col-md-12 card-body no-gutters">
	                     <c:choose>
	                         <c:when test="${not empty image}">
	                             <img class="col-md-12 " src="<c:url value='/resources/images/${image}'/>" height="250" width="150" alt="병원이미지">
	                         </c:when>
	                         <c:otherwise>
	                             <img class="col-md-12" src="https://i.ibb.co/gdq8PKg/pexels-tom-fisk-1692693.jpg" alt="병원이미지" height="250" width="150" border="0">
	                         </c:otherwise>
	                     </c:choose>
	                      <p class="card-title" style="margin-top: 7%;">병원명 : ${name}</p>
	                      <p class="card-text" style="margin-top: 4%;">병원안내 : ${description}</p>
	                      <p class="card-text" style="margin-top: 4%;">리뷰수 ${reviewCount} || 평점 : ${reviewScore}</p>
	                    </div>
						  <a href="hospitals/hospital?hid=${hid}" class="btn btn-outline-primary" >병원 상세보기</a>
               	 	</div>

	                  <%
					    }
					   } catch (Exception e) {
					      e.printStackTrace();
					   } finally {
					      // 사용한 자원을 정리합니다.
					      if (rs != null) {
					         try { rs.close(); } catch (SQLException e) { }
					      }
					      if (stmt != null) {
					         try { stmt.close(); } catch (SQLException e) { }
					      }
					      if (conn != null) {
					         try { conn.close(); } catch (SQLException e) { }
					      }
					   }
					%> 
      			  </div>
             			               
                   <h5 style="border-left: 3px solid #FFA07A; margin-bottom: 3%;" class="col-md-12"><span class="ml-4" >best 별점 상품</span></h5>
					 <div class="col-md-12  card-group no-gutters p-0 d-felx">
	                       <%
							
						   
						   try {
						      // JDBC 드라이버를 로드합니다.
						      Class.forName("com.mysql.jdbc.Driver");
						      
						      // DB에 연결합니다.
						      String url = "jdbc:mysql://localhost:3306/123team_db";
						      String username = "root";
						      String password = "1234";
						      conn = DriverManager.getConnection(url, username, password);
						      
						      // SQL 쿼리를 실행합니다.
						      String sql = "SELECT * FROM product order by reviewScore desc limit 3";
						      stmt = conn.createStatement();
						      rs = stmt.executeQuery(sql);
						      // 결과를 처리합니다.
						      while (rs.next()) {
						         // 각 행의 데이터를 가져옵니다.
						         String ProductId = rs.getString(1);
						         String ProductName = rs.getString(2);
						         int ProductPrice = rs.getInt(3);
						         String ProductDscription = rs.getString(5);
						         String ProductImage = rs.getString(8);
						         float reviewScore = rs.getFloat(11);
						         int reviewCount = rs.getInt(12);
						         
						         request.setAttribute("ProductId", ProductId);
						         request.setAttribute("ProductName", ProductName);
						         request.setAttribute("ProductPrice", ProductPrice);
						         request.setAttribute("ProductDscription", ProductDscription);
						         request.setAttribute("ProductImage", ProductImage);
						         request.setAttribute("reviewScore", reviewScore);
						         request.setAttribute("reviewCount", reviewCount);
						         
						 %>
                                         		
                       <div class="col-md-12 row no-gutters mr-1 card mb-1">
                          <div class="col-md-12 card-body no-gutters">
                          <c:choose>
                              <c:when test="${not empty ProductImage}">
                                  <img class="col-md-12 " src="<c:url value='/resources/images/${ProductImage}'/>" height="250" width="150" alt="병원이미지">
                              </c:when>
                              <c:otherwise>
                                  <img class="col-md-12" src="https://i.ibb.co/gdq8PKg/pexels-tom-fisk-1692693.jpg" alt="상품이미지" height="250" width="150" border="0">
                              </c:otherwise>
                          </c:choose>
                           <p class="card-title" style="margin-top: 7%;">상품명 : ${ProductName}</p>
                           <p class="card-text" style="margin-top: 4%;">가격 : ${ProductPrice}</p>
                           <p class="card-text" style="margin-top: 4%;">상품설명 : ${ProductDscription}</p>
                           <p class="card-text" style="margin-top: 4%;">리뷰수 ${reviewCount} || 평점 : ${reviewScore}</p>
                         </div>
                          <a href="products/product?productId=${ProductId}" class="btn btn-outline-primary" >상품 상세보기</a>
                      </div>
							               
	                  <%
					    }
					   } catch (Exception e) {
					      e.printStackTrace();
					   } finally {
					      // 사용한 자원을 정리합니다.
					      if (rs != null) {
					         try { rs.close(); } catch (SQLException e) { }
					      }
					      if (stmt != null) {
					         try { stmt.close(); } catch (SQLException e) { }
					      }
					      if (conn != null) {
					         try { conn.close(); } catch (SQLException e) { }
					      }
					   }
					%> 
					</div>
												
                  <h5 style="border-left: 3px solid #FFCD63; margin-bottom: 3%;"> <span class="ml-4">체험단 현황</span></h5>
                     <div class="col-md-12 row card-group no-gutters" style="margin-bottom: 3%;">
				        <div class="card">
				           <div class="card-body">
                      			<%
							  try {
							     // JDBC 드라이버를 로드합니다.
							     Class.forName("com.mysql.jdbc.Driver");
							     
							     // DB에 연결합니다.
							     String url = "jdbc:mysql://localhost:3306/123team_db";
							     String username = "root";
							     String password = "1234";
							     conn = DriverManager.getConnection(url, username, password);
							     
							     // SQL 쿼리를 실행합니다.
							     String sql = "SELECT * FROM ENBoard order by Hit desc limit 3";
							     stmt = conn.createStatement();
							     rs = stmt.executeQuery(sql);
							     // 결과를 처리합니다.
							     while (rs.next()) {
							        // 각 행의 데이터를 가져옵니다.
							        String Title = rs.getString(2);
							        int Hit = rs.getInt(3);
							        String RegistDay = rs.getString(4);
							        String BoardId = rs.getString(7);
							       
							        
							        request.setAttribute("Hit1", Hit);
							        request.setAttribute("Title1", Title);
							        request.setAttribute("BoardId1", BoardId);
							        request.setAttribute("RegistDay1", RegistDay);
								 %>
                                <ul class="icon-data-list d-block border-top">
					                <li>
					                  <div class="">
					                    <div>
					                      <a href="ENboards/ENboard?boardId=${BoardId1}"><p class="text-info mb-1">${Title1}</p></a>
					                      <small>${RegistDay1} 조회수 ${Hit1}</small>
					                    </div>
					                  </div>
					                </li>
					              </ul>
             						 <%
    								}
								   } catch (Exception e) {
								      e.printStackTrace();
								   } finally {
								      // 사용한 자원을 정리합니다.
								      if (rs != null) {
								         try { rs.close(); } catch (SQLException e) { }
								      }
								      if (stmt != null) {
								         try { stmt.close(); } catch (SQLException e) { }
								      }
								      if (conn != null) {
								         try { conn.close(); } catch (SQLException e) { }
								      }
								   }
								%> 
								</div>
      						 </div>
                          </div>
                    	</div>
					 </div>

                	<div class="col-md-3 stretch-card grid-margin">
		             <div class="card">
		               <div class="card-body">
		                 <p class="card-title">공지사항</p>
		                 <%
						   try {
						      // JDBC 드라이버를 로드합니다.
						      Class.forName("com.mysql.jdbc.Driver");
						      
						      // DB에 연결합니다.
						      String url = "jdbc:mysql://localhost:3306/123team_db";
						      String username = "root";
						      String password = "1234";
						      conn = DriverManager.getConnection(url, username, password);
						      
						      // SQL 쿼리를 실행합니다.
						      String sql = "SELECT * FROM NBoard";
						      stmt = conn.createStatement();
						      rs = stmt.executeQuery(sql);
						      int i = 1;
						      // 결과를 처리합니다.
						      while (rs.next()) {
						         // 각 행의 데이터를 가져옵니다.
						         String context = rs.getString(2);
						         String title = rs.getString(3);
						         int hit = rs.getInt(4);
						         String registDay = rs.getString(5);
						         String boardId = rs.getString(6);
						         
						         request.setAttribute("context", context);
						         request.setAttribute("title", title);
						         request.setAttribute("hit", hit);
						         request.setAttribute("registDay", registDay);
						         request.setAttribute("boardId", boardId);
						         request.setAttribute("num", i);
						         i++;
						         if(i==7){
						        	 break;
						         } 
						 %>
		                  <ul class="icon-data-list d-block border-top">
		                    <li>
		                      <div class="">
		                        <div>
		                          <a href="Nboards/Nboard?boardId=${boardId}"><p class="text-info mb-1">${title}</p></a>
		                          <small>${registDay} 조회수 ${hit}</small>
		                        </div>
		                      </div>
		                    </li>
		                  </ul>
		                  <%
						    }
						   } catch (Exception e) {
						      e.printStackTrace();
						   } finally {
						      // 사용한 자원을 정리합니다.
						      if (rs != null) {
						         try { rs.close(); } catch (SQLException e) { }
						      }
						      if (stmt != null) {
						         try { stmt.close(); } catch (SQLException e) { }
						      }
						      if (conn != null) {
						         try { conn.close(); } catch (SQLException e) { }
						      }
						   }
						%> 
		                </div>
	             	 </div>
	              </div>     
	            </div> 
                 <!--여기서 복붙 끝-->
             </div>
          </div>
       </div>
     </div>
     
	<%@ include file="./module/footer.jsp" %> 
  
  <script src="vendors/js/vendor.bundle.base.js"></script>
  <script src="vendors/chart.js/Chart.min.js"></script>
  <script src="vendors/datatables.net/jquery.dataTables.js"></script>
  <script src="vendors/datatables.net-bs4/dataTables.bootstrap4.js"></script>
  <script src="js/dataTables.select.min.js"></script>
  <script src="js/off-canvas.js"></script>
  <script src="js/hoverable-collapse.js"></script>
  <script src="js/template.js"></script>
  <script src="js/settings.js"></script>
  <script src="js/todolist.js"></script>
  <script src="js/dashboard.js"></script>
  <script src="js/Chart.roundedBarCharts.js"></script>
</body>
<script src="/resources/js/hospitals.js"></script>
</html>
<!-- 2024-03-11  merge 완료 -->

                                     <%-- <div class="col-md-5">
                                            <div class="no-gutters col-md-12" style="border-left: 3px solid red;"><h4 class="ml-3" >공지사항 </h4>    
                                            </div>	
                                            <br>   
	                                            <div class="card col-md-12 no-gutters" style="max-width: 540px;">
											<%
												Connection conn = null;
											   	Statement stmt = null;
											  	ResultSet rs = null;
											   
											   try {
											      // JDBC 드라이버를 로드합니다.
											      Class.forName("com.mysql.jdbc.Driver");
											      
											      // DB에 연결합니다.
											      String url = "jdbc:mysql://localhost:3306/123team_db";
											      String username = "root";
											      String password = "1234";
											      conn = DriverManager.getConnection(url, username, password);
											      
											      // SQL 쿼리를 실행합니다.
											      String sql = "SELECT * FROM NBoard";
											      stmt = conn.createStatement();
											      rs = stmt.executeQuery(sql);
											      int i = 1;
											      // 결과를 처리합니다.
											      while (rs.next()) {
											         // 각 행의 데이터를 가져옵니다.
											         
											         String title = rs.getString(3);
											         int hit = rs.getInt(4);
											         String registDay = rs.getString(5);
											         String boardId = rs.getString(6);
											         
											         request.setAttribute("title", title);
											         request.setAttribute("hit", hit);
											         request.setAttribute("registDay", registDay);
											         request.setAttribute("boardId", boardId);
											         request.setAttribute("num", i);
											         i++;
											         if(i==7){
											        	 break;
											         } 
											 %>
											 			<a href="Nboards/Nboard?boardId=${boardId}">${num} 제목 : ${title} 조회수 : ${hit} 등록일 : ${registDay}</a>
											<%
											    }
											   } catch (Exception e) {
											      e.printStackTrace();
											   } finally {
											      // 사용한 자원을 정리합니다.
											      if (rs != null) {
											         try { rs.close(); } catch (SQLException e) { }
											      }
											      if (stmt != null) {
											         try { stmt.close(); } catch (SQLException e) { }
											      }
											      if (conn != null) {
											         try { conn.close(); } catch (SQLException e) { }
											      }
											   }
											%>  
	                                         </div>
                                        </div> --%>