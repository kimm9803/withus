<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: Mjjeon
  Date: 2023-11-16
  Time: 오전 10:10
  To change this template use File | Settings | File Templates.
--%>

<html>
<head>
    <title>Group Board Detail</title>
    <script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>

    <style>
        
    </style>

</head>
<body>



<!-- test 디자인 -->

<header><%@ include file="../header.jsp" %></header>

<div class="container mt-4" style="margin-top: 100px;">
    <div class="post-card">
        <h2 class="post-title">${groupBoardView.title}</h2>
        <p class="post-details">
            <small>
                작성자 : ${groupBoardView.name} |
                쟉성일 : ${groupBoardView.gbregdate} |
                카테고리 : ${groupBoardView.gbcatename}
            </small>
        </p>
    </div>

    <div class="separator"></div>

    <div class="post-card">

        <p class="post-details">${groupBoardView.content}</p>

        <!-- 수정 버튼 추가 -->
        <c:choose>
            <c:when test="${isCreateBoard}">
                <!-- 본인만 수정 삭제 버튼 확인  -->
                <a href="/gboard/modifypage/${groupBoardView.gbno}/${groupBoardView.gno}">수정</a>
                <a href="/gboard/delete/${groupBoardView.gbno}/${groupBoardView.gno}">삭제</a>
            </c:when>
            <c:otherwise>
                <!-- 그 외의 경우에는 버튼을 숨김 -->
            </c:otherwise>
        </c:choose>

    </div>

<!-- 정보 -->




<!-- 댓글 조회 -->

<ul id = "commentList">
    <!-- 댓글 목록 받아서 동적 추가 -->
</ul>

<!-- Ajax 댓글 조회 스크립트 추가-->

<h3>댓글 입력</h3>
<form id = "commentForm" enctype="multipart/form-data">

    <input type="hidden" id="gbno" name = "gbno" value="${groupBoardView.gbno}">
    <input type="hidden" id="gno" name ="gno" value="${groupBoardView.gno}">
    <input type="hidden" id="memberid" name="memberid" value="${memberid}"><!-- 세션 등에서 사용자 아이드를 가져와야 한다. -->

    <label for="content">Comment:</label>
    <textarea id = "content" name="content" rows="4" cols="50"></textarea>
    <br>
    <input type="button" value="Submit" onclick="addComment()">

</form>

</div>
<script>
    // 페이지 로딩 시에 댓글 목록을 불러와 화면에 표시
    $(document).ready(function () {
        loadComments();
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
                    let listItem = $('<li>').text(comment.name + ' : ' + comment.content + '\u00a0\u00a0\u00a0\u00a0\u00a0\u00a0\u00a0\u00a0\u00a0\u00a0\u00a0\u00a0\u00a0\u00a0\u00a0\u00a0\u00a0\u00a0\u00a0\u00a0\u00a0\u00a0\u00a0\u00a0\u00a0\u00a0\u00a0\u00a0\u00a0\u00a0\u00a0\u00a0\u00a0\u00a0\u00a0\u00a0\u00a0\u00a0\u00a0\u00a0\u00a0\u00a0\u00a0\u00a0\u00a0\u00a0\u00a0\u00a0\u00a0\u00a0\u00a0\u00a0\u00a0\u00a0\u00a0\u00a0\u00a0\u00a0\u00a0' + comment.gbreplydate +'\n');

                    //수정 버튼 추가 및 클릭 이벤트 설정
                    var modifyButton = $('<button>').text('수정').click(function(){
                        modifyComment(comment.replyid, comment.content);
                        console.log(comment.replyid);
                        console.log(comment.memberid);  // memberid 잘 나옴 확인
                    });
                    var deleteButton = $('<button>').text('삭제').click(function(){
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
<!-- 좋아요  -->
<!-- 댓글추가  -->



<footer><%@ include file="../footer.jsp" %></footer>
</body>
</html>