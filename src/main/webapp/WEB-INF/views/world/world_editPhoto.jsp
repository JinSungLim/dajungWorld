<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<html lang="ko">
  <head>
    <meta charset="UTF-8" />
    <title> 사진첩 수정페이지</title>
    <link rel="stylesheet" href="resources/css/font.css" />
    <link rel="stylesheet" href="resources/css/editPhoto.css" />
    <script type="text/javascript" src="resources/js/world_editPhoto.js"></script>
  </head>
  <script type="text/javascript">
	$(document).ready(function() {
		//alert('화면')
        $("a[name='file-delete']").on("click", function(e) {
        	//alert('클릭')
            e.preventDefault();
            deleteFile($(this));
        });
        var imgCount = document.getElementById('file-list').childElementCount;
		var fileCount = document.getElementById('attachFileDiv').childElementCount;
		var lastFile = document.getElementById('attachFileDiv').lastElementChild.id;
		if((imgCount+fileCount) == 6){
			//alert("disabled되야댐")
			document.getElementById(lastFile).firstElementChild.disabled = true;
			return
		}else{
			//alert("disabled안되야함 : "+document.getElementById('attachFileDiv').lastElementChild.id)
			document.getElementById(lastFile).firstElementChild.disabled = false;
			return
		}
    })
    
 </script>
  <form name="f" action="world_editPhoto.do" method="post" enctype="multipart/form-data">
	<div class="bookcover">
		<div class="bookdot">
			<div class="page">
			      <div class="editPhoto_content">
			         	<div class = "title">
			         	<input type="hidden" value="${getPhoto.photo_num}" name="photo_num">
						<h4>사진 제목을 수정해주세요!</h4>
                		<input type="text" name="photo_title" maxlength="12"  value = "${getPhoto.photo_title}" placeholder ="제목은 12자 이내로 지어주세요">
            			<br>	
			            </div>
			            <div class = "content">
			            <h4>사진 글을 수정해주세요!</h4>
			            <textarea rows="15" cols ="106" width = "80%"name="photo_content"   maxlength="200"  placeholder ="사진글은 200자 이내로 지어주세요">${getPhoto.photo_content}</textarea>
			            </div>
			            <div class = "image">
							<h4>사진 이미지를 수정해주세요!(최대5개까지 가능)</h4>
			        <div>
					
			
						<td><c:forEach items="${imgList}" var="file">
								<div class="file-input">
									<img src="${upPath}/${file}" width="50" height="50"><br> ${file} <a href='#this' name='file-delete'>삭제</a> <input type="hidden" name="file_img" value="${file}">
								</div>
							</c:forEach></td>

							<div class="form-group file-group" id="file-list">
								<c:set var="number" value="1" />
								<c:forEach items="${imageList}" var="file">
									<div class="file-input">
										<c:if test="${file != null }">
											<img src="${upPath}/${file}" width="50" height="50">
											<br>
										${file} 
									
									<a href='#this' name='file-delete'>삭제</a>

											<input type="hidden" name="photo_image${number}" value="${file}">
										</c:if>
									</div>
									<c:set var="number" value="${number+1}" />
							</c:forEach>
							</div>
							<div id="attachFileDiv">
								<div id="file0">
									<input type="file" id="file_img0" name="file_img0" value="" size="20" onchange="javascript:attachFile.add(0)">
								</div>
								<div id="image-preview" class="image-preview"></div>
							</div>
			        <div>
			         <input type="submit"  value = "수정">
					 <input type="button"  onclick="history.back()" value = "취소">	
			          </div>
			          
			           </div>			            
			       </div>
			       </form>				    			            
			</div>
		</div>		
	</div>
	

</body>
</html>