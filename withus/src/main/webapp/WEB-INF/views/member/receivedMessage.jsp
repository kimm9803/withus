<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>받은 쪽지함</title>
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

.pagination {
    display: flex;
    justify-content: center;
    margin-top: 20px;
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
  border: 1px solid #ccc;
  color: #333;
  border-radius: 5px;
}

main a:hover {
  background-color: #f0f0f0;
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
	<h2 style="text-align: center; margin-bottom: 50px;">받은 쪽지함</h2>
    <div class="message-links">
      <div class="message-link">
        <a href="/user/mymessage">받은 쪽지함</a>
      </div>
      <div class="message-link">
        <a href="/user/send-message">보낸 쪽지함</a>
      </div>
    </div>
    <div id="table">
	<table class="table table-hover">
		<thead>
			<tr style="text-align: center; border-bottom: 1px solid black;">
				<th scope="col" style="width:100px; padding:15px 0;">#</th>
				<th scope="col" style="padding:15px 0;">제목</th>
				<th scope="col" style="width:300px;padding:15px 0;">보낸사람</th>
				<th scope="col" style="width:200px;padding:15px 0;">받은날짜</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach items="${receivedMessage}" var="message" varStatus="loop">
				<tr class="clickable-row"
					data-href="/user/mymessage/view/${message.messageId}" >
					<td style="text-align: center; padding: 15px 0;">${loop.index + 1}</td>
					<td style="padding-left: 20px; text-align: center; padding: 15px 0;">${message.title}</td>
					<td style="padding: 15px 0;text-align: center;">${message.name}</td>
					<td style="padding: 15px 0;text-align: center;">${message.sendDate}</td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
	</div>
	<div class="pagination">
		<ul>
			<c:if test="${pageMaker.prev}">
				<li><a
					href="/user/mymessage${pageMaker.makeQuery(pageMaker.startPage - 1)}">이전</a></li>
			</c:if>

			<c:forEach begin="${pageMaker.startPage}" end="${pageMaker.endPage}"
				var="idx">
				<li><a href="/user/mymessage${pageMaker.makeQuery(idx)}">${idx}</a></li>
			</c:forEach>

			<c:if test="${pageMaker.next && pageMaker.endPage > 0}">
				<li><a
					href="/user/mymessage${pageMaker.makeQuery(pageMaker.endPage + 1)}">다음</a></li>
			</c:if>
		</ul>
	</div>
</main>	
	<footer><%@ include file="../footer.jsp" %></footer>
	<script>
		$(document).ready(function() {
			$('.clickable-row').on('click', function() {
				window.location = $(this).data('href');
			});
		})
	</script>
</body>
</html>