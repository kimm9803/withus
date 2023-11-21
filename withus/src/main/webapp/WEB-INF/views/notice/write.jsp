<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <title>공지사항 작성</title>
</head>

<body>

    <div class="container mt-5">
        <h2 class="mb-4">공지사항 작성</h2>

        <form method="POST" action="/admin/notice/write">
            <div class="mb-3">
                <label for="title" class="form-label">제목</label>
                <input type="text" class="form-control" id="title" name="nttitle"placeholder="제목을 입력하세요">
            </div>

            <div class="mb-3">
                <label for="author" class="form-label">작성자</label>
                <input type="text" class="form-control" id="memberid" name="memberid"value="${memberid}"  readonly>
            </div>
            
            <div class="mb-3">
                <label for="content" class="form-label">내용</label>
                <textarea class="form-control" id="content" name="ntcont"rows="5" placeholder="내용을 입력하세요"></textarea>
            </div>


            <button type="submit" class="btn btn-primary">작성하기</button>
        </form>

    </div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>

</html>