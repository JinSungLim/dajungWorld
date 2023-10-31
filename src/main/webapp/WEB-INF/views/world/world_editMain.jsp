<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<html lang="ko">
  <head>
    <meta charset="UTF-8" />
    <title> 메인 수정페이지</title>
    <link rel="stylesheet" href="resources/css/font.css" />
    <link rel="stylesheet" href="resources/css/insertMain.css" />
  </head>
  <form name="f" action="world_editMain.do" method="post" enctype="multipart/form-data">
	<div class="bookcover">
		<div class="bookdot">
			<div class="page">
			      <div class="insertMain_content">
			           	<input type="hidden" value="${memId.main_num}" name="main_num">
			         	<div class = "title">
						<h4>대문 제목을 수정해주세요.</h4>
                		<input type="text" name="main_title" maxlength="12"  placeholder ="제목은 12자 이내로 지어주세요" value ="${getMain.main_title}">
            			<br>	
			            </div>
			            <div class = "content">
			            <h4>대문 글을 수정해주세요!</h4>
			            <textarea rows="15"cols ="106"width="80%"name="main_content" maxlength="200"  placeholder ="대문글은 200자 이내로 지어주세요">${getMain.main_content}</textarea>
			            </div>
			            <div class = "image">
							<h4>대문 이미지를 수정해주세요!(한개만 등록 가능합니다.)</h4>
							<input type="file" name = "main_image1" id ="main_image1" >	
							<img src="${upPath}/${getMain.main_image1}	" width="50" height="50">
							<input type="hidden" name = "main_image2" value = "${getMain.main_image1 }"/>
						</div>											            
			        	 <div>
			         <input type="submit"  value = "수정" >
					 <input type="button"  onclick= "history.back()" value = "취소">	
			           </div>			            
			       </div>
			       </form>				    			            
			</div>
		</div>		
	</div>
	

</body>
</html>