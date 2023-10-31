<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<%@ include file="world_main_top.jsp" %>
              <div class="home_contents" style = "height: 540px; overflow-y : scroll;">
                <div class="updated_news_title"><br><strong>Updated news</strong></div>
                <div class="updated_news_contents">
                  <div class="updated_news_left"> 
                  <c:if test ="${empty listUpdateNews}">
                  <div>
                     <font color ="black"> 최신 소식이 없습니다!</font>            
                  </div>                
                  </c:if>                             
                  <c:forEach var = "dto" items ="${listUpdateNews}">             	                       
                    <span class="updated_news_left1"><span class="updated_news_red">&nbsp;사진첩&nbsp;</span><a href ="diary_main.do?member_num=${memId.member_num}&id=${memId.id}">${dto.photo_title} </span>  </a>                       
                    <span class="updated_news_left2"><span class="updated_news_blue">&nbsp;게시판&nbsp;</span><a href ="board_main.do">${dto.board_title}</span>   </a>                                     
                   </c:forEach>         
   				</div>
                  <div class="updated_news_right">
                    <div class="updated_news_right1">다이어리<span class="updated_news_right_number"><a href = "diary_main.do?board_num=${memId.member_num}&id=${memId.id}">0/25</a></span> &emsp;&emsp;&emsp;&emsp;사진첩 <span class="updated_news_right_number"><a href ="photo_main.do?member_num=${memId.member_num}&id=${memId.id}">${getListPhotoCount}/25</a></span></div>
                    <div class="updated_news_right2">게시판 <span class="updated_news_right_number"><a href = "board_main.do?board_num=${memId.member_num}&id=${memId.id}">${getListBoardCount}/25</a></span> &emsp;&emsp;&emsp;&emsp;&emsp;방명록 <span class="updated_news_right_number"><a href ="visit_main.do?member_num=${memId.member_num}&id=${memId.id}&main_num=${memId.main_num}">${getListVisitCount}/25</a></span></div>
                    <div class="updated_news_right3"></div>
                  </div>
                </div>                         
                <div class="miniroom_title"><br><strong>Miniroom</strong></div>
                <div class="miniroom_contents">
                  <img src="./resources/images/backGround.PNG" class="miniroom_gif" >
                </div>
                <form name="f" action="world_insertFamilyReply.do" method="post" onsubmit ="return insertCheck()" >
                <div class= "miniroom_title" >
                <input type= "hidden" value ="${memId.id}" name ="id">
                <input type="hidden" value="${memId.member_num}" name="member_num">  
                
                <br><strong>일촌평</strong></div> 
                <br>    
                <c:if test ="${not empty listFamilyReply }">
                <c:forEach var= "dto" items="${listFamilyReply}">
                <div  class="updated_news_left"><span class="updated_news_left1">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;${dto.id} : ${dto.family_reply} &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;${dto.family_date}</span></div>
                </c:forEach>
                </c:if> 
                       	
             <div align ="center" >
             <br>
              <tr><textarea style = "resize: none;" cols ="55" rows = "5" placeholder ="일촌평을 남겨주세요!" name ="family_reply"></textarea>        
              </div>        
             <div align ="right"><input type ="submit" value ="등록"></div>
              </form>
   			</div>
   							
   			<div class="menu_bar">       
            <a href="world_main.do?member_num=${memId.member_num}&id=${memId.id}" class="menu_button1">&nbsp;&nbsp;홈</a>
            <a href="diary_main.do?member_num=${memId.member_num}&id=${memId.id}" class="menu_button2">&nbsp;&nbsp;Diary</a>
            <a href="photo_main.do?member_num=${memId.member_num}&id=${memId.id}" class="menu_button3">&nbsp;&nbsp;사진첩</a>
            <a href="board_main.do?member_num=${memId.member_num}&id=${memId.id}" class="menu_button4">&nbsp;&nbsp;게시판</a>
            <a href="visit_main.do?member_num=${memId.member_num}&id=${memId.id}&main_num=${memId.main_num}" class="menu_button5">&nbsp;&nbsp;방명록</a>
         	</div>

<script type = "text/javascript" >

function insertCheck(){
	
	if (document.f.family_reply.value == "") {
		alert("일촌평을 입력해주세요.")
		document.f.family_reply.focus()
		
		return false
	}	
}
</script>		
       <!--     </div> -->
          

   <%-- <c:if test="${empty memInfo.id}">
   <script>if(!alert('로그인 해야 사용가능합니다. 로그인을 먼저 해 주세요.')) document.location = 'admin';</script>
   </c:if> --%>
    
  </body>
</html>