<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" integrity="sha384-rGyo0JO5moIeqqI8cWc7OH1OKgIUnr3dwdaDl9z6nY1dFMIHiLoNzz+5bstaD49" crossorigin="anonymous">
  <style>
    header {
      background-color: #E6E1E1;
      color: black !important;
      margin-bottom: 200px;
      height: 150px;
    }
    a.nav-link {
      color: black !important;
    }
  </style>
  <title>WithUs</title>
</head>
<body>
  <!-- header.jsp -->
  <header class="p-4">
    <img src="/img/withus.png" style="width:200px; height: 100px; float: left;">
    <div class="container">
      <nav class="navbar navbar-expand-lg navbar-dark bg-beige">
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
          <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarNav">
          <ul class="navbar-nav ms-auto">
            <li class="nav-item active">
              <a class="nav-link" href="#">Home</a>
            </li>
            <li class="nav-item">
              <a class="nav-link" href="#">About</a>
            </li>
            <li class="nav-item">
              <a class="nav-link" href="#">Contact</a>
            </li>
          </ul>
        </div>
        <div>
          <sec:authorize access="isAuthenticated()">
            <a href="/logout" class="btn btn-danger">로그아웃</a>
          </sec:authorize>
          <sec:authorize access="isAnonymous()">
            <div style="margin-bottom: 10px;">
              <a href="/auth/login" class="btn btn-primary">로그인</a>
            </div>
          </sec:authorize>
        </div>
      </nav>
    </div>
  </header>
  <!-- The rest of your website content goes here -->
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js" integrity="sha384-mQ93GR66B00ZXjt0YO5KlohRA5SY2XofGJYqQ1xu3KAW4eYaFMOlA5P1iIYO5F3V" crossorigin="anonymous"></script>
</body>
</html>
