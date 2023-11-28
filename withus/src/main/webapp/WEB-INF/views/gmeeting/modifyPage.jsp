<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>정모 수정</title>
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
      .container {
        width: 50%;
        margin: 0 auto; /* Center the container */
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
      input[type="datetime-local"] {
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

	<main style="margin-top: 200px; margin-bottom: 200px;">
	    <div class="container mt-4">
	      <div class="post-card">
	      	<h1 style="margin-bottom: 40px;">정모 수정</h1>
	        <form id ="meetingForm" action="/gmeeting/modify/${gno}/${meetingid}" method="post">
	          <!-- 모임 정보 입력 폼 -->
	          <label for="title">제목</label>
	          <input type="text" id="title" name="title" value="${modifyView.title}" required><br>
	
	          <label for="content">내용</label>
	          <textarea id="content" name="content" required>${modifyView.content}</textarea><br>
	
	          <label for="location">장소</label>
	          <input type="text" id="location" name="location" value="${modifyView.location}" required><br>
	
	          <label for="cost">비용</label>
	          <input type="text" id="cost" name="cost" value="${modifyView.cost}" required><br>
	
	          <label for="capacity">인원</label>
	          <input type="text" id="capacity" name="capacity" value="${modifyView.capacity}" required><br>
	
	          <label for="meetingDate">정모 날짜</label>
	          <input type="datetime-local" id="meetingDate" name="meeting_date" value="${modifyView.meeting_date}" required><br>
	
	          <label for="deadlineDate">마감 날짜</label>
	          <input type="datetime-local" id="deadlineDate" name="deadline_date" value="${modifyView.deadline_date}" required><br>

				<p id="warningMessage" class="warning"></p>

	          <!-- 폼 제출 버튼 -->
	          <button type="submit">수정</button>
	
	          <!-- hidden 필드에 gno와 meetingid를 전달 -->
	          <input type="hidden" name="gno" value="${gno}">
	          <input type="hidden" name="meetingid" value="${meetingid}">
	        </form>
	      </div>
	    </div>
	</main>
    <footer><%@ include file="../footer.jsp" %></footer>

	<script>
		$(document).ready(function() {
			// 폼 제출 이벤트를 가로채서 폼을 서버로 직접 제출
			$('form').submit(function(event) {
				checkDeadlineDate(); // 날짜 체크
			});

			// 마감 날짜의 변경을 감지하여 처리
			$('#deadlineDate').on('change', function() {
				checkDeadlineDate();
			});

			// 정모 날짜의 변경을 감지하여 처리
			$('#meetingDate').on('change', function() {
				checkDeadlineDate();
			});
		});

		function checkDeadlineDate() {
			var meetingDate = new Date($('#meetingDate').val() );
			var deadlineDate = new Date($('#deadlineDate').val() );

			// 마감 날짜가 정모 날짜 이전으로 선택되어야 함
			if (deadlineDate > meetingDate) {
				$('#warningMessage').text('마감 날짜는 정모 날짜 이전으로 설정되어야 합니다.');
			} else {
				$('#warningMessage').text('');
				// 마감 날짜가 정모 날짜 이전 경우에만 서버로 제출됩니다.
			}
		}

	</script>


</body>
</html>
