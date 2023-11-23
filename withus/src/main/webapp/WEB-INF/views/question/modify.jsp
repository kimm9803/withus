<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>질문 작성</title>
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
		width: 50%;
		margin: 150px auto;
		height: 70vh;
	}
	
	.q-container {
		background-color: #F0F1F2;
		padding: 50px;
		border-radius: 20px;
	}
	
	h1 {
		margin-bottom: 40px;
	}
	
	.button-group {
		display: flex;
		justify-content: flex-end;
		margin-top: 25px;
	}
</style>
</head>
<body>
	<header><%@ include file="../header.jsp" %></header>
	
	<main>
		<div class="q-container">
			<h1>Q&A</h1>
			<form action="/user/question/modify" method="post">
				<input type="hidden" name="qno" value="${question.qno}">
				<input type="hidden" name="writer" value="${question.writer}">
				<div class="mb-3">
					<label for="title" class="form-label">제목</label>
					<input type="text" id="title" class="form-control" name="title" value="${question.title}" placeholder="질문 제목을 작성해주세요." required>
				</div>
				<div class="mb-3">
					<label for="content" class="form-label">내용</label>
					<textarea class="form-control" id="content" name="content" rows="15" required>${question.content}</textarea>
				</div>
				<div class="button-group">
					<button type="submit" class="btn btn-dark" style="margin-right: 10px;">수정</button>
					<button type="button" class="btn btn-secondary" onclick="history.go(-1)">취소</button>
				</div>
			</form>
		</div>
	</main>
	
	<footer><%@ include file="../footer.jsp" %></footer>
</body>
</html>