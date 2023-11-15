<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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

    <style>
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
        }

        th, td {
            text-align: center;
        }

        .clickable-row {
            cursor: pointer;
        }

        .dropdown-menu {
            min-width: auto;
        }

        /* 수정된 스타일 */
        .custom-table {
          
            border-radius: 15px;
            overflow: hidden;
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
                    <td>${report.memberid}</td>
                </tr>
                <tr>
                    <th>신고 그룹명</th>
                    <td>${report.gname}</td>
                </tr>
                <tr>
                    <th>신고 사유</th>
                    <td>${report.rpcate}</td>
                </tr>
                <tr>
                    <th>신고 날짜</th>
                    <td>${report.reportdate}</td>
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
            <a href="/admin/group/reportlist" class="btn btn-primary">목록</a>
        </div>
    </div>

    <!-- Bootstrap JS 및 다른 필요한 스크립트들을 여기에 추가할 수 있습니다. -->
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"
            integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL"
            crossorigin="anonymous"></script>
</body>
</html>
