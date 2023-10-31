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
 
 function deleteReply(number){
	 var reply_num = Number(number);
	 var deleteReply = confirm("답글을 삭제하시겠습니까?")
	 if(deleteReply){
		 location.href = "world_deleteReply.do?reply_num="+reply_num;
	 }
 }
 
 
 </script>
  
  <form name="f" action="world_replyBoard.do" method="post" onsubmit ="return replyCheck()" >
	<div class="bookcover">
		<div class="bookdot">
			<div class="page">
			      <div class="board_content">
			      		<input type="hidden" value="${memId.id}" name="id">		
			     	    <input type="hidden" value="${getBoard.board_num}" name="board_num">		   
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
			             <c:forEach var="rdto" items="${listReply}"> 	
			            <tr>		        	            
			            <td >${rdto.name} : ${rdto.reply_content }</td>&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;<td>(${rdto.reply_date})</td>
						
						<c:if test="${memId.member_num == rdto.member_num}">
						<td>	<font size = "2.5"><a href ="world_editReply.do?reply_num=${rdto.reply_num}&board_num=${getBoard.board_num}">수정 | </a><a href ="javascript:deleteReply('${rdto.reply_num}')">삭제</a></font></td>
						</c:if>
						<br>            
			            </tr>
			            </c:forEach>
			            </div>
			            <div class = "content">			            
			            <h4>답글 작성</h4>
			            <textarea style = "resize : none;" rows="4"cols="106"width="80%"name="reply_content" maxlength="100" ></textarea>		            
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
					 <input type="submit" value = "답글 등록" >	
					 <br>
					      <c:if test ="${memId.member_num == getBoard.member_num}">
			         	<input type="button"  onclick= "location.href='world_editBoard.do?board_num=${getBoard.board_num}'" value = "게시글 수정">			
			         	</c:if>            		            
					 	<input type="button"  onclick="location.href='board_main.do?member_num=${memId.member_num}&id=${memId.id}'" value = "게시판으로">			
			           </div>			            
			       </div>
			       </form>				    			            
			</div>
		</div>		
	</div>
	

</body>
</html>