<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>질문 리스트</title>
<script src="https://kit.fontawesome.com/51db22a717.js"
	crossorigin="anonymous"></script>
<link rel="stylesheet"
	href="https://fonts.googleapis.com/css2?family=Sunflower:wght@300&display=swap">
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN"
	crossorigin="anonymous">
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL"
	crossorigin="anonymous"></script>
<style>
	* {
		font-family: 'Sunflower', sans-serif;
	}

	main {
		width: 65%;
		margin: 150px auto;
		min-height: 70vh;
	}
	
	.button-div {
		display: flex;
		justify-content: flex-end;
	}
	
	h1 {
		margin-bottom: 40px;
	}

</style>
</head>
<body>
	<header><%@ include file="../header.jsp" %></header>
	
	<main>
		<h1>Q&A</h1>
		<table class="table table-hover" style="border-top: 1px solid black;">
		  <thead>
		    <tr style="text-align: center; border-bottom: 1px solid black;">
		      <th scope="col" style="width: 100px; padding: 15px 0;">#</th>
		      <th scope="col" style="padding: 15px 0;">제목</th>
		      <th scope="col" style="width: 300px; padding: 15px 0;">작성자</th>
		      <th scope="col" style="width: 150px; padding: 15px 0;">처리상태</th>
		      <th scope="col" style="width: 200px; padding: 15px 0;">작성일</th>
		    </tr>
		  </thead>
		  <tbody>		    
			<c:forEach items="${questionList}" var="question">
				<tr class="clickable-row" data-href="/question/view/${question.qno}">
			      <th scope="row" style="text-align: center; padding: 15px 0;">${question.qno}</th>
			      <td style="padding-left: 20px; padding: 15px 0;">
			            <c:choose>
			              <c:when test="${fn:length(question.title) > 50}">
			                  ${fn:substring(question.title, 0, 50)}...
			              </c:when>
			              <c:otherwise>
			                  ${question.title}
			              </c:otherwise>
			          </c:choose>
			      </td>
			      <td style="text-align: center; padding: 15px 0;">${question.name}(${question.writer})</td>
			      <td style="text-align: center; padding: 15px 0;">
			      	<c:choose>
			      		<c:when test="${question.status == 0}">
			      			미답변
			      		</c:when>
			      		<c:otherwise>
			      			답변완료
			      		</c:otherwise>
			      	</c:choose>
			      </td>
			      <td style="text-align: center; padding: 15px 0;">${question.regDate}</td>
			    </tr>
			</c:forEach>
		  </tbody>
		</table>
		<div class="button-div">
			<button type="button" class="btn btn-dark write">글쓰기</button>
		</div>
	</main>
	
	<footer><%@ include file="../footer.jsp" %></footer>
	
	<script>
		$(document).ready(function() {
			$('.write').on('click', function() {
				location.href = '/user/question';
			});
			
			$('.clickable-row').on('click', function() {
				var href = $(this).data('href');
				window.location.href = href; // 클릭한 링크로 이동
			});
		})
	</script>
</body>
</html>