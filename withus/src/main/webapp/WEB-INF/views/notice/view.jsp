<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>공지사항 상세보기</title>
    
    <!-- 부트스트랩 5 스타일시트 -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        body {
            padding-top: 20px;
        }

        .container {
            margin-top: 20px;
        }

        .card {
            border: none;
            border-radius: 10px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
        }

        .card-header {
            background-color: #3D8B55;
            color: white;
            border-radius: 10px 10px 0 0;
        }

        .card-body {
            padding: 30px;
        }

        .meta-info {
            margin-top: 15px;
            display: flex;
            justify-content: space-between;
            align-items: center;
            border-bottom: 1px solid #ddd;
            padding-bottom: 10px;
        }

        .notice-content {
            margin-top: 15px;
            height: 300px;
            white-space: pre-line; /* 개행 문자를 <br> 태그로 변환 */
        }

        main {
            margin-top: 100px;
            margin-bottom: 50px;
        }

        .btn-group {
            margin-top: 20px;
            float: right;
        }
    </style>
</head>
<body>
<header><%@ include file="../header.jsp" %></header>
<main>
    <div class="container mt-5">
        <div class="row">
            <div class="col-md-8 offset-md-2">
                <!-- 공지사항 상세내용 -->
                <div class="card">
                    <div class="card-header">
                        <h1 class="mb-0">${notice.nttitle}</h1>
                    </div>
                    <div class="card-body">
                        <div class="meta-info">
                            <div class="text-muted">작성일: ${notice.ntregdate}</div>
                            <div class="text-muted">작성자: ${notice.name}</div>
                        </div>
                        <div class="notice-content">
                            <p>${notice.ntcont}</p>
                        </div>
                        <!-- 수정, 삭제 버튼 -->
                        <c:if test="${notice.memberid eq memberid}">
                        <div class="btn-group">
                            <div><a href="/admin/notice/modify/${notice.noticeid}" class="btn btn-warning">수정</a></div>
                            <div><a href="/admin/notice/delete/${notice.noticeid}" class="btn btn-danger" id="deleteBtn">삭제</a></div>
                            <div><a href="javascript:history.back()" class="btn btn-secondary">이전으로</a></div>
                            <div><a href="/notice/list" class="btn btn-secondary">목록으로</a></div>
                        </div>
                        </c:if>
                    </div>
                </div>
            </div>
        </div>
    </div>
</main>
<!-- 부트스트랩 5 스크립트 및 팝퍼스 스크립트 -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
<script>
    document.getElementById("deleteBtn").addEventListener("click", function() {
        var confirmed = confirm("정말 삭제하시겠습니까?");
        if (confirmed) {
            // 삭제 로직을 수행하는 URL로 리다이렉트 또는 AJAX 요청을 추가하세요.
            window.location.href = "/admin/notice/delete/${notice.noticeid}";
        } else {
        	 event.preventDefault(); // 이벤트 전파를 막음
        }
    });
</script>
</body>
</html>
