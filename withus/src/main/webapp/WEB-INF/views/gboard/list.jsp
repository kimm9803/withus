<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>그룹 게시판 리스트</title>
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
		<h1>그룹 게시판</h1>
		<table class="table table-hover" style="border-top: 1px solid black;">
		  <thead>
		    <tr style="text-align: center; border-bottom: 1px solid black;">
		      <th scope="col" style="width: 150px; padding: 15px 0;">구분</th>
		      <th scope="col" style="padding: 15px 0;">제목</th>
		      <th scope="col" style="width: 200px; padding: 15px 0;">글쓴이</th>
		      <th scope="col" style="width: 200px; padding: 15px 0;">날짜</th>
		    </tr>
		  </thead>
		  <tbody>		    
			<c:forEach var="board" items="${groupBoardList}">
	            <tr>
	                <td>${board.gbcatename}</td>
	                <td><a href = "/gboard/view?gbno=${board.gbno}">${board.title}</a></td>
	                <td>${board.name}</td>
	                <td>${board.gbregdate}</td>
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
				location.href = '/gboard/create/' + ${gno};
			})
		})
	</script>
</body>
</html>
