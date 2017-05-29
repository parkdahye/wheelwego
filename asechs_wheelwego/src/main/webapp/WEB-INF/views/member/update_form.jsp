<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<form method="post" id="updateForm" action="${pageContext.request.contextPath}/updateMember.do">
아이디 : <input type="text" name="id" value="${sessionScope.memberVO.id}" readonly><br>
비밀번호 : <input type="password" name="password" required="required"><br>
이름 : <input type="text" name="memberName" value="${sessionScope.memberVO.memberName}" readonly="readonly"><br>
주소 : <input type="text" name="address" value="${sessionScope.memberVO.address}" required="required"><br>
폰번호 : <input type="text" name="phoneNumber" value="${sessionScope.memberVO.phoneNumber}" required="required"><br>
<c:if test="${sessionScope.memberVO.memberType=='1'}">
	사업자번호 : <input type="text" name="memebrType" value="${sessionScope.memberVO.memberType}" readonly><br>
</c:if>
<input type="submit" value="수정" name="updateBtn">   <input type="button" value="취소" name="cancelBtn">
</form>


<script type="text/javascript">
   $(document).ready(function(){
      $(":input[name=cancelBtn]").click(function(){
         if(confirm("회원 정보 수정을 취소하시겠습니까?")){
            location.href="${pageContext.request.contextPath}/home.do";
         }
      });
   });
</script>