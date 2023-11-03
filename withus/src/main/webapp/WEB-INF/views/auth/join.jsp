<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입</title>
</head>
<body>
	<h2>회원가입 페이지</h2>
	<form action="/join-proc" method="post">
		<div>
			<label for="id">아이디</label>
			<input type="text" id="id" name="memberId">
		</div>
		<div>
			<label for="pw">비밀번호</label>
			<input type="password" id="pw" name="password">
		</div>
		<div>
			<label for="name">이름</label>
			<input type="text" id="name" name="name">
		</div>
		<div>
			<label for="sex">성별</label>
			<select name="sex" id="sex">
				<option value="select">선택</option>
				<option value="male">남자</option>
				<option value="female">여자</option>
			</select>
		</div>
		<button type="submit">회원가입</button>
	</form>
</body>
</html>