<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>신고 내역 목록</title>
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

a {
    text-decoration: none;
    padding: 5px 10px;
    border: 1px solid #ccc;
    color: #333;
    border-radius: 5px;
}

a:hover {
    background-color: #f0f0f0;
}

</style>
</head>
<body>
	
	<table class="table table-hover">
		<thead>
			<tr>
				<th scope="col">#</th>
				<th scope="col">신고자 아이디</th>
				<th scope="col">신고 그룹명</th>
				<th scope="col">신고 사유</th>
				<th scope="col">신고날짜</th>
				<th scope="col">선택</th>
			</tr>
		</thead>
		<tbody>
		<c:forEach items="${gReportList}" var="report" varStatus="loop">
			<tr class="clickable-row"  data-href="/admin/group/reportview/${report.greportid}">			
				<td>${loop.index + 1}</td>
				<td>${report.memberid}</td>
				<td>${report.gname}</td>
				<td>${report.rpcate}</td>
				<td>${report.reportdate}</td>
				<td>
					<div class="dropdown">
			            <button class="btn btn-secondary btn-sm dropdown-toggle drop" type="button" id="dropdownMenuButton" data-bs-toggle="dropdown" aria-expanded="false">
			              신고확인여부
			            </button>
			            <ul class="dropdown-menu" aria-labelledby="dropdownMenuButton">
			              <li><a class="dropdown-item" href="#">확인</a></li>
			              <li><a class="dropdown-item" href="#">취소</a></li>			              
			            </ul>
			    	</div>
				</td>
			</tr>
		</c:forEach>
		</tbody>
	</table>
	
	<div>
		<ul>
			<c:if test="${pageMaker.prev}">
				<li><a
					href="/admin/group/reportlist${pageMaker.makeQuery(pageMaker.startPage - 1)}">이전</a></li>
			</c:if>

			<c:forEach begin="${pageMaker.startPage}" end="${pageMaker.endPage}"
				var="idx">
				<li><a href="/admin/group/reportlist${pageMaker.makeQuery(idx)}">${idx}</a></li>
			</c:forEach>

			<c:if test="${pageMaker.next && pageMaker.endPage > 0}">
				<li><a
					href="/admin/group/reportlist${pageMaker.makeQuery(pageMaker.endPage + 1)}">다음</a></li>
			</c:if>
		</ul>
	</div>	
	<script>
	$(document).ready(function() {
		$('.clickable-row').on('click', function() {
			window.location = $(this).data('href');
		});
	})
	</script>
</body>
</html>