<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<html lang="ko">
  <head>
    <meta charset="UTF-8" />
    <title> dajungWorld</title>
    <link rel="stylesheet" href="resources/css/font.css?after" />
    <link rel="stylesheet" href="resources/css/layout.css?after" />
    <link rel="stylesheet" href="resources/css/home.css?after" />
  </head>
 <script type ="text/javaScript">

 function updateMain(number){
	 
	 var main_num = Number(number);
	 var goUpdateMain = confirm("대문을 수정하시겠습니까?");
	 if(goUpdateMain){
		 location.href = 'world_editMain.do?main_num='+main_num;
		 
	 }
	 
	 
	 
 }
  
 </script>
  <body>
    <div class="bookcover">
      <div class="bookdot">
        <div class="page">
          <div class="home">
            <div class="upside" >
              <br><strong>&emsp;&emsp;&emsp;TODAY ${getTodayCount} <span style="color:coral;"></span><td> | </td>TOTAL ${getTotalCount} 		</strong> &emsp;&emsp;&emsp; &emsp; 
              <c:if test="${empty getMain.main_title}">
              <span class="title"><a href ="world_editMain.do?main_num=${memId.main_num}&member_num=${memId.member_num}">제목을 만들어주세요!</a>
              </c:if>
              <c:if test="${not empty getMain.main_title}">
              <span class="title">${getMain.main_title}&emsp;&emsp;
			  <input type ="button" onclick="javascript:updateMain('${getMain.main_num}')" value ="대문수정">
			  <%-- <a href ="javascript:updateMain('${getMain.main_num}')">수정</a> --%>
			  </c:if> 
              
              
              </span>        
              dajungworld.com/${memId.id}
              &emsp;&emsp;
              
              ${memId.id}님 환영합니다!
              
              <c:if test="${ not empty memId}">
									<a href="world_logout.do" >
										로그아웃
									</a>
									
									<a href ="world_memberList.do">■회원 목록■</a>
<%-- 									■회원 목록■
									<select onchange="if(this.value) window.open(this.value);">
									<c:forEach var ="dto" items ="${listMember}">
									<option value ="world_main.do?member_num=${dto.member_num}&id=${dto.id}">${dto.id}
									</c:forEach>
									</select> --%>
									
			
            </div>
            <div class="home_main" style = "height: 550px;" >
              <div class="profile">
                <div class="profile_1">
                <c:if test = "${empty getMain.main_image1}">
                  <a href ="world_editMain.do?main_num=${memId.main_num}&member_num=${memId.member_num}"><img src="./resources/images/insertImage.PNG" class="profile_image" ></a>
                 </c:if>     
                <c:if test = "${not empty getMain.main_image1}">
                	<img src="./resources/images/${getMain.main_image1}" class="profile_image">
                </c:if>
                </div>
                <c:if test="${empty getMain.main_content}">
                <div class="profile_2"><a href ="world_editMain.do?main_num=${memId.main_num}&member_num=${memId.member_num}">나만의 대문글을 작성해주세요!</a><br><br></div>
                </c:if>
                 <c:if test="${not empty getMain.main_content}">
                    <div class="profile_2">${getMain.main_content}</a><br><br></div>
                     <div>
                   &emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;<input type ="button" value = "회원정보 수정" onclick = "location.href='world_editInfo.do?id=${memId.id}'">
                    </div>
                 </c:if>
                 </c:if>
                <div class="profile_3">
                  <div class="profile-dropdown">           
                    <div class="dropdown-btn">
                      <div class="dropdown-title">Related Link</div>
                      <div class="triangle-down"></div>
                  </div>
                  
                    <div class="dropdown-content">
                      <a href="https://js-etc.tistory.com/" target="_blank">Devlog</a>
                      <a href="https://github.com/JinSungLim" target="_blank">Github</a>                
                    </div>
                  </div>
                </div>
              </div>