<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

   <div class=" text-center"> <h1 class="page-header">MY TRUCK</h1> </div>
    <a href="${pageContext.request.contextPath}/afterLogin_mypage/foodtruck" >푸드트럭 상세보기</a>
    <div class="_40h7m" >
    <form class="form-signin" action="${pageContext.request.contextPath}/afterLogin_mypage/showMyfoodtruck.do" method="post" enctype="multipart/form-data">
    <div class="_ljqf0 col-lg-12">
    		<div  class="col-lg-6" style="margin-right: 5px">
    		<button id="profileBtn" type="button" onclick=document.all.file.click();>
    			<img id="profileImg"  src="${pageContext.request.contextPath}/resources/upload/${truckVO.fileVO.filepath}">
    		</button>
		<input type="file" name="file" id="file" style="display: none;" /> 
		</div>
				<div class="col-lg-6">
					<h1>${sessionScope.memberVO.id }</h1>
				</div>
		</div>
 		<br><BR>
    	<div>
    		<aside>
    			<label for="foodtruckName">이름</label>
    		</aside>
    		<div>
    				<input type="text" name="foodtruckName" placeholder="푸드트럭 이름을 입력해주세요" class="form-control" value="${truckVO.foodtruckName}">
    		</div>
    	</div>
    	<div>
    		<aside>
    			<label for="foodtruck">푸드트럭 넘버</label>
    		</aside>
    		<div>
    				<input type="text" name="foodtruckNumber" placeholder="푸드트럭 넘버를 입력해주세요" class="form-control" value="${truckVO.foodtruckNumber}">
    		</div>
    	</div>
    	<div>
    		<aside>
    			<label for="foodtruck">푸드트럭 소개</label>
    		</aside>
    		<div>
    				<textarea rows="4" cols="50"  name="introduction" placeholder="푸드트럭을 소개해주세요!" style="resize: none;" class="form-control" >${truckVO.introduction}</textarea>
    		</div>
    	</div>
	<br>
     <aside>
    			<label for="foodtruckName">메뉴1</label>
    		</aside>
    		<div>
    				<input type="text" name="foodList[0].menuName"  placeholder="음식명을 입력해주세요" class="form-control" value="${truckVO.foodList.menuName}">
    				<input type="text"  name="foodList[0].menuPrice"  placeholder="가격을 입력해주세요" class="form-control" value=" ${truckVO.foodList.menuPrice}">
	    			<input type="file" name="foodList[0].menuFile">
    		</div>
    		   <aside>
    			<label for="foodtruckName">메뉴2</label>
    		</aside>
    		<div>
    				<input type="text" name="foodList[1].menuName" placeholder="음식명을 입력해주세요" class="form-control">
    				<input type="text"  name="foodList[1].menuPrice"  placeholder="가격을 입력해주세요" class="form-control">
	    			<input type="file" name="foodList[1].menuFile">
    		</div>
    		   <aside>
    			<label for="foodtruckName">메뉴3</label>
    		</aside>
    		<div>
    				<input type="text" name="foodList[2].menuName"   placeholder="음식명을 입력해주세요" class="form-control">
    				<input type="text" name="foodList[2].menuPrice"  placeholder="가격을 입력해주세요" class="form-control">
	    			<input type="file" name="foodList[2].menuFile">
    		</div>
    		<br><br>
    		<input type="submit" value="등록"> 
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
          alert(this.value); //선택한 이미지 경로 표시
          readURL(this);
      });
   });

</script>

