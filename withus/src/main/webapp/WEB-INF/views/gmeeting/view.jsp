<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html>
<head>
  <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css"
        integrity="sha384-B4gt1jrGC7Jh4AgTPSdUtOBvfO8sh+WyIxHX72X5z6QcNY5M+8NTojREDAwnzmX1"
        crossorigin="anonymous">
  <style>
    body {
      background-color: #f8f9fa;
      margin-bottom: 60px; /* Adjust the margin-bottom as needed */
    }
    .container {
      max-width: 70%; /* Adjust the percentage as needed */
    }
    .post-card {
      background-color: #fff;
      padding: 20px;
      border-radius: 10px;
      box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
      margin: 20px auto; /* Center the card */
    }
    .post-title {
      font-size: 24px;
      margin-bottom: 10px;
      text-align: center;
    }
    .post-details {
      font-size: 14px;
      color: #6c757d;
      text-align: center;
    }
    .separator {
      border-top: 2px solid #ccc;
      margin: 20px 0;
    }
    .action-buttons {
      margin-top: 20px;
      text-align: center;
    }
    footer {
      position: fixed;
      bottom: 0;
      width: 100%;
      background-color: #f8f9fa;
      text-align: center;
      padding: 10px;
    }
    header{
      position: fixed;
    }
  </style>
</head>
<body>
<header><%@ include file="../header.jsp" %></header>

<div class="container mt-4" style="margin-top: 100px;">
    <div class="post-card">
      <h2 class="post-title">${groupMeetingView.title}</h2>
      <p class="post-details">
        <small>
          정원 : ${attendCount}/${groupMeetingView.capacity} |
          비용 : ${groupMeetingView.cost} |
          위치 : ${groupMeetingView.location}
          <br>
          정모 날짜 : ${groupMeetingView.meeting_date}
          <br>
          마감 날짜 : ${groupMeetingView.deadline_date}
        </small>
      </p>
      참석 인원<br>
      <c:forEach var="meetingAttend" items="${groupMeetingAttendName}" varStatus="loopStatus">
        ${meetingAttend.name}

        ${meetingAttend.regdate}
        <br>
      </c:forEach>
    </div>

  <div class="separator"></div>

  <div class="post-card">

    <p class="post-details">${groupMeetingView.content}</p>

    <!-- 참석 버튼 -->
    <form action="/gmattendance/create/${groupMeetingView.meetingid}/${groupMeetingView.gno}" method="post">
      <!-- 참석 버튼 -->
      <button type="submit">참석</button>
    </form>

    <!-- 수정 삭제 버튼 추가 -->
    <a href="/gmeeting/modifypage/${groupMeetingView.gno}/${groupMeetingView.meetingid}" class="btn btn-primary ml-2">수정 페이지</a>
    <a href="/gmeeting/delete/${groupMeetingView.gno}/${groupMeetingView.meetingid}" class="btn btn-danger ml-2">삭제</a>

  </div>

  <div class="action-buttons">
    <form action="/gmattendance/create/${groupMeetingView.meetingid}/${groupMeetingView.gno}" method="post">

    </form>
  </div>

</div>

<footer><%@ include file="../footer.jsp" %></footer>
</body>
</html>