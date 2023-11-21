<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <title>공지사항 수정</title>
    <style>
        body {
            padding-top: 20px;
        }

        .container {
            margin-top: 20px;
        }

        .form-container {
            border: 2px solid #3D8B55; /* 테두리 스타일 및 컬러 조정 */
            border-radius: 10px;
            padding: 20px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1); /* 그림자 효과 추가 */
        }
        
        main {
            margin-top: 150px;
        }
        label{
        	font-weight: bold;
        }

    </style>
</head>

<body>
    <header><%@ include file="../header.jsp" %></header>
    <main>
        <div class="container mt-5 form-container">
            <h2 class="mb-4">공지사항 수정</h2>

            <form method="POST" action="/admin/notice/modify/${notice.noticeid}" id="modifyForm">
                <input type="hidden" name="noticeid" value="${notice.noticeid}">
                <div class="mb-3">
                    <label for="title" class="form-label">제목</label>
                    <input type="text" class="form-control" id="title" name="nttitle" value="${notice.nttitle}">
                </div>

                <div class="mb-3">
                    <label for="author" class="form-label">작성자</label>
                    <input type="text" class="form-control" id="memberid" name="memberid" value="${notice.memberid}" readonly>
                </div>

                <div class="mb-3">
                    <label for="content" class="form-label">내용</label>
                    <textarea class="form-control" id="content" name="ntcont" rows="10">${notice.ntcont}</textarea>
                </div>

                <div class="d-flex justify-content-end">
                    <button type="submit" class="btn btn-primary" id="modifyBtn">수정</button>
                    <a href="javascript:history.back()" class="btn btn-secondary">이전</a>
                </div>
            </form>
        </div>
    </main>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
    <script>
        document.getElementById("modifyBtn").addEventListener("click", function() {
            var confirmed = confirm("정말 수정하시겠습니까?");
            if (!confirmed) {
                // 사용자가 "취소"를 선택한 경우 폼 제출 막기
                event.preventDefault();
            }
        });
    </script>
</body>
</html>
