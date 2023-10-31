<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<%@ include file="world_main_top.jsp" %>
<!--  회원목록 -->
<div class="home_contents" style = "height: 540px; overflow-y : scroll;">
					<div>
					<div>
                     <c:set var="count" value="0" /> 
                  <c:if test ="${empty listMember}">
                  <div>
                     <font color ="black"> 회원이 존재하지 않습니다.</font>            
                  </div> 
                   </c:if>              
  		           <c:if test ="${not empty listMember }">
  		            <c:set var="count" value="0" />
     			   <c:forEach var="dto" items="${listMember}">
  		           
  		           <img src = "./resources/images/${dto.main_image1}" class = "profile_image1">
  		           <div>
  		           ${dto.id}
  		           </div>
  		           </c:forEach>
  		           </c:if>
  		           
  		           <c:set var="count" value="${count + 1}" />
         	 <c:if test="${count % 3 == 0}">
          	</c:if>
       
  		       </div>
  		     </div>

</div>
	</ul>
</html>
			


				

            
			  						
