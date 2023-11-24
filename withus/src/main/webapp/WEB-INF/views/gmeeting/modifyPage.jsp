<%--
  Created by IntelliJ IDEA.
  User: Mjjeon
  Date: 2023-11-23
  Time: 오후 6:36
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>정모수정 페이지 </title>
</head>
<body>
    <h2>모임 수정 </h2>


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

        <label for="deadlineDate">정모 날짜:</label>
        <input type="date" id="deadlineDate" name="deadline_date" value="${modifyView.deadline_date}" required><br>

      <!-- hidden 필드에 gno와 meetingid를 전달 -->
      <input type="hidden" name="gno" value="${gno}">
      <input type="hidden" name="meetingid" value="${meetingid}">

      <!-- 폼 제출 버튼 -->
      <button type="submit">수정</button>
    </form>

</body>
</html>
