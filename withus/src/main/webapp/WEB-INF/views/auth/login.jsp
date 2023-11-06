<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Login</title>
    <link rel="stylesheet" href="/css/login.css">
    <script src="https://kit.fontawesome.com/51db22a717.js" crossorigin="anonymous"></script>
    <link href="https://fonts.googleapis.com/css2?family=Alata&display=swap" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL" crossorigin="anonymous"></script>
</head>
<body>
    <div class="page-container">
        <div class="login-form-container shadow">
            <div class="login-form-right-side">
                <div class="top-logo-wrap">
                    
                </div>
                <h1>Hello Friend!</h1>
                <p style="margin-bottom: 40px;">Enter your personal details and start your journey with us.</p>
                <button class="homeBtn" type="button">Home</button>
            </div>
            <div class="login-form-left-side">
                <div class="login-top-wrap">
                    <span>Don't have an account?</span>
                    <button class="create-account-btn shadow-light">Create Account</button>
                </div>
                <form action="/auth/login-proc" method="post">
                
                <div class="login-input-container">
                    <div class="login-input-wrap input-id">
                        <i class="far fa-envelope"></i>
                        <input placeholder="ID" type="text" name="memberId">
                    </div>
                    <div class="login-input-wrap input-password">
                        <i class="fas fa-key"></i>
                        <input placeholder="Password"  type="password" name="password">
                    </div>
                </div>
                <c:if test="${not empty error}">
					<div class="alert alert-danger pt-2 pb-2" style="font-size: 14px; margin-top: 25px; margin-bottom: 0px">
						${exception}
					</div>
				</c:if>
                <div class="login-btn-wrap">
                    <button class="login-btn" type="submit">Sign In</button>
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
                    <a href="#" >Forgot password?</a>
                </div>
                
                </form>
            </div>
        </div>
    </div>
    <script>
    	$(document).ready(function() {
    		$('.create-account-btn').on('click', function() {
    			location.href = '/auth/join';
    		});
    		
    		$('.homeBtn').on('click', function() {
    			location.href = '/';
    		});
    	})
    </script>
</body>
</html>