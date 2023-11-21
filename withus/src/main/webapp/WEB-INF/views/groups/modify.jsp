<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>그룹 수정</title>
    <!-- 부트스트랩 CDN 링크 -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-4bw+/aepP/YC94hEpVNVgiZdgIC5+VKNBQNGCHeKRQN+PtmoHDEXuppvnDJzQIu9" crossorigin="anonymous">
</head>
<body>
    <div class="container mt-5">
        <h2>그룹 수정</h2>
        <!-- 그룹 생성 폼 -->
        <form action="/groups/modify/${group.gno}" method="post">
        <input type="hidden" name="gno" value="${group.gno}">
            <div class="mb-3">
                <label for="groupName" class="form-label">그룹명</label>
                <input type="text" class="form-control" id="groupName" name="gname" value="${group.gname}"required autocomplete="off">
            </div>
            <div class="mb-3">
                <label for="groupLeader" class="form-label">그룹장</label>
                <input type="text" class="form-control" id="groupLeader"  value="${group.name}"readonly>
            </div>
            <div class="mb-3">
                <label for="groupIntro" class="form-label">그룹 소개</label>
                <textarea class="form-control" id="groupIntro" name="gintro" rows="4" required>${group.gintro}</textarea>
            </div>
            <div class="mb-3">
                <label for="groupPerson" class="form-label">정원</label>
                <input type="number" class="form-control" id="groupPerson" name="gperson" value="${group.gperson}"  min="${group.memberCnt}" max="99"required>
            </div>         
            <button type="submit" class="btn btn-dark">그룹 수정</button>
            <button type="button" class="btn btn-dark" onclick="goBack()">취소</button>
        </form>
    </div>
    <!-- 부트스트랩 JS 및 Popper.js, jQuery CDN 링크 -->
    <script type="text/javascript">
	    function goBack() {
	        window.history.back();
	    }
    </script>
    <script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-b0ExgGCWEJWiUfEz0M6eV8vpxOicE92RNDdNxnksqauF5R3Viv4tK2kElEPrzYD1" crossorigin="anonymous"></script>
</body>
</html>
