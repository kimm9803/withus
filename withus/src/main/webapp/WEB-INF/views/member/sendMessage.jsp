<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>보낸 쪽지함</title>
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
</style>
</head>
<body>
	<div>
		<a href="/user/mymessage">받은 쪽지함</a>
	</div>
	<div>
		<a href="/user/send-message">보낸 쪽지함</a>
	</div>
	<table class="table table-hover">
		<thead>
			<tr>
				<th scope="col">#</th>
				<th scope="col">제목</th>
				<th scope="col">받은사람</th>
				<th scope="col">보낸날짜</th>
			</tr>
		</thead>
		<tbody>
		<c:forEach items="${sendMessage}" var="message" varStatus="loop">
			<tr class="clickable-row" data-href="/user/mymessage/view/${message.messageId}">
				<td>${loop.index + 1}</td>
				<td>${message.title}</td>
				<td>${message.name}</td>
				<td>${message.sendDate}</td>
			</tr>
		</c:forEach>
		</tbody>
	</table>
	<script>
		$(document).ready(function() {
			$('.clickable-row').on('click', function() {
				window.location = $(this).data('href');
			});
		})
	</script>
</body>
</html>