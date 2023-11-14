<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>그룹 상세보기</title>
    <!-- Bootstrap 5 CSS 링크 추가 -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-4bw+/aepP/YC94hEpVNVgiZdgIC5+VKNBQNGCHeKRQN+PtmoHDEXuppvnDJzQIu9" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js"></script>
    <!-- jQuery 추가 -->
    <script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
    <style>
/* 컨텐츠를 중앙에 정렬 */
.content {
	max-width: 60%;
	margin: 0 auto;
}

/* 이미지 스타일 */
#groupImage {
	height: 200px;
	width: 100%;
	border: 1px solid black;
}

/* 버튼 간격 조절 */
.btn-group {
	margin-top: 10px;
}

#image {
	width: 100%
}

.btn.dropdown-toggle::after {
	content: none;
}

.btn.dropdown-toggle {
	background-color: transparent;
	color: black;
}

.btn.dropdown-toggle:hover {
	border: 1px solid #ccc;
}

.dropdown-menu {
	background-color: #fff;
	border: 1px solid #ccc;
}

.dropdown-item {
	color: #000;
}

.dropdown-item:hover {
	background-color: #f8f9fa;
	color: #000; 
}
</style>
</head>
<body>
    <div class="container mt-5">
        <div class="content">
            <h1>${group.gname }</h1>
            <div id="image">
                <c:if test="${empty group.newImageName}">
                    <!-- image.newImageName이 null이나 비어 있을 때 -->
                    <img id="groupImage" src="/img/basic.jpg" class="img-fluid rounded" alt="Group Image">
                    <form method="post" action="/upload/${group.gno}" enctype="multipart/form-data">
                        <input type="hidden" name="gno" value="${group.gno}">
                        <!-- 투명한 파일 입력 필드와 가짜 버튼 -->
						<input type="file" id="fileInput" name="image"style="opacity: 0; position: absolute; width: 1px; height: 1px;">				
						<input type="submit" class="btn btn-primary mt-2" value="이미지 등록" />
                    </form>
                </c:if>
                <c:if test="${not empty group.newImageName}">
                    <!-- image.newImageName이 값이 있을 때 -->
                    <img id="groupImage" src="/${group.newImageName}" class="img-fluid rounded" alt="Group Image">
                    <form method="post" action="/modify/${group.gno}" enctype="multipart/form-data">
                        <input type="file" id="fileInput" name="image"style="opacity: 0; position: absolute; width: 1px; height: 1px;">
                        <input type="hidden" name="gno" value="${group.gno}">
                        <input type="submit" class="btn btn-primary mt-2" value="이미지 수정" />
                        <button type="button" class="btn btn-danger mt-2" id="imagedelete">이미지 삭제</button>
                    </form>
                </c:if>
            </div>
            <div class="card mt-3">
                <div class="card-body">
                    <h2 class="card-title">${group.gname}</h2>
                    <p class="card-text">그룹장:
	                    <div class="dropdown">
						  <a class="btn btn-secondary btn-sm dropdown-toggle" href="#" role="button" id="dropdownMenuLink" data-bs-toggle="dropdown" aria-expanded="false">
						     ${group.name}
						  </a>
						
						  <ul class="dropdown-menu" aria-labelledby="dropdownMenuLink">
						    <li><a class="dropdown-item" href="#">회원정보</a></li>
						    <li><a class="dropdown-item" href="/user/message?memberId=${group.memberid}">쪽지 보내기</a></li>
						    <li><a class="dropdown-item" href="#">신고하기</a></li>
						  </ul>
						</div>                    
                    </p>
                    <p class="card-text">추천: ${group.glike}</p>
                    <p class="card-text">그룹소개: ${group.gintro}</p>
                    <p class="card-text">생성일: ${group.gdate}</p>
                    <p class="card-text">정원: ${memberCnt}/${group.gperson}</p>
                </div>
            </div>
            <div class="btn-group">
                <button type="button" class="btn btn-danger" id="deleteBtn">그룹 삭제</button>
            </div>
            <div class="btn-group">
                <button type="button" class="btn btn-warning" onclick="location.href='/groups/list'">목록으로</button>
            </div>
            <!-- 정원이 남아있고 그룹원이 아니면 -->
            <c:if test="${memberCnt lt group.gperson && findById eq 0 && not empty memberid}">
            <div class="btn-group">
                <button type="button" class="btn btn-dark" id="joinButton">그룹 가입</button>
            </div>        
			</c:if>
            <c:if test="${findById eq 1}">
            <div class="btn-group">
                <button type="button" class="btn btn-dark" id="leaveButton">그룹 탈퇴</button>
            </div>        
			</c:if>
			
			<c:if test="${memberid eq group.memberid}">

            <div class="btn-group">
                <button type="button" class="btn btn-light" onclick="location.href='/groups/joinlist/${group.gno}'">가입신청 목록</button>                
            </div>
            <div class="btn-group">
                <button type="button" class="btn btn-light" onclick="location.href='/groups/memberlist/${group.gno}'">그룹원 목록</button>                
            </div>
			</c:if>	            
        </div>
    </div>
    <!-- 부트스트랩 5 JS 및 Popper.js 추가 -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-hZf+5sIo/1GTbMkEl9QAeRU3sJQl1LbSH+6l5f+4F1gPK6ES4kDl9Nvl7TZyH2Sm" crossorigin="anonymous"></script>
<script>
    document.getElementById('groupImage').addEventListener('click', function() {
        document.getElementById('fileInput').click();
    });

    // 파일이 변경되었을 때 실행되는 함수
    $('#fileInput').change(function() {
        var fileInput = document.getElementById('fileInput');
        var filePath = fileInput.value;

        // 파일 확장자 확인
        var allowedExtensions = /(\.jpg|\.jpeg|\.png)$/i;
        if (!allowedExtensions.exec(filePath)) {
            alert('이미지 파일만 업로드 가능합니다.');
            fileInput.value = ''; // 파일 선택 취소
            return false;
        }

        // 선택한 파일을 읽기
        var reader = new FileReader();
        reader.onload = function(e) {
            // 이미지를 미리 보여주기
            $('#groupImage').attr('src', e.target.result);
        };
        reader.readAsDataURL(fileInput.files[0]);
    });

    $(document).ready(function() {
        // 그룹 삭제 버튼 클릭 이벤트
        $('#deleteBtn').click(function() {
            // 확인 다이얼로그를 띄우고 사용자가 확인하면 삭제 요청 전송
            if (confirm('정말로 삭제하시겠습니까?')) {
                $.ajax({
                    type: 'GET',
                    url: '/groups/delete/${group.gno}', // 실제 삭제 요청을 처리할 서버의 URL
                    success: function(response) {
                        // 성공 시 동작
                        alert("삭제 성공");
                        location.href = "/groups/list";
                    },
                    error: function(error) {
                        // 실패 시 동작
                        console.error('삭제 실패', error);
                    }
                });
            }
        });

        // 이미지 삭제 버튼 클릭 이벤트
		      $('#imagedelete').click(function() {
		    // 확인 다이얼로그를 띄우고 사용자가 확인하면 삭제 요청 전송
		    if (confirm('정말로 삭제하시겠습니까?')) {
		        $.ajax({
		            type: 'GET',
		            url: '/image/delete/${group.gno}', // 실제 삭제 요청을 처리할 서버의 URL
		            success: function(response) {
		                // 성공 시 동작
		                alert("삭제 성공");
		                location.reload();
		            },
		            error: function(error) {
		                // 실패 시 동작
		                console.error('삭제 실패', error);
		            }
		        });
		    }
		});
		        // 가입신청
        $("#joinButton").click(function () {
            if (confirm('정말로 가입하시겠습니까?')) {
                $.ajax({
                    type: "GET",
                    url: "/groups/join",
                    data: {
                        gno: '${group.gno}' // 백틱이 아닌 따옴표 사용
                    },
                    success: function (response) {
                        alert("가입 신청이 완료되었습니다.");
                    },
                    error: function (error) {
                        alert("가입 신청 중 오류가 발생했습니다.");
                    }
                });
            }
        });

        $("#leaveButton").click(function () {
            if (confirm('정말로 탈퇴하시겠습니까?')) {
                $.ajax({
                    type: "GET",
                    url: "/groups/leave",
                    data: {
                        memberid: '${memberid}', // 백틱이 아닌 따옴표 사용
                        gno: '${group.gno}' // 백틱이 아닌 따옴표 사용
                    },
                    success: function (response) {
                        alert("탈퇴가 완료되었습니다.");
                    },
                    error: function (error) {
                        alert("탈퇴가 실패했습니다.");
                    }
                });
            }
        });
    });
</script>
</body>
</html>
