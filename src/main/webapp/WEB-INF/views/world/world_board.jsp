<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<%@include file="world_main_top.jsp"%>
<head>
<link rel="stylesheet" type= "text/css"  href="resources/css/board.css?after" />
<script type="text/javascript" src="https://code.jquery.com/jquery-3.5.1.js"></script>


</head>
<script type="text/javascript">


$(function() {
	var chkObj = document.getElementsByName("RowCheck");
	var rowCnt = chkObj.length;

	$("input[name='allCheck']").click(function() {
		var chk_listArr = $("input[name='RowCheck']");
		for (var i = 0; i < chk_listArr.length; i++) {
			chk_listArr[i].checked = this.checked;

		}
	});
	$("input[name='RowCheck']").click(function() {
		if ($("input[name='RowCheck']:checked").length == rowCnt) {
			$("input[name='allCheck']")[0].checked = true;
		} else {
			$("input[name='allCheck']")[0].checked = false;
		}
	});
});

function deleteBoard(){

	var goDelete = confirm("게시글을 삭제하시겠습니까?");
	
	if(goDelete){
		
		var del = document.getElementsByName('RowCheck');
		const arr = [];
		for(i = 0;i<del.length;++i){
				if(del[i].checked == true){
						arr.push(del[i].value);				
						
				}					
		}
		
		if (arr.length == 0) {
			alert("삭제할 게시글을 선택해주세요.");
			return;
		}
		$.ajax({

			url : './world_boardDelete.do',
			type : 'post',
			data : {
				dlist : JSON.stringify(arr)
			},
			cache : false,
			success : function(res) {
				alert("삭제가 완료되었습니다.")
				document.location.href = document.location.href;
				location.href('world/board_main.do')
			}
		});

	}
}

</script>

              <div class="home_contents" style = "height: 550px;" >
                <div class="board_contents">
               
   <div class = "board_contents" align="center" >
<%--     <input type="hidden" value="${memId.id}" name="id">  
    <input type="hidden" value="${memId.member_num}" name="member_num">   --%>
	<table  width="100%">
		<tr bgcolor="white" >
			<th width="5%">
			<input type="checkbox" id="allCheck" name="allCheck" /> 		    
			</th>
			<th width ="10%"></th>
			<th width="45%">제목</th>
			<th width ="15%">작성자</th>
			<th width ="15%">작성일</th>
			<th width ="10%">조회</th>
		</tr>
                <c:forEach var="dto" items="${listBoard}">           
                <tr>
                <th width="5%" ><input type="checkbox" name="RowCheck" value="${dto.board_num}"> 
				<td width = "10%">${dto.board_num}</td>
				<td width="45%">
				<a href="world_contentBoard.do?board_num=${dto.board_num}">${dto.board_title}</a>			
				<c:if test="${dto.board_count > 20}">
					<img src="resources/images/hot.gif">
				</c:if>
				</td>
				<td align = "center" width = "15%"><a href="#">${dto.name}</a></td>
				<td align ="center" width ="15%">${dto.board_date}</td>
				<td align = "center" width = "10%">${dto.board_count}</td>
				<c:if test="${dto.board_count > 0 }">
				<td align = "center" width = "10%">${plus_board_count}</td>
				</c:if>		
				</tr>	
  				</c:forEach>
  				</table>
  				   <c:if test= "${empty listBoard}">
                 	    <div class="photo_contents" align = "center"><br></br><br>게시판에 등록된 글이 없습니다!</div>
                 </c:if>	
                     
                         
          <br><br>
  		<form name="f" action="world_boardSearch.do" method="post">
  		<select name ="search" >
		<option value="board_title">제	목</option>
		<option value="board_content">내    용</option>
		</select>
		<input  type="text" name="searchString" placeholder="검색할 내용을 입력하세요..." style="width: 300px;">
		<button type="submit" >검색</button>
		<button type="reset" >초기화</button>
		</form>	
		 <div align = "right">
		 			<td><input type ="button" value ="삭제"  onclick = "deleteBoard()"></td>
                   <td><input type ="button" value ="글쓰기" onclick = "location.href='world_insertBoard.do'"></td>
          </div>
                </div>
              </div>
            </div>
          
          <div class="menu_bar">       
            <a href="world_main.do?member_num=${memId.member_num}&id=${memId.id}" class="menu_button1">&nbsp;&nbsp;홈</a>
            <a href="diary_main.do?member_num=${memId.member_num}&id=${memId.id}" class="menu_button2">&nbsp;&nbsp;Diary</a>
            <a href="photo_main.do?member_num=${memId.member_num}&id=${memId.id}" class="menu_button3">&nbsp;&nbsp;사진첩</a>
            <a href="board_main.do?member_num=${memId.member_num}&id=${memId.id}" class="menu_button4">&nbsp;&nbsp;게시판</a>
            <a href="visit_main.do?member_num=${memId.member_num}&id=${memId.id}&main_num=${memId.main_num}" class="menu_button5">&nbsp;&nbsp;방명록</a>
          </div>

  </body>
</html>