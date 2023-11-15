<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Close Page</title>
    <script>
        // 페이지 로드 후 3초 뒤에 창을 닫음
        window.onload = function() {
            setTimeout(function() {
                window.close();
            }, 2000); // 2000 밀리초 = 2초
        };
    </script>
</head>
<body>
    <div style="text-align: center; margin-top: 50px;">
        <h2>페이지가 닫힙니다.</h2>
        <p>제출이 완료되었습니다.</p>
    </div>
</body>
</html>
