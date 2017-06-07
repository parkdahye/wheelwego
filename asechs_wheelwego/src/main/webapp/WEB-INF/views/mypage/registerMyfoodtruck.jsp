<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
          <div class=" text-center"> <h1 class="page-header">MY TRUCK</h1> </div>
   <div align="center">
      <button type="button" id="deleteAccountBtn" class="btn btn-warning">회원탈퇴</button>&nbsp;&nbsp;
 	 <button type="button" id="updateBtn" class="btn btn-warning">회원정보수정</button>&nbsp;&nbsp;
 	<button type="button" id="updateTruckBtn"class="btn btn-warning">MY TRUCK 설정</button>&nbsp;&nbsp;
</div>	
     <div class="_40h7m" >
    <form id="registerForm" onsubmit="return checkProfile()" class="form-signin" 
     action="${pageContext.request.contextPath}/afterLogin_mypage/registerFoodtruck.do" method="post" enctype="multipart/form-data">
    <div class="_ljqf0 col-lg-12" >
    		<div  class="col-lg-12" style="margin-right: 5px" align="center">
    		<button id="profileBtn" type="button" onclick=document.all.file.click();>
    			<img id="profileImg" src="${pageContext.request.contextPath}/upload/defaultTruck.jpg">
    		</button>
		<input type="file" name="foodtruckFile" id="file" style="display: none;"/> 
		</div>
		</div>
 		<br><BR>
 		 		<div>
    		<aside>
    			<label for="foodtruckName">ID</label>
    		</aside>
    		<div>
    				<input type="text" name="" class="form-control" value="${sessionScope.memberVO.id }" readonly="readonly">
    		</div>
    	</div>
    	   <br>
    	<div>
    		<aside>
    			<label for="foodtruckName">이름</label>
    		</aside>
    		<div>
    				<input type="text" name="foodtruckName" placeholder="푸드트럭 이름을 입력해주세요" class="form-control" required="required">
    		</div>
    	</div>
    	<br>
    	<div>
    		<aside>
    			<label for="foodtruck">푸드트럭 넘버</label>
    		</aside>
    		<div>
    				<input type="text" name="foodtruckNumber" placeholder="푸드트럭 넘버를 입력해주세요" class="form-control" required="required">
    		</div>
    	</div>
    	<br>
    	<div>
    		<aside>
    			<label for="foodtruck">푸드트럭 소개</label>
    		</aside>
    		<div>
    				<textarea rows="4" cols="50"  name="introduction" placeholder="푸드트럭을 소개해주세요!" style="resize: none;" class="form-control" required="required"></textarea>
    		</div>
    	</div>
	<br><br>
	<div align="center">
	<input type="submit" id="registerBtn" class="btn btn-warning"   value="등록" >
	</div>
	</form>
	</div>
	<br><br>
	
	
	  <script type="text/javascript">
  $(document).ready(function(){
      function readURL(input) {
          if (input.files && input.files[0]) {
              var reader = new FileReader(); //파일을 읽기 위한 FileReader객체 생성
              reader.onload = function (e) {
              //파일 읽어들이기를 성공했을때 호출되는 이벤트 핸들러
                  $("#profileImg").attr("src", e.target.result);
                  //이미지 Tag의 SRC속성에 읽어들인 File내용을 지정
                  //(아래 코드에서 읽어들인 dataURL형식)
              }                   
              reader.readAsDataURL(input.files[0]);
              //File내용을 읽어 dataURL형식의 문자열로 저장
          }
      }//readURL()--

      //file 양식으로 이미지를 선택(값이 변경) 되었을때 처리하는 코드
      $("#file").change(function(){
          readURL(this);
      });

   });
  
  function checkProfile(){
    	  var file=$("#file").val();
    	  if(file==""){
	    		alert("프로필 사진을 설정해주세요");
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
});
</script>