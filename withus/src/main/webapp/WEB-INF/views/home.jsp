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
<%@ include file="header.jsp" %>

<div>
<sec:authorize access="hasRole('ROLE_ADMIN')">
<h5>관리자</h5>    
    <a href="/admin/adminpage">관리자 페이지</a>
    <a href="/admin/user/list">회원 전체 목록</a>
    <a href="/admin/group/reportlist">그룹 신고 내역</a>
    <a href="/admin/group/list">그룹 전체 목록</a>
    <a href="/admin/user/report-list">회원 신고 내역</a>  
</sec:authorize>
</div>


<h5>회원</h5>  
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

<a href ="/groups/create">그룹만들기</a>
<a href ="/groups/loadall">그룹목록보기</a>
<a href ="/upload">이미지업로드 테스트</a>
<a href ="  ">모임 만들기</a>
<a href ="  ">모임 홈</a>
<br>
<a href ="/gboard/create">게시판 작성</a>
<a href ="  ">게시판</a>
<a href ="/main">메인화면</a>





</body>
</html>