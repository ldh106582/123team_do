<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상품 상세정보 페이지</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css" rel="stylesheet"integrity="sha384-4bw+/aepP/YC94hEpVNVgiZdgIC5+VKNBQNGCHeKRQN+PtmoHDEXuppvnDJzQIu9" crossorigin="anonymous">
<script type="text/javascript">
				
					function editform(comment,commentId,productId){
						
						var container = document.getElementById(commentId);
						console.log(commentId);
						var dew = "willdelete"+commentId;
						var willdelete = document.getElementById(dew);
						console.log(dew);
						container.removeChild(willdelete);
						
						var form = document.createElement("form");
						form.setAttribute("action","/123team/products/u_comment");
						form.setAttribute("method","POST");
						
						var inputh = document.createElement("input");
						inputh.setAttribute("type","hidden");
						inputh.setAttribute("name","commentId");
						inputh.setAttribute("value",commentId);
						
						var inputg = document.createElement("input");
						inputg.setAttribute("type","hidden");
						inputg.setAttribute("name","productId");
						inputg.setAttribute("value",productId);
						
						var inputt = document.createElement("input");
						inputt.setAttribute("type","text");
						inputt.setAttribute("name","comment");
						inputt.setAttribute("value",comment);
						
						var inputs = document.createElement("input");
						inputs.setAttribute("type","submit");
						inputs.setAttribute("value","수정하기");
						
						form.appendChild(inputh);
						form.appendChild(inputg);
						form.appendChild(inputt);
						form.appendChild(inputs);
						
						container.appendChild(form);
						
					}
</script>	
</head>
<body>
	<%
		request.setAttribute("type", session.getAttribute("type"));
		request.setAttribute("checktype", "p");
	%>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="./resources/js/refreshing.js"></script>

<div id="header">
		<%@  include file="../module/header.jsp" %>
	</div>
 
    <div class="container-fluid page-body-wrapper">
 <%@  include file="../module/leftheader.jsp" %>
 
        <div class="content-wrapper">
          <div class="card mx-auto " style="width: 80rem;">
 
			<c:choose>
			    <c:when test="${not empty product.productImage}">
			        <img class="col-md-12 mt-2 rounded-lg"" src="<c:url value='/resources/images/${product.productImage}'/>" height="50" width="150" alt="상품이미지">
			    </c:when>
			    <c:otherwise>
			        <img class="col-md-12 mt-2 rounded-lg"
                           src="https://i.ibb.co/gdq8PKg/pexels-tom-fisk-1692693.jpg"
                           alt="상품이미지" height="150" width="150" border="0">
			    </c:otherwise>
			</c:choose>

                <div class="card-body col-md-12">
                    <h5 class="card-title col-md-12 p-0 mb-4" style="font-size: 2vw;">${product.productName}</h5>
                    <p class="card-text mb-4" style="font-size: 1vw;">${product.productPrice}</p>
                    <p class="card-text mb-4" style="font-size: 1vw;">${product.productCategory}</p>
                    <p class="card-text mb-4" style="font-size: 1vw;"> ${product.productUnitStock}</p>
                    <p class="card-text mb-4" style="font-size: 1vw;"> ${product.productDescribe}</p>


					<form:form modelAttribute="product" action="/123team/products/creatCart" method="post" enctype="Multipart/form-data">
		            <input type="hidden" name="productId"  value="${product.productId}">
		            <input type="hidden" name="productName" value="${product.productName}" >
		            <input type="hidden" name="productPrice" value="${product.productPrice}">
		            <input type="hidden" name="productCategory" value="${product.productCategory}" >
		            <input type="hidden" name="productImage" value="${product.productImage}" >

                     <div class="show-grid col-md-12 row">
                         <div class="col-md-6 p-0"> 
                             <input type="submit" class="btn btn-outline-primary m-0" value="장바구니추가" onclick="alert('장바구니 추가 완료')">
                         </div>
                     	</form:form>
                     
                         <div class="col-md-6 p-0">
                             <c:if test="${loginId == product.personId}">
                                 <div class="col-md-12 p-0 d-flex" style="justify-content: flex-end;">
                                     <a href="update?productId=${product.productId}" class="btn btn-outline-info mr-1">상품수정</a>
                                     <a href="delete?productId=${product.productId}" class="btn btn-outline-danger " onclick="alert('정말 삭제 하시겠습니까?')">상품삭제</a>
                                 </div>
                             </c:if>
                         </div>
                     </div>
                     <br>
                     리뷰 수 : ${product.reviewCount}
                     평점 : ${product.reviewScore}
                    <c:if test="${loginId ==  product.personId}">
                    
                    	<div class="mb-2 ml-2">
                    	
                    	
                        	<a class="btn btn-outline-info btn-sm border border-dark mt-3" href="/123team/products/p_review?personId=${product.personId}">리뷰작성</a>
                 		</div>
                 	</c:if>
                 	   <div class="col-md-12 row mt-5 p-0" style="justify-content: center;">
                        <c:forEach items="${listOfProductReview}" var="review">
                        <%
                            int i = 0;
                        if(i%2==0){
                        %>
                        <div class="col-md-6 p-0">
                            <div class="review1 card mb-3" style="max-width: 540px;">
                                <div class="row no-gutters form-group">
                                    <div class="col-md-4">
                                        <c:choose>
                                            <c:when test="${not empty review.reviewImage}">
                                              <img class="col-md-12  rounded-lg" src="<c:url value='/resources/images/${review.reviewImage}'/>" height="120"  alt="리뷰이미지">
                                            </c:when>
                                            <c:otherwise>
                                              <img class="col-md-12  rounded-lg" src="https://i.ibb.co/wyMqmJp/pexels-980859.jpg" alt="pexels-980859" border="0" alt="리뷰이미지" height="160" border="0">
                                            </c:otherwise>
                                        </c:choose>
                                    </div>
                                    <div class="col-md-8">
                                        <div class="card-body ">
                                            <h5 class="card-title">${review.title}</h5>
                                            <p class="card-text">${review.context}</p>
                                            <p class="card-text text-muted"> ${review.reviewScore}</p>
                                        </div>
                                        <div class="col-md-12 px-0">
                                            <c:if test="${loginId ==  review.personId}">
                                                <a class="btn btn-outline-info btn-sm mr-1" href="u_review?personId=${review.personId}&reviewId=${review.reviewId}">리뷰수정</a> 
                                                <a class="btn btn-outline-info btn-sm mr-1" href="d_review?reviewId=${review.reviewId}" onclick="alert('정말 삭제 하시겠습니까?')">리뷰삭제</a>
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
                                              <img class="col-md-12  rounded-lg" src="<c:url value='/resources/images/${review.reviewImage}'/>" height="120"  alt="리뷰이미지">
                                            </c:when>
                                            <c:otherwise>
                                              <img class="col-md-12  rounded-lg" src="https://i.ibb.co/wyMqmJp/pexels-980859.jpg" alt="pexels-980859" border="0" alt="리뷰이미지" height="160" border="0">
                                            </c:otherwise>
                                        </c:choose>
                                    </div>
                                    <div class="col-md-8">
                                        <div class="card-body ">
                                            <h5 class="card-title">${review.title}</h5>
                                            <p class="card-text">${review.context}</p>
                                            <p class="card-text text-muted"> ${review.reviewScore}</p>
                                        </div>
                                        <div class="col-md-12 px-0">
                                            <c:if test="${loginId ==  review.personId}">
                                                <a class="btn btn-outline-info btn-sm mr-1" href="u_review?personId=${review.personId}&reviewId=${review.reviewId}">리뷰수정</a> 
                                                <a class="btn btn-outline-info btn-sm mr-1" href="d_review?reviewId=${review.reviewId}" onclick="alert('정말 삭제 하시겠습니까?')">리뷰삭제</a>
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

                        <div class="col-md-12 text-center">
                            <a href="">1</a>
                        </div>
                        <a href="qa?productId=${product.productId}&personId=${product.personId}">Q&A</a>
                        <div class="card">
                        	<c:forEach items="${listofQnA}" var="qna">
					        <div class="container my-3">
					            <div class="row">
					                <div class="col-md-12">
					                    <h1 class="mt-4 font-weight-bold">${qna.title}</h1>
					                    <hr>
					                    <div class="col-md-12">
					                        <h5 class="font-weight-bold"> ${qna.personId} &emsp;|&emsp; ${qna.registDay} </h5>
					                    </div>
					                    <hr>
					                    <div class="col-md-12" style="height: 200px;">
					                        <p>${qna.context}</p>
					                        <c:choose>
					                            <c:when test="${not empty qna.image}">
					                                <img class="col-md-6  rounded-lg" src="<c:url value='/resources/images/${qna.image}'/>" width="100px;"  alt="리뷰이미지">
					                            </c:when>
					                            <c:otherwise></c:otherwise>
					                        </c:choose>
					                    </div>
					                    <div class="d-flex justify-content-between">
					                        <div></div>
					                        <div>
				                                <a href="u_qna?QnAId=${qna.qnaId}&productId=${qna.productId}"class="btn btn-primary btn-sm">수정하기</a>
				                                <a href="d_qna?QnAId=${qna.qnaId}&productId=${qna.productId}"class="btn btn-danger btn-sm" onclick="alert('정말 삭제 하시겠습니까?')">삭제하기</a>
					                        </div>
					                    </div>			
					                    <hr>
					                </div>
					            </div>
					            <hr>
					            <div class="list-group">
					                <c:if test="${loginId != null}">
					                    <h5 class="mb-3">댓글</h5>
					                    <form action="a_comment" method="POST" class="mb-3">
					                        <input type="hidden" name="productId" value="${product.productId}">
		                        			<input type="hidden" name="qnaId" value="${qna.qnaId}">
					                        <div class="form-inline">
					                            <textarea class="form-control mb-2 mr-sm-2" name="comment" style="width: 89%;" rows="2"></textarea>
					                            <button type="submit" class="btn btn-primary">댓글 작성</button>
					                        </div>
					                    </form>
					                </c:if>
					                <c:forEach items="${qna.commentlist}" var="commentlist">
					                    <div class="list-group-item">
					                        <div class="d-flex w-100 justify-content-between">
					                            <h5 class="mb-1">${commentlist.personId}</h5>
					                            <small>${commentlist.registDay}</small>
					                        </div>
					                        <div class="d-flex w-100 justify-content-between" id="${commentlist.commentId}">
					                        <p class="mb-1" id="willdelete${commentlist.commentId}">${commentlist.comment}</p>
					                         </div>
					                        <c:if test="${commentlist.personId == loginId}">
					                            <button class="btn btn-primary btn-sm" onclick="editform('${commentlist.comment}','${commentlist.commentId}','${qna.productId}')">댓글 수정</button>
					                            <a href="d_comment?commentId=${commentlist.commentId}&productId=${qna.productId}" class="btn btn-danger btn-sm" onclick="alert('정말 삭제 하시겠습니까?')">댓글 삭제</a>
					                        </c:if>
					                    </div>
					                </c:forEach>
					               </div>
					               </c:forEach> 
					            </div>
					        </div>
					    </div>
					    
        				<%-- <a href="qa?productId=${product.productId}&personId=${product.personId}">Q&A</a>
        				
        				
                        <table class="col-md-12 text-center border p-0">
                            <thead>
                                <td class="col-md-12 row">
                                    <th class="border col-md-1">답변현황</th>
                                    <th class="border col-md-2">제목</th>
                                    <th class="border col-md-2">내용</th>
                                    <th class="border col-md-2">이미지</th>
                                    <th class="border col-md-1">작성자</th>
                                    <th class="border col-md-2">작성일</th>
                                    <th class="border col-md-1">수정</th>
                                    <th class="border col-md-1">삭제</th>
                                </td>
                            </thead>
                            <c:forEach items="${listofQnA}" var="qna">
	                            <tbody>
	                                <td>
	                                    <td class="border col-md-1">답변</td>
	                                    <td class="border col-md-2">${qna.title}</td>
	                                    <td class="border col-md-2">${qna.context}</td>
	                                    <td class="border col-md-2">
	                                    <c:forEach items="${qna.commentlist}" var="commentlist">
	                                    	${commentlist.qnaId}
                                    		${commentlist.comment}
	                                    	${commentlist.registDay}
	                                    	${commentlist.personId}
	                                    	${commentlist.commentId} 
	                                    </c:forEach>
	                                    <c:choose>
                                            <c:when test="${not empty qna.image}">
                                              <img class="col-md-6  rounded-lg" src="<c:url value='/resources/images/${qna.image}'/>" width="100px;"  alt="리뷰이미지">
                                            </c:when>
                                            <c:otherwise></c:otherwise>
                                        </c:choose>
	                                    </td>
	                                    <td class="border col-md-1">${qna.personId}</td>
	                                    <td class="border col-md-2">${qna.registDay}</td>
	                                    <td class="border col-md-1"><a href="u_qna?QnAId=${qna.qnaId}&productId=${qna.productId}">수정</a></td>
	                                    <td class="border col-md-1"><a href="d_qna?QnAId=${qna.qnaId}&productId=${qna.productId}">삭제</a></td>
	                                </td>
	                            </tbody>
	                            <form action="a_comment" method="post">
		                        	<input type="hidden" name="productId" value="${product.productId}">
		                        	<input type="hidden" name="qnaId" value="${qna.qnaId}">
		                        	<div>
		                        		<textarea rows="2" name="comment"></textarea>
		                        		<button type="submit" class="btn btn-primary btn-sm">댓글작성</button>
		                        	</div>
		                        </form>
                            </c:forEach>
                        </table> --%>
                        </div>
                    </div>
                </div>
            </div>
    	</div>
	<%@ include file="../module/footer.jsp" %>



 	<!--    <form:form modelAttribute="product" action="/123team/products/creatCart" method="post" enctype="Multipart/form-data">
 	   <input type="hidden" name="productId"  value="${product.productId}">
	   <input type="hidden" name="productName" value="${product.productName}" >
	   <input type="hidden" name="productPrice" value="${product.productPrice}">
	   <input type="hidden" name="productCategory" value="${product.productCategory}" >
	   <input type="hidden" name="productImage" value="${product.productImage}" >
	
			 <c:choose>
                 <c:when test="${product.productImage == null} ">
                     <div class="myphoto">
                         <img src="https://ibb.co/kmbdwzQ" width="56" height="56" alt="내 프로필 이미지">
                     </div>
                    </c:when>
                   <c:otherwise>
                     <div class="myphoto">
                         <img src="<c:url value="/resources/images/ ${product.productImage}"/>" height="56" alt="상품 이미지">
                     </div>
                   </c:otherwise>
             </c:choose>
		 	<p>
			상품ID : ${product.productId}
			<p>
			상품명 : ${product.productName}
			<p>
			카테고리 : ${product.productCategory}
			<p>
			가격 : ${product.productPrice}
			<p>
			등록일 : ${product.releaseDate}
			<p>
			상품설명 : ${product.productDescribe}

			<p>
			재고수 : ${product.productUnitStock}
			<p>
			<c:if test="${loginId != null && type != checktype}">
				<input type="submit" value="장바구니추가"/>
			</c:if>
  	   </form:form>
  	<c:if test="${loginId == product.personId}">
	<a href="update?productId=${product.productId}"><button>상품수정</button></a>  <a href="delete?productId=${product.productId}"><button>상품삭제</button></a>
	</c:if>
	<c:if test="${loginId != null && type != checktype}">
	<a class="btn btn-success" href="/123team/products/readcart">내 장바구니</a>
	<a class="btn btn-success" aria-labelledby="exampleModalLabel" href="/123team/products/p_review?personId=${product.personId}">리뷰쓰기</a>
	</c:if>
	 -->

</body>
</html>