<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입</title>
<link rel="stylesheet" href="/css/join.css">
<script src="https://kit.fontawesome.com/51db22a717.js" crossorigin="anonymous"></script>
<link href="https://fonts.googleapis.com/css2?family=Alata&display=swap" rel="stylesheet">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL" crossorigin="anonymous"></script>
<style>

</style>
</head>
<body>			
	<div class="page-container">
        <div class="login-form-container shadow">
            <div class="login-form-right-side">
                <div class="top-logo-wrap">
                    
                </div>
                <h1>Welcome WithUs Web Application!</h1>
                <p style="margin-bottom: 40px;">Our WithUs web application provides a platform for users to form groups of common interest, organize meetings, and communicate. These applications allow users to share their interests and work together to improve communication and interaction.</p>
                <button class="homeBtn" type="button">Home</button>
            </div>
            <div class="login-form-left-side">
                <div class="login-top-wrap">
                    <span>Do you already have an account?</span>
                    <button class="create-account-btn shadow-light">Sign In</button>
                </div>
                <form action="/auth/join" method="post">
	                <div class="login-input-container">
	                    <div class="login-input-wrap input-id">
	                        <i class="far fa-envelope"></i>
	                        <input placeholder="ID" type="text" id="id" name="memberId" value="${member.memberId}" maxlength="12"><br>
	                        <span class="valid valid-memberId">${valid_memberId}</span>
	                        <span class="idChk"></span>
	                    </div>
	                    <div class="login-input-wrap input-password">
	                        <i class="fas fa-key"></i>
	                        <input placeholder="Password (8 to 20 characters)"  type="password" id="pw" name="password" maxlength="20">
	                        <span class="valid">${valid_password}</span>
	                    </div>
	                    <div class="login-input-wrap input-password">
	                        <i class="fas fa-key"></i>
							<input placeholder="Password Check" type="password" maxlength="20" id="pw-chk"><br>
							<span class="pwChkSpan"></span>
	                    </div>
	                    <div class="login-input-wrap input-name">
	                        <i class="far fa-user"></i>
	                        <input placeholder="Real Name" type="text" id="real-name" name="name" value="${member.name}"><br>
	                        <span class="valid">${valid_name}</span>
	                    </div>
	                </div>
	                <div class="login-btn-wrap">
	                    <button class="login-btn" type="submit">Create Account</button>
	                    <div class="mt-4">
							<a style="margin-right: 10px;" href="#">
								<img src="/img/kakao.png" width="40" height="40">
							</a>
							<a style="margin-right: 10px;" href="#">
								<img src="/img/naver.png" width="40" height="40">
							</a>
							<a href="/oauth2/authorization/google">
								<img src="/img/google.png">
							</a>
						</div>
	                </div>
                </form>
            </div>
        </div>
    </div>	
	<script>
		$(document).ready(function() {
			
			// 중복체크 여부
			var duplicateCheck = false;
			// 비밀번호 확인 여부
			var passwordCheck = false;
			
			// 아이디 중복검사
			$('#id').on('keyup', function() {
				const memberId = $('#id').val();
				$('.valid-memberId').text('');
				
				if (!/^[a-zA-Z0-9]{4,12}$/.test(memberId)) {
					$('.idChk').text('4자 이상 12자 이하의 영문자 또는 숫자로 이루어져야 합니다.');
					$('.idChk').css('color', 'red');
					$('.idChk').css('font-size', '11px');
					duplicateCheck = false;
				} else {
					$.ajax({
						 url : '/auth/join/duplicate-check',
						 type : 'POST',
						 data : {
							 memberId : memberId
						 },
						 success : function(count) {
							 if (count == 0) {
								 $('.idChk').text('사용가능한 아이디입니다!');
								 $('.idChk').css('color', 'blue');
								 $('.idChk').css('font-size', '11px');
								 duplicateCheck = true;
							 } else {
								 $('.idChk').text('이미 사용 중인 아이디입니다!');
								 $('.idChk').css('color', 'red');
								 $('.idChk').css('font-size', '11px');
								 duplicateCheck = false;
							 }
						 },
						 error : function() {
							 alert('에러 발생');
						 }
					})
				}
			});
			
			// 중복체크 여부 false / 비밀번호 확인 false / => 폼 제출 막음
			$('.login-btn').on('click', function() {
				if (duplicateCheck == false) {
					alert('아이디 중복 검사를 해주세요!');
					event.preventDefault();
				} else if (passwordCheck == false) {
					alert('비밀번호 확인을 해주세요!');
					event.preventDefault();
				}
			});
			
			// 비밀번호 확인 체크
			$('#pw-chk').on('keyup', function() {
				var pwVal = $('#pw').val();
				var pwChkVal = $('#pw-chk').val();
				
				if (pwVal === pwChkVal) {
					$('.pwChkSpan').text('비밀번호가 일치합니다!');
					$('.pwChkSpan').css('color', 'blue');
					$('.pwChkSpan').css('font-size', '11px');
					passwordCheck = true;
				} else {
					$('.pwChkSpan').text('비밀번호가 일치하지 않습니다!');
					$('.pwChkSpan').css('color', 'red');
					$('.pwChkSpan').css('font-size', '11px');
					passwordCheck = false;
				}
			});
			
			$('.homeBtn').on('click', function() {
				location.href = '/';
			});
			
			$('.create-account-btn').on('click', function() {
				location.href = '/auth/login';
			});
			
			
			
		})
	</script>
</body>
</html>