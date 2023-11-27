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
				<span style="margin-right: 10px; font-weight: bold;">🖊 ${question.name}(${question.writer})</span>|<span style="margin-left: 10px">📃 ${question.regDate}</span>
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
							<a class="a-seq" href="/question/view/${prevQuestion.qno}">< &nbsp; 이전글</a>
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
					<c:choose>
						<c:when test="${nextIsNull == 1}">
							<a class="a-seq" href="#">다음글&nbsp; ></a>
						</c:when>
						<c:otherwise>
							<a class="a-seq" href="/question/view/${nextQuestion.qno}">다음글&nbsp; ></a>
						</c:otherwise>
					</c:choose>
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
			<c:forEach items="${answer}" var="answer">
				<div class="answer-field" data-ano="${answer.ano}">
					<div class="answer-head">
						<div>
							<span style="font-weight: bold;">🖊 관리자</span> &nbsp;| &nbsp;📃 ${answer.regDate}
						</div>
						<c:if test="${role == 'ROLE_ADMIN'}">
							<div class="replace-modify">
								<a class="modify-link" href="#" data-ano="${answer.ano}">수정</a> &nbsp;|&nbsp; <a href="/admin/answer/delete/${answer.ano}/${question.qno}">삭제</a>
							</div>
						</c:if>
					</div>
					<div class="answer-content">${answer.content}</div>
				</div>
			</c:forEach>
			<c:choose>
				<c:when test="${role == 'ROLE_ADMIN'}">
					<div class="answer-group">
						<textarea class="text" cols="129" rows="10"></textarea>	
					</div>
					<div class="answer-write">
						<button type="button" class="btn btn-dark answer-btn">작성</button>
					</div>
				</c:when>
				<c:otherwise>
					<div class="answer-group">
						<textarea cols="129" rows="10" placeholder="   관리자만 작성할 수 있습니다." disabled></textarea>	
					</div>
					<div class="answer-write">
						<button type="button" class="btn btn-dark">작성</button>
					</div>
				</c:otherwise>
			</c:choose>
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
			});
			
			$('.answer-btn').on('click', function() {
				var content = $('.text').val();
				var qno = ${question.qno};
				
				$.ajax({
					url: '/admin/answer/write',
					type: 'POST',
					data: {
						content: content,
						qno: qno
					},
					success: function(success) {
						location.href = '/question/view/' + qno;
					},
					error: function() {
						alert('에러 발생');
					}
				})
			});
			
			$(document).on('click', '.modify-link', function() {
			    var currentContent = $(this).closest('.answer-field').find('.answer-content').text();
			    var textareaElement = '<textarea class="text" cols="129" rows="10">' + currentContent + '</textarea>';
			    var saveButton = '<div class="replace-modify"><a class="modify-btn" href="#">확인</a> &nbsp;|&nbsp; <a class="cancel" href="#">취소</a></div>';

			    // answer.ano 값을 가져오기 위해 변수에 저장
			    var ano = $(this).closest('.answer-field').find('.modify-link').data('ano');

			    // 현재 내용을 textarea로 교체
			    $(this).closest('.answer-field').find('.answer-content').replaceWith(textareaElement);
			    $(this).closest('.answer-field').find('.replace-modify').replaceWith(saveButton);

			    // 수정 버튼을 클릭한 해당 answer.ano 값을 변수에 저장하여 사용
			    $(this).closest('.answer-field').data('ano', ano);
			});

		    // 수정 버튼 클릭 시 AJAX 요청
		    $(document).on('click', '.modify-btn', function() {
		        var content = $(this).closest('.answer-field').find('.text').val();
		        var ano = $(this).closest('.answer-field').data('ano');


		        $.ajax({
		            url: '/admin/answer/modify',
		            type: 'POST',
		            data: {
		                content: content,
		                ano: ano
		            },
		            success: function(success) {
		                location.href = '/question/view/' + ${question.qno};
		            },
		            error: function() {
		                alert('에러 발생');
		            }
		        });
		    });
		    
		    // 취소 버튼
		    $('.cancel').on('click', function() {
	            location.href = '/question/view/' + ${question.qno};
		    });
		})
	</script>
</body>
</html>