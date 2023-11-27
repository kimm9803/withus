<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>정모 목록</title>
<script src="https://kit.fontawesome.com/51db22a717.js" crossorigin="anonymous"></script>
<link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Sunflower:wght@300&display=swap">
<link
   href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css"
   rel="stylesheet">
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script
   src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js"></script>
<style>
	* {
		font-family: 'Sunflower', sans-serif;
	}
  

    /* 게시판 리스트 스타일 */
    .gmeeting-list {
      margin-top: 100px;
    }

    .pagination {
    display: flex;
    justify-content: center;
    margin-top: 80px;
}

.pagination ul {
    padding: 0;
    list-style: none;
    margin: 0;
    display: flex;
}

.pagination li {
    display: inline-block;
    margin: 0 2px;
}
.message-links {
  display: flex;
  justify-content: flex-end; /* 수정된 부분 */
  margin-bottom: 20px;
}

.message-link {
  margin-left: 10px; /* 각 링크 간의 간격 조절 */
}

main a {
  text-decoration: none;
  padding: 10px;
  color: #333;
  border-radius: 5px;
}

main a:hover {
  font-weight: bold;
}

main {
    margin:150px auto;	
    min-height: 80vh;
    height: auto; /* 높이를 자동으로 조절하도록 설정 */	
    width:60%
}
#table{
	height: 600px;
}
  </style>
</head>
<body>
<header><%@ include file="../header.jsp" %></header>
<main>
	<h1 style="margin-bottom: 40px;">정모 목록</h1>
	<table class="table table-hover">
		<thead>
			<tr style="text-align: center; border-bottom: 1px solid black;">
				<th scope="col" style="padding:15px 0;">주최자</th>
				<th scope="col" style="padding:15px 0;">제목</th>
				<th scope="col" style="padding:15px 0;">위치</th>
				<th scope="col" style="padding:15px 0;">비용</th>
				<th scope="col" style="padding:15px 0;">정모날짜</th>
				<th scope="col" style="padding:15px 0;">마감날짜</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach var="meeting" items="${groupMeetingList}">
			    <tr style="text-align: center;">
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
</main>

<footer><%@ include file="../footer.jsp" %></footer>
</body>
</html>
