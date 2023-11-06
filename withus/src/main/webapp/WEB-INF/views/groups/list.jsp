<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>With Us</title>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
<link rel="stylesheet" href="/css/main.css" />

<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
<style>
#create{
 margin : 20px auto;
}
</style>
</head>
<body>
  <div id="main">
    <h2>그룹 목록</h2>   
    <a href="/groups/create" class="btn btn-dark" id="create">그룹 생성</a>
		<div class="card-container">
			<c:forEach var="group" items="${groupList}">
				<div class="card">
					<div class="card-header"><h5><a href="/groups/view/${group.gno}">그룹명 : ${group.gname}</a></h5></div>
					<div class="card-body">						
						<p class="card-text">번호: ${group.gno}</p>						
						<p class="card-text">생성일: ${group.gdate}</p>
						<p class="card-text">정원: ${group.gperson}</p>
						<p class="card-text">추천: ${group.glike}</p>
					</div>
				</div>
			</c:forEach>
		</div>
	</div> 
  <script>
  </script>
 
  
</body>
</html>





