<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>받은 쪽지 상세</title>
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
  width: 30%;
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
		<div><h1>✉ 쪽지상세</h1></div>
		<div class="m-box">
			<div>
				<span>제 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;목</span><span style="font-weight: bold; margin-left: 20px;">${message.title}</span>
			</div>
			<hr class="dotted">
			<div style="margin-bottom: 10px;">
				<span>보낸사람</span> <span style="margin-left: 15px; background-color: #DCF5FA; border-radius: 10px; padding: 4px 8px 4px 8px;">${message.senderName}</span>
			</div>
			<hr class="dotted">
			<div style="margin-bottom: 10px;">
				<span>받는사람</span> <span style="margin-left: 15px; background-color: #DCF5FA; border-radius: 10px; padding: 4px 8px 4px 8px;">${message.receiverName}</span>
			</div>
			<hr class="dotted">
			<div>
				<span>날 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;짜</span><span style="margin-left: 20px;">${message.sendDate}</span>
			</div>
			<hr class="dotted">
			<div class="con">${message.content}</div>
			<div class="button-group">
				<button class="btn btn-danger delete" style="margin-right: 10px;">삭제</button>
				<button class="btn btn-dark list">목록</button>
			</div>
		</div>
		
	</main>
	<footer><%@ include file="../footer.jsp" %></footer>
	
	<script>
		$(document).ready(function() {
			var messageId = ${message.messageId};
			
			// 목록 버튼
			$('.list').on('click', function() {
				history.back();
			});
			
			// 삭제 버튼
			$('.delete').on('click', function() {
				const confirmMessage = confirm('쪽지를 삭제하시겠습니까?');
				
				if (confirmMessage) {
					$.ajax({
						url: '/user/mymessage/delete',
						type: 'POST',
						data: {
							messageId : messageId
						},
						success: function() {
							location.href = '/user/mymessage';
						},
						error: function() {
							alert('에러 발생');
						}
					});
				};
			});
		})
	</script>
</body>
</html>