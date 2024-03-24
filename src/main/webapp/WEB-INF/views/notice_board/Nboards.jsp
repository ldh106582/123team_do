<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.4.1/dist/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
</head>
<body>
	<% 
		int size = (Integer) request.getAttribute("size");
		request.setAttribute("sise", size);
	%>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="./resources/js/refreshing.js"></script>

<div id="header">
		<%@  include file="../module/header.jsp" %>
	</div>
		<div class="container-fluid page-body-wrapper">
	 		<%@  include file="../module/leftheader.jsp" %>
			<div class="content-wrapper">
		        <div class="row">
		           <div class="col-lg-12">
		                <div class="card">
		                    <div class="card-body">
		                        <p class="card-title">공지사항</p>
		                        <div class="d-flex justify-content-between mb-3">
		                            <div></div>
		                            <div>
                                    <form action="/123team/Nboards/selectbytitle" class="form-inline my-2 justify-content-center ">
							            <input type="text" name="title" placeholder="제목입력" class="form-control mr-3" />
							            <button type="submit" class="btn btn-outline-primary">검색</button>
							        </form>
		                                <c:if test="${loginId != null}">
		                                    <a href="Nboards/add" class="btn btn-primary">게시글 작성</a>
		                                </c:if>
		                            </div>
		                        </div>
			                    <div class="row">
			                        <div class="col-12">
				                        <div class="table-responsive">
				                            <div id="example_wrapper" class="dataTables_wrapper dt-bootstrap4 no-footer">
				                                <div class="row">
				                                    <div class="col-sm-12 col-md-6"></div>
				                                    <div class="col-sm-12 col-md-6"></div>
				                                </div>
				                                <div class="row">
				                                    <div class="col-sm-12">
							                        	<table id="example" class="display expandable-table dataTable no-footer" style="width: 100%;" role="grid">
								                            <thead>
								                                <tr role="row">
								                                    <th class="sorting_disabled" rowspan="1" aria-label="Quote#" style="width: 153px;">
								                                        #
								                                    </th>
								                                    <th tabindex="0" aria-controls="example" rowspan="1" colspan="1" aria-label="Product: activate to sort column descending" aria-sort="ascending" style="width: 177px;">
								                                        제목
								                                    </th>
								                                    <th tabindex="0" aria-controls="example" rowspan="1" colspan="1" aria-label="Business type: activate to sort column ascending" style="width: 210px;">
								                                        작성자
								                                    </th>
								                                    <th tabindex="0" aria-controls="example" rowspan="1" colspan="1" aria-label="Policy holder: activate to sort column ascending" style="width: 200px;">
								                                        작성일
								                                    </th>
								                                    <th tabindex="0" aria-controls="example" rowspan="1" colspan="1" aria-label="Premium: activate to sort column ascending" style="width: 149px;">
								                                        조회수
								                                    </th>
								                                </tr>
								                            </thead>
								
								                            <tbody>
								                                <c:set var="pageSize" value="${sise}" /> <!-- 한 페이지에 표시할 게시글 수 -->
								                                <c:set var="currentPage" value="${param.page ne null ? param.page : 1}" /> <!-- 현재 페이지 번호 -->
								                                <c:set var="start" value="${(currentPage - 1) * pageSize}" /> <!-- 페이지의 시작 인덱스 -->
								                                <c:set var="end" value="${currentPage * pageSize}" /> <!-- 페이지의 끝 인덱스 -->
								                                <%
								                                    int pagenum =0;
								                                    int totalPages=0;
								                                    int count = 0;
								                                %>
								                                <c:forEach items="${NBoardlist}" var="nboard" varStatus="status">
												   					<%
																		++pagenum;
																		request.setAttribute("pagenum", pagenum);
																	%>
													                <c:if test="${status.index >= start && status.index < end}"> <!-- 현재 페이지에 해당하는 게시글만 표시 -->
													                    <tr>
													                        <th scope="row">${pagenum}</th>
													                        <td class="col-7"><a href="/123team/Nboards/Nboard?boardId=${nboard.boardId}">${nboard.title}</a></td>
													                        <td>${nboard.personId}</td>
													                        <td>${nboard.registDay}</td>
													                        <td>${nboard.hit}</td>
													                    </tr>
													                </c:if>
												                </c:forEach>
								                            </tbody>
							                        	</table>
								                        <div>
								                            <%
								                                 if(pagenum%5>0){
								                                     ++totalPages;
								                                 }
								                             
								                                 totalPages = totalPages+(pagenum/5);
								                                 
								                                 if(size>5){
								                                     --totalPages;
								                                 }
								                                 request.setAttribute("totalPages", totalPages);
								                             %>
								                             <ul class="pagination justify-content-center">
								                                 <c:forEach begin="1" end="${totalPages}" var="pageNum"> 
								                                     <li class="page-item "><a href="Nboards?page=${pageNum}" class="page-link">${pageNum}</a></li>
								                                 </c:forEach>
								                             </ul>
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
 <%-- 
	<% 
		int size = (Integer) request.getAttribute("size");
		request.setAttribute("sise", size);
	%>
	<div class="container my-3">
        <h1><img width="66" height="66" src="https://img.icons8.com/external-outline-design-circle/66/external-46-business-and-investment-outline-design-circle.png" alt="external-46-business-and-investment-outline-design-circle"/>공지사항</h1>
        <div class="d-flex justify-content-between mb-3">
            <div>
                <a href="/123team/Nboards" class="btn btn-secondary mr-2">공지사항</a>
                <a href="/123team/Fboards" class="btn btn-secondary mr-2">자유게시판</a>
                <a href="/123team/ENboards" class="btn btn-secondary mr-2">체험단</a>
            </div>
            <div>
            	<a href="Nboards/add" class="btn btn-primary">게시글 작성</a>
            </div>
        </div>
        <table class="table table-striped">
            <thead>
                <tr>
                    <th scope="col">#</th>
                    <th scope="col">제목</th>
                    <th scope="col">작성자</th>
                    <th scope="col">작성일</th>
                    <th scope="col">조회수</th>
                </tr>
            </thead>
            <tbody>
            <c:set var="pageSize" value="${sise}" /> <!-- 한 페이지에 표시할 게시글 수 -->
			<c:set var="currentPage" value="${param.page ne null ? param.page : 1}" /> <!-- 현재 페이지 번호 -->
			<c:set var="start" value="${(currentPage - 1) * pageSize}" /> <!-- 페이지의 시작 인덱스 -->
			<c:set var="end" value="${currentPage * pageSize}" /> <!-- 페이지의 끝 인덱스 -->
			<%
				int pagenum =0;
				int totalPages=0;
				int count = 0;
			%>
                 <c:forEach items="${NBoardlist}" var="nboard" varStatus="status">
   					<%
						++pagenum;
						request.setAttribute("pagenum", pagenum);
					%>
	                <c:if test="${status.index >= start && status.index < end}"> <!-- 현재 페이지에 해당하는 게시글만 표시 -->
	                    <tr>
	                        <th scope="row">${pagenum}</th>
	                        <td class="col-7"><a href="/123team/Nboards/Nboard?boardId=${nboard.boardId}">${nboard.title}</a></td>
	                        <td>${nboard.boardId}</td>
	                        <td>${nboard.registDay}</td>
	                        <td>${nboard.hit}</td>
	                    </tr>
	                </c:if>
                </c:forEach>
            </tbody>
        </table>
        <div>
	       <%
				if(pagenum%5>0){
					++totalPages;
				}
			
				totalPages = totalPages+(pagenum/5);
				
				if(size>5){
					--totalPages;
				}
				request.setAttribute("totalPages", totalPages);
			%>
            <ul class="pagination justify-content-center">
                <c:forEach begin="1" end="${totalPages}" var="pageNum"> 
                    <li class="page-item "><a href="/123team/Nboards?page=${pageNum}" class="page-link">[${pageNum}]</a></li>
                </c:forEach>
            </ul>
        </div>
        

    </div>
	
	<%@ include file="../module/footer.jsp" %> --%>
</body>
</html>