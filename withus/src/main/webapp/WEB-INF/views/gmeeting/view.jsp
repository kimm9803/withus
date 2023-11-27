<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>정모 상세</title>
<script src="https://kit.fontawesome.com/51db22a717.js"
	crossorigin="anonymous"></script>
<link rel="stylesheet"
	href="https://fonts.googleapis.com/css2?family=Sunflower:wght@300&display=swap">
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN"
	crossorigin="anonymous">
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL"
	crossorigin="anonymous"></script>

<style>
* {
	font-family: 'Sunflower', sans-serif;
}
main {
  margin: 0 auto;
  width: 35%;
  margin-top: 250px;
  margin-bottom: 200px;
}

/* header와 footer를 고정시킴 */
header, footer {
  width: 100%;
  left: 0;
}

header {
  top: 0;
}


.m-box {
	border: 1px solid brown;
	padding: 20px;
	margin-top: 20px;
}
hr.dotted {
  border: none; /* 기본적인 선을 없애고 */
  border-top: 2px dashed brown; /* 점선 스타일을 설정합니다. */
  height: 1px; /* 선의 높이를 조정합니다. */
}
.button-group {
	display: flex;
	justify-content: flex-end;
	margin-top: 20px;
}

.con {
	height: 200px;
}
</style>
</head>
<body>
	<header><%@ include file="../header.jsp" %></header>

	<main>
		<div><h1>👩‍👩‍👧‍👦 정모</h1></div>
		<div class="m-box">
			<div>
				<span style="font-weight: bold;">제 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;목</span><span style="margin-left: 20px;">${groupMeetingView.title}</span>
			</div>
			<hr class="dotted">
			<div style="margin-bottom: 10px;">
				<span style="font-weight: bold;">정 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;원</span> <span style="margin-left: 20px;">${attendCount} / ${groupMeetingView.capacity}</span>
			</div>
			<hr class="dotted">
			<div style="margin-bottom: 10px;">
				<span style="font-weight: bold;">비 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;용</span> <span style="margin-left: 20px;">${groupMeetingView.cost}</span>
			</div>
			<hr class="dotted">
			<div>
				<span style="font-weight: bold;">위 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;치</span><span style="margin-left: 20px;">${groupMeetingView.location}</span>
			</div>
			<hr class="dotted">
			<div style="display: flex;">
				<div style="margin-right: 70px;">
					<span style="font-weight: bold;">정모날짜</span><span style="margin-left: 20px;">${groupMeetingView.meeting_date}</span>
				</div>
				<div style="font-weight: bold;">|</div>
				<div style="margin-left: 70px;">
					<span style="font-weight: bold;">마감날짜</span><span style="margin-left: 20px;">${groupMeetingView.deadline_date}</span>
				</div>
			</div>
			<hr class="dotted">
			<div class="con">${groupMeetingView.content}</div>
			<hr class="dotted">
			<div style="margin-bottom: 10px;">
				<span style="font-weight: bold;">참&nbsp;&nbsp;가&nbsp;&nbsp;원</span>
				<c:forEach var="meetingAttend" items="${groupMeetingAttendName}" varStatus="loopStatus">
					<span style="margin-left: 15px; background-color: #DCF5FA; border-radius: 10px; padding: 4px 8px 4px 8px;">
		        		${meetingAttend.name}
		        	</span>
		    	</c:forEach>
			</div>
			
			<!-- 본인만 수정 및 삭제 버튼 표시 -->
			<div class="button-group">
			
				<form action="/gmattendance/create/${groupMeetingView.meetingid}/${groupMeetingView.gno}" method="post">
			        <!-- 참석 버튼 -->
			        <button type="submit" class="btn btn-dark">참석</button>
			    </form>
		      <c:choose>
		        <c:when test="${isCreateMeeting}">
		          <!-- 수정 삭제 버튼 추가 -->
		          <a href="/gmeeting/modifypage/${groupMeetingView.gno}/${groupMeetingView.meetingid}" class="btn btn-dark" style="margin-left: 10px;">수정</a>
		          <a href="/gmeeting/delete/${groupMeetingView.gno}/${groupMeetingView.meetingid}" class="btn btn-danger" style="margin-left: 10px;">삭제</a>
		        </c:when>
		        <c:otherwise>
		          <!-- 그 외의 경우에는 버튼을 숨김 -->
		        </c:otherwise>
		      </c:choose>
		
		      
			</div>
		
	</main>

	<footer><%@ include file="../footer.jsp" %></footer>
</body>
</html>