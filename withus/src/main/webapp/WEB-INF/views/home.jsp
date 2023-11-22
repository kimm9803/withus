<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
		 pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>home</title>
<style>
	main {
		margin-top: 100px;
	}
</style>
</head>
<body>
	<header><%@ include file="header.jsp" %></header>
	<main>
		<div><a href ="/groups/create">그룹만들기</a></div>
		<div><a href ="/groups/loadall">그룹목록보기</a></div>
		<div><a href ="/upload">이미지업로드 테스트</a></div>
		<div><a href ="  ">모임 만들기</a></div>
		<div><a href ="  ">모임 홈</a></div>
		<div><a href ="/gboard/create">게시판 작성</a></div>
		<div><a href ="  ">게시판</a></div>
		<div><a href ="/main">메인화면</a></div>
		<div><a href ="/admin/notice/write">공지사항 등록</a></div>
		<div><a href ="/notice/list">공지사항 목록</a></div>
	</main>

	<footer><%@ include file="footer.jsp" %></footer>
</body>
</html>