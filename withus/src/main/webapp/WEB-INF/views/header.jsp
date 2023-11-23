<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>header</title>
    <link rel="stylesheet" href="/css/header.css">
    <script src="https://kit.fontawesome.com/51db22a717.js" crossorigin="anonymous"></script>
    <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Sunflower:wght@300&display=swap">
    <!-- Bootstrap CSS -->
    <!-- <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet"> -->    
    <!-- 추가한 스타일 -->
<style>

</style>
</head>
<body>
	<header class="header">
		<a href="/" class="logo">With Us</a>
		
		<nav class="navbar">
			<a href="/">Home</a>
			<a href="#">About</a>
			<a href="/groups/create">모임만들기</a>
			<a href="/question/list">Q&A</a>
			<a href="/notice/list">공지사항</a>
			<sec:authorize access="hasRole('ROLE_ADMIN')">
				<a href="/admin/page">관리자 페이지</a>
			</sec:authorize>
			<sec:authorize access="hasRole('ROLE_USER')">
				<a href="/user/mypage">마이페이지</a>
				<a href="/user/mymessage">쪽지함</a>
			</sec:authorize>
			<sec:authorize access="isAnonymous()">
				<a href="/auth/login">로그인</a>
			</sec:authorize>
			<sec:authorize access="isAuthenticated()">
				<a href="/logout">로그아웃</a>
			</sec:authorize>
		</nav>
	</header>
</body>
</html>