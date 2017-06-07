<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<script>
function checkDelete(){
	if (confirm("정말 탈퇴하시겠습니까?") == true){    //확인
	    return true;
	}else{   //취소
	    return false;
	}
}
</script>
<div class="container">
  <form action="${pageContext.request.contextPath}/afterLogin_mypage/checkPasswordForm.do" onsubmit="return checkDelete()">
  <input type="submit" value="회원탈퇴" class="btn btn-warning">
  <input type="hidden" name="command" value="deleteAccount"> 
  </form>
  <br>
  <form action="${pageContext.request.contextPath}/afterLogin_mypage/checkPasswordForm.do">
  <input type="submit" value="회원정보수정" class="btn btn-warning">
  <input type="hidden" name="command" value="update_form">
  </form>
  <br>
<c:choose>
	<c:when test="${sessionScope.memberVO.memberType=='seller'}">
		<c:choose>
			<c:when test="${truckNumber==null }">
				<a href="${pageContext.request.contextPath}/afterLogin_mypage/registerMyfoodtruck.do" class="btn btn-warning" role="button">MYTRUCK 등록</a><br>
			</c:when>
			<c:otherwise>
				<a href="${pageContext.request.contextPath}/afterLogin_mypage/myfoodtruck_page.do" class="btn btn-warning" role="button">MYTRUCK 설정</a><br>
				<a href="${pageContext.request.contextPath}/afterLogin_mypage/myfoodtruck_menuList.do" class="btn btn-warning" role="button">메뉴 관리</a><br>
				<a href="${pageContext.request.contextPath}/afterLogin_mypage/showMyfoodtruck.do" class="btn btn-warning" role="button">MYTRUCK 보기</a><br>
				<a href="${pageContext.request.contextPath}/afterLogin_mypage/checkTruckGPS.do?sellerId=${sessionScope.memberVO.id}" class="btn btn-warning" role="button">TRUCK 위치 설정</a><br>	
				<a href="">예약관리</a>
			</c:otherwise>
		</c:choose>
	</c:when>
	<c:otherwise>
		<a href="${pageContext.request.contextPath}/afterLogin_mypage/wishlist.do" class="btn btn-warning" role="button">단골트럭</a><br>
		<br>
		<a href="${pageContext.request.contextPath}/afterLogin_mypage/showMyReviewList.do?customerId=${sessionScope.memberVO.id}" class="btn btn-warning" role="button">My Review List</a>
	</c:otherwise>
</c:choose>
</div>
