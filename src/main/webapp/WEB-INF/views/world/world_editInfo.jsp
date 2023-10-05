<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
 
 <!DOCTYPE html>
<html lang="ko">
 <head>
     <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>내 정보 수정</title>
    <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@400;500;700&display=swap" rel="stylesheet">
    <script src="https://kit.fontawesome.com/53a8c415f1.js" crossorigin="anonymous"></script>
    <link rel="stylesheet" href="resources/css/editInfo.css?after">
    <link rel="stylesheet" href="resources/css/join.css?after">
    <script type="text/javascript" src="https://code.jquery.com/jquery-3.5.1.js"></script>
    <script src = "https://cdn.jsdelivr.net/npm/swiper@9/swiper-bundle.min.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script> 
    <script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.10.0/js/bootstrap-datepicker.min.js"></script> 
	<script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.10.0/locales/bootstrap-datepicker.ko.min.js"></script>
 </head>
 
<script type = "text/javascript">
 
/* 비밀번호 확인 검사 */
 function editCheck(pwdValue){
	 
	 isPwdcase = /^[a-zA-Z]+(?=.*\d)(?=.*[~!@#$%^&*()_+|<>?:{}`])[0-9a-zA-Z~!@#$%^&*()_+|<>?:{}`]{9,17}$/g			
			
	
	 if (document.f.name.value == "") {
			alert("변경하실 이름을 입력 하세요.")
			document.f.name.focus()
			
			return false
		}	 
	 if (document.f.hp.value == "") {
			alert("변경하실 휴대폰 번호를 입력 하세요.")
			document.f.hp.focus()
			
			return false
		}	 
	 if (document.f.password.value == "") {
			alert("변경하실 패스워드를 입력 하세요.")
			document.f.password.focus()
			
			return false
		}	 
	 
	 if (document.f.edit_checkPw.value == "") {
			alert("패스워드 확인란을 입력 하세요.")
			document.f.edit_checkPw.focus()
			
			return false
		}	 
	 if(document.f.password.value == document.f.basic_password.value){
			 alert("기존 패스워드와 동일합니다. 다른 패스워드로 변경해주세요.")
			 document.f.password.focus()
			
		 	 return false
	 }


	if (document.f.password.value != document.f.edit_checkPw.value) {
			alert("비밀 번호가 일치하지 않습니다. 다시입력해주세요.")
			document.f.edit_checkPw.focus()
			
			return false				
			
	}
	 
	if (pwdValue.match(isPwdcase) == null) {
		alert("영문자, 숫자, 특수기호로 구성된 10자 ~ 16자의 비밀번호를 입력해주세요.")
		document.f.password.focus()
		return false
		
	 
	}
	  
}

 </script>
 
 

<form name ="f" id="memInfo_id_f" action="world_editInfo.do" method ="post" onsubmit = "return editCheck(this.value)">

	<body>
	<div class = "wrap" >		
	<div class = "editInfo" >
	<div class = login_id >
	<h2>내 정보 수정</h2>
	<br>
	<br>
	<br>
		</div>
		<div style="margin:3px 0px;" >
			<div>아이디</div>
			<input class="input"  name ="id" style="border-radius:0; border: black solid 1px; width:100%; padding:10px; margin:10px 0px;" value ="${memInfo.id}" readOnly>
		</div>
		<div style="margin:3px 0px;">
			<div>이 름</div>
			<input class="input" name="name" style="border-radius:0; border: black solid 1px; width:100%; padding:10px; margin:10px 0px;" value ="${memInfo.name}">
		</div>
		<div style="margin:3px 0px;">
		<div>이메일</div>
			<input class="input" name="email" style="border-radius:0; border: black solid 1px; width:100%; padding:10px; margin:10px 0px;" value = "${memInfo.email}">
		</div>
		<div style="margin:3px 0px;">
		<div>휴대폰 번호</div>
			<input class="input" name="hp" style="border-radius:0; border: black solid 1px; width:100%; padding:10px; margin:10px 0px;" value ="${memInfo.hp}">
		</div>
		<div style="margin:3px 0px;">
		<div>기존 패스워드</div>
			<input type="password" name="basic_password" style="border-radius:0; border: black solid 1px; width:100%; padding:10px; margin:10px 0px;" value="${memInfo.password}" readOnly >
		</div>
		<div style="margin:3px 0px;">
		<div>새로운 패스워드</div>
			<input type="password" name="password" style="border-radius:0; border: black solid 1px; width:100%; padding:10px; margin:10px 0px;" onkeyup ="pwdCheck(this.value)" maxlength="16" placeholder ="*비밀번호 (영문대소문자/숫자/특수문자 중 2가지 이상 조합, 10~16자)" >
		</div>
		<div style="margin:3px 0px;">
		<div>새로운 패스워드 확인</div>
			<input type="password" name = "edit_checkPw"  style="border-radius:0; border: black solid 1px; width:100%; padding:10px; margin:10px 0px;" onkeyup ="pwdCheck(this.value)" maxlength="16" placeholder="*비밀번호 확인">
			<span id = "pwd_check"></span>
			<input type = "hidden" name = "isPwdCheck">
		</div>	
    <div align = "left">
		<input type="submit"  value = "확인" >
		<input type="button"  value = "취소" onclick ="location.href='world_main.do'">
	</div>
</form>
<script type = "text/javascript">

function pwdCheck(pwdValue) {
				// 영소문자로 시작하는 영대소문자 + 숫자 + 특수기호 로 구성된 비밀번호 정규 표현식
		
	 isPwdcase = /^[a-zA-Z]+(?=.*\d)(?=.*[~!@#$%^&*()_+|<>?:{}`])[0-9a-zA-Z~!@#$%^&*()_+|<>?:{}`]{9,17}$/g			
								
	if (document.f.password.value != document.f.edit_checkPw.value) {
		document.getElementById("pwd_check").innerHTML
			= "<p style = 'font-size : 12; color : red;'>비밀 번호가 일치하지 않습니다.</p>"
			
		document.f.isPwdCheck.value = "false"
		
	} else if (document.f.password.value == document.f.edit_checkPw.value) {
		if (pwdValue.match(isPwdcase) == null) {
			document.getElementById("pwd_check").innerHTML
			= "<p style = 'font-size : 12; color : red;'>영문자, 숫자, 특수기호로 구성된 10자 ~ 16자의 비밀번호를 입력해주세요.</p>"
			
			document.f.isPwdCheck.value = "false"
			
		}if(pwdValue.match(isPwdcase) == document.f.basic_password.value) {
			document.getElementById("pwd_check").innerHTML
			= "<p style = 'font-size : 12; color : red;'>기존 패스워드와 동일합니다. 다른 패스워드로 변경해주세요.</p>"
			
			document.f.isPwdCheck.value = "false"
		
		}else {
			document.getElementById("pwd_check").innerHTML
				= "<p style = 'font-size : 12; color : blue;'>비밀 번호가 일치합니다.</p>"
				
			document.f.isPwdCheck.value = "true"

		}
	}	
	if (document.f.password.value == "" || document.f.edit_checkPw.value == "") {
		document.getElementById("pwd_check").innerHTML = ""
		
		document.f.isPwdCheck.value = "false"
	

	}
}

</script>
</div>      
</div>
</body>
</html>


