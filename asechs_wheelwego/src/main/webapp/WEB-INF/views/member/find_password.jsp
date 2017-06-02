<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<div class="container col-xs-3">
  <form class="form-group" id="find_id_form">
  
    <div class="form-group">
      <label for="id">ID</label>
      <input type="text" class="form-control" id="id" placeholder="Enter your ID" name="id" autofocus>
    </div>
    <div class="form-group">
      <label for="memberName">Name</label>
      <input type="text" class="form-control" id="memberName" placeholder="Enter your name" name="memberName">
    </div>
    <div class="form-group">
      <label for="phoneNumber">Phone Number</label>
      <input type="text" class="form-control" id="phoneNumber" placeholder="Enter your phoneNumber" name="phoneNumber">
    </div>
        <div class="form-group">
      <label for="password">새로운 비밀번호</label>
      <input type="password" class="form-control" id="password" placeholder="Enter your new password" name="password">
    </div>
    <input type="button" class="btn btn-primary" id="findpwBtn" value="새 비밀번호 설정하기">
  </form>
</div>

<div class="form-group">
      <div class="col-sm-10">
        <p class="form-control-static" id="result_id"></p>
      </div>
    </div>
    
    
    <script type="text/javascript">
$(document).ready(function(){
   $("#findpwBtn").click(function(){

      var id=$("#id").val();
	  var name=$("#memberName").val();
	  var tel = $("#phoneNumber").val();
	  var pw = $("#password").val();
	  
	  
/*       var id=$(":input[name=id]").val();
      var name=$(":input[name=memberName]").val();
      var tel = $(":input[name=phoneNumber]").val();
      var pw = $(":input[name=password]").val(); */

      
      alert(id + " " + name + " " + tel + " " + pw + " ")
       $.ajax({
            type:"POST",
            url:"${pageContext.request.contextPath}/forgetMemberPassword.do",            
            data:"id="+id+"&memberName="+name+"&phoneNumber="+tel+"&password="+pw, 
            success:function(result){    
               if(result==0){

                  alert(result);

                  alert("일치하는 정보가 없습니다. 다시 입력해주세요.");
                    $('form').each(function(){
                         this.reset();
                       });
                    $(":input[name=id]").focus();
               }
               else{

            	   alert("비밀번호가 성공적으로 변경되었습니다. 다시 로그인해주세요.");
            	   location.href="${pageContext.request.contextPath}/home.do";
              	 }
               }
            })//ajax                    
   }); // click
}); // ready
</script>