<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>그룹 생성</title>
    <!-- 부트스트랩 CDN 링크 -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-4bw+/aepP/YC94hEpVNVgiZdgIC5+VKNBQNGCHeKRQN+PtmoHDEXuppvnDJzQIu9" crossorigin="anonymous">
    <style>
    main{
	    margin-top: 150px;
	    margin-bottom: 70px;
    }
    </style>
</head>
<body>
<header><%@ include file="../header.jsp" %></header>
<main>
    <div class="container mt-5">
        <h2>그룹 생성</h2>
        <!-- 그룹 생성 폼 -->
        <form action="/groups/create" method="post">
            <div class="mb-3">
                <label for="groupName" class="form-label">그룹명</label>
                <input type="text" class="form-control" id="groupName" name="gname" required autocomplete="off">
            </div>
            <div class="mb-3">
                <label for="groupIntro" class="form-label">그룹 소개</label>
                <textarea class="form-control" id="groupIntro" name="gintro" rows="4" required></textarea>
            </div>
            <div class="mb-3">
                <label for="groupPerson" class="form-label">정원</label>
                <input type="number" class="form-control" id="groupPerson" name="gperson" value="1"  min="1" max="99"required>
            </div>
            <div class="mb-3">
                <label for="category" class="form-label">카테고리</label>
                <select class="form-select" id="category" name="cateid" required>
                    <option value="1">아웃도어/여행</option>
                    <option value="2">운동/스포츠</option>
                    <option value="3">책/글</option>
                    <option value="4">외국/언어</option>
                    <option value="5">문화/공연/축제</option>
                    <option value="6">음악/악기</option>
                    <option value="7">사진/영상</option>
                    <option value="8">게임/오락</option>
                    <option value="9">차/오토바이</option>
                </select>
            </div>
           <div class="mb-3">
			    <label for="region" class="form-label">지역</label>
			    <select class="form-select" id="rno" name="rno" required>
			        <option value="1">서울</option>
			        <option value="2">부산</option>
			        <option value="3">대구</option>
			        <option value="4">인천</option>
			        <option value="5">광주</option>
			        <option value="6">대전</option>
			        <option value="7">울산</option>
			        <option value="8">세종</option>
			        <option value="9">경기도</option>
			        <option value="10">강원도</option>
			        <option value="11">충청북도</option>
			        <option value="12">충청남도</option>
			        <option value="13">전라북도</option>
			        <option value="14">전라남도</option>
			        <option value="15">경상북도</option>
			        <option value="16">경상남도</option>
			        <option value="17">제주도</option>
			    </select>
			</div>
            <button type="submit" class="btn btn-primary">그룹 생성</button>
        </form>
    </div>
</main>
<footer><%@ include file="../footer.jsp" %></footer>    
    <!-- 부트스트랩 JS 및 Popper.js, jQuery CDN 링크 -->
    <script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-b0ExgGCWEJWiUfEz0M6eV8vpxOicE92RNDdNxnksqauF5R3Viv4tK2kElEPrzYD1" crossorigin="anonymous"></script>
</body>
</html>
