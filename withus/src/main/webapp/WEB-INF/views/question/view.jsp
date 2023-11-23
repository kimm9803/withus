<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>질문 상세</title>
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
</style>
</head>
<body>
	<header><%@ include file="../header.jsp" %></header>
	
	<main>
		<div class="q-container">
			<div class="h">
				<h1>Q&A</h1>
			</div>
			<div class="s-h">
				<h1>${question.title}</h1>
			</div>
			<div class="ss-h">
				<span style="margin-right: 10px">🖊 ${question.name}(${question.writer})</span>|<span style="margin-left: 10px">📃 ${question.regDate}</span>
			</div>
			<div class="content">
				${question.content}
			</div>
			<div class="link-seq">
				<div>
					<c:choose>
						<c:when test="${prevIsNull == 1}">
							<a class="a-seq" href="#">< &nbsp; 이전글</a>
						</c:when>
						<c:otherwise>
							<a class="a-seq" href="/question/view/${prevQuestion.qno - 1}">< &nbsp; 이전글</a>
						</c:otherwise>
					</c:choose>
					
					<div>
						<c:choose>
							<c:when test="${prevIsNull == 1}">
								이전 게시물이 없습니다.
							</c:when>
							<c:otherwise>
								<c:choose>
					              <c:when test="${fn:length(prevQuestion.title) > 20}">
					                  ${fn:substring(prevQuestion.title, 0, 20)}...
					              </c:when>
					              <c:otherwise>
					                  ${prevQuestion.title}
					              </c:otherwise>
					          </c:choose>
							</c:otherwise>
						</c:choose>
					</div>
				</div>
				<div>
					<a class="a-seq" href="#">다음글&nbsp; ></a>
					<div>
						<c:choose>
							<c:when test="${nextIsNull == 1}">
								다음 게시물이 없습니다.
							</c:when>
							<c:otherwise>
								<c:choose>
					              <c:when test="${fn:length(nextQuestion.title) > 20}">
					                  ${fn:substring(nextQuestion.title, 0, 20)}...
					              </c:when>
					              <c:otherwise>
					                  ${nextQuestion.title}
					              </c:otherwise>
					          </c:choose>
							</c:otherwise>
						</c:choose>
					</div>
				</div>
			</div>
			<div class="button-group">
				<button type="button" class="btn btn-dark go-list">목록</button>
				<c:choose>
					<c:when test="${isWriter ==  true}">
						<button type="button" class="btn btn-dark modify">수정</button>
						<button type="button" class="btn btn-danger delete">삭제</button>
					</c:when>
				</c:choose>
			</div>
		</div>
	</main>
	
	<footer><%@ include file="../footer.jsp" %></footer>
	
	<script>
		$(document).ready(function() {
			$('.go-list').on('click', function() {
				location.href = '/question/list';
			})
			
			$('.modify').on('click', function() {
				location.href = '/user/question/modify/${question.qno}';
			})
			
			$('.delete').on('click', function() {
				const qno = ${question.qno};
				const writer = '${question.writer}';
				
				const confirmDelete = confirm('정말로 삭제하시겠습니까?');
				
				if (confirmDelete) {
					$.ajax({
						url: '/user/question/delete',
						type: 'POST',
						data: {
							qno: qno,
							writer: writer
						},
						success: function(success) {
							alert('삭제되었습니다');
							location.href='/question/list';
						},
						error: function() {
							alert('에러 발생');
						}
					});
				}
			})
		})
	</script>
</body>
</html>