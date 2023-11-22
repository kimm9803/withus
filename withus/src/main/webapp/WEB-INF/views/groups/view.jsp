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
    <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Sunflower:wght@300&display=swap">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js"></script>
    <!-- jQuery 추가 -->
    <script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
    <style>

* {
	font-family: 'Sunflower', sans-serif;
}
/* 컨텐츠를 중앙에 정렬 */
.content {
	max-width: 60%;
	margin: 0 auto;
}

        /* 이미지 스타일 */
        #groupImage {
            height: 400px;
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
		
		.group-info {
			margin-bottom: 20px; /* 그룹장 정보와 그룹 정보 사이 간격 조절 */
		}
		
		.group-details, .group-intro {
			margin-top: 20px; /* 그룹 정보와 그룹 소개 사이 간격 조절 */
			border: 1px solid #ccc; /* 테두리 추가 */
			padding: 15px; /* 안쪽 여백 추가 */
		}
		main{
			margin-top: 150px;
			margin-bottom: 100px;
		}
		.group-intro{
			white-space: pre-line;
		}
		
		#modifyBtn {
        background-color: olive;       
        border: none;
        
	    }
	
	    #modifyBtn:hover {
	        background-color: darkgreen;
	        color: white;
	    }

</style>
</head>
<body>
<header><%@ include file="../header.jsp" %></header>
<main>
    <div class="container mt-5">
        <div class="content">
            <h1>${group.gname }</h1>           
            <div id="image">
                <c:if test="${empty group.newImageName}">
                    <!-- image.newImageName이 null이나 비어 있을 때 -->
                    <img id="groupImage" src="/img/basic.jpg" class="img-fluid rounded" alt="Group Image">
                    <c:if test="${group.memberid eq memberid}">
                    <form method="post" action="/upload/${group.gno}" enctype="multipart/form-data">
                        <input type="hidden" name="gno" value="${group.gno}">
                        <!-- 투명한 파일 입력 필드와 가짜 버튼 -->
						<input type="file" id="fileInput" name="image"style="opacity: 0; position: absolute; width: 1px; height: 1px;">
						<input type="submit" class="btn btn-primary mt-2" value="이미지 등록" />
                    </form>
                    </c:if>
                </c:if>
                <c:if test="${not empty group.newImageName}">
                    <!-- image.newImageName이 값이 있을 때 -->
                    <img id="groupImage" src="/${group.newImageName}" class="img-fluid rounded" alt="Group Image">
                    <form method="post" action="/modify/${group.gno}" enctype="multipart/form-data">
                        <input type="file" id="fileInput" name="image"style="opacity: 0; position: absolute; width: 1px; height: 1px;">
                        <input type="hidden" name="gno" value="${group.gno}">
                        <c:if test="${group.memberid eq memberid}">
                        <input type="submit" class="btn btn-primary mt-2" value="이미지 수정" />
                        <button type="button" class="btn btn-danger mt-2" id="imagedelete">이미지 삭제</button>
                        </c:if>
                    </form>
                </c:if>
            </div>
           <div class="card mt-3" >
   			 <div class="card-body">
					<div class="d-flex justify-content-between align-items-center" style="margin-bottom: 20px;">
					    <!-- 그룹 이름 -->
					    <h2 class="card-title">${group.gname}</h2>
					
					    <!-- 정원이 남아있고 그룹원이 아니면 -->
					    <c:if test="${memberCnt lt group.gperson && findById eq 0 && not empty memberid && group.memberid ne memberid}">
					        <div class="btn-group">
					            <button type="button" class="btn btn-dark" id="joinButton">그룹 가입</button>
					        </div>
					    </c:if>
					</div>
		        <!-- 그룹 신고 -->
		           <div id="report">
					    <a href="#" id="reportLink">
					        <img id="groupreport" src="/img/report.png" style="width: 30px; height: 30px; float: right;">					        
					    </a>
					</div>	
				<!-- 그룹 추천 -->				
		            <div id="like">			               			    
					    <img id="grouplike" src="/img/like.png" style="width: 25px; height: 25px; float: right; margin-right: 20px;" >					    				    
					</div>		

		        <!-- 그룹장 정보 -->
		        <div class="group-info">
				    <div class="card-text">그룹장:
				        <div class="dropdown d-inline">
				            <a class="btn btn-secondary btn-sm dropdown-toggle" href="#" role="button" id="dropdownMenuLink" data-bs-toggle="dropdown" aria-expanded="false">
				                ${group.name}
				            </a>
				            <ul class="dropdown-menu" aria-labelledby="dropdownMenuLink">
				                <li><a class="dropdown-item" href="#">회원정보</a></li>
				                <li><a class="dropdown-item" href="/user/message?memberId=${group.memberid}">쪽지 보내기</a></li>
				                <li><a class="dropdown-item" href="#" id="userReport">신고하기</a></li>
				            </ul>
				        </div>
				    </div>
				</div>
		        <!-- 그룹 정보 (추천, 생성일, 정원) -->
		        <div class="group-details">
		            <p class="card-text">추천: ${group.glike}</p>
		            <p class="card-text">생성일: ${group.gdate}</p>
		            <p class="card-text">정원: ${memberCnt}/${group.gperson}</p>
		        </div>

		        <!-- 그룹 소개 -->
		        <div class="group-intro">
		            <p class="card-text">그룹소개: ${group.gintro}</p>
		        </div>
                 <!-- 추가 그룹 게시판  -->
                 <div class="group-board">
                     <hr>
                     <h4>게시판</h4>
                     <hr>
                     <c:forEach var="board" items="${groupBoardList}"  varStatus="loopStatus">
                         <c:if test="${loopStatus.index < 2}">
                             <p>${board.gbcatename}</p>
                             <p>${board.name}</p>
                             <p>${board.gbregdate}</p>
                             <p><a href="/gboard/view?gbno=${board.gbno}"><b>${board.title}</b></a></p>
                             <p>${board.content}</p>
                            <hr>
                         </c:if>
                     </c:forEach>
                     <button class="group-board-button"><a href="/gboard/list/${gno}">더보기</a></button>
                     <hr>
                 </div>
		    </div>
		</div>
            <div class="btn-group">
                <button type="button" class="btn btn-warning" onclick="location.href='/groups/loadall'">목록으로</button>
            </div>
            <div class="btn-group">
                <button type="button" class="btn btn-warning" onclick="location.href='/'">홈으로</button>
            </div>

        <c:if test="${findById eq 1}">
            <div class="btn-group">
                <button type="button" class="btn btn-dark" id="leaveButton">그룹 탈퇴</button>

            </div>
			</c:if>

			<c:if test="${memberid eq group.memberid}">
            <div class="btn-group">
                <button type="button" class="btn btn-dark"id="modifyBtn" onclick="location.href='/groups/modify/${group.gno}'">그룹 수정</button>
            </div>
            
            <div class="btn-group">
                <button type="button" class="btn btn-danger" id="deleteBtn">그룹 삭제</button>
            </div>           

            <div class="btn-group">
                <button type="button" class="btn btn-light" onclick="location.href='/groups/joinlist/${group.gno}'">가입신청 목록</button>
            </div>
            <div class="btn-group">
                <button type="button" class="btn btn-light" onclick="location.href='/groups/memberlist/${group.gno}'">그룹원 목록</button>
            </div>
        </c:if>
        <a href="/gboard/create/${group.gno}">gboard작성</a>
    </div>
</div>
</main>
<footer><%@ include file="../footer.jsp" %></footer>


<!-- 부트스트랩 5 JS 및 Popper.js 추가 -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-hZf+5sIo/1GTbMkEl9QAeRU3sJQl1LbSH+6l5f+4F1gPK6ES4kDl9Nvl7TZyH2Sm" crossorigin="anonymous"></script>
<script>
		//JavaScript에서 JSP 표현식 사용
		var isMember = ${group.memberid eq memberid}
		
		// 조건 확인
		if (isMember) {
		    document.getElementById('groupImage').addEventListener('click', function() {
		        document.getElementById('fileInput').click();
		    });
		}

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

        //그룹원 탈퇴
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
         //신고 버튼
        $('#reportLink').click(function(e) {
            e.preventDefault(); // 기본 동작 방지
            var reportUrl = '/groups/reportform/'+${group.gno}; // 여기에 신고 URL을 지정하십시오.

            // 새 창 열기
            var reportWindow = window.open(reportUrl, '_blank', 'width=500, height=700, resizable=yes, scrollbars=yes');

            // 새 창에서 신고 URL 열도록 설정
            if (reportWindow) {
                reportWindow.location.href = reportUrl;
            } else {
                alert('팝업 창이 차단되었습니다. 팝업 창을 허용해주세요.');
            }
        }); 
        
        //회원 신고 버튼
        $('#userReport').click(function(e) {
        	var memberid = '${group.memberid}';
        	console.log(memberid);
            e.preventDefault(); // 기본 동작 방지
            var reportUrl = '/user/reportform?memberid='+memberid; // 여기에 신고 URL을 지정하십시오.

            // 새 창 열기
            var reportWindow = window.open(reportUrl, '_blank', 'width=500, height=700, resizable=yes, scrollbars=yes');

            // 새 창에서 신고 URL 열도록 설정
            if (reportWindow) {
                reportWindow.location.href = reportUrl;
            } else {
                alert('팝업 창이 차단되었습니다. 팝업 창을 허용해주세요.');
            }
        });    

    });
    $(document).ready(function() {
        // 그룹 추천 이미지 클릭 이벤트
       var memberid = "${memberid}"; // 변수를 문자열로 초기화
        $('#grouplike').click(function() {
            // memberid가 null이 아닌 경우에만 likeAction 함수 호출
            if (memberid.trim() !== "") { // 빈 문자열이 아닌 경우에만 likeAction 함수 호출
                likeAction();
            } else {
                alert('로그인이 필요합니다.'); // 로그인이 필요한 경우 알림 표시
            }
        });

        // 그룹 추천 액션을 처리하는 함수
        function likeAction() {
            // 확인 다이얼로그를 띄우고 사용자가 확인하면 추천 요청 전송
            if (confirm('정말로 추천하시겠습니까?')) {
            	var groupGno = parseInt("${group.gno}", 10);
                $.ajax({
                    type: 'GET',
                    url: '/groups/like/' + groupGno, // 서버에서 올바른 값으로 대체되는지 확인
                    data : {
                    	memberid : memberid
                    },
                    success: function(response) {                    	
                        if (response === 'like') {
                            alert('추천이 완료되었습니다.');
                        } else if (response === 'unlike') {
                            alert('추천이 취소되었습니다');
                        }
                    },
                    error: function(error) {
                        // 오류를 처리하거나 오류 메시지를 표시합니다
                        console.error('추천 실패', error);
                    }
                });
            }
        }
    });


</script>

</body>
</html>