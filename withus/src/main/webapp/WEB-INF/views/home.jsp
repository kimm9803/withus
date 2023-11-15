<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>home</title>
</head>
<body>
<sec:authorize access="hasRole('ROLE_ADMIN')">
    <a href="/admin/user/list">회원 전체 목록</a>
</sec:authorize>
<sec:authorize access="isAuthenticated()">
	<a href="/logout">로그아웃</a>
	<a href="/user/mypage">마이페이지</a>
	<a href="/user/mymessage">쪽지함</a>
</sec:authorize>
<sec:authorize access="isAnonymous()">
	<div style="margin-bottom: 10px;">
		<a href="/auth/login">로그인</a>
	</div>
</sec:authorize>
<a href="/groups/create">그룹만들기</a>
<a href="/groups/list">그룹목록보기</a>
<a href="/upload">이미지업로드 테스트</a>
</body>
</html>