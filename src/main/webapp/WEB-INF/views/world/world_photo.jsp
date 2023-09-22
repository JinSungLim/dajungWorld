<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<%@include file="world_main_top.jsp"%>
<head>
<link rel="stylesheet" type= "text/css"  href="resources/css/photo.css" />



</head>
<script type="text/javascript">

function insertPhoto(){
		var goInsert = confirm("사진 등록하시겠습니까?");
		
		if(goInsert){
		location.href='world_insertPhoto.do'	
		
	}
}

function deletePhoto(number){
	var photo_num = Number(number);
	var goDelete = confirm("사진을 삭제하시겠습니까?");
	
	if(goDelete){
	location.href='world_deletePhoto.do?photo_num='+photo_num;
		
	}
	
}
</script>



              <div class="home_contents">

                <div class="photo_contents">
                <div align = "right">
                   <td><input type ="button" value ="나만의 사진을 등록해주세요!" onclick = "insertPhoto()"></td>
                 </div>
             
                 <c:if test= "${empty listPhoto}">
                 	    <div class="photo_contents" align = "center"><br></br><br>사진첩에 등록된 사진이없습니다!</div>
                 </c:if>
                <c:if test="${not empty listPhoto}">
                <c:forEach var="dto" items="${listPhoto}">
                  <div class="photo_title">&emsp;&nbsp;${dto.photo_title}<span class="photo_title_date"> ${dto.photo_date }&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="world_editPhoto.do?photo_num=${dto.photo_num}">수정&nbsp;|&nbsp;</a><a href ="javascript:deletePhoto('${dto.photo_num}')">삭제</a></span></div>
                
                <a href="world_photo_view.do?photo_num=${dto.photo_num}">
                  <img class="photo" src="resources/images/${dto.photo_image1}">
                </a>       
                  <div class="photo_text" align = "center">${dto.photo_content }</div>
  				</c:forEach>
  				</c:if>
                </div>
              </div>
            </div>
          </div>
          
           <div class="menu_bar">       
            <a href="world_main.do" class="menu_button1">&nbsp;&nbsp;홈</a>
            <a href="diary_main.do" class="menu_button2">&nbsp;&nbsp;다이어리</a>
            <a href="photo_main.do" class="menu_button3">&nbsp;&nbsp;사진첩</a>
            <a href="board_main.do" class="menu_button4">&nbsp;&nbsp;게시판</a>
            <a href="visit_main.do" class="menu_button5">&nbsp;&nbsp;방명록</a>
          </div>

  </body>
</html>