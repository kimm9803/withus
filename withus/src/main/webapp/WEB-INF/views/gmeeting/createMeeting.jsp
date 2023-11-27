<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>정모 만들기</title>
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
        body {
            margin: 0;
            padding: 0;
            font-family: 'Sunflower', sans-serif;
            background-color: #f0f0f0;
        }

        .main-container {
            margin-top: 200px;
            margin-bottom: 200px;
        }

        .card {
            width: 600px;
            height: 750px;
            background-color: #fff;
            border: 1px solid #ddd;
            border-radius: 8px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            padding: 50px;
            box-sizing: border-box;
            margin: 0 auto; /* 중앙 정렬을 위해 추가 */
        }

        .card input[type="text"] {
            width: 100%; /* 제목(input 태그의 name이 "title")을 더 넓게 조정 */
            padding: 10px;
            margin-bottom: 10px;
            display: inline-block;
            box-sizing: border-box;
            border: 1px solid #ccc;
            border-radius: 5px;
        }

        .card input[type="number"],
        .card input[type="date"] {
            padding: 10px;
            margin-bottom: 10px;
            display: inline-block;
            box-sizing: border-box;
            border: 1px solid #ccc;
            border-radius: 5px;
        }

        .card button {
            width: 100%;
            background-color: #4CAF50;
            color: white;
            padding: 10px;
            border: none;
            border-radius: 5px;
            cursor: pointer;
        }
        footer {
            bottom: 0;
            width: 100%;
        }
        .custom {
        	width: 40%;
        }
        .cus {
        	width: 250px;
        }
    </style>

    <title>Title</title>
</head>
<body>
<header><%@ include file="../header.jsp" %></header>
<!-- createMeeting.jsp -->

<div class = main-container>
    <div class = card>
    	<h1 style="margin-bottom: 40px;">정모 생성</h1>
		<form action="/gmeeting/create/${gno}" method="post" enctype="multipart/form-data">
		
			<label for="title">제목</label>
			<div>
		    	<input type="text" id="title" name="title" placeholder="제목을 입력하세요" required>
		    </div>
		    <label for="content">내용</label>
		    <div>
		    	<input type="text" id="content" name="content" placeholder="내용을 입력하세요" required >
		    </div>
		    <label for="location">위치</label>
		    <div>
		    	<input type="text" id="location" name="location" required>
		    </div>
		    <label for="cost">비용</label>
		    <div>
		    	<input type="text" id="cost" name="cost" placeholder="비용" required>
		    </div>
		    <label for="capacity">인원</label>
		    <div>
			    <input class="custom" type="number" id="capacity" name="capacity" min="5" max="99" placeholder="정모 인원(5명 ~ 99명)" required>
		    </div>
		    <!-- 정모 날짜 선택  -->
		    <div style="display: flex; justify-content: space-between;">
		    	<div class="cus">
		    		<div><label for="meeting_date">정모날짜</label></div>
		    		<input type="date" id="meeting_date" name="meeting_date" style="width: 240px;" required>
		    	</div>
		    	<div class="cus">
		    		<div><label for="deadline-date">마감날짜</label></div>
		    		<input type="date" id="deadline_date" name="deadline_date" style="width: 240px;" required>
		    	</div>
		    </div>
		    <!-- 마감 날짜 선택 -->
		    
		    <!-- hidden -->
		    <input type="hidden" name="memberid" value="${memberid}">
		    <input type="hidden" name="gno" value="${gno}">
		    <button type="submit" class="group-board-button" style="margin-top: 20px;">모임 생성</button>
		</form>
    </div>
</div>
<footer><%@ include file="../footer.jsp" %></footer>
</body>
</html>
