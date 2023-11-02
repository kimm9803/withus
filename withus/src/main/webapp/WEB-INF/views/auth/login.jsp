<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인</title>
</head>
<body>
	<h2>로그인 페이지</h2>
	<form action="/login-proc" method="post">
		<div>
			<input type="text" name="memberId" placeholder="아이디">
		</div>
		<div>
			<input type="password" name="password" placeholder="비밀번호">
		</div>
		<button type="submit">로그인</button>
	</form>
	<a href="/join">회원가입을 아직 하지 않으셨나요?</a>
</body>
</html>