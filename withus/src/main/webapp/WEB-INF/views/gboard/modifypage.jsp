<%--
  Created by IntelliJ IDEA.
  User: Mjjeon
  Date: 2023-11-16
  Time: 오후 2:49
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Modify Group Board</title>
</head>
<body>
    <h2>Modify Group Board</h2>

    <form action="/gboard/modify/${gbno}/${gno}" method="post">
        <!-- 제목 수정 가능 표시 -->
        <label for="title">제목:</label>
        <input type="text" id="title" name="title" value="${modifyView.title}"><br>

        <!-- 내용 수정 가능 표시 -->
        <label for="content">내용:</label>
        <textarea id="content" name="content">${modifyView.content}</textarea><br>

        <!-- 카테고리 수정 가능 표시 -->
        <label for="gbcateid">카테고리 선택:</label>
        <select id="gbcateid" name="gbcateid">
            <option value="1">가입인사</option>
            <option value="2">자유글</option>
            <option value="3">모임후기</option>
        </select>
        <!-- 숨겨진 필드 -->

        <input type="hidden" name="gbno" value="${modifyView.gbno}">
        <input type="hidden" name="gno" value="${modifyView.gno}">
        <input type="hidden" name="memberid" value="${modifyView.memberid}">

        <input type="submit" value="완료">

    </form>
</body>
</html>
