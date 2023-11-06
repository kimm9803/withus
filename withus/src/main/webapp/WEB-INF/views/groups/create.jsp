<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Create Group</title>
</head>
<body>
    <h1>Create Group</h1>
    <form action="/groups/create" method="post">
        <label for="groupName">그룹명:</label>
        <input type="text" id="groupName" name="gname" required><br>

        <label for="groupIntro">그룹소개:</label>
        <textarea id="groupIntro" name="gintro" rows="4" cols="50"></textarea><br>

        <input type="submit" value="그룹 만들기">
    </form>
</body>
</html>
