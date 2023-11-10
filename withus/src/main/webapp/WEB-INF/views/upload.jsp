<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8">
<title>사진</title>
</head>

<body>
	<h1>사진업로드테스트</h1>
	<form method="post" action="/upload" enctype="multipart/form-data">
		<ul>
			<li>이미지 파일 <input type="file" multiple="multiple" name="image">
				<input type="submit" id="submit" value="전송" />
			</li>
		</ul>
	</form>
	<div>
    <a href="/image/3">이미지 생성</a>    
</div>
</body>
</html>