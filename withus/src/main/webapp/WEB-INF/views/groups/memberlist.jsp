<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<html>
<head>
<title>그룹원목록</title>
<!-- 부트스트랩 5 링크 추가 -->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css"
	rel="stylesheet">
<link rel="stylesheet"
	href="https://fonts.googleapis.com/css2?family=Sunflower:wght@300&display=swap">
<script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
<style>
* {
	font-family: 'Sunflower', sans-serif;
}

	main{
		display: flex; width: 60%; margin: 0 auto; margin-top: 150px; height: 80vh;
	}
	h1{
		margin-bottom: 30px;
	}
</style>
</head>
<body>
<header><%@ include file="../header.jsp" %></header>
<main>
	<div class="container mt-5">
		<h1>그룹원 목록</h1>

		<c:if test="${not empty memberlist}">
			<table class="table table-bordered">
				<thead>
					<tr>
						<th>그룹원 ID</th>
						<th>그룹원 이름</th>
						<th>가입일</th>
						<th>역할</th>
						<th>추방</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach var="memberlist" items="${memberlist}">
						<tr>
							<td>${memberlist.memberid}</td>
							<td>${memberlist.name}</td>
							<td>${memberlist.gjoindate}</td>
							<td><c:if test="${memberlist.gauth eq 1}">회원</c:if> <c:if
									test="${memberlist.gauth ne 1}">간부진</c:if></td>
							<td style="width:150px;">
								<button type="button" id="ban" class="btn btn-dark"
									data-memberid="${memberlist.memberid}">회원 추방</button>
							</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
		</c:if>
		<div class="btn-group mt-3 mr-2">
			<button type="button" class="btn btn-warning"
				onclick="location.href='/groups/loadall'">목록으로</button>
		</div>
		<div class="btn-group mt-3 mr-2">
            <button type="button" class="btn btn-secondary" onclick="history.back()">이전으로</button>
        </div>
        <div class="btn-group mt-3">
            <button type="button" class="btn btn-primary" onclick="location.href='/'">홈으로</button>
        </div>    
	</div>
</main>
<footer><%@ include file="../footer.jsp" %></footer>
	<!-- 부트스트랩 5 스크립트 추가 -->
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"></script>
	<script type="text/javascript">
// jQuery를 사용하여 문서가 준비되면 실행될 함수 정의
$(document).ready(function () {
    // 버튼에 클릭 이벤트 리스너 등록
    $("#ban").click(function () {
        var memberid = $(this).data("memberid");       
        if (confirm('정말 추방 시키시겠습니까?')) {
            // Ajax 요청 수행
            $.ajax({
                url: "/groups/memberban/"+${gno},
                method: "GET",
                data: {
                	memberid: memberid                	
                },
                success: function (data) {
                    alert("추방되었습니다.");
                    location.reload();
                },
                error: function (xhr, status, error) {
                    alert("추방이 되지 않았습니다.");
                }
            });
        }
    });
});
</script>

</body>
</html>
