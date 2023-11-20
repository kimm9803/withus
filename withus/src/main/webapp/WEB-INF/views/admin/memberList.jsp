<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>회원 목록</title>
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
		margin-top: 140px;
	}
	
	body {
	   padding: 0;
	   margin: 0;
	}
	
	div {
	   box-sizing: border-box;
	}
	
	/* alert badge */
	.circle {
	   display: inline-block;
	   width: 5px;
	   height: 5px;
	   border-radius: 2.5px;
	   background-color: #ff0000;
	   position: absolute;
	   top: -5px;
	   left: 110%;
	}
	
	/* 녹색 텍스트 */
	.green {
	   color: #24855b;
	}
	
	.red {
	   color: #DC3545;
	}
	
	.wrap {
	   margin-top: 60px;
	   margin-bottom: 60px;
	   background-color: #F8F8F8;
	   border: 1px solid #ccc;
	}
	/* 어두운 회색 배경 */
	.grayContainer {
	   height: 70px;
	   /*background-color: #373B46;*/
	   background-color: seagreen;
	   display: flex;
	   align-items: flex-end;
	   padding: 16px;
	   justify-content: center;
	}
	
	.grayContainer .name {
	   font-size: 20px;
	   font-weight: bold;
	   color: #ffffff;
	}
	
	.grayContainer .modify {
	   margin-left: auto;
	}
	
	
	
	/*=================== 좌측 부분 스타일 ==================*/
	.listContainer {
	   padding: 0;
	   background-color: #ffffff;
	   margin-bottom: 10px;
	}
	
	.listContainer .item {
	   display: flex;
	   align-items: center;
	   justify-content: center;
	   color: black;
	   text-decoration: none;
	   height: 56px;
	   box-sizing: border-box;
	   transition: background-color 0.3s, color 0.3s;
	}
	.listContainer .item:hover {
		background-color: lightgray;
		color: white;
	}
	
	.listContainer .icon {
	   margin-right: 14px;
	}
	
	.listContainer .text {
	   font-size: 16px;
	   position: relative;
	}
	
	.listContainer .right {
	   margin-left: auto;
	}
	
	/*=================== 내지갑의 보유 적립금 들어가는 부분 ================*/
	.listContainer .smallLight {
	   font-size: 14px;
	   color: #c2c2c2;
	}
	
	.listContainer .smallLight>span {
	   margin-left: 10px;
	}
	
	.listContainer .right .blct {
	   font-size: 14px;
	   font-weight: bold;
	   margin-right: 5px;
	}
	
	
	.rightArea {
	   margin-left: 40px;
	   margin-top: 60px;
	}

	
	/* listGroupTitle에 스타일 추가 */
	.listGroupTitle {
	  background-color: #ffffff; /* 배경색 설정 */
	  color: seagreen; /* 텍스트 색상 설정 */
	  padding: 12px; /* 내부 여백 설정 */
	  font-weight: bold; /* 폰트 굵기 설정 */
	  font-size: 20px;
	  text-align: center;
	  border-bottom: 1px solid gray;
	  border-top: 1px solid gray;
	}
	.pagination {
	    text-align: center;
	    margin-top: 20px;
	}
	
	.p-ul {
	    padding: 0;
	    list-style: none;
	    display: inline-block;
	}
	
	.p-li {
	    display: inline-block;
	    margin: 0 2px;
	}
	
	.p-a {
	    text-decoration: none;
	    padding: 5px 10px;
	    border: 1px solid #ccc;
	    color: #333;
	    border-radius: 5px;
	}
	
	.p-a:hover {
	    background-color: #f0f0f0;
	}

</style>
</head>
<body>
	<header><%@ include file="../header.jsp" %></header>
	<main style="display: flex; width: 75%; margin: 0 auto; margin-top: 100px;">
		
		
	      <div class="wrap" style="flex: 1;">
	         <div class="grayContainer" style="display: flex; justify-content: center; align-items: center;">
	             <div>
	                 <div class="name" style="text-align: center;">관리자 페이지</div>
	             </div>
	         </div>     
	         
	         <div class="listContainer">
			  <div class="listGroup">
			    <div class="listGroupTitle">회원</div>
			    <a href="/admin/user/list" class="item">		      
			      <div class="text">회원 전체 목록</div>		      
			    </a>
			    <!-- 
			    <a href="#" class="item">		      
			      <div class="text">상품후기</div>		      
			    </a>
			     -->
			    <a href="/admin/user/report-list" class="item">		      
			      <div class="text">회원 신고 내역</div>		      
			    </a>
			    
			  </div>		  
			  <div class="listGroup">
			    <div class="listGroupTitle">그룹</div>
			    <a href="/admin/group/list" class="item">		      
			      <div class="text">그룹 전체 목록</div>		      
			    </a>
			    <a href="/admin/group/reportlist" class="item">		      
			      <div class="text">그룹 신고 내역</div>		      
			    </a>
			  </div>
			  
			  <!-- Q & A 조회 추가 일단 num 안받고 리스트만 받기-->
					<div class="listGroup">
						<div class="listGroupTitle">Q&A</div>
						<a href="/question/adminListPageSearch?num=1" class="item">
							<div class="text">Q&A 조회</div>
						</a>
					</div>
			  		  
			  <div class="listGroup">
			    <div class="listGroupTitle">공지사항</div>
			    <a href="/notice/writeform" class="item">		      
			      <div class="text">공지사항 등록</div>		      
			    </a>
			    <a href="/notice/list" class="item">		      
			      <div class="text">공지사항 목록</div>		      
			    </a>
			  </div>
			</div>         
	      </div>
	
	      <!-- 오른쪽 콘텐츠 영역 -->
	      <div class="rightArea" style="flex: 4;">
	         <div class="grayContainer">
	            <div class="name" style="display: flex; justify-content: space-between;">
	               <div class="left" style="display: flex; align-items: center;">                  
	                  <div style="font-weight: normal; margin-left: 0 auto; text-align: center; font-size: 25px;">어서오세요!! With Us 관리자님</div>
	               </div>               
	            </div>
	         </div>
	         <div style="margin-top: 40px; text-align: center;"><h2 style="font-weight: bold;">회원 목록</h2></div>
	         <div style="margin-top: 40px;">
	         	<table class="table table-hover">
				<thead>
					<tr style="text-align: center;">
						<th scope="col">#</th>
						<th scope="col">아이디</th>
						<th scope="col">이름</th>
						<th scope="col">가입날짜</th>
						<th scope="col">선택</th>
					</tr>
				</thead>
				<tbody>
				<c:forEach items="${memberList}" var="member" varStatus="loop">
					<tr class="clickable-row" style="text-align: center;">
						<td>${loop.index + 1}</td>
						<td>${member.memberId}</td>
						<td>${member.name}</td>
						<td>${member.regDate}</td>
						<td>
							<div class="dropdown">
					            <button class="btn btn-secondary btn-sm dropdown-toggle drop" type="button" id="dropdownMenuButton" data-bs-toggle="dropdown" aria-expanded="false">
					              선택
					            </button>
					            <ul class="dropdown-menu" aria-labelledby="dropdownMenuButton">
					              <li><a class="dropdown-item" href="#">회원정보</a></li>
					              <li><a class="dropdown-item" href="/user/message?memberId=${member.memberId}">쪽지 보내기</a></li>
					              <li><a class="dropdown-item deleteMember" href="#">강제탈퇴</a></li>
					            </ul>
					    	</div>
						</td>
					</tr>
				</c:forEach>
				</tbody>
			</table>
			
			<div style="text-align: center; margin-top: 40px;">
				<ul class="p-ul">
					<c:if test="${pageMaker.prev}">
						<li class="p-li"><a class="p-a"
							href="/admin/user/list${pageMaker.makeQuery(pageMaker.startPage - 1)}">이전</a></li>
					</c:if>
		
					<c:forEach begin="${pageMaker.startPage}" end="${pageMaker.endPage}"
						var="idx">
						<li class="p-li"><a class="p-a" href="/admin/user/list${pageMaker.makeQuery(idx)}">${idx}</a></li>
					</c:forEach>
		
					<c:if test="${pageMaker.next && pageMaker.endPage > 0}">
						<li class="p-li"><a class="p-a"
							href="/admin/user/list${pageMaker.makeQuery(pageMaker.endPage + 1)}">다음</a></li>
					</c:if>
				</ul>
			</div>
	         </div>
	      </div>
	</main>
	<footer><%@ include file="../footer.jsp" %></footer>
	
	<script>
		$(document).ready(function() {
			$('.drop').on('click', function() {
				var memberId = $(this).closest('tr').find('td:eq(1)').text();
				console.log(memberId);
			});
			
			$('.dropdown-menu .deleteMember').on('click', function(e) {
			    var confirmation = confirm('정말로 이 회원을 강제 탈퇴시키겠습니까?');
			        
			    if (confirmation) {
			        var memberId = $(this).closest('tr').find('td:eq(1)').text();
			        location.href = '/admin/user/delete?memberId=' + memberId;
			    } else {
			     	e.preventDefault();
			    }
			});
		});
	</script>
</body>
</html>