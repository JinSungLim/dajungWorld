<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<!-- mall_member_join_complete.jsp -->
<head>
     <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Welcome!</title>
    <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@400;500;700&display=swap" rel="stylesheet">
    <script src="https://kit.fontawesome.com/53a8c415f1.js" crossorigin="anonymous"></script>
    <link rel="stylesheet" href="resources/css/login.css?after">
    <script type="text/javascript" src="https://code.jquery.com/jquery-3.5.1.js"></script>
</head>

<div class = "wrap">		
	<div class = "login">
		<div class = "login_id">
		
				<h2>아이디 찾기 결과</h2>
				<br>
				<br>
				<br>
				<p>회원님의 아이디는 ${userId}입니다. 감사합니다.</p>
				
		</div>
			<br>
			<br>
			<br>
			<input type = "button" value = "메인으로" class = "btn s-btn"
					onclick = "location.href = 'world_login.do'">
		</div>
</div>
