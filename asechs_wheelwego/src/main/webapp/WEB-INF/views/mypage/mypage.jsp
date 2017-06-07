<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


   <div class=" text-center"> <h1 class="page-header">MY Page</h1> </div>
   <div align="center">
  <button type="button" id="deleteAccountBtn" class="btn btn-warning">회원탈퇴</button>&nbsp;&nbsp;
  <button type="button" id="updateBtn" class="btn btn-warning">회원정보수정</button>&nbsp;&nbsp;

<c:choose>
	<c:when test="${sessionScope.memberVO.memberType=='seller'}">
		<c:choose>
			<c:when test="${truckNumber==null }">
				<button type="button" id="registerTruckBtn"=class="btn btn-warning">MY TRUCK 등록</button>&nbsp;&nbsp;
			</c:when>
			<c:otherwise>
			<button type="button" id="updateTruckBtn"class="btn btn-warning">MY TRUCK 설정</button>&nbsp;&nbsp;
			<button type="button" id="menuBtn"class="btn btn-warning">MENU</button>&nbsp;&nbsp;
			<button type="button" id="myTruckBtn"class="btn btn-warning">MY TRUCK PAGE</button>&nbsp;&nbsp;
			</c:otherwise>
		</c:choose>
	</c:when>
	<c:otherwise>
				<button type="button" id="wishlistBtn"class="btn btn-warning">단골트럭</button>&nbsp;&nbsp;
			<button type="button" id="reviewBtn"class="btn btn-warning">MY REVIEW</button>&nbsp;&nbsp;
	</c:otherwise>
</c:choose>
</div>
<script>
function checkDelete(){
	if (confirm("정말 탈퇴하시겠습니까?") == true){    //확인
	    return true;
	}else{   //취소
	    return false;
	}
}

$(document).ready(function(){
		$("#deleteAccountBtn").click(function(){
			if(confirm("계정을 삭제하시겠습니까?")){
				location.href="${pageContext.request.contextPath}/afterLogin_mypage/checkPasswordForm.do?command=deleteAccount";
			}
		});
		$("#updateBtn").click(function(){
				location.href="${pageContext.request.contextPath}/afterLogin_mypage/checkPasswordForm.do?command=update_form";
		});
		$("#registerTruckBtn").click(function(){
			location.href="${pageContext.request.contextPath}/afterLogin_mypage/registerMyfoodtruck.do";
	});
		$("#updateTruckBtn").click(function(){
			location.href="${pageContext.request.contextPath}/afterLogin_mypage/myfoodtruck_page.do";
	});
		$("#menuBtn").click(function(){
			location.href="${pageContext.request.contextPath}/afterLogin_mypage/myfoodtruck_menuList.do";
	});
		$("#myTruckBtn").click(function(){
			location.href="${pageContext.request.contextPath}/afterLogin_mypage/showMyFoodtruck.do?id=${sessionScope.memberVO.id}";
	});
		$("#wishlistBtn").click(function(){
			location.href="${pageContext.request.contextPath}/afterLogin_mypage/wishlist.do";
	});
		$("#reviewBtn").click(function(){
			location.href="${pageContext.request.contextPath}/afterLogin_mypage/showMyReviewList.do?customerId=${sessionScope.memberVO.id}";
	});
});
</script>