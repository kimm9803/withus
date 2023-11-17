<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://kit.fontawesome.com/51db22a717.js" crossorigin="anonymous"></script>
<link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Sunflower:wght@300&display=swap">
<style>
	* {
		font-family: 'Sunflower', sans-serif;
	}
	
	main {
		margin-top: 100px;
	}
</style>
</head>
<body>
	<header><%@ include file="../header.jsp" %></header>
	<main>
		<a href="/admin/user/list">회원 전체 목록</a>
		<a href="/admin/group/reportlist">그룹 신고 내역</a>
		<a href="/admin/group/list">그룹 전체 목록</a>
		<a href="/admin/user/report-list">회원 신고 내역</a>
	</main>
	
</body>
</html>