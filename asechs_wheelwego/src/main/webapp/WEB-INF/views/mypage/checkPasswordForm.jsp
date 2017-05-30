<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core" prefix="c" %>

<script type="text/javascript">
$(document).ready(function(){
   

});

function checkPwForm_submit(){
    //세션 password와 입력하는 password 비교
    if($("#passwordPre").val() != '1234'){
       alert("비밀번호가 일치하지 않습니다.");
       return false;
    }
}
</script>
<form action="${pageContext.request.contextPath}/afterLogin_mypage/${param.command}.do" onsubmit="return checkPwForm_submit()">
   패스워드 <input type="password" name="password" id="passwordPre" size="10" required="required"><br>
   <input type="hidden" value="${param.command}">
   <input type="submit" value="확인">
</form>