<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<style>
img{
    border-radius: 8px;
}
.overlay{
	border-bottom-left-radius: 8px;
	border-bottom-right-radius: 8px;
}
</style>
<jsp:include page="../mypage/mypage.jsp"/>
<br><br>

<div class="row">
 <div class="container col-sm-12">
  <c:choose>
<c:when test="${requestScope.wishlist!='[]'}">  
      <c:forEach items="${requestScope.wishlist}" var="wishList">
      <div class="w3-third col-sm-4" >    
         <div class="w3-one" align="center">
            <a href="${pageContext.request.contextPath}/foodTruckAndMenuDetail.do?foodtruckNo=${wishList.foodtruckNumber}">
               <img height="250px" width="260px" src="${pageContext.request.contextPath}/resources/upload/${wishList.fileVO.filepath}" style="position:relative;  z-index: 1; ">
                </a>
                  <input  type="image" id="insertBtn" name = "${wishList.foodtruckNumber}" src = "${pageContext.request.contextPath }/resources/upload/hearton.png" 
                      style="right:40px;opacity: 0.8; z-index: 2;" >
               <div class="overlay" >
                  <div class="txtOverLay">
                     <h4>${wishList.foodtruckName}</h4>
                  </div>
               </div>
            </div>
          </div>
             </c:forEach>
  </c:when>
        <c:otherwise>
         등록된 단골트럭이 없습니다.
      </c:otherwise>
   </c:choose>
</div>
</div>

 <script>
$(document).ready(function(){
   $("input#insertBtn").click(function(){
        var foodtruckNumber = $(this).attr('name');
        var id = "${sessionScope.memberVO.id}";
        
        if(confirm("즐겨찾기를 해제하시겠습니까?") == false) {
                return false;
        }        
           
         $.ajax({
             type:"POST",
             url:"${pageContext.request.contextPath}/afterLogin_mypage/deleteWishList.do",
             data : {id: id, foodtruckNumber: foodtruckNumber} ,
             success:function(data){
                location.reload();
             },
             error:function(request,status,error){
                 alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
             }
          });
   });   
});


</script>
 
 
 
 
 
 
 
 