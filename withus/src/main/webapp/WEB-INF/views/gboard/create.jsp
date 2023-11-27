<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%--
  Created by IntelliJ IDEA.
  User: Mjjeon
  Date: 2023-11-15
  Time: 오전 10:17
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>

    <form action="/gboard/create" method="post">
        <label for="title">제목</label>
        <input id="title" type="text" name="title"/>

        <label for="cont">내용</label>
        <textarea id="cont"  name="content"></textarea>

        <label for="gbcateid">카테고리 선택:</label>
            <select id="gbcateid" name="gbcateid">
                <option value="1">자유글</option>
                <option value="2">모임 후기</option>
                <option value="3">가입 인사 </option>
            </select>

        <input type="hidden" name="memberid" value="${memberid}">
        <input type="hidden" name="gno" value="${gno}">

        <input type="submit" value="등록"/>
    </form>
</body>
</html>
