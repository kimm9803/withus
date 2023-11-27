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
        footer {
            position: fixed;
            bottom: 0;
            width: 100%;
            background-color: #f8f9fa;
            text-align: center;
            padding: 10px;
            margin-left: -5px;
        }
        .main-container{
            margin-top: 100px;

        }
        .card {
            width: 300px; /* 카드의 너비를 조정할 수 있습니다. */
            height: 200px; /* 카드의 높이를 조정할 수 있습니다. */
            background-color: #fff; /* 흰색 배경 색상을 지정합니다. */
            border: 1px solid #ddd; /* 테두리를 추가할 수 있습니다. */
            border-radius: 8px; /* 카드의 모서리를 둥글게 만듭니다. */
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1); /* 그림자 효과를 추가합니다. */
            padding: 20px; /* 카드 내부 여백을 조정할 수 있습니다. */
            box-sizing: border-box; /* 박스 모델의 크기를 테두리와 여백을 포함하여 지정합니다. */
            
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
    </div>
</div>
<footer style="height: 20px"><%@ include file="../footer.jsp" %></footer>
</body>
</html>
