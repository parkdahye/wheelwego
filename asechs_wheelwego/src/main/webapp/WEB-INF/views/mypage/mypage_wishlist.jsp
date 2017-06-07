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
<div class=" text-center"> <h1 class="page-header">MY Page</h1> </div>
<div align="center">
  <button type="button" id="deleteAccountBtn" class="btn btn-warning">회원탈퇴</button>&nbsp;&nbsp;
  <button type="button" id="updateBtn" class="btn btn-warning">회원정보수정</button>&nbsp;&nbsp;
   <button type="button" id="wishlistBtn"class="btn btn-warning">단골트럭</button>&nbsp;&nbsp;
<button type="button" id="reviewBtn"class="btn btn-warning">MY REVIEW</button>&nbsp;&nbsp;
</div>
<br><br>

<div class="row">
 <div class="container col-sm-12">
  <c:choose>
<c:when test="${requestScope.wishlist!='[]'}">  
      <c:forEach items="${requestScope.wishlist}" var="wishList">
      <div class="w3-third col-sm-4" >    
         <div class="w3-one" align="center">
            <a href="${pageContext.request.contextPath}/foodTruckAndMenuDetail.do?foodtruckNo=${wishList.foodtruckNumber}">
               <img height="250px" width="260px" src="${pageContext.request.contextPath}/upload/${wishList.fileVO.filepath}" style="position:relative;  z-index: 1; ">
                </a>
                  <input  type="image" id="insertBtn" name = "${wishList.foodtruckNumber}" src = "${pageContext.request.contextPath }/upload/hearton.png" 
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

   $(document).ready(function(){
      $("#deleteAccountBtn").click(function(){
         if(confirm("계정을 삭제하시겠습니까?")){
            location.href="${pageContext.request.contextPath}/afterLogin_mypage/checkPasswordForm.do?command=deleteAccount";
         }
      });
      $("#updateBtn").click(function(){
            location.href="${pageContext.request.contextPath}/afterLogin_mypage/checkPasswordForm.do?command=update_form";
      });
      $("#wishlistBtn").click(function(){
         location.href="${pageContext.request.contextPath}/afterLogin_mypage/wishlist.do";
   });
      $("#reviewBtn").click(function(){
         location.href="${pageContext.request.contextPath}/afterLogin_mypage/showMyReviewList.do?customerId=${sessionScope.memberVO.id}";
   });
});
</script>
 
 
 
 
 
 
 
 