<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관심 카테고리</title>
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

body, html {
	background: #eff0f2;
}

.container {
	display: flex;
	flex-direction: column;
	justify-content: center;
	align-items: center;
}

.image-container {
	display: flex;
	justify-content: center;
	text-align: center;
	margin-top: 20px;
	flex-wrap: wrap;
}

.image-container>div {
	margin: 10px;
	max-width: 320px;
	flex: 0 0 calc(33.33% - 20px); /* 각 요소가 33.33%의 너비를 가지도록 설정 */
	box-sizing: border-box; /* 요소의 패딩과 테두리를 포함한 너비를 지정 */
}

.image-container img {
	max-width: 100%;
	max-height: 100%;
}

.image-container img:hover {
	transform: scale(1.1);
	transition: transform 0.3s ease;
}

.image-caption {
	margin-top: 5px;
	margin-bottom: 10px;
	font-size: 30px;
}

.top {
	font-size: 38px;
	margin-top: 40px;
	margin-bottom: 20px;
}

.nextBtnContainer {
	width: 100%;
	text-align: right;
	margin-top: 10px;
	margin-bottom: 40px;
	margin-right: 280px;
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

.selected {
	border: 5px solid darkgreen;
	box-shadow: 0 0 5px rgba(0, 128, 0, 0.5);
}
</style>

</head>
<body>
	<div class="container">
		<div class="top">관심 카테고리를 선택해주세요!(다중 선택 가능)</div>
		<div class="image-container">
			<div>
				<img alt="아웃도어/여행" src="/img/travel.jpg" name="1" width="320"
					height="180">
				<div class="image-caption">아웃도어/여행</div>
			</div>
			<div>
				<img alt="운동/스포츠" src="/img/sports.jpg" name="2" width="320"
					height="180">
				<div class="image-caption">운동/스포츠</div>
			</div>
			<div>
				<img alt="책/글" src="/img/book.jpg" name="3" width="320" height="180">
				<div class="image-caption">책/글</div>
			</div>
			<div>
				<img alt="외국/언어" src="/img/language.jpg" name="4" width="320"
					height="180">
				<div class="image-caption">외국/언어</div>
			</div>
			<div>
				<img alt="문화/공연/축제" src="/img/show.jpg" name="5" width="320"
					height="180">
				<div class="image-caption">문화/공연/축제</div>
			</div>
			<div>
				<img alt="음악/악기" src="/img/instrument.jpg" name="6" width="320"
					height="180">
				<div class="image-caption">음악/악기</div>
			</div>
			<div>
				<img alt="사진/영상" src="/img/picture.jpg" name="7" width="320"
					height="180">
				<div class="image-caption">사진/영상</div>
			</div>
			<div>
				<img alt="게임/오락" src="/img/game.jpg" name="8" width="320"
					height="180">
				<div class="image-caption">게임/오락</div>
			</div>
			<div>
				<img alt="차/오토바이" src="/img/car.jpg" name="9" width="320"
					height="180">
				<div class="image-caption">차/오토바이</div>
			</div>
		</div>
		<div class="nextBtnContainer">
			<button type="button" class="nextBtn">완료</button>
		</div>
	</div>
	<script>
		$(document).ready(function() {
			var selectedImages = [];

			$(".image-container img").click(function() {
				var cateId = $(this).attr('name');
				var index = selectedImages.indexOf(cateId);

				if ($(this).hasClass("selected")) {
					// 이미 선택된 경우, 선택 해제하고 배열에서 제거
					$(this).removeClass("selected");
					if (index > -1) {
						selectedImages.splice(index, 1);
					}
				} else {
					// 선택되지 않은 경우, 선택하고 배열에 추가
					$(this).addClass("selected");
					if (index === -1) {
						selectedImages.push(cateId);
					}
				}
			});

			$(".nextBtn").on('click', function() {
				console.log(selectedImages);
				
				$.ajax({
					url: '/user/category/favor/set',
					type: 'POST',
					data: {
						selectedImages: selectedImages
					},
					success: function() {
						location.href = "/user/region";
					},
					error: function() {
						alert('에러 발생');
					}
				})
			});
		});
	</script>
</body>
</html>
