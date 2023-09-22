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
    <link rel="stylesheet" href="resources/css/login.css?after">
    <script type="text/javascript" src="https://code.jquery.com/jquery-3.5.1.js"></script>
 </head>
 
 
 
 
 <script>
 function sendId(){
	 document.f.submit()
 }
 function sendPw(){
	 document.p.submit()
 }
    function toggleInputDisplay() {
      var inputContainers = {
        email: document.getElementById("input_email"),
        hp: document.getElementById("input_hp")
      };

      var radioButtons = document.getElementsByName("radio_option");
      var selectedOption;

      // 선택된 라디오 버튼의 값을 가져옵니다.
      for (var i = 0; i < radioButtons.length; i++) {
        if (radioButtons[i].checked) {
          selectedOption = radioButtons[i].value;
          break;
        }
      }

      // 선택된 옵션에 따라 해당 입력란을 보이거나 숨깁니다.
      for (var option in inputContainers) {
        if (inputContainers.hasOwnProperty(option)) {
          if (option === selectedOption) {
            inputContainers[option].style.display = "block";
          } else {
            inputContainers[option].style.display = "none";
          }
        }
      }
    }    
  </script>




<form name ="f" id="find_id_f" action="world_find_id_complete.do" method ="post">
	<body>
	<input type ="hidden" name = "mode" value = "${mode}" >
	<c:if test="${mode == 'find_id'}">
	<div class = "wrap">		
	<div class = "login">
	<div class = login_id>
	<h2>아이디 찾기</h2>
	<br>
	<br>
	<br>
		</div>
		<div align = "left">
		<input type="radio" name="radio_option" value="email" onchange="toggleInputDisplay()" checked>
		이메일
		<input type="radio" name="radio_option" value="hp" onchange="toggleInputDisplay()">
		휴대폰번호
		</div>
		<div style="margin:3px 0px;">
			<input class="input" name="name" style="border-radius:0; border: black solid 1px; width:100%; padding:10px; margin:10px 0px;" placeholder="이름">
		</div>
		<div id ="input_email" >
			<input class="input" name="email" style="border-radius:0; border: black solid 1px; width:100%; padding:10px; margin:10px 0px;" placeholder="이메일">
		</div>
		<div id="input_hp" style="display: none; margin:3px 0px;" >
			<input class="input" name="hp" style="border-radius:0; border: black solid 1px; width:100%; padding:10px; margin:10px 0px;" placeholder="휴대폰번호">
		</div>
		<div align = "left">
		<input type="submit"  value = "확인" >
		<input type="button"  value = "취소" onclick ="location.href='world_login.do'">
		</div>
	</form>
	</c:if>
	
	
	<form name ="p" id="find_id_pw" action="world_find_pw_complete.do" method ="post">
	<c:if test="${mode != 'find_id'}">
	<div class = "wrap">		
	<div class = "login">
	<div class = "login_id">
	<h2>비밀번호 찾기</h2>
	<br>
	<br>
	<br>
	</div>
		<div style="margin:3px 0px;">
			<input class="input" name = "name" style="border-radius:0; border: black solid 1px; width:100%; padding:10px; margin:10px 0px;" placeholder="이름">
		</div>
		<div id="input_email" style="display: block; margin:3px 0px;">
			<input class="input" name="email" style="border-radius:0; border: black solid 1px; width:100%; padding:10px; margin:10px 0px;" placeholder="이메일">
		</div>
		
		<div align = "left">
		<input type="submit"  value = "확인" >
		<input type="button"  value = "취소" onclick ="location.href='world_login.do'">
		</div>
	</c:if>
		</form>
</div>      
</div>
</body>
</html>


