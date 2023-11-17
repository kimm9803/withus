<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>쪽지</title>
    <script src="https://kit.fontawesome.com/51db22a717.js" crossorigin="anonymous"></script>
    <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Sunflower:wght@300&display=swap">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL" crossorigin="anonymous"></script>

    <style>
        * {
            font-family: 'Sunflower', sans-serif;
        }
        
        /* 중앙 정렬을 위한 스타일 */
        .centered-form {
            display: flex;
            justify-content: center;
            
        }
        .centered-form form {
            width: 100%;
            max-width: 600px; /* 폼의 최대 너비 */
            padding: 45px; /* 패딩을 더 크게 조정 */
            border: 1px solid #ddd;
            border-radius: 20px;
            background-color: #f9f9f9;
        }
        .centered-form form label {
            font-weight: bold;
        }
        .centered-form form input[type="text"],
        .centered-form form textarea {
            width: 100%;
            margin-bottom: 15px; /* 마진을 조금 더 크게 조정 */
            padding: 12px; /* 패딩을 더 크게 조정 */
            border-radius: 5px;
            border: 1px solid #ccc;
        }
        
        .btn-primary {
        	background-color: seagreen;
        	border: none;
        }
        
        .btn-primary:hover {
        	background-color: 
        }
        
        main {
        	margin-top: 200px;
        	margin-bottom: 120px;
        }
    </style>
</head>
<body>
    <header><%@ include file="../header.jsp" %></header>

    <main class="centered-form">
        <form action="/user/message/send" method="post">
            <div><input type="hidden" name="sender" value="${sender}"></div>
            <div><input type="hidden" name="receiver" value="${receiver}"></div>
            <div style="text-align: center;"><h2>쪽지</h2></div>
            <div class="mb-3">
                <label for="receiver" class="form-label">받는 사람</label>
                <input type="text" id="receiver" class="form-control" value="${gLeaderName}" readonly required/>
            </div>
            <div class="mb-3">
                <label for="title" class="form-label">제목</label>
                <input type="text" id="title" name="title" class="form-control" maxlength="50" required/>
            </div>
            <div class="mb-3">
                <label for="content" class="form-label">내용</label>
                <textarea id="content" name="content" class="form-control" rows="5" required></textarea>
            </div>
            <div style="display: flex; justify-content: flex-end; margin-top: 30px;">
	            <input type="submit" value="보내기" class="btn btn-primary"/>
	            <button type="button" class="btn btn-secondary" style="margin-left: 10px;">취소</button>
            </div>
        </form>
    </main>

    <footer><%@ include file="../footer.jsp" %></footer>
</body>
</html>
