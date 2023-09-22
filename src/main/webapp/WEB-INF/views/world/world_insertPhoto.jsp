<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<html lang="ko">
  <head>
    <meta charset="UTF-8" />
    <title> 사진첩 작성페이지</title>
    <link rel="stylesheet" href="resources/css/font.css" />
    <link rel="stylesheet" href="resources/css/insertPhoto.css" />
    <script type="text/javascript" src="resources/js/world_insertPhoto.js"></script>
  </head>
  <form name="f" action="world_insertPhoto.do" method="post" enctype="multipart/form-data">
	<div class="bookcover">
		<div class="bookdot">
			<div class="page">
			      <div class="insertPhoto_content">
			         	<div class = "title">
						<h4>사진 제목을 지어주세요!</h4>
                		<input type="text" name="photo_title" maxlength="12"  placeholder ="제목은 12자 이내로 지어주세요">
            			<br>	
			            </div>
			            <div class = "content">
			            <h4>사진 글을 작성해주세요!</h4>
			            <textarea rows="15" cols ="106" width = "80%"name="photo_content" maxlength="200"  placeholder ="사진글은 200자 이내로 지어주세요"></textarea>
			            </div>
			            <div class = "image">
							<h4>사진 이미지를 등록해주세요!(최대5개까지 가능)</h4>
			        <div>
			<img src="resources/images/${getPhoto.photo_image1}">
		</div>
		<div>${getPhoto.photo_image2}</div>
		<div>${getPhoto.photo_image3}</div>
		<div>${getPhoto.photo_image4}</div>
		<div>${getPhoto.photo_image5}</div>

		<div>
			<div class="form-group file-group" id="file-list">
				<c:set var="number" value="1" />
				<c:forEach items="${imageList}" var="file">
					<div class="file-input">

						<c:if test="${file != null }">
							<img src="${upPath}/${file}" width="50" height="50">
							<br>
										${file} 
										<c:if test="${dto.del eq 'N' }">
								<a href='#this' name='file-delete'>삭제</a>
							</c:if>
							<input type="hidden" name="photo_image${number}" value="${file}">
						</c:if>
					</div>
					<c:set var="number" value="${number+1}" />
				</c:forEach>
			</div>
			<c:if test="${dto.del eq 'N' }">
				<div id="attachFileDiv">
					<div id="file0">
						<input type="file" id="file_img0" name="file_img0" value="" size="20" onchange="javascript:attachFile.add(0)">
					</div>
				</div>
			</c:if>
		</div>

		<div id="attachFileDiv">
			<div id="file0">
				<input type="file" id="file_img0" name="file_img0" value="" size="20" onchange="attachFile.add(0)">
			</div>
		</div>
		<div id="image-preview" class="image-preview"></div>
	</div>
			        <div>
			         <input type="submit"  value = "등록">
					 <input type="button"  onclick="javascript:hitory.back()" value = "취소">	
			          </div>
			          
			           </div>			            
			       </div>
			       </form>				    			            
			</div>
		</div>		
	</div>
	

</body>
</html>