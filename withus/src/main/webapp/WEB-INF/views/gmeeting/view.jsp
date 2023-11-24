<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: Mjjeon
  Date: 2023-11-23
  Time: 오후 2:43
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>

</head>
<body>
<c:if test="${not empty groupMeetingView}">
  <p><strong>제목:</strong> ${groupMeetingView.title}</p>
  <p><strong>내용:</strong> ${groupMeetingView.content}</p>
  <p><strong>주최자:</strong> ${groupMeetingView.name}</p>
  <p><strong>정모 날짜:</strong> ${groupMeetingView.meeting_date}</p>
  <p><strong>위치:</strong> ${groupMeetingView.location}</p>
  <p><strong>비용:</strong> ${groupMeetingView.cost}</p>
  <p><strong>정원:</strong>${attendCount}/${groupMeetingView.capacity}(${groupMeetingView.capacity - attendCount} 자리남음)</p>
  <p><strong>마감날짜:</strong> ${groupMeetingView.deadline_date}</p>

  <!-- 여기에 원하는 형태로 데이터를 표시할 추가적인 로직을 넣으세요. -->
</c:if>

<form action="/gmattendance/create/${groupMeetingView.meetingid}/${groupMeetingView.gno}" method="post">
  <!-- 참석 버튼 -->
  <button type="submit">참석</button>
</form>
<!-- 수정 삭제 버튼추가 -->
<a href="/gmeeting/modifypage/${groupMeetingView.gno}/${groupMeetingView.meetingid}">수정 페이지</a>
<a href="/gmeeting/delete/${groupMeetingView.gno}/${groupMeetingView.meetingid}">삭제</a>

</body>
</html>
