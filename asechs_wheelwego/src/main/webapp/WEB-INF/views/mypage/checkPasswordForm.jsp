<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core" prefix="c" %>
<script type="text/javascript">
$(document).ready(function(){
	$("#inputForm").click(function(){
		  var id= "${sessionScope.memberVO.id}";
		  var password=$("#password").val();
		  
	      $.ajax({
	          type:"POST",
	          url:"${pageContext.request.contextPath}/getMemberPasswordAjax.do",  	          
	          data : {id: id, password: password} , 
	          success:function(data){
	        	  if (data == "ok")
	        		  $("#checkPwForm").submit();
	        	  else
	        	  {
	        		  alert("비밀번가 일치하지 않습니다!");
	        		  $("#password").val("");
	        		  $("#password").focus();
	        		  return;  
	        	  }
	          }
	       });//ajax  
	});
});
	
	
	
   /* $("#inputForm").submit(function(){

	  	  

   }); // click 
}); // ready*/
</script>

<form method="post" action="${pageContext.request.contextPath}/mypage/update_form.do" id="checkPwForm">
   패스워드 확인 <input type="password" name="password" id="password" size="10" required="required"><br>
   <input type="hidden" value="${param.command}">
   <input type="button" value="확인" id = "inputForm">
</form>