<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: Mjjeon
  Date: 2023-11-15
  Time: 오후 5:55
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
    <table border="1">
         <thead>
            <th>작성자</th>
            <th>카테고리</th>
            <th>작성일</th>
            <th>제목</th>
            <th>내용</th>
         </thead>
    <tbody>
        <c:forEach var="board" items="${groupBoardList}">
            <tr>
                <td>${board.name}</td>
                <td>${board.gbcatename}</td>
                <td>${board.gbregdate}</td>
                <td><a href = "/gboard/view?gbno=${board.gbno}">${board.title}</a></td>
                <td>${board.content}</td>
            </tr>
        </c:forEach>
    </tbody>
    </table>
</body>
</html>
