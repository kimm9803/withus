<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>신고 상세 정보</title>
    <!-- Bootstrap 스타일 추가 -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css"
          integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN"
          crossorigin="anonymous">
   <link rel="stylesheet"
   href="https://fonts.googleapis.com/css2?family=Sunflower:wght@300&display=swap">
    <style>
         * {
         font-family: 'Sunflower', sans-serif;
      }
        /* 추가한 스타일들 */
        body {
            background-color: #f8f9fa;
        }

        .container {
            margin-top: 50px;
        }

        h1 {
            color: orange;
            margin-bottom: 50px;
        }

        table {
            background-color: #fff;
            border-collapse: separate; /* border-collapse 추가 */
            border-spacing: 0; /* border-spacing 추가 */
        }

        th, td {
            text-align: center;
            border: 1px solid #dee2e6; /* 안쪽 선 색상 지정 */
            padding:8px;
        }

        .clickable-row {
            cursor: pointer;
        }

        .dropdown-menu {
            min-width: auto;
        }
        
        .custom-table {
            border-radius: 15px;
            overflow: hidden;
            border: 1px solid black; /* 테두리 추가 */
        }

       
        .custom-table th,
        .custom-table td {
            vertical-align: middle;
        }
    </style>
</head>
<body>
    <div class="container mt-5">
        <h1 class="text-center">신고 상세 정보</h1>
        <table class="table custom-table">
            <thead>
                <tr>
                    <th>신고자 아이디</th>
                    <td>${report.reporterId}</td>
                </tr>
                <tr>
                    <th>피신고 아이디</th>
                    <td>${report.reportedId}</td>
                </tr>
                <tr>
                    <th>신고 사유</th>
                    <td>${report.rpcate}</td>
                </tr>
                <tr>
                    <th>신고 날짜</th>
                    <td>${report.reportDate}</td>
                </tr>
                <tr>
                    <th>신고 진행상태</th>
                    <c:choose>
					  <c:when test="${report.rpstatus eq 0}">
					    <td>확인중</td>
					  </c:when>
					  <c:when test="${report.rpstatus eq 1}">
					    <td>확인</td>
					  </c:when>
					  <c:when test="${report.rpstatus eq 2}">
					    <td>거부</td>
					  </c:when>
					  <c:otherwise>
					    <td>알 수 없음</td>
					  </c:otherwise>
					</c:choose>		
                </tr>
                <tr>
                    <th>신고 내용</th>
                    <td>
                        <textarea class="form-control" rows="5" readonly>${report.rpcontent}</textarea>
                    </td>
                </tr>
                <!-- 추가적인 필드들을 여기에 추가할 수 있습니다. -->
            </thead>
        </table>
        <div class="mt-3">
            <a href="#" onclick="history.go(-1)" class="btn btn-secondary">이전</a>
            <a href="/admin/user/report-list" class="btn btn-primary">목록</a>
            <c:if test="${report.rpstatus eq 0}">
            <a href="/admin/user/reportadmit/${report.mreportId}" class="btn btn-secondary" id="confirmAdmitBtn">확인</a>
            <a href="/admin/user/reportreject/${report.mreportId}" class="btn btn-primary" id="confirmRejectBtn">거부</a>
            </c:if>
        </div>
    </div>

    <!-- Bootstrap JS 및 다른 필요한 스크립트들을 여기에 추가할 수 있습니다. -->
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"
            integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL"
            crossorigin="anonymous"></script>
    <script>
	    document.getElementById('confirmAdmitBtn').addEventListener('click', function() {
	        var isConfirmed = confirm('신고를 허락하시겠습니까?');
	        if (isConfirmed) {
	            window.location.href = '/admin/user/reportadmit/${report.mreportId}';
	        }
	    });
	
	    document.getElementById('confirmRejectBtn').addEventListener('click', function() {
	        var isConfirmed = confirm('신고를 거부하시겠습니까?');
	        if (isConfirmed) {
	            window.location.href = '/admin/user/reportreject/${report.mreportId}';
	        }
	    });
    </script>
</body>
</html>