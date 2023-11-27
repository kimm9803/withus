<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%--
  Created by IntelliJ IDEA.
  User: Mjjeon
  Date: 2023-11-23
  Time: 오전 7:41
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<html>
<head>
    <style>
        body {
            margin: 0;
            padding: 0;
            font-family: 'Arial', sans-serif;
            background-color: #f0f0f0;
        }

        .main-container {
            margin-top: 100px;
            text-align: center;
        }

        .card {
            width: 300px;
            height: 500px;
            background-color: #fff;
            border: 1px solid #ddd;
            border-radius: 8px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            padding: 20px;
            box-sizing: border-box;
            margin: 0 auto; /* 중앙 정렬을 위해 추가 */
        }

        .card input[type="text"] {
            width: 100%; /* 제목(input 태그의 name이 "title")을 더 넓게 조정 */
            padding: 10px;
            margin-bottom: 10px;
            display: inline-block;
            box-sizing: border-box;
            border: 1px solid #ccc;
            border-radius: 5px;
        }

        .card input[type="number"],
        .card input[type="date"] {
            width: 100%;
            padding: 10px;
            margin-bottom: 10px;
            display: inline-block;
            box-sizing: border-box;
            border: 1px solid #ccc;
            border-radius: 5px;
        }

        .card button {
            width: 100%;
            background-color: #4CAF50;
            color: white;
            padding: 10px;
            border: none;
            border-radius: 5px;
            cursor: pointer;
        }
        footer {
            position: fixed;
            bottom: 0;
            width: 100%;
            background-color: #f8f9fa;
            text-align: center;
            padding: 10px;
            margin-left:-5px;
        }
    </style>

    <title>Title</title>
</head>
<body>
<header><%@ include file="../header.jsp" %></header>
<!-- createMeeting.jsp -->

<div class = main-container>
    <div class = card>
<form action="/gmeeting/create/${gno}" method="post" enctype="multipart/form-data">

    <input type="text" name="title" placeholder="제목" required>
    <br>
    <input type="text" name="content" placeholder="내용" required >
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
    </div>
</div>
<footer style="height: 20px"><%@ include file="../footer.jsp" %></footer>
</body>
</html>
