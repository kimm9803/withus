<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<c:if test="${empty image.newImageName}">
    <!-- image.newImageName이 null이나 비어 있을 때 -->
    <img src="/img/basic.jpg" alt="테스트 이미지" style="height: 200px; width: 400px; border: 1px solid black;">
</c:if>
<c:if test="${not empty image.newImageName}">
    <!-- image.newImageName이 값이 있을 때 -->
    <img src="/${image.newImageName}" alt="테스트 이미지" style="height: 200px; width: 400px; border: 1px solid black;">
</c:if>

<form method="post" action="/modify" enctype="multipart/form-data">
    <ul>
        <li>이미지 파일 <input type="file" multiple="multiple" name="image">
            <input type="hidden" name="gimageid" value="${image.gimageid}">
            <input type="submit" id="submit" value="수정" />
        </li>
    </ul>
</form>
<a href="/delete/${image.gno}">이미지 삭제</a>
</body>
</html>
