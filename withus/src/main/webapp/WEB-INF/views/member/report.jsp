<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>회원신고</title>

<!-- 부트스트랩 5 스타일시트 링크 -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css"rel="stylesheet">
<link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Sunflower:wght@300&display=swap">
<style>
* {
	font-family: 'Sunflower', sans-serif;
}
label{
font-weight: bold;
}
h5{
font-weight: bold;
}
</style>
</head>
<body>

<div class="container mt-5">
    <div class="row justify-content-center">
        <div class="col-md-6">
            <div class="card">
                <div class="card-header">
                    <h5 class="card-title">회원 신고</h5>
                </div>
                <div class="card-body">
                    <!-- 여기에 폼 내용 추가 -->
                    <form  id="reportForm" action="/user/report" method="post">
					    <!-- 폼 필드들과 라벨 추가 -->
					    <div class="mb-3">
					        <label for="reporterId" class="form-label">신고자</label>
					        <input type="text" class="form-control bg-light" id="reporterId" name="reporterId" value="${reporterId}" readonly>
					    </div>
					    
					    <div class="mb-3">
					        <label for="reportedId" class="form-label">피신고자</label>
					        <input type="text" class="form-control bg-light" id="reportedId" name="reportedId" value="${reportedId}" readonly>
					    </div>					    
					    <div class="mb-3">
					        <label for="reason" class="form-label">신고사유</label>
					        <select class="form-select" id="rpcate" name="rpcate">
					            <option value="욕설/비방">욕설/비방</option>
					            <option value="홍보/상업성">홍보/상업성</option>
					            <option value="불법">불법</option>
					            <option value="음란성">음란성</option>
					            <option value="기타">기타</option>					            
					        </select>
					    </div>					
					    <div class="mb-3">
					        <label for="rpcontent" class="form-label">신고내용</label>
					        <textarea class="form-control" id="rpcontent" rows="5" cols="30" name="rpcontent"></textarea>
					    </div>							
					    <button type="button" class="btn btn-primary" onclick="submitForm()">신고하기</button>
					    <!-- 닫기 버튼 -->
					    <button type="button" class="btn btn-secondary" onclick="closePage()">닫기</button>
					</form>
                </div>
            </div>
        </div>
    </div>
</div>

<!-- 부트스트랩 5 스크립트 링크 (팝퍼와 부트스트랩 자바스크립트 포함) -->
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.6/dist/umd/popper.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.min.js"></script>

<!-- 닫기 버튼 클릭 시 페이지 닫기 함수 -->
<script>
    function closePage() {
        window.close();
    }
    
    function submitForm() {
        var confirmSubmit = confirm("신고를 제출하시겠습니까?");
        if (confirmSubmit) {
            // 확인을 눌렀을 때 폼 제출
            document.getElementById("reportForm").submit();                       
            
        } else {
            // 확인을 누르지 않았을 때의 처리
            return false; // 폼 제출을 취소
        }
    }

</script>
</body>
</html>