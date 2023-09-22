<%@ page import ="java.util.Date" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<html lang="ko">
  <head>
    <meta charset="UTF-8" />
    <title> 게시글 내용페이지</title>
    <link rel="stylesheet" href="resources/css/font.css" />
    <link rel="stylesheet" href="resources/css/contentBoard.css" /> 
 </head>
 <script type = "text/javascript">
 
 function replyCheck(){
	 
	 if (document.f.reply_content.value == "") {
			alert("답글을 입력해주세요.")
			document.f.id.focus()
			
			return false
		}
	  
 }
 
 
 </script>
  
  <form name="f" action="world_editReply.do" method="post" onsubmit ="return replyCheck()" >
	<div class="bookcover">
		<div class="bookdot">
			<div class="page">
			      <div class="board_content">	
			      		<input type="hidden" value="${getBoard.board_num}" name="board_num">		   
			      		<input type="hidden" value="${getReply.reply_num}" name="reply_num">		   
			         	<div class = "title" > 
						<h4>제 목</h4>
                		<input type="text" name="board_title" maxlength="12" value = "${getBoard.board_title}" readOnly>
            			<br>	
			            </div>
			            <div class = "content">
			            <h4>내 용<h4>
			            <br>
			            <td name="board_content" maxlength="200"  readOnly><font size ="2.5">&emsp;&emsp;${getBoard.board_content}</font></td>
			            </div>
			            <div class = "content">			            
			            <h4>답 글</h4>
			            <textarea rows="4"cols="106"width="80%"name="reply_content" maxlength="100" >${getReply.reply_content }</textarea>		            
			            </div>			            		            
			            <div>
					 &emsp;&emsp;&emsp;&emsp;
					 &emsp;&emsp;&emsp;&emsp;
					 &emsp;&emsp;&emsp;&emsp;
					 &emsp;&emsp;&emsp;&emsp;
					 &emsp;&emsp;&emsp;&emsp;
					 &emsp;&emsp;&emsp;&emsp;
					 &emsp;&emsp;&emsp;&emsp;
					 &emsp;&emsp;&emsp;&emsp;
					 &emsp;&emsp;&emsp;&emsp;&emsp;&emsp;
					 <br>
			         	<input type="submit"   value = "답글 수정">			      		            
					 	<input type="button"  onclick="javascript:history.back()" value = "취소">			
			           </div>			            
			       </div>
			       </form>				    			            
			</div>
		</div>		
	</div>
	

</body>
</html>