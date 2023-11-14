<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>쪽지</title>
    <link rel="stylesheet" href="/css/login.css">
    <script src="https://kit.fontawesome.com/51db22a717.js" crossorigin="anonymous"></script>
    <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Sunflower:wght@300&display=swap">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL" crossorigin="anonymous"></script>
	
<style>
* {
	font-family: 'Sunflower', sans-serif;
}
</style>
</head>
<body>
	<form action="/user/message/send" method="post">
		<div><input type="hidden" name="sender" value="${sender}"></div>
		<div><input type="hidden" name="receiver" value="${receiver}"></div>
		<div>
			<label for="receiver">받는 사람</label>
			<input type="text" id="receiver" value="${gLeaderName}" required/>
		</div>
		<div>※제목은 최대 50자까지 입력 가능합니다.</div>
		<div>
			<label for="title">제목</label>
			<input type="text" id="title" name="title" maxlength="50" required/>
		</div>
		<div>
			<label for="content">내용</label>
			<textarea id="content" name="content" cols="30" rows="5" required></textarea>
		</div>
		<input type="submit" value="보내기" />
		
	</form>
</body>
</html>