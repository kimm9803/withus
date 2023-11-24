<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<%--
  Created by IntelliJ IDEA.
  User: Mjjeon
  Date: 2023-11-23
  Time: 오후 12:07
  To change this template use File | Settings | File Templates.
--%>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<table border="1">
  <thead>
  <th>주최자</th>
  <th>제목</th>
  <th>정모날짜</th>
  <th>마감날짜</th>
  <th>위치</th>
  <th>비용</th>
  <th>참석</th>
  </thead>
  <tbody>
  <c:forEach var="meeting" items="${groupMeetingList}">
    <tr>
      <td>${meeting.name}</td>
      <td><a href="/gmeeting/view/${meeting.meetingid}/${meeting.gno}">${meeting.title}</a></td>
      <td>${meeting.meeting_date}/${meeting.deadline_date}</td>
      <td>${meeting.deadline_date}</td>
      <td>${meeting.location}</td>
      <td>${meeting.cost}</td>
      <td>
          ${meeting.gno}
        <form action="/gmattendance/create/${meeting.meetingid}/${meeting.gno}" method="post">
        <!-- 참석 버튼 -->
        <button type="submit">참석</button>
      </form></td>
    </tr>
  </c:forEach>
  </tbody>
</table>
</body>
</html>
