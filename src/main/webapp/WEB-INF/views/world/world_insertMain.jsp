<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<html lang="ko">
  <head>
    <meta charset="UTF-8" />
    <title> 메인 작성페이지</title>
    <link rel="stylesheet" href="resources/css/font.css" />
    <link rel="stylesheet" href="resources/css/insertMain.css" />
  </head>
  <form name="f" action="world_insertMain.do" method="post" enctype="multipart/form-data">
	<div class="bookcover">
		<div class="bookdot">
			<div class="page">
			      <div class="insertMain_content">
			      	<input type ="hidden" value = "${memId.member_num}" name = "member_num">
			      	<input type ="hidden" value = "${memId.id}" name = "id">
			         	<div class = "title">
						<h4>대문 제목은?</h4>
                		<input type="text" name="main_title" maxlength="12"  placeholder ="제목은 12자 이내로 지어주세요">
            			<br>	
			            </div>
			            <div class = "content">
			            <h4>대문 글을 작성해주세요!</h4>
			            <textarea rows="15" cols ="106" width = "80%"name="main_content" maxlength="200"  placeholder ="대문글은 200자 이내로 지어주세요"></textarea>
			            </div>
			            <div class = "image">
			     
							<h4>대문 이미지를 등록해주세요!(한개만 등록 가능합니다.)</h4>
							<input type="file" name = "main_image1" id ="main_image1" >													            
	
			        	 <div>
			         <input type="submit"  value = "등록">
					 <input type="button"  onclick= "history.back()" value = "취소">	
			           </div>			            
			       </div>
			       </form>				    			            
			</div>
		</div>		
	</div>
	

</body>
</html>