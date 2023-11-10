<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>그룹 상세보기</title>
    <!-- Bootstrap 5 CSS 링크 추가 -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        /* 컨텐츠를 중앙에 정렬 */
        .content {
            max-width: 60%;
            margin: 0 auto;
        }
    </style>
</head>
<body>
<header><%@ include file="../header.jsp" %></header>
    <div class="container mt-5">
        <div class="content">
            <h1>그룹 상세보기</h1>
            <div>
				<c:if test="${empty group.newImageName}">
					<!-- image.newImageName이 null이나 비어 있을 때 -->
					<img src="/img/basic.jpg" style="height: 200px; width: 400px; border: 1px solid black;">
					<form method="post" action="/upload/${group.gno}" enctype="multipart/form-data">
					    <input type="hidden" name="gno" value="${group.gno}">
						<input type="file" multiple="multiple" name="image"> 
						<input type="submit" id="submit" value="등록" />
					</form>
				</c:if>
				<c:if test="${not empty group.newImageName}">
					<!-- image.newImageName이 값이 있을 때 -->
					<img src="/${group.newImageName}" style="height: 200px; width: 400px; border: 1px solid black;">
				<form method="post" action="/modify/${group.gno}" enctype="multipart/form-data">
				<input type="file" multiple="multiple" name="image">
	            <input type="hidden" name="gno" value="${group.gno}">
	            <input type="submit" id="submit" value="수정" />
	            </form>
				</c:if>
			</div>
            <div class="card">
                <div class="card-body">
                    <h2 class="card-title">${group.gname}</h2>
                    <p class="card-text">추천: ${group.glike}</p>
                    <p class="card-text">그룹소개: ${group.gintro}</p>
                    <p class="card-text">생성일: ${group.gdate}</p>
                    <p class="card-text">정원: ${group.gperson}</p>
                </div>
            </div>
        </div>
    </div>
</body>
</html>
