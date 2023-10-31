<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Sign Up</title>
    <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@400;500;700&display=swap" rel="stylesheet">
    <script src="https://kit.fontawesome.com/53a8c415f1.js" crossorigin="anonymous"></script>
    <link rel="stylesheet" href="resources/css/join.css?after">
    <script type="text/javascript" src="https://code.jquery.com/jquery-3.5.1.js"></script>  
    <script src = "https://cdn.jsdelivr.net/npm/swiper@9/swiper-bundle.min.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script> 
    <script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.10.0/js/bootstrap-datepicker.min.js"></script> 
	<script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.10.0/locales/bootstrap-datepicker.ko.min.js"></script>
</head>

<script type="text/javascript">

	// 필수입력칸 유효성 검사
function joinCheck() {
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
		
		if (document.f.join_checkPw.value == "") {
			alert("비밀번호 확인란을 입력하세요.")
			document.f.join_checkPw.focus()
			
			return false
		}
		
		if (document.f.name.value == "") {
			alert("이름을 입력하세요.")
			document.f.name.focus()
			
			return false
		}
		
		if (document.f.email.value == "") {
			alert("이메일을 입력하세요.")
			document.f.email.focus()
			
			return false
		}
		

		if (document.f.hp.value == "") {
			alert("휴대폰 번호를 입력하세요.")
			document.f.hp.focus()
			
			return false
		}


	}
	
function returnMain(){
		
		var goMain = confirm("회원가입을 취소하시겠습니까?");
		if(goMain) {
			location.href='world_login.do'		
		}
		
		
	}
	
	
	
	
</script>

<body>
	<form name ="f" action ="world_join_ok.do" method = "post" onsubmit = "return joinCheck()">
    <div class="wrap">
        <div class="join">
            <h2>회원가입</h2>
            
			<div class = "must" >
			<td>*은 필수입력사항</td>			
			</div>
            <div class = "join_id">
                <h4>아이디</h4>
                <input type="text" name="id" maxlength="16" onkeyup = "idCheck(this.value)"placeholder="*아이디 (영문소문자/숫자, 4~16자)" >
            	<br>        	
            	<span id = "id_check"></span>
				<input type = "hidden" name = "isIdCheck">     
			
            </div>
            <div class="join_name">
                <h4>이름</h4>
                <c:if test = "${empty name }">
                <input type="text" name="name"  placeholder="이름을 입력해주세요">
            	</c:if>
            	<c:if test ="${not empty name }">
             	<input type="text" name="name"  value = "${ name }" readOnly>
            	</c:if>
            
            </div>
            <div class="join_pw">
                <h4>비밀번호</h4>
                <input type="password" name="password" onkeyup ="pwdCheck(this.value)" maxlength="16" placeholder="*비밀번호 (영문대소문자/숫자/특수문자 중 2가지 이상 조합, 10~16자)"> 
            </div> 
            <div class="join_checkPw">
                <h4>비밀번호 확인</h4>
                <input type="password" name="join_checkPw" onkeyup ="pwdCheck(this.value) " maxlength="16" placeholder="*비밀번호 확인"> 
            	<span id = "pwd_check"></span>
				<input type = "hidden" name = "isPwdCheck">
            </div>                        
             <div class="join_email">
                <h4>이메일</h4>
                <c:if test = "${empty email }">
                <input type="text" name="email" placeholder="이메일 주소를 입력해주세요."> 
            	</c:if>
            	<c:if test="${not empty email }">
				<input type = "text" name = "email" value ="${ email }" readOnly>
				</c:if>
            	
            </div>      
            <div class="join_hp">
                <h4>휴대폰 번호</h4>             
                <c:if test = "${empty hp}">
                <input type="text" name="hp" id ="phone" maxlength ="11" placeholder="하이픈(-)를 제외하고 입력하여주세요."> 
            	</c:if>
            	 <c:if test = "${not empty hp}">
            	 <input type="text" name="hp" id = "phone" value = "${hp}" readOnly> 
            	 </c:if>
            	 
            </div>  
		     				       
            <div class = "join_gender">   
             	<h4>성별</h4>    
             	<c:if test = "${empty gender}" >
            	<input type = "radio" name = "gender" value = "male" >
										<label>남성</label>
										&emsp;
				<input type = "radio" name = "gender" value = "female">
										<label>여성</label>
				</c:if>
		
				<c:if test = "${ gender == 'male' }">
										<input type = "radio" name = "gender" value = "male" checked="checked" disabled="disabled">
										<label>남성</label>
										&emsp;
										<input type = "radio" name = "gender" value = "female" disabled="disabled">
										<label>여성</label>
				</c:if>
									
				<c:if test = "${ gender == 'female' }">
										<input type = "radio" name = "gender" value = "male" disabled="disabled">
										<label>남성</label>
										&emsp;
										<input type = "radio" name = "gender" value = "female" checked="checked" disabled="disabled">
										<label>여성</label>
				</c:if> 

             </div>    
             		                      
   			<div>
   		
               <td> <input type="submit" value="가입"></td>                 
               <td><input type="button" value="취소" onclick = "returnMain()"></td>  
            </div>           

            
		</form>
    	</div>
    	</div>
    
    <script type="text/javascript">

	/* 아이디 중복 검사 */
	function idCheck(idValue) {
		var isLowercase = /^[a-z]+[a-z0-9]{3,17}$/g		
		
		if (idValue.match(isLowercase) != null) {
			$.ajax({
				type : "GET",			
				url : "./idUseCheck",				
				data: {
					"id" : idValue
				},
				
				success : function(res) {
					if (res > 0) {
						document.getElementById("id_check").innerHTML
						= "<p style = 'font-size : 12; color : red;'>이미 사용중인 아이디입니다.</p>"

						document.f.isIdCheck.value = "false"
						
					} else {
						document.getElementById("id_check").innerHTML
							= "<p style = 'font-size : 12; color : blue;'>사용 가능한 아이디입니다.</p>"
							
						document.f.isIdCheck.value = "true"
					}
				}
				
			})
		} else {
			document.getElementById("id_check").innerHTML
				= "<p style = 'font-size : 12; color : red;'>사용 불가능한 아이디입니다.</p>"

			document.f.isIdCheck.value = "false"
		}
		
	
		
		
		if (idValue == "") {
			document.getElementById("id_check").innerHTML = ""
			document.f.isIdCheck.value = "false"
		}
	}
	/* // 아이디 중복 검사 */
	
	
	/* 비밀번호 확인 검사 */
	function pwdCheck(pwdValue) {
					// 영소문자로 시작하는 영대소문자 + 숫자 + 특수기호 로 구성된 비밀번호 정규 표현식
		isPwdcase = /^[a-zA-Z]+(?=.*\d)(?=.*[~!@#$%^&*()_+|<>?:{}`])[0-9a-zA-Z~!@#$%^&*()_+|<>?:{}`]{9,17}$/g
		
		
		
		if (document.f.password.value != document.f.join_checkPw.value) {
			document.getElementById("pwd_check").innerHTML
				= "<p style = 'font-size : 12; color : red;'>비밀 번호가 일치하지 않습니다.</p>"
				
			document.f.isPwdCheck.value = "false"
			
		} else if (document.f.password.value == document.f.join_checkPw.value) {
			if (pwdValue.match(isPwdcase) == null) {
				document.getElementById("pwd_check").innerHTML
				= "<p style = 'font-size : 12; color : red;'>영문자, 숫자, 특수기호로 구성된 10자 ~ 16자의 비밀번호를 입력해주세요.</p>"
				
				document.f.isPwdCheck.value = "false"
				
			} else {
				document.getElementById("pwd_check").innerHTML
					= "<p style = 'font-size : 12; color : blue;'>비밀 번호가 일치합니다.</p>"
					
				document.f.isPwdCheck.value = "true"
			}
		}
		
		
		
		
		if (document.f.password.value == "" || document.f.join_checkPw.value == "") {
			document.getElementById("pwd_check").innerHTML = ""
			
			document.f.isPwdCheck.value = "false"
		}
	}

	
    </script>
    
    
</body>
</html>