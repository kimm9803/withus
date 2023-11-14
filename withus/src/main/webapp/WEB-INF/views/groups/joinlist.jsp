<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<html>
<head>
    <title>Group Join List</title>
    <!-- 부트스트랩 5 링크 추가 -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet">
    <script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
</head>
<body>

<div class="container mt-5">
    <h1>Group Join List</h1>

    <c:if test="${not empty joinlist}">
        <table class="table table-bordered">
            <thead>
                <tr>
                    <th>가입번호</th>
                    <th>신청자 ID</th>
                    <th>가입자 이름</th>
                    <th>가입 신청일</th>
                    <th>가입 여부</th>
                    <th>가입 허가</th>
                </tr>
            </thead>
            <tbody>
                <c:forEach var="joinlist" items="${joinlist}">
                    <tr>
                        <td>${joinlist.gjoinid}</td>
                        <td>${joinlist.memberid}</td>
                        <td>${joinlist.name}</td>
                        <td>${joinlist.gappdate}</td>
                        <td> <c:if test="${joinlist.gpermit eq 1}">YES</c:if>
			                 <c:if test="${joinlist.gpermit eq 0}">NO</c:if>
			            </td>
                        <td>
				            <button type="button" id="permit"class="btn btn-dark"
				                    data-gjoinid="${joinlist.gjoinid}"
				                    data-gno="${joinlist.gno}"
				                    data-memberid="${joinlist.memberid}">
				                가입 허가
				            </button>
				        </td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>
    </c:if>
		<div class="btn-group">
			<button type="button" class="btn btn-warning" onclick="location.href='/groups/list'">목록으로</button>
		</div>    
</div>

<!-- 부트스트랩 5 스크립트 추가 -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"></script>
<script type="text/javascript">
// jQuery를 사용하여 문서가 준비되면 실행될 함수 정의
$(document).ready(function () {
    // 버튼에 클릭 이벤트 리스너 등록
    $("#permit").click(function () {
        var gjoinid = $(this).data("gjoinid");
        var gno = $(this).data("gno");
        var memberid = $(this).data("memberid");
        if (confirm('가입을 수락하시겠습니까?')) {
            // Ajax 요청 수행
            $.ajax({
                url: "/groups/permit",
                method: "GET",
                data: {
                    gjoinid: gjoinid,
                    gno : gno,
                    memberid : memberid
                },
                success: function (data) {
                    alert("가입 허가 되었습니다.");
                    location.reload();
                },
                error: function (xhr, status, error) {
                    alert("가입 허가 실패했습니다.");
                }
            });
        }
    });
});

</script>


</body>
</html>
