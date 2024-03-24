<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="com.springmvc.domain.*"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.4.1/dist/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">

				<script type="text/javascript">
					function editform(comment,commentId){
						
						var container = document.getElementById(commentId);
						console.log(commentId);
						var dew = "willdelete"+commentId;
						var willdelete = document.getElementById(dew);
						console.log(dew);
						container.removeChild(willdelete);
						
						var form = document.createElement("form");
						form.setAttribute("action","/123team/Nboards/updatecomment");
						form.setAttribute("method","POST");
						
						var inputh = document.createElement("input");
						inputh.setAttribute("type","hidden");
						inputh.setAttribute("name","commentId");
						inputh.setAttribute("value",commentId);
						
						var inputt = document.createElement("input");
						inputt.setAttribute("type","text");
						inputt.setAttribute("name","comment");
						inputt.setAttribute("value",comment);
						
						var inputs = document.createElement("input");
						inputs.setAttribute("type","submit");
						inputs.setAttribute("value","수정하기");
						
						form.appendChild(inputh);
						form.appendChild(inputt);
						form.appendChild(inputs);
						
						container.appendChild(form);
						
						
					}
				</script>
</head>
<body>		

	<%
		request.setAttribute("loginId", session.getAttribute("personId"));
	%>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="./resources/js/refreshing.js"></script>

<div id="header">
		<%@  include file="../module/header.jsp" %>
	</div>
		<div class="container-fluid page-body-wrapper">
	 		<%@  include file="../module/leftheader.jsp" %>
	 		<div class="content-wrapper">
	 			<div class="card">
					<div class="container my-3">
				        <div class="row">
				            <div class="col-md-12">
				                <h1 class="mt-4 font-weight-bold">${board.title}</h1>
				                <hr>
				                <div class="col-md-12">
				                	<h5 class="font-weight-bold"> ${board.personId} &emsp;|&emsp; ${board.registDay} &emsp;|&emsp; 조회수: ${board.hit}</h5>
				                </div>
				                <hr>
				                <div class="col-md-12" style="height: 200px;">
				                    <p>${board.context}</p>
				                </div>
				                <div class="d-flex justify-content-between">
				                	<div></div>
									<div>
										<a href="/123team/ENboards" class="btn btn-primary btn-sm">돌아가기</a>
						                <c:if test="${loginId == board.personId}">
							                <a href="update?boardId=${board.boardId}"class="btn btn-primary btn-sm">수정하기</a>
							                <a href="delete?boardId=${board.boardId}"class="btn btn-danger btn-sm">삭제하기</a>
						                </c:if>
					                </div>
								</div>			
				                <hr>
				            </div>
				        </div>
				        <hr>
				        <div class="list-group">
				        	<c:if test="${loginId != null}">
							    <h5 class="mb-3">댓글</h5>
							    <form action="Nboard" method="POST" class="mb-3">
							        <input type="hidden" name="boardId" value="${board.boardId}">
							        <div class="form-inline">
							            <textarea class="form-control mb-2 mr-sm-2" name="comment" style="width: 89%;" rows="2"></textarea>
							            <button type="submit" class="btn btn-primary">댓글 작성</button>
							        </div>
							    </form>
							</c:if>
						    <c:forEach items="${Commentlist}" var="comments">
						        <div class="list-group-item">
						            <div class="d-flex w-100 justify-content-between">
						            	<h5 class="mb-1">${comments.personId}</h5>
						                <small>${comments.registDay}</small>
						                
						                
						            </div>
						            <div class="d-flex w-100 justify-content-between" id="${comments.commentId}">
						            <p class="mb-1" id="willdelete${comments.commentId}">${comments.comment}</p>
						             </div>
						            <c:if test="${comments.personId == loginId}">
						                <button class="btn btn-primary btn-sm" onclick="editform('${comments.comment}','${comments.commentId}')">댓글 수정</button>
						                <a href="deletecoment?commentId=${comments.commentId}&boardId=${board.boardId}" class="btn btn-danger btn-sm">댓글 삭제</a>
						            </c:if>
						        </div>
						    </c:forEach>
					       </div> 
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>		
	<%@ include file="../module/footer.jsp" %>
 	
<%-- 	
 			
	<div class="container my-3">
        <h1>공지 상세 페이지</h1>
        <a href="/123team/Nboards">돌아가기</a>
        <div class="row">
            <div class="col-md-12">
                <h1 class="mt-4">${board.title}</h1>
                <hr>
                <div class="col-md-12" style="height: 200px;">
                    <p class="">${board.context}</p>
                </div>
                <hr>
                <c:if test="${loginId == board.personId}">
                <a href="update?boardId=${board.boardId}"class="btn btn-primary">수정하기</a>
                <a href="delete?boardId=${board.boardId}"class="btn btn-danger">삭제하기</a>
                </c:if>
            </div>
        </div>
        <hr>
        <div class="list-group">
        	<c:if test="${loginId != null}">
			    <h5 class="mb-3">댓글</h5>
			    <form action="ENboard" method="POST" class="mb-3">
			        <input type="hidden" name="boardId" value="${board.boardId}">
			        <div class="form-group">
			            <textarea class="form-control" name="comment" rows="3"></textarea>
			        </div>
			        <button type="submit" class="btn btn-primary">댓글 작성</button>
			    </form>
			</c:if>
			
		    <c:forEach items="${Commentlist}" var="comments">
		        <div class="list-group-item">
		            <div class="d-flex w-100 justify-content-between">
		            	<h5 class="mb-1">${comments.personId}</h5>
		                <small>${comments.registDay}</small>
		                
		                
		            </div>
		            <div class="d-flex w-100 justify-content-between" id="${comments.commentId}">
		            	<p class="mb-1" id="willdelete${comments.commentId}">${comments.comment}</p>
		             </div>
		            <c:if test="${comments.personId == loginId}">
		                <button class="btn btn-primary" onclick="editform('${comments.comment}','${comments.commentId}')">댓글 수정</button>
		                <a href="deletecoment?commentId=${comments.commentId}&boardId=${board.boardId}" class="btn btn-danger">댓글 삭제</a>
		            </c:if>
		        </div>
		    </c:forEach>     
		</div>
    </div>
    
    <%@ include file="../module/footer.jsp" %>
 --%>

<%-- 	
	<c:if test="${board.personId == loginId}">
=======
    <nav class="navbar navbar-expand navbar-dark bg-success">
        <div class="container">
            <div class="navbar-header">
                <a class="navbar-brand" href="/123team">Home</a>
            </div>
            <div class="collapse navbar-collapse justify-content-end" id="navbarNav">
              <ul class="navbar-nav">
                <li class="nav-item">
                  <a class="nav-link" href="/123team/hospital">병원</a>
                </li>
                <li class="nav-item">
                  <a class="nav-link" href="/123team/products">동물상품</a>
                </li>
                <li class="nav-item">
                  <a class="nav-link" href="/123team/Fboards">게시판</a>
                </li>
 				<c:choose>             
	            <c:when test="${not empty managerId }">
	                	
	                <li class="nav-item">
	                  <a class="nav-link" href="/123team/managerlogin/manager_page?personId=${managerId.personId}">마이페이지</a>
	                </li>
	                
	            </c:when>
	               	<c:otherwise>
		                <li class="nav-item">
		                  <a class="nav-link" href="/123team/login">로그인</a>
		                </li>
	                </c:otherwise>
                </c:choose>
                
            </div>
        </div>
    </nav>
 <%
 				request.setAttribute("loginId", userinfo.getInstance().getPersonId());
 			%>
 			<c:if test="${board.personId == loginId}">
>>>>>>> fa9e400f8ceb5c1826ec622c185d981968432be3
			<a href="update?boardId=${board.boardId}">공지글 수정</a>
			<a href="delete?boardId=${board.boardId}">공지글 삭제</a>
			&emsp;&emsp;&emsp; </c:if>
			<a href="/123team/Nboards">돌아가기</a>
			<br>
			===================================================================================
			<br>
			<h5> 제목 : ${board.title} &emsp;&emsp;작성자ID : ${board.personId}</h5>
			<h5>내용</h5>
			<div>${board.context}</div>
			====================================================================================
			<h5> 댓글</h5>
			<c:forEach items="${Commentlist}" var="comments">
				<br>
				작성일 : ${comments.registDay}
				<div id="${comments.commentId}">
					<b id="willdelete${comments.commentId}">${comments.comment}</b>
				</div>
				<c:if test="${comments.personId == loginId}">
				<button onclick="editform('${comments.comment}','${comments.commentId}')">댓글 수정</button>
				 <a href="deletecoment?commentId=${comments.commentId}&boardId=${board.boardId}"><button>댓글 삭제</button></a>
				 </c:if>
				<br>
				--------------------------------------------------------------------------------
			</c:forEach>
			<br>
			====================================================================================
			<c:if test="${loginId != null}">
			<h5>댓글 작성</h5>
			<form action="ENboard" method="POST">
				<input type="hidden" name="boardId" value="${board.boardId}">
				<input type="text" name="comment">
				<input type="submit" value="등록">
			</form>
			</c:if>
	 --%>
			
</body>

	
<%-- 	
 			
	<div class="container my-3">
        <h1>공지 상세 페이지</h1>
        <a href="/123team/Nboards">돌아가기</a>
        <div class="row">
            <div class="col-md-12">
                <h1 class="mt-4">${board.title}</h1>
                <hr>
                <div class="col-md-12" style="height: 200px;">
                    <p class="">${board.context}</p>
                </div>
                <hr>
                <c:if test="${loginId == board.personId}">
                <a href="update?boardId=${board.boardId}"class="btn btn-primary">수정하기</a>
                <a href="delete?boardId=${board.boardId}"class="btn btn-danger">삭제하기</a>
                </c:if>
            </div>
        </div>
        <hr>
        <div class="list-group">
        	<c:if test="${loginId != null}">
			    <h5 class="mb-3">댓글</h5>
			    <form action="ENboard" method="POST" class="mb-3">
			        <input type="hidden" name="boardId" value="${board.boardId}">
			        <div class="form-group">
			            <textarea class="form-control" name="comment" rows="3"></textarea>
			        </div>
			        <button type="submit" class="btn btn-primary">댓글 작성</button>
			    </form>
			</c:if>
			
		    <c:forEach items="${Commentlist}" var="comments">
		        <div class="list-group-item">
		            <div class="d-flex w-100 justify-content-between">
		            	<h5 class="mb-1">${comments.personId}</h5>
		                <small>${comments.registDay}</small>
		                
		                
		            </div>
		            <div class="d-flex w-100 justify-content-between" id="${comments.commentId}">
		            	<p class="mb-1" id="willdelete${comments.commentId}">${comments.comment}</p>
		             </div>
		            <c:if test="${comments.personId == loginId}">
		                <button class="btn btn-primary" onclick="editform('${comments.comment}','${comments.commentId}')">댓글 수정</button>
		                <a href="deletecoment?commentId=${comments.commentId}&boardId=${board.boardId}" class="btn btn-danger">댓글 삭제</a>
		            </c:if>
		        </div>
		    </c:forEach>     
		</div>
    </div>
    
    <%@ include file="../module/footer.jsp" %>
 --%>

<%-- 	
	<c:if test="${board.personId == loginId}">
=======
    <nav class="navbar navbar-expand navbar-dark bg-success">
        <div class="container">
            <div class="navbar-header">
                <a class="navbar-brand" href="/123team">Home</a>
            </div>
            <div class="collapse navbar-collapse justify-content-end" id="navbarNav">
              <ul class="navbar-nav">
                <li class="nav-item">
                  <a class="nav-link" href="/123team/hospital">병원</a>
                </li>
                <li class="nav-item">
                  <a class="nav-link" href="/123team/products">동물상품</a>
                </li>
                <li class="nav-item">
                  <a class="nav-link" href="/123team/Fboards">게시판</a>
                </li>
 				<c:choose>             
	            <c:when test="${not empty managerId }">
	                	
	                <li class="nav-item">
	                  <a class="nav-link" href="/123team/managerlogin/manager_page?personId=${managerId.personId}">마이페이지</a>
	                </li>
	                
	            </c:when>
	               	<c:otherwise>
		                <li class="nav-item">
		                  <a class="nav-link" href="/123team/login">로그인</a>
		                </li>
	                </c:otherwise>
                </c:choose>
                
            </div>
        </div>
    </nav>
 <%
 				request.setAttribute("loginId", userinfo.getInstance().getPersonId());
 			%>
 			<c:if test="${board.personId == loginId}">
>>>>>>> fa9e400f8ceb5c1826ec622c185d981968432be3
			<a href="update?boardId=${board.boardId}">공지글 수정</a>
			<a href="delete?boardId=${board.boardId}">공지글 삭제</a>
			&emsp;&emsp;&emsp; </c:if>
			<a href="/123team/Nboards">돌아가기</a>
			<br>
			===================================================================================
			<br>
			<h5> 제목 : ${board.title} &emsp;&emsp;작성자ID : ${board.personId}</h5>
			<h5>내용</h5>
			<div>${board.context}</div>
			====================================================================================
			<h5> 댓글</h5>
			<c:forEach items="${Commentlist}" var="comments">
				<br>
				작성일 : ${comments.registDay}
				<div id="${comments.commentId}">
					<b id="willdelete${comments.commentId}">${comments.comment}</b>
				</div>
				<c:if test="${comments.personId == loginId}">
				<button onclick="editform('${comments.comment}','${comments.commentId}')">댓글 수정</button>
				 <a href="deletecoment?commentId=${comments.commentId}&boardId=${board.boardId}"><button>댓글 삭제</button></a>
				 </c:if>
				<br>
				--------------------------------------------------------------------------------
			</c:forEach>
			<br>
			====================================================================================
			<c:if test="${loginId != null}">
			<h5>댓글 작성</h5>
			<form action="ENboard" method="POST">
				<input type="hidden" name="boardId" value="${board.boardId}">
				<input type="text" name="comment">
				<input type="submit" value="등록">
			</form>
			</c:if>
	 --%>
			
</body>
</html>