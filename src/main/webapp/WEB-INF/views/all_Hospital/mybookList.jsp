<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.4.1/dist/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
<link rel="stylesheet" href="/123team/resources/css/Mypage.css">
<head>
<script type="text/javascript">
function changed(bid,registday) {
	var container = document.getElementById("container"+bid);
	var delp = document.getElementById("willdelete"+bid);
	var addp = document.getElementById("addp"+bid);
	
	console.log(bid);
	container.removeChild(delp);
	container.removeChild(addp);
	
	var form = document.createElement("form");
	form.setAttribute("action","/123team/hospitals/editbook");
	form.setAttribute("method","POST");
	
	var inputT = document.createElement("input");
	inputT.setAttribute("type","hidden");
	inputT.setAttribute("name","bid");
	inputT.setAttribute("value",bid);
	
	var inputD = document.createElement("input");
	inputD.setAttribute("type","datetime-local");
	inputD.setAttribute("name","registDay");
	inputD.setAttribute("value",registday);
	
	var inputO = document.createElement("input");
	inputO.setAttribute("type","hidden");
	inputO.setAttribute("name","originday");
	inputO.setAttribute("value",registday);
	
	var inputs = document.createElement("input");
	inputs.setAttribute("type","submit");
	inputs.setAttribute("value","변경완료");
	
	var button = document.createElement("button");
	button.setAttribute("onclick",cancelForm());
	var buttonText = document.createTextNode("취소");
	button.appendChild(buttonText);
	
	form.appendChild(inputT);
	form.appendChild(inputD);
	form.appendChild(inputs);
	form.appendChild(inputO);
	form.appendChild(button);
	
	container.appendChild(form);
}
function cancelForm() {
    var form = document.querySelector("form");
    if (form) {
        form.remove();
    }
}
</script>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="./resources/js/refreshing.js"></script>

<div id="header">
		<%@  include file="../module/header.jsp" %>
	</div>
    <div class="container-fluid page-body-wrapper">
      
     <%@  include file="../module/leftheader.jsp" %>

  <c:set var="petId" value="${app.petId}" />
     
        <div class="content-wrapper">
            <div class="row">
               <div class="col-lg-12">
                    <div class="card">
                        <div class="card-body">
                            <h1 class="col-md-12 card-title">예약자 확인</h1>
                            <div class="row">
                                <div class="col-12">

                                    <div class="table-responsive">
                                        <div id="example_wrapper" class="dataTables_wrapper dt-bootstrap4 no-footer">
                                            <div class="row">
                                                <div class="col-sm-12">
                                                    <table id="example" class="display expandable-table dataTable no-footer" style="width: 100%;" role="grid">
                                                        <thead>
                                                            <tr role="row">
                                                                <th class="sorting_disabled text-center" rowspan="1" aria-label="Quote#" style="width: 153px;">
                                                                    예약번호
                                                                </th>
                                                                <th class="text-center" tabindex="0" aria-controls="example" rowspan="1" colspan="1" aria-label="Product: activate to sort column descending" aria-sort="ascending" style="width: 177px;">
                                                                    병원이름
                                                                </th>
                                                                <th class="text-center" tabindex="0" aria-controls="example" rowspan="1" colspan="1" aria-label="Business type: activate to sort column ascending" style="width: 210px;">
                                                                    예약일자
                                                                </th>
                                                                <th class="text-center" tabindex="0" aria-controls="example" rowspan="1" colspan="1" aria-label="Policy holder: activate to sort column ascending" style="width: 200px;">
                                                                    진료 내용
                                                                </th>
                                                                <th class="text-center" tabindex="0" aria-controls="example" rowspan="1" colspan="1" aria-label="Premium: activate to sort column ascending" style="width: 149px;">
                                                                    예약취소
                                                                </th>
                                                                <th class="text-center" tabindex="0" aria-controls="example" rowspan="1" colspan="1" aria-label="Status: activate to sort column ascending" style="width: 149px;">
                                                                    처리 상태
                                                                </th>
                                                            </tr>
                                                        </thead>
												 <c:forEach items="${booklist}" var="book">			
                                                        <tr>

													        <td class="text-center m-0">    
													            <p class="useid m-0">${book.bid}</p>
													        </td>
													        <td class="text-center">
													            ${book.hospitalName}
													        </td>
													        <td class="text-center">
													            ${book.registDay}
													            <button onclick="changed('${book.bid}','${book.registDay}')" id="addp${book.bid}" class="btn btn-outline-primary mr-2" style="margin: 0% 6.5% 0% 0%;">날짜 변경</button>
													        </td>
													        <td class="text-center">
													            ${book.context}
													        </td>
													        <td class="text-center">
													            <a class="btn btn-outline-danger" href="deletebook?bid=${book.bid}" onclick="alert('정말 취소 하시겠습니까?')">예약취소</a>
													        </td>
													        <td class="text-center">
													            ${book.state}
													        </td>                                   
                                                        </tr>
                                                  </c:forEach>   
                                                    </table>
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

<%@  include file="../module/footer.jsp" %>
<%-- 	
	<a href="/123team/hospitals">병원목록으로 돌아가기</a>
 <c:forEach items="${booklist}" var="book">
 <div id="container${book.bid}">
 <p>
 	병원이름 : ${book.hospitalName}
 	<p>
 	동물 : ${book.petId}
 	<p>
 	진료내용 : ${book.context}
 	<p>
 	처리 상태 : ${book.state}
 	<p id="willdelete${book.bid}">예약일 : ${book.registDay}</p>
 	<button onclick="changed('${book.bid}','${book.registDay}')" id="addp${book.bid}" >날짜 변경</button>
 </div>
 	<a href="deletebook?bid=${book.bid}">예약취소</a>
 </c:forEach>
  --%>      
</body>
</html>