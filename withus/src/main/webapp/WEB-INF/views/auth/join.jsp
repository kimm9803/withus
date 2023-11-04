<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입</title>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<style>
.s {
	margin-bottom: 10px;
}

.valid {
	color : red;
	font-size: 14px;
}
</style>
</head>
<body>
	<h2>회원가입 페이지</h2>
	<form action="/auth/join" method="post">
		<div class="s">
			<label for="id">아이디</label>
			<input type="text" id="id" name="memberId" value="${member.memberId}" minlength="4" maxlength="12" placeholder="아이디를 입력해주세요" required>
			<button type="button" class="duplicate-check-btn">중복확인</button>
			<br>
			<span class="valid">${valid_memberId}</span>
		</div>
		<div class="s">
			<label for="pw">비밀번호</label>
			<input type="password" id="pw" name="password" minlength="8" maxlength="20" required><br>
			<span class="valid">${valid_password}</span>
		</div>
		<div class="s">
			<label for="name">이름</label>
			<input type="text" id="name" name="name" placeholder="이름을 입력해주세요"><br>
			<span class="valid">${valid_name}</span>
		</div>
		<div class="s">
			<label for="sex">성별</label>
			<select name="sex" id="sex">
				<option value="select">선택</option>
				<option value="male">남자</option>
				<option value="female">여자</option>
			</select>
		</div>
		<button type="submit" class="join-btn">회원가입</button>
	</form>
	
	<script>
		$(document).ready(function() {
			
			// 중복체크 여부
			var duplicateCheck = false;
			
			// 아이디 중복검사
			$('.duplicate-check-btn').on('click', function() {
				const memberId = $('#id').val();
				
				if (memberId === null || memberId === '') {
					alert('아이디를 입력해주세요!');
				} else {
					$.ajax({
						 url : '/auth/join/duplicate-check',
						 type : 'POST',
						 data : {
							 memberId : memberId
						 },
						 success : function(count) {
							 if (count == 0) {
								 alert('사용가능한 아이디입니다!');
								 duplicateCheck = true;
							 } else {
								 alert('이미 사용 중인 아이디입니다!')
								 $('#id').val('');
								 duplicateCheck = false;
							 }
						 },
						 error : function() {
							 alert('에러 발생');
						 }
					})
				}
			});
			
			// 중복체크 여부 false 일 때
			$('.join-btn').on('click', function() {
				if (duplicateCheck == false) {
					alert('중복 검사를 해주세요!');
					event.preventDefault();
				}
			});
		})
	</script>
</body>
</html>