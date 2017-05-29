<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- 회원 아이디 찾기 -->
<h2>아이디 찾기</h2>
<form method="post" action="${pageContext.request.contextPath}/findMemberId.do">
이름 : <input type="text" name="memberName"><br>
핸드폰 번호 : <input type="text" name="phoneNumber"><br>
<input type="submit" value="Search">
</form>
<hr>
<h2>비밀번호 찾기</h2>
<form method="post" action="${pageContext.request.contextPath}/findMemberPassword.do">
아이디 : <input type="text" name="id"><br>
이름 :   <input type="text" name="memberName"><br>
핸드폰 번호 : <input type="text" name="phoneNumber"><br>
<input type="submit" value="Search">
</form>