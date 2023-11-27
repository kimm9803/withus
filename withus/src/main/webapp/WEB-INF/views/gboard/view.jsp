<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>그룹 게시판</title>
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
	* {
		font-family: 'Sunflower', sans-serif;
	}
    
    main {
		width: 50%;
		margin: 150px auto;
		
	}

	.h {
		padding-bottom: 30px;
		border-bottom: 2px solid black;
	}
	
	.s-h {
		margin-top: 30px;
		margin-bottom: 30px;
	}
	
	.ss-h {
		border-bottom: 1px solid #ccc;
		padding-bottom: 20px;
	}
	
	.content {
		margin-top: 30px;
		padding-bottom: 20px;
		height: 400px;
		font-size: 18px;
	}
	
	.link-seq {
		display: flex;
		justify-content: space-between;
		border-bottom: 1px solid #ccc;
		padding-bottom: 30px;
	}
	
	.button-group {
		display: flex;
		justify-content: flex-end;
		margin-top: 30px;
		border-bottom: 1px solid #ccc;
		padding-bottom: 30px;
	}
	
	.a-seq {
		text-decoration: none;
        color: blue;
        font-weight: 600;
        font-size: 18px;
        cursor: pointer;
	}
	
	.btn {
		margin-left: 10px;
	}
	
	.answer-group {
		margin-top: 30px;
	}
	
	.answer-write {
		margin-top: 25px;
		display: flex;
		justify-content: flex-end;
	}
	
	.answer-field {
		padding-top: 30px;
		border-bottom: 1px solid #ccc;
		padding-bottom: 30px;
	}
	.answer-head {
		display: flex;
		justify-content: space-between;
		margin-bottom: 15px;
	}
	
	#commentList {
		padding: 0;
	}
	
	#commentList li {
		margin-top: 20px;
		padding-bottom: 20px;
		border-bottom: 1px solid #ccc;
	}
	
	#commentForm {
		margin-top: 30px;
	}
</style>

</head>
<body>

	<header><%@ include file="../header.jsp" %></header>

	<main>
		<div class="q-container">
			<div class="h">
				<h1>그룹 게시판</h1>
			</div>
			<div class="s-h">
				<h1>${groupBoardView.title}</h1>
			</div>
			<div class="ss-h">
				<span style="margin-right: 10px; font-weight: bold;">🖊 ${groupBoardView.name}</span>|<span style="margin-left: 10px">📃 ${groupBoardView.gbregdate}</span>|
				<span style="margin-left: 10px;">📚 ${groupBoardView.gbcatename}</span>
			</div>
			<div class="content">
				${groupBoardView.content}
			</div>
			
			<div class="button-group">
				<button type="button" class="btn btn-dark go-list">이전</button>
				<c:choose>
		            <c:when test="${isCreateBoard}">
		                <!-- 본인만 수정 삭제 버튼 확인  -->
		                <a class="btn btn-dark" href="/gboard/modifypage/${groupBoardView.gbno}/${groupBoardView.gno}">수정</a>
		                <a class="btn btn-danger" href="/gboard/delete/${groupBoardView.gbno}/${groupBoardView.gno}">삭제</a>
		            </c:when>
		            <c:otherwise>
		                <!-- 그 외의 경우에는 버튼을 숨김 -->
		            </c:otherwise>
		        </c:choose>
			</div>
			<ul id = "commentList">
			    <!-- 댓글 목록 받아서 동적 추가 -->
			</ul>
			
			<form id = "commentForm" enctype="multipart/form-data">
			    <input type="hidden" id="gbno" name = "gbno" value="${groupBoardView.gbno}">
			    <input type="hidden" id="gno" name ="gno" value="${groupBoardView.gno}">
			    <input type="hidden" id="memberid" name="memberid" value="${memberid}"><!-- 세션 등에서 사용자 아이드를 가져와야 한다. -->
			
			    
			    <textarea class="text" id = "content" name="content" cols="129" rows="10"></textarea>
			    <br>
			    
			    <input class="btn btn-dark" type="button" value="작성" style="float: right;" onclick="addComment()">
			
			</form>
			
		</div>
	</main>	

	<footer><%@ include file="../footer.jsp" %></footer>
<script>
    // 페이지 로딩 시에 댓글 목록을 불러와 화면에 표시
    $(document).ready(function () {
        loadComments();
        
        $('.go-list').on('click', function() {
        	history.back();
        })
    });

    function addComment(){
        // FormData 객체를 생성하여 폼 데이터를 가져옴
        var formData = new FormData($('#commentForm')[0]);

        // Ajax를 사용하여 댓글 추가
        $.ajax({
            type: 'POST',
            url: '/gboard/reply',
            data: formData,
            processData: false,  // 중요: jQuery가 데이터를 처리하지 않도록 함
            contentType: false,  // 중요: jQuery가 contentType을 설정하지 않도록 함
            success: function(){
                //댓글 추가 성공시 댓글 목록 갱신
                loadComments();
                $('#content').val('');
            },
            error: function(){
                alert('댓글 추가에 실패했습니다.');
            }
        });
    }
    function loadComments() {
        // 현재 게시글의 gbno, gno, memberid를 가져오기
        var gbno = $('#gbno').val();
        var gno = $('#gno').val();
        var memberid = $('#memberid').val();
       // var replyid =  $('#replyid').val();

        // Ajax를 사용하여 서버로부터 댓글 목록을 가져옴
        $.ajax({
            type: 'GET',
            url: '/gboard/comments',
            data: { gbno: gbno, gno: gno, memberid: memberid },
            dataType: 'json',
            success: function (comments) {
                // 댓글 목록을 받아온 후에 화면에 추가하는 작업 수행
                var commentList = $('#commentList');
                commentList.empty();

                for (var i = 0; i < comments.length; i++) {
                    let comment = comments[i];
                    let listItem = $('<li>').text(comment.name + ' : ' + comment.content + '\u00a0\u00a0\u00a0\u00a0\u00a0\u00a0\u00a0\u00a0\u00a0\u00a0\u00a0\u00a0\u00a0\u00a0\u00a0\u00a0\u00a0\u00a0\u00a0\u00a0\u00a0\u00a0\u00a0\u00a0\u00a0\u00a0\u00a0\u00a0\u00a0\u00a0\u00a0\u00a0\u00a0\u00a0\u00a0\u00a0\u00a0\u00a0\u00a0\u00a0\u00a0\u00a0\u00a0\u00a0\u00a0\u00a0\u00a0\u00a0\u00a0\u00a0\u00a0\u00a0\u00a0\u00a0\u00a0\u00a0\u00a0\u00a0\u00a0\u00a0\u00a0\u00a0\u00a0\u00a0\u00a0\u00a0\u00a0\u00a0\u00a0\u00a0\u00a0\u00a0\u00a0\u00a0\u00a0\u00a0\u00a0\u00a0\u00a0\u00a0\u00a0\u00a0\u00a0\u00a0\u00a0\u00a0\u00a0\u00a0\u00a0\u00a0\u00a0\u00a0\u00a0\u00a0\u00a0\u00a0\u00a0\u00a0\u00a0\u00a0\u00a0\u00a0\u00a0\u00a0\u00a0\u00a0\u00a0\u00a0\u00a0\u00a0\u00a0\u00a0\u00a0\u00a0\u00a0\u00a0\u00a0\u00a0\u00a0\u00a0\u00a0\u00a0\u00a0\u00a0\u00a0\u00a0\u00a0\u00a0\u00a0\u00a0\u00a0\u00a0\u00a0\u00a0' + comment.gbreplydate +'\n');

                    //수정 버튼 추가 및 클릭 이벤트 설정
                    var modifyButton = $('<button>').text('수정').addClass('btn btn-dark btn-sm').click(function(){
                        modifyComment(comment.replyid, comment.content);
                        console.log(comment.replyid);
                        console.log(comment.memberid);  // memberid 잘 나옴 확인
                    });
                    var deleteButton = $('<button>').text('삭제').addClass('btn btn-danger btn-sm').click(function(){
                        deleteComment(comment.replyid, comment.memberid);
                        console.log(comment.replyid);
                        console.log(comment.memberid);
                    });

                    //버튼 추가
                    listItem.append(modifyButton);  // 수정 버튼
                    listItem.append(deleteButton);  // 삭제 버튼
                    commentList.append(listItem);
                }
            },
            error: function () {
                alert('댓글 목록을 불러오는데 실패했습니다.');
            }
        });
    }

    //댓글 삭제
    function deleteComment(replyid, memberid){
        // 사용자에게 확인 창 표시
        var confirmation = window.confirm('댓글을 삭제하시겠습니까?')

        // 확인이면 삭제 요청 전송
        if(confirmation){
            $.ajax({
                type: 'POST',
                url: '/gboard/deleteComment',   // 적절한 서버 엔드포인트로 변경
                data: { replyid: replyid, memberid: memberid },
                success: function() {
                  // 삭제 성공시 댓글 목록 갱신
                  loadComments();
                },
                error: function(){
                    alert('댓글 삭제에 실패했습니다.')
                }
            })
        }
    }

    //수정 창 열기
    function modifyComment(replyid, content){
        // 새창 열기
        // 사용자에게 경고창 표시
        var confirmation = window.prompt('댓글 수정\n\n현재 댓글 내용:\n' + content, content);
        // 확인이면 수정 함수 호출
        if (confirmation) {
            modifyCommentInDialog(replyid, confirmation);
        }
    }

    //댓글 수정
    function modifyCommentInDialog(replyid, confirmation){

        // Ajax 사용하여 댓글 수정
        $.ajax({
            type: 'POST',
            url: '/gboard/commentModify',
            data: { replyid: replyid, content: confirmation},
            success: function(){
                //댓글 수정 성공시 부모 창에서 댓글 목록 갱신
                loadComments();
            },
            error: function(){
                alert('댓글 수정에 실패했습니다.');
            }
        });
        //새 창 닫기
        window.close()
    }

</script>

</body>
</html>