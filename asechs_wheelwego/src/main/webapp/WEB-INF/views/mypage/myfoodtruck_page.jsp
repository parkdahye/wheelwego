<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

   <div class=" text-center"> <h1 class="page-header">MY TRUCK</h1> </div>
    <a href="${pageContext.request.contextPath}/afterLogin_mypage/foodtruck" >푸드트럭 상세보기</a>
    <div class="_40h7m" >
    <form class="form-signin" action="${pageContext.request.contextPath}/afterLogin_mypage/showMyfoodtruck.do" method="post" enctype="multipart/form-data">
    <div class="_ljqf0 col-lg-6">
    
 
   	<p id="status">File API & FileReader API not supported</p>
    		<button>
    			<div id="holder"></div>

    		</button>

				<input type="file" id="profileImg" name="truckFile">
				<div class="" id="holder"></div>
				<div class="col-lg-6">
					<h1>${sessionScope.memberVO.id }</h1>
				</div>
		</div>
 
    	<div>
    		<aside>
    			<label for="foodtruckName">이름</label>
    		</aside>
    		<div>
    				<input type="text" name="foodtruckName" placeholder="푸드트럭 이름을 입력해주세요" class="form-control">
    		</div>
    	</div>
    	<div>
    		<aside>
    			<label for="foodtruck">푸드트럭 넘버</label>
    		</aside>
    		<div>
    				<input type="text" name="foodtruckNumber" placeholder="푸드트럭 넘버를 입력해주세요" class="form-control">
    		</div>
    	</div>
    	<div>
    		<aside>
    			<label for="foodtruck">푸드트럭 소개</label>
    		</aside>
    		<div>
    				<input type="text" name="introduction" placeholder="푸드트럭을 소개해주세요!" class="form-control">
    		</div>
    	</div>

     <aside>
    			<label for="foodtruckName">메뉴1</label>
    		</aside>
    		<div>
    				<input type="text" name="foodList[0].menuName"  placeholder="음식명을 입력해주세요" class="form-control">
    				<input type="text"  name="foodList[0].menuPrice"  placeholder="가격을 입력해주세요" class="form-control">
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
    		<input type="submit"> 
   </form>
   </div>
   <br><br>
   
   
<script>
var upload = document.getElementById('profileImg'),
    holder = document.getElementById('holder'),
    state = document.getElementById('status');

if (typeof window.FileReader === 'undefined') {
  state.className = 'fail';
} else {
  state.className = 'success';
  state.innerHTML = 'File API & FileReader available';
}
 
upload.onchange = function (e) {
  e.preventDefault();

  var file = upload.files[0],
      reader = new FileReader();
  reader.onload = function (event) {
    var img = new Image();
    img.src = event.target.result;
    // note: no onload required since we've got the dataurl...I think! :)
    if (img.width > 560) { // holder width
      img.width = 560;
    }
    holder.appendChild(img);
  };
  reader.readAsDataURL(file);

  return false;
};
</script>