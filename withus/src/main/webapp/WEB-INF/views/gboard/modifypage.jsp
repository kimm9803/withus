<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%--
  Created by IntelliJ IDEA.
  User: Mjjeon
  Date: 2023-11-16
  Time: 오후 2:49
  To change this template use File | Settings | File Templates.
--%>

<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<html>
<head>
    <style>
        footer {
            position: fixed;
            bottom: 0;
            width: 100%;
            background-color: #f8f9fa;
            text-align: center;
            padding: 10px;
        }
        .modify-page {
            width: 80%;
            margin: 0 auto; /* 가운데 정렬을 위해 추가 */
            margin-top: 100px; /* 상단 여백을 추가 */
            background-color: #fff;
            padding: 20px;
            border-radius: 10px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }
        input[type="text"],
        textarea,
        input[type="date"] {
            width: 100%;
            padding: 10px;
            margin: 5px 0 15px;
            display: inline-block;
            border: 1px solid #ccc;
            box-sizing: border-box;
            border-radius: 5px;
        }



    </style>
    <title>Modify Group Board</title>
</head>
<body>

    <header><%@ include file="../header.jsp" %></header>
    <div class="modify-page">
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
        <br>
        <input type="submit" value="완료">

    </form>
    </div>
    <footer style="height: 20px"><%@ include file="../footer.jsp" %></footer>

</body>
</html>
