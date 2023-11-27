<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%--
  Created by IntelliJ IDEA.
  User: Mjjeon
  Date: 2023-11-23
  Time: 오후 12:07
  To change this template use File | Settings | File Templates.
--%>

<html>
<head>
    <title>Title</title>
  <style>
    footer {
      position: fixed;
      bottom: 0;
      width: 100%;
      background-color: #f8f9fa;
      text-align: center;
      padding: 10px;
    }

    /* 게시판 리스트 스타일 */
    .gmeeting-list {
      margin-top: 100px;
    }

    /* 테이블 스타일 */
    table {
      width: 100%;
      border-collapse: collapse;
      margin-bottom: 20px;
    }

    /* 테이블 헤더 스타일 */
    th {
      background-color: #f2f2f2;
    }

    /* 테이블 셀 스타일 */
    td, th {
      border: 1px solid #ddd;
      padding: 8px;
      text-align: left;
    }

    /* 링크 스타일 */
    a {
      color: #007bff;
      text-decoration: none;
    }

    a:hover {
      text-decoration: underline;
    }
  </style>
</head>
<body>
<header><%@ include file="../header.jsp" %></header>

<div class ="gmeeting-list" style="margin-top: 100px;">

  <h3>정모 게시판</h3>
  <br>
  <table border="1">
  <thead>
  <th>주최자</th>
  <th>제목</th>
  <th>위치</th>
  <th>비용</th>
  <th>정모날짜</th>
  <th>마감날짜</th>

  </thead>
  <tbody>
  <c:forEach var="meeting" items="${groupMeetingList}">
    <tr>
      <td>${meeting.name}</td>
      <td><a href="/gmeeting/view/${meeting.meetingid}/${meeting.gno}">${meeting.title}</a></td>
      <td>${meeting.location}</td>
      <td>${meeting.cost}</td>
      <td>${meeting.meeting_date}</td>
      <td>${meeting.deadline_date}</td>
    </tr>
  </c:forEach>
  </tbody>
</table>

  <!-- 페이징 링크 -->
  <c:if test="${currentPage > 1}">
    <a href="?page=${currentPage - 1}">이전</a>
  </c:if>

  <c:if test="${not empty groupMeetingList && groupMeetingList.size() == pageSize}">
    <a href="?page=${currentPage + 1}">다음</a>
  </c:if>

</div>
<footer><%@ include file="../footer.jsp" %></footer>
</body>
</html>
