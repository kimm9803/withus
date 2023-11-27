<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: Mjjeon
  Date: 2023-11-15
  Time: 오후 5:55
  To change this template use File | Settings | File Templates.
--%>

<html>
<head>
    <title>Title</title>

    <style>

        footer {
            position: fixed;
            bottom: 0;
            width: 107%;
            margin-left: -20px;
            background-color: #f8f9fa;
            text-align: center;
            padding: 10px;
        }
        .board-table {
            margin: 20px;
        }

        table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 20px;
        }

        th, td {
            border: 1px solid #000000;
            padding: 10px;
            text-align: left;
        }

        th {
            background-color: #18732b;
            color: white;
        }

        tbody tr:nth-child(even) {
            background-color: #f2f2f2;
        }

        tbody tr:hover {
            background-color: #ddd;
        }

        a {
            color: #007bff;
            text-decoration: none;
            font-weight: bold;
        }

        a:hover {
            text-decoration: underline;
        }
    </style>
</head>
<body>
<header><%@ include file="../header.jsp" %></header>

<div class =board-table style="margin-top: 100px;">
    <h3>그룹 게시판</h3>
    <table border="1">
         <thead>
            <th>구분</th>
            <th>제목</th>
            <th>글쓴이</th>
            <th>날짜</th>
         </thead>
    <tbody>
        <c:forEach var="board" items="${groupBoardList}">
            <tr>
                <td>${board.gbcatename}</td>
                <td><a href = "/gboard/view?gbno=${board.gbno}">${board.title}</a></td>
                <td>${board.name}</td>
                <td>${board.gbregdate}</td>
            </tr>
        </c:forEach>
    </tbody>
    </table>
</div>
<footer><%@ include file="../footer.jsp" %></footer>
</body>
</html>
