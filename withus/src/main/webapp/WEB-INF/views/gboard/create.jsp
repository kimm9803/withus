<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%--
  Created by IntelliJ IDEA.
  User: Mjjeon
  Date: 2023-11-15
  Time: 오전 10:17
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<html>
<head>
    <style>

        label {
            display: block;
            margin-top: 10px;
        }

        footer {
            position: fixed;
            bottom: 0;
            width: 100%;
            background-color: #f8f9fa;
            text-align: center;
            padding: 10px;
            margin-left: -5px;
        }

        .create-form {
            background-color: #fff;
            padding: 20px;
            border-radius: 10px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            margin: 20px auto; /* Center the card */
        }
        .container {
            max-width: 70%;
            margin: 100px auto; /* Center the container */
        }
        input[type="text"],
        textarea,
        select {
            width: 100%;
            padding: 10px;
            margin-bottom: 10px;
            display: inline-block;
            box-sizing: border-box;
            border: 1px solid #ccc;
            border-radius: 5px;
        }
    </style>
    <title>Title</title>
</head>
<body>


<header><%@ include file="../header.jsp" %></header>
<div class="container mt-4" style="margin-top: 100px;">
<div class ="create-form">
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
    </div>
</div>
<footer style="height: 20px"><%@ include file="../footer.jsp" %></footer>
</body>
</html>
