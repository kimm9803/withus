<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>모임 사이트</title>
    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">    
    <!-- 추가한 스타일 -->

<style>
    .navbar-brand,
    .navbar-dark .navbar-nav .nav-link {
        color: #000000; /* 검은색 텍스트 */
    }
        .navbar-text a {
        color: #000000; /* 검은색 텍스트 */
    }
</style>


</head>
<body>

<!-- 헤더 시작 -->
<nav class="navbar navbar-expand-lg navbar-dark">
    <div class="container">
        <a class="navbar-brand" href="/">With Us</a>
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarNav">
            <ul class="navbar-nav">
                <li class="nav-item">
                    <a class="nav-link" href="#">홈</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="#">모임 목록</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="#">새로운 모임</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="#">이벤트</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="#">문의하기</a>
                </li>
            </ul>
            <div class="navbar-text ms-auto">
                <sec:authorize access="isAuthenticated()">
                    <a href="/logout" class="btn btn-outline-primary me-2">로그아웃</a>
                    <a href="/user/mypage" class="btn btn-outline-primary me-2">마이페이지</a>
                    <a href="/user/mymessage" class="btn btn-outline-primary me-2">쪽지함</a>
                </sec:authorize>
                <sec:authorize access="isAnonymous()">
                    <a href="/auth/login" class="btn btn-outline-primary me-2">로그인</a>
                </sec:authorize>
            </div>
        </div>
    </div>
</nav>
<!-- 헤더 종료 -->

</body>
</html>
