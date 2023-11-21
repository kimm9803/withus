<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>공지사항 목록</title>
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
    text-align: center;
    margin-top: 20px;
}

ul {
    padding: 0;
    list-style: none;
    display: inline-block;
}

li {
    display: inline-block;
    margin: 0 2px;
}

main a {
    text-decoration: none;
    padding: 5px 10px;
    border: 1px solid #ccc;
    color: #333;
    border-radius: 5px;
}

main a:hover {
    background-color: #f0f0f0;
}
.pagination-wrapper {
    text-align: center;
    margin-top: 20px;
}
main{
	margin-top: 150px;
	width:60%;
	margin-left: auto;
    margin-right: auto;
}
h2{
	text-align: center;
}
#write{
	margin-bottom: 20px;
	float: right;
}

</style>
</head>
<body>
<header><%@ include file="../header.jsp" %></header>
<main>
<h2>공지사항</h2>
<div id="write"><a href="/admin/notice/write" class="btn btn-dark">공지사항 등록</a></div>
	<table class="table table-hover" id="noticelist">
		<thead>
			<tr>
				<th scope="col">#</th>
				<th scope="col">제목</th>
				<th scope="col">작성자</th>
				<th scope="col">등록일</th>
			</tr>
		</thead>
		<tbody>
		<c:forEach items="${noticeList}" var="notice" varStatus="loop">
			<tr class="clickable-row" data-href="/notice/view/${notice.noticeid}">
				<td>${loop.index + 1}</td>
				<td>${notice.nttitle}</td>
				<td>${notice.name}</td>
				<td>${notice.ntregdate}</td>
			</tr>
		</c:forEach>
		</tbody>
	</table>

	<div class="pagination-wrapper">
		<ul>
			<c:if test="${pageMaker.prev}">
				<li><a
					href="/admin/group/list${pageMaker.makeQuery(pageMaker.startPage - 1)}">이전</a></li>
			</c:if>

			<c:forEach begin="${pageMaker.startPage}" end="${pageMaker.endPage}"
				var="idx">
				<li><a href="/admin/group/list${pageMaker.makeQuery(idx)}">${idx}</a></li>
			</c:forEach>

			<c:if test="${pageMaker.next && pageMaker.endPage > 0}">
				<li><a
					href="/admin/group/list${pageMaker.makeQuery(pageMaker.endPage + 1)}">다음</a></li>
			</c:if>
		</ul>
	</div>	
</main>		
	<script>
		$(document).ready(function() {
			$('.clickable-row').on('click', function() {
				window.location = $(this).data('href');
			});
		})
	</script>
</body>
</html>