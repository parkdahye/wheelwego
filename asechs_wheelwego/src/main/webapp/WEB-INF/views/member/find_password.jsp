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
      <input type="text" class="form-control" id="phoneNumber" placeholder="Enter your Phone Number" name="phoneNumber">
    </div>
    <input type="button" class="btn btn-primary" id="findpwBtn" value="Find Password">
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
      var id=$(":input[name=id]").val();
      var name=$(":input[name=memberName]").val();
      var tel = $(":input[name=phoneNumber]").val();
       $.ajax({
            type:"POST",
            url:"${pageContext.request.contextPath}/forgetMemberPassword.do",            
            data:"id="+id+"&memberName="+name+"&phoneNumber="+tel, 
            success:function(result){    
               if(result==""){
                  alert("일치하는 정보가 없습니다. 다시 입력해주세요.");
                    $('form').each(function(){
                         this.reset();
                       });
                    $(":input[name=id]").focus();
               }
               else
                  $("#result_id").html("비밀번호는 "+ result + " 입니다.");   
               }
            })//ajax                    
   }); // click
}); // ready
</script>