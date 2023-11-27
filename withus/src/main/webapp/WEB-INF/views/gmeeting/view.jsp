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
      font-size: 16px;
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
      margin-left: -4.5px;
    }
    header{
      position: fixed;
    }

    button {
      position: fixed; /* 화면에 고정시킵니다. */
      height: 80px;
      width: 60.5%;
      padding: 10px; /* 버튼 내부 여백을 추가할 수 있습니다. */
      background-color: #b5e0c9; /* 연한 초록색 계열의 배경색을 지정합니다. */
      border: none; /* 테두리를 없앱니다. */
      color: #0e753b; /* 버튼 텍스트 색상을 지정합니다. */
      font-size: 16px; /* 버튼 텍스트의 크기를 조절할 수 있습니다. */
      cursor: pointer; /* 커서를 손가락 모양으로 변경합니다. */
      border-radius: 55px; /* 버튼의 모서리를 둥글게 만듭니다. */
      bottom: 370px;
    }

    /* 버튼에 호버 효과를 추가합니다. */
    button:hover {
      background-color: #a2d9ce; /* 마우스를 올렸을 때의 배경색을 지정합니다. */
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


      <div class="separator"></div>
      멤버 소개(${attendCount}명)<br>
      <c:forEach var="meetingAttend" items="${groupMeetingAttendName}" varStatus="loopStatus">
        ${meetingAttend.name}
        <br>
      </c:forEach>

      <div class="separator"></div>

      <p class="post-details">${groupMeetingView.content}</p>


      <!-- 본인만 수정 및 삭제 버튼 표시 -->
      <c:choose>
        <c:when test="${isCreateMeeting}">
          <!-- 수정 삭제 버튼 추가 -->
          <a href="/gmeeting/modifypage/${groupMeetingView.gno}/${groupMeetingView.meetingid}" class="btn btn-primary ml-2">수정 페이지</a>
          <a href="/gmeeting/delete/${groupMeetingView.gno}/${groupMeetingView.meetingid}" class="btn btn-danger ml-2">삭제</a>
        </c:when>
        <c:otherwise>
          <!-- 그 외의 경우에는 버튼을 숨김 -->
        </c:otherwise>
      </c:choose>

      <form action="/gmattendance/create/${groupMeetingView.meetingid}/${groupMeetingView.gno}" method="post">
        <!-- 참석 버튼 -->
        <button type="submit" >참석</button>
      </form>

      <div class="separator"></div>
    </div>





  <div class="action-buttons">
    <form action="/gmattendance/create/${groupMeetingView.meetingid}/${groupMeetingView.gno}" method="post">

    </form>
  </div>

</div>

<footer><%@ include file="../footer.jsp" %></footer>
</body>
</html>