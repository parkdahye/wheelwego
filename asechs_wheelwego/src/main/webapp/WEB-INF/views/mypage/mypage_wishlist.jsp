<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %> 

<style>
 .container-fluid {
      padding: 40px 50px 30px 40px;
  }
  .bg-grey {
      background-color: #f6f6f6;
  }
  .thumbnail {
      padding: 0 0 15px 0;
      border: 1px solid light grey;
      height:280px;
      position: relative;
      display: block;
  }
  .thumbnail img {
     /*  width: 100%;
      height:100%; */
      margin-bottom: 10px;
      
  }
  .col-sm-6{
  width: 50%;
  height: 300px;
  }
/*   img:hover {
    opacity: 0.5;
    filter: alpha(opacity=50); /* For IE8 and earlier */
} */
</style>

<div class=" text-center"> <h1 class="page-header">MY Page</h1> </div>
<div align="center">
  <button type="button" id="deleteAccountBtn" class="btn btn-warning">회원탈퇴</button>&nbsp;&nbsp;
  <button type="button" id="updateBtn" class="btn btn-warning">회원정보수정</button>&nbsp;&nbsp;
   <button type="button" id="wishlistBtn"class="btn btn-warning">단골트럭</button>&nbsp;&nbsp;
<button type="button" id="reviewBtn"class="btn btn-warning">MY REVIEW</button>&nbsp;&nbsp;
</div>
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

<br><br>

<div class="row">
<div class="container col-sm-12">
<c:choose>
<c:when test="${fn:length(wishlist.truckList) != 0}">
  <c:forEach items="${wishlist.truckList}" var="wishList">
      <div class="w3-third col-sm-4" >    
         <div class="w3-one" align="center">
            <a href="${pageContext.request.contextPath}/foodTruckAndMenuDetail.do?foodtruckNo=${wishList.foodtruckNumber}">
               <img height="250px" width="260px" src="${pageContext.request.contextPath}/resources/upload/${wishList.fileVO.filepath}" style="position:relative;  z-index: 1; ">
                </a>
                  <input  type="image" id="insertBtn" name = "${wishList.foodtruckNumber}" src = "${pageContext.request.contextPath}/resources/upload/hearton.png" 
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

<p class="paging text-center">
	<c:set var="pb" value="${requestScope.wishlist.pagingBean}"></c:set>
	<!-- 
			step2 1) 이전 페이지 그룹이 있으면 이미지 보여준다. (img/left_arrow_btn.gif)
				   		페이징빈의 previousPageGroup 이용 
				   2)  이미지에 이전 그룹의 마지막 페이지번호를 링크한다. 
				   	    hint)   startPageOfPageGroup-1 하면 됨 		 
	 -->      
	<c:if test="${pb.previousPageGroup}">
	<a href="${pageContext.request.contextPath}/afterLogin_mypage/wishlist.do?pageNo=${pb.endPageOfPageGroup-1}&id=${pb.customerId}">◀&nbsp; </a>
	</c:if>
	<!-- step1. 1)현 페이지 그룹의 startPage부터 endPage까지 forEach 를 이용해 출력한다
				   2) 현 페이지가 아니면 링크를 걸어서 서버에 요청할 수 있도록 한다.
				      현 페이지이면 링크를 처리하지 않는다.  
				      PagingBean의 nowPage
				      jstl choose 를 이용  
				      예) <a href="list.do?pageNo=...">				   
	 -->		
	<c:forEach var="i" begin="${pb.startPageOfPageGroup}" end="${pb.endPageOfPageGroup}">
	<c:choose>
	<c:when test="${pb.nowPage!=i}">
	<a href="${pageContext.request.contextPath}/afterLogin_mypage/wishlist.do?pageNo=${i}&id=${pb.customerId}">${i}</a> 
	</c:when>
	<c:otherwise>
	${i}
	</c:otherwise>
	</c:choose>
	&nbsp;
	</c:forEach>	 
	<!-- 
			step3 1) 다음 페이지 그룹이 있으면 이미지(img/right_arrow_btn.gif) 보여준다. 
				   		페이징빈의 nextPageGroup 이용 
				   2)  이미지에 이전 그룹의 마지막 페이지번호를 링크한다. 
				   	    hint)   endPageOfPageGroup+1 하면 됨 		 
	 -->   
	<c:if test="${pb.nextPageGroup}">
	<a href="${pageContext.request.contextPath}/afterLogin_mypage/wishlist.do?pageNo=${pb.endPageOfPageGroup+1}&id=${pb.customerId}">${i}</a>
	<a href="${pageContext.request.contextPath}/afterLogin_mypage/wishlist.do?pageNo=${pb.endPageOfPageGroup+1}&id=${pb.customerId}">▶</a>
	<!-- <img src="img/right_arrow_btn.gif"> -->
	</c:if>
</p>

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
			location.href="${pageContext.request.contextPath}/afterLogin_mypage/wishlist.do?id=${sessionScope.memberVO.id}";
		});
		$("#reviewBtn").click(function(){
			location.href="${pageContext.request.contextPath}/afterLogin_mypage/showMyReviewList.do?customerId=${sessionScope.memberVO.id}";
		});
  });
</script>
 
 
 
 
 
 
 
 