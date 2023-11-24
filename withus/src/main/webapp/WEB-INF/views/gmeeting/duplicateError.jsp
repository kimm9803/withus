<%--
  Created by IntelliJ IDEA.
  User: Mjjeon
  Date: 2023-11-23
  Time: 오후 5:42
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Duplicate Error</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            text-align: center;
            margin: 50px;
        }
    </style>
</head>
<body>

<h2>중복 참석 오류</h2>
<p>이미 참석하셨습니다.</p>

<script>
    // JavaScript를 사용하여 경고창을 띄우기
    alert("이미 참석하셨습니다.");
    // 창을 닫거나 리다이렉트 등의 추가적인 동작을 수행할 수 있습니다.
    //확인 누르면 뒤로
    history.back();

    // 또는 다른 경로로 리다이렉트
    // window.location.href = "/your/redirect/path";
</script>

</body>
</html>