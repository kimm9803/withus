<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>그룹 상세보기</title>
</head>
<body>
    <h1>그룹 상세보기</h1>
    <div>
        <h2>${group.gname}</h2>
        <p>추천: ${group.glike}</p>
        <p>그룹소개 : ${group.gintro}</p> 
        <p>생성일: ${group.gdate}</p>
        <p>정원: ${group.gperson}</p>
    </div>
</body>
</html>
