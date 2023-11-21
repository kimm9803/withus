<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관심지역</title>
<script src="https://kit.fontawesome.com/51db22a717.js"
	crossorigin="anonymous"></script>
<link
	href="https://fonts.googleapis.com/css2?family=Dongle&display=swap"
	rel="stylesheet">
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
	font-family: 'Dongle';
}

.region {
    width: 130px; /* 원하는 크기 설정 */
    height: 130px; /* 원하는 크기 설정 */
    border-radius: 50%; /* 반지름을 50%로 설정하여 동그란 원으로 만듭니다 */
    background-color: #999; /* 배경색은 원하는 색상으로 변경할 수 있습니다 */
    display: inline-flex; /* div를 인라인 요소로 배치합니다 */
    justify-content: center; /* 가로 중앙 정렬 */
    align-items: center; /* 세로 중앙 정렬 */
    margin: 20px; /* 여백 설정 */
    cursor: pointer; /* 마우스 커서 모양 변경 */
    color: white;
    font-size: 35px;
    transition: background-color 0.3s, transform 0.3s;
} 

.region:hover {
    transform: scale(1.2); /* 확대 효과 */
    background-color: seagreen; /* 호버 시 배경색 변경 */
    box-shadow: 0 0 10px rgba(0, 0, 0, 0.5); /* 그림자 효과 추가 */
}

.container {
	width: 60%;
	height: 100%;
	margin-top: 100px;
	text-align: center;
}

h1, h4 {
	text-align: center;
}

h1 {
	color: seagreen;
	font-size: 55px;
}
h4 {
	margin-top: 20px;
	margin-bottom: 40px;
	font-size: 30px;
}

.selected {
    background-color: seagreen !important;
}
.nextBtn {
	background-color: olive;
	color: white;
	border: 1px solid white;
	border-radius: 20px;
	padding: 1px 40px;
	font-size: 30px;
	transition: background-color 0.5s, color 0.5s;
}

.nextBtn:hover {
	background-color: darkgreen;
	color: white;
}

.next {
	text-align: right;
	margin-right: 60px;
	margin-top: 40px;
}
</style>
</head>
<body>
<div class="container">
	<h1>지역 키워드를 선택하세요</h1>
	<h4>원하는 지역에서 진행되는 맞춤형 모임정보를 확인할 수 있어요</h4>
	<div class="region" name="1">서울</div>
	<div class="region" name="2">부산</div>
	<div class="region" name="3">대구</div>
	<div class="region" name="4">인천</div>
	<div class="region" name="5">광주</div>
	<div class="region" name="6">대전</div>
	<div class="region" name="7">울산</div>
	<div class="region" name="8">세종</div>
	<div class="region" name="9">경기</div>
	<div class="region" name="10">강원</div>
	<div class="region" name="11">충북</div>
	<div class="region" name="12">충남</div>
	<div class="region" name="13">전북</div>
	<div class="region" name="14">전남</div>
	<div class="region" name="15">경북</div>
	<div class="region" name="16">경남</div>
	<div class="region" name="17">제주</div>
	<div class="region" name="18">해외</div>
	
	<div class="next">
		<button type="button" class="nextBtn">다음</button>
	</div>
</div>

<script>
	$(document).ready(function() {
		var selectedRegions = [];
		
	    $('.region').click(function() {
	    	var rno = $(this).attr('name');
			var index = selectedRegions.indexOf(rno);
			
	        // 현재 선택한 지역에 'selected' 클래스가 있는지 확인
	        var isSelected = $(this).hasClass('selected');
	
	        // 만약 현재 선택한 지역에 'selected' 클래스가 이미 있다면 제거하고, 없다면 추가
	        if (isSelected) {
	            $(this).removeClass('selected');
	            if (index > -1) {
	            	selectedRegions.splice(index, 1);
				}
	        } else {
	            $(this).addClass('selected');
	            if (index === -1) {
	            	selectedRegions.push(rno);
				}
	        }
	    });
	    
	    $('.nextBtn').click(function() {
	    	console.log(selectedRegions);
	    	
	    	$.ajax({
				url: '/user/region/set',
				type: 'POST',
				data: {
					selectedRegions: selectedRegions
				},
				success: function() {
					location.href = "/";
				},
				error: function() {
					alert('에러 발생');
				}
			})
	    })
	});
</script>
</body>
</html>