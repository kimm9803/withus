<%--
  Created by IntelliJ IDEA.
  User: Mjjeon
  Date: 2023-11-23
  Time: 오후 6:36
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>정모수정 페이지 </title>

    <style>

      footer {
        bottom: 0;
        width: 100%;
        background-color: #f8f9fa;
        text-align: center;
        padding: 10px;
        margin-left: -5px;
      }
      .container {
        max-width: 70%;
        margin: 100px auto; /* Center the container */
      }

      .post-card {
        background-color: #fff;
        padding: 20px;
        border-radius: 10px;
        box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        margin: 20px auto; /* Center the card */
      }

      label {
        display: block;
        margin-top: 10px;
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

      /* Adjust the width of the submit button */
      button {
        width: 100%;
        background-color: #4CAF50;
        color: white;
        padding: 10px;
        border: none;
        border-radius: 5px;
        cursor: pointer;
      }

    </style>
</head>
<body>

    <header><%@ include file="../header.jsp" %></header>


    <div class="container mt-4" style="margin-top: 100px;">
      <div class="post-card">
        <form action="/gmeeting/modify/${gno}/${meetingid}" method="post">
          <!-- 모임 정보 입력 폼 -->
          <label for="title">제목:</label>
          <input type="text" id="title" name="title" value="${modifyView.title}" required><br>

          <label for="content">내용:</label>
          <textarea id="content" name="content" required>${modifyView.content}</textarea><br>

          <label for="location">장소:</label>
          <input type="text" id="location" name="location" value="${modifyView.location}" required><br>

          <label for="cost">비용:</label>
          <input type="text" id="cost" name="cost" value="${modifyView.cost}" required><br>

          <label for="capacity">인원:</label>
          <input type="text" id="capacity" name="capacity" value="${modifyView.capacity}" required><br>

          <label for="meetingDate">정모 날짜:</label>
          <input type="date" id="meetingDate" name="meeting_date" value="${modifyView.meeting_date}" required><br>

          <label for="deadlineDate">마감 날짜:</label>
          <input type="date" id="deadlineDate" name="deadline_date" value="${modifyView.deadline_date}" required><br>

          <!-- 폼 제출 버튼 -->
          <button type="submit">수정</button>

          <!-- hidden 필드에 gno와 meetingid를 전달 -->
          <input type="hidden" name="gno" value="${gno}">
          <input type="hidden" name="meetingid" value="${meetingid}">
        </form>
      </div>
    </div>

    <footer style="height: 20px"><%@ include file="../footer.jsp" %></footer>

</body>
</html>
