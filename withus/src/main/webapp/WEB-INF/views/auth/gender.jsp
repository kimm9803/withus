<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>성별</title>
    <link rel="stylesheet" href="/css/gender.css">
    <script src="https://kit.fontawesome.com/51db22a717.js" crossorigin="anonymous"></script>
    <link href="https://fonts.googleapis.com/css2?family=Alata&display=swap" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL" crossorigin="anonymous"></script>
</head>
<body>
	<div class="page-container">
		<div class="select-gender">Select your gender!</div>
        <div class="gender-container shadow">
            <div class="left-side">
            	<input type="checkbox" id="male-chk" class="gender-checkbox-left">
            	<label for="male-chk" class="male"></label>
            	<img src="/img/male.png" width="200" height="200">
                <div class="gender-name">Male</div>
               
                
            </div>
            <div class="right-side">
            	<input type="checkbox" id="female-chk" class="gender-checkbox-right">
            	<label for="female-chk" class="female"></label>
            	<img src="/img/female.png" width="200" height="200">
            	<div class="gender-name">Female</div> 
            </div>
        </div>
        <div>
        	<button class="nextBtn" type="button">Next</button>
        </div>
        
    </div>	
    
    <script>
	    $(document).ready(function() {
	        $('#male-chk').click(function() {
	            $('#female-chk').prop('checked', false);
	        });
	
	        $('#female-chk').click(function() {
	            $('#male-chk').prop('checked', false);
	        });
	        
	        $('.nextBtn').on('click', function() {
	        	var gender = 'select';
	        	if ($('#male-chk').prop('checked')) {
	        		gender = 'male';
	        		
	        		$.ajax({
	        			url: '/user/gender/set',
	        			type: 'POST',
	        			data: {
	        				gender: gender
	        			},
	        			success: function(success) {
	        				location.href = '/user/category/interest';
	        			},
	        			error: function() {
	        				alert('에러 발생');
	        			}
	        		});
	        	} else if ($('#female-chk').prop('checked')) {
	        		gender = 'female';
	        		
	        		$.ajax({
	        			url: '/user/gender/set',
	        			type: 'POST',
	        			data: {
	        				gender: gender
	        			},
	        			success: function(success) {
	        				location.href = '/user/category/interest';
	        			},
	        			error: function() {
	        				alert('에러 발생');
	        			}
	        		});
	        	} else {
	        		alert('성별을 선택해주세요!');
	        	}
	        	
	        });
	    });
    </script>
</body>
</html>