<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    

<html>
<head>
<meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://getbootstrap.com/docs/5.2/assets/css/docs.css" rel="stylesheet">
    <title>Bootstrap Example</title>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
	<link rel="stylesheet" type= "text/css"  href="resources/css/photo_view.css" />
</head>
	<body>
		<br></br>
		<div class="container" >
		<div align = "right" >
		<input type="button" value = "뒤로가기" onclick="location.href='photo_main.do?=${memId.member_num}&id=${memId.id}'">
		</div>
		<div id="carouselExampleControls" class="carousel slide" data-bs-ride="carousel">
		  <div class="carousel-inner">
			    <div class="carousel-item active">
				      <img src="resources/images/${getPhoto.photo_image1}" class="d-block w-100" alt="...">
				</div>
				    <div class="carousel-item">
				    <c:if test = "${getPhoto.photo_image2 == null}">
				    	<img src="resources/images/no_image.png" class="d-block w-100" alt="...">
				    </c:if>
				   	 <c:if test = "${getPhoto.photo_image2 != null}">
				      <img src="resources/images/${getPhoto.photo_image2}" class="d-block w-100" alt="...">
				     </c:if>
				    </div>
				<div class="carousel-item">
					 <c:if test = "${getPhoto.photo_image3 == null}"	>
				     	<img src="resources/images/no_image.png" class="d-block w-100" alt="...">
				      </c:if>
				      <c:if test = "${getPhoto.photo_image3 != null}">
				      <img src="resources/images/${getPhoto.photo_image3}" class="d-block w-100" alt="...">
				     </c:if>
				    </div>
				<div class="carousel-item">
				      <c:if test = "${getPhoto.photo_image4 == null}"	>
				     	<img src="resources/images/no_image.png" class="d-block w-100" alt="...">
				      </c:if>
				      <c:if test = "${getPhoto.photo_image4 != null}">
				      <img src="resources/images/${getPhoto.photo_image4}" class="d-block w-100" alt="...">
				     </c:if>	      
				</div>
				<div class="carousel-item">
				 	<c:if test = "${getPhoto.photo_image5 == null}"	>
				     	<img src="resources/images/no_image.png" class="d-block w-100" alt="...">
				      </c:if>
				    <c:if test = "${getPhoto.photo_image5 != null}">
				      <img src="resources/images/${getPhoto.photo_image5}" class="d-block w-100" alt="...">
				    </c:if>		      
				</div>
		</div>
				  <button class="carousel-control-prev" type="button" data-bs-target="#carouselExampleControls" data-bs-slide="prev">
				    <span class="carousel-control-prev-icon" aria-hidden="true"></span>
				    <span class="visually-hidden">Previous</span>
				  </button>
				  <button class="carousel-control-next" type="button" data-bs-target="#carouselExampleControls" data-bs-slide="next">
				    <span class="carousel-control-next-icon" aria-hidden="true"></span>
				    <span class="visually-hidden">Next</span>
			  </button>
		</div>			
				
		</div>
	</body>
</html>