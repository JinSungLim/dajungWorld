<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Welcome!</title>
    <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@400;500;700&display=swap" rel="stylesheet">
    <script src="https://kit.fontawesome.com/53a8c415f1.js" crossorigin="anonymous"></script>
    <link rel="stylesheet" href="resources/css/login.css">
    <script type="text/javascript" src="https://code.jquery.com/jquery-3.5.1.js"></script>
      
</head>

<script type="text/javascript">

function againLogin(){
	
	if (document.f.id.value == "") {
		alert("아이디를 입력하세요.")
		document.f.id.focus()
		
		return false
	}
	
	if (document.f.password.value == "") {
		alert("비밀번호를 입력하세요.")
		document.f.password.focus()
		
		return false
	}
	
}

</script>
<form name ="f" action ="world_login_ok.do" method = "post" onsubmit = "return againLogin()">
<body>
	<c:if test="${not empty cookie.id_check.value}">
		<c:set value="checked" var="checked"/>
	</c:if>
    <div class="wrap">
        <div class="login">
            <h2>Dajung World</h2>
            <div class="login_sns">
            </div>
            <div class="login_id">
                <h4>아이디</h4>
                <input type="text" name="login_id" id = "login_id" placeholder="아이디를 입력해주세요" value ="${cookie.id_check.value}">
            </div>
            <div class="login_pw">
                <h4>비밀번호</h4>
                <input type="password" name="login_password" id = "login_password" placeholder="비밀번호를 입력해주세요">
            </div>
            <div class="login_etc">
                <div class="checkbox">
                <input type="checkbox" name = "remember_userId" id ="remember_userId" ${checked} > 아이디 기억하기
                </div>
                <div class="forgot_pw">
                <li><a href="world_find_id.do">아이디 찾기</a> / <a href="world_find_pw.do">비밀번호 찾기</a> </li>
            </div>         
            </div>
            <br>
     		<div >
            <a href="https://kauth.kakao.com/oauth/authorize?client_id=2826f2ac804b472722dbaaafc93c681e&redirect_uri=http://localhost:8081/dajungworld/kakaoLogin&response_type=code"
																					>
																					<img src="resources/images/kakao_login_medium_narrow.png" >
			</a>
			</div>
            <div class="sign_up" align ="center">
                <a href="world_join.do">Sign Up</a>
            </div>
                  
            
            <div class="submit">
             	
                <input type="submit" value="로그인" >
            </div>
            </form>
        </div>
    </div>
</body>
</html>