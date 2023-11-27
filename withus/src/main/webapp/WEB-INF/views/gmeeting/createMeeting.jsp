<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%--
  Created by IntelliJ IDEA.
  User: Mjjeon
  Date: 2023-11-23
  Time: 오전 7:41
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>

<!-- createMeeting.jsp -->
<form action="/gmeeting/create/${gno}" method="post" enctype="multipart/form-data">

    <input type="text" name="title" placeholder="제목" required>
    <br>
    <input type="text" name="content" placeholder="내용" required>
    <br>
    <input type="text" name="location" placeholder="위치" required>
    <br>
    <input type="text" name="cost" placeholder="비용" required>
    <br>
    <input type="number" name="capacity" placeholder="정모 인원(5명 ~ 300명)" required>
    <br>
    <!-- 정모 날짜 선택  -->
    정모날짜:<input type="date" name="meeting_date" placeholder="만나는 날짜" required>
    <br>
    <!-- 마감 날짜 선택 -->
    마감날짜:<input type="date" name="deadline_date" placeholder="만나는 날짜" required>
    <br>
    <!-- hidden -->
    <input type="hidden" name="memberid" value="${memberid}">
    <input type="hidden" name="gno" value="${gno}">


    <button type="submit" class="group-board-button">모임 생성</button>
</form>


</body>
</html>
