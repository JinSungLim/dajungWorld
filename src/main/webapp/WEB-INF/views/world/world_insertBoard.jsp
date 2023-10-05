<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<html lang="ko">
  <head>
    <meta charset="UTF-8" />
    <title> 게시판 작성페이지</title>
    <link rel="stylesheet" href="resources/css/font.css" />
    <link rel="stylesheet" href="resources/css/insertMain.css" />
  </head>
  
<script text = "text/javascript">

function insertCheck(){
	
	if (document.f.board_title.value == "") {
		alert("제목을 입력해주세요.")
		document.f.board_title.focus()
		
		return false
	}
	
	
}



</script>  
  
  <form name="f" action="world_insertBoard.do" method="post" onsubmit ="return insertCheck()" >
	<div class="bookcover">
		<div class="bookdot">
			<div class="page">
			      <div class="insertMain_content">
			         	<div class = "title">
						<h4>제목을 입력해주세요</h4>
                		<input type="text" name="board_title" maxlength="12" placeholder = "제목은12자이내로 지어주세요.">
            			<br>	
			            </div>
			            <div class = "content">
			            <h4>내용을 적어주세요</h4>
			            <textarea rows="15" cols ="106" width = "80%" name="board_content" maxlength="200" placeholder = "내용은 200자이내로 적어주세요." ></textarea>
			            </div>
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