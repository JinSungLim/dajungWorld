<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<%@include file="world_main_top.jsp"%>
<head>
<link rel="stylesheet" href="resources/css/visit.css?after" />

</head>

<script type="text/javascript">

function insertCheck(){
	
	if(document.f.visit_content.value == ""){
		alert("내용을 입력해주세요.")
		document.f.visit_content.focus()
		
		return false
	}
	
	
}


</script>
              <div class="home_contents">
                <div class="visit_contents">
                <form name="f" action="world_insertVisit.do" method="post" onsubmit ="return insertCheck()" enctype="multipart/form-data">
            	  <div class="visit_title"><span style="color:mediumblue">&emsp;&emsp;&emsp;${memId.id}</span></div>
                  <div class="visit_container"> 
                  <c:if test = "${empty getMain.main_image1}">
                     <div class="visit_picture visit_background3">  
                  	<img src="./resources/images/basicImage.PNG" >
					</div>
                 </c:if>          
                 <c:if test ="${not empty getMain.main_image1}">  
                  <div class="visit_picture visit_background3">         
                  <img src="./resources/images/${getMain.main_image1}" >
                  </div>     
                  </c:if>
                 <input type="hidden" value="${memId.id}" name="id">  
                 <input type="hidden" value="${memId.member_num}" name="member_num">
          		 <input type="hidden" value="${memId.main_num}" name="main_num">
                     <br>
                    <textarea style = "resize : none;" rows="11" cols ="40" width = "40%" name="visit_content" maxlength="100" placeholder = "내용은 200자이내로 적어주세요." ></textarea>
                  </div> 
                  <div>
 				&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;<input type = "submit" value = "등록">
 				  </div>
                  </form> 
                <c:if test= "${empty listVisit}">
                 	    <div ><br></br><br>&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;방명록에 등록된 글이 없습니다!</div>          			
                 </c:if>	
                 <c:if test ="${not empty listVisit}">
                <c:forEach var = "dto" items = "${listVisit}">  
              
                  <div class="visit_title">&emsp;no.${dto.visit_num} <span style="color:mediumblue">${dto.id}</span> <i class="fas fa-home"></i><span class="visit_date">${dto.visit_date}</span>
                  <c:if test ="${memId.id == dto.id}">
                  &emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;<a href = "world_deleteVisit.do?visit_num=${dto.visit_num}">삭제</a>
                  </c:if>
                  </div>
                  <div class="visit_container">
                  <div class="visit_picture visit_background3">
                  <c:if test ="${empty dto.main_image1}">
                  <img src="./resources/images/basicImage.PNG" >               
                  </c:if> 
                  <c:if test ="${not empty dto.main_image1 }">
                   <img src="./resources/images/${dto.main_image1}" >
                   </c:if>
   				 </div>
                    <div class="visit_text">${dto.visit_content}</div>
                    	
                  </div> 
                 </c:forEach>               
                 </c:if>  	

				 	   
                <br>
               	<br>
               	<br>
               	<br>
               	<br>
                <br>
                <br>
                <br>
                <br>
                <br>
               
              </div>                 
              </div>           
           <div class="menu_bar">       
            <a href="world_main.do?member_num=${memId.member_num}&id=${memId.id}" class="menu_button1">&nbsp;&nbsp;홈</a>
            <a href="diary_main.do?member_num=${memId.member_num}&id=${memId.id}" class="menu_button2">&nbsp;&nbsp;Diary</a>
            <a href="photo_main.do?member_num=${memId.member_num}&id=${memId.id}" class="menu_button3">&nbsp;&nbsp;사진첩</a>
            <a href="board_main.do?member_num=${memId.member_num}&id=${memId.id}" class="menu_button4">&nbsp;&nbsp;게시판</a>
            <a href="visit_main.do?member_num=${memId.member_num}&id=${memId.id}" class="menu_button5">&nbsp;&nbsp;방명록</a>
          </div>
  </body>
</html>