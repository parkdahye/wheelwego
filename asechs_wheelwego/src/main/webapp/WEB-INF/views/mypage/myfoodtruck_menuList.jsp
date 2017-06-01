<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        <div class="_40h7m" >
        <c:choose>
        	<c:when test="${menuList!='[]'}">
       <form class="menuForm" method="post" action="${pageContext.request.contextPath}/afterLogin_mypage/updateMenu.do" enctype="multipart/form-data">
        	<c:forEach items="${menuList}" var="foodVO" begin="0" end="2" varStatus="status">
        <table style="border: none; padding: 15px">
         	<tr>
         		<td>대표 메뉴${foodVO.menuId}<input type="hidden" name="foodList[${status.index}].menuId" value="${foodVO.menuId}" required="required"></td>
         		<td><input type="text" name="foodList[${status.index}].menuName" class="menuName" placeholder="메뉴이름" value="${foodVO.menuName}" required="required"></td>
         		<td><input type="text" name="foodList[${status.index}].menuPrice" class="menuPrice"  placeholder="가격" value="${foodVO.menuPrice}" required="required"></td>
         		<td><input type="file" name="foodList[${status.index}].menuFile" class="menuFile" >
         		</td>
         		<td>
         			<img style="width: 40%" class="menuImg" alt="" src="${pageContext.request.contextPath}/resources/upload/${foodVO.fileVO.filepath}">
         		</td>
         		<td>
         			<button type="button" class="resetBtn">reset</button>
         		</td>
         	</tr>
         	</table>
         	</c:forEach>
         		<button type="submit" class="checkBtn">수정</button>
         	</form>
        	</c:when>
        	<c:otherwise>
         <form  class="menuForm" method="post" action="${pageContext.request.contextPath}/afterLogin_mypage/registerMenuList.do" enctype="multipart/form-data">
        	<table style="border: none; padding: 15px">
        		<tr>
        	 	<td>대표 메뉴</td>
         	  <td><input type="text" name="foodList[0].menuName" placeholder="메뉴이름" required="required"></td>
         		<td><input type="text" name="foodList[0].menuPrice" placeholder="가격" required="required"></td>
         		<td><input type="file" name="foodList[0].menuFile" required="required" class="menuFile"></td>
         		<td>
         			<img style="width: 40%" class="menuImg" alt="" src="${pageContext.request.contextPath}/resources/upload/defaultMenu.jpg">
         		</td>
         	</tr>
         		<tr>
         	<td>대표 메뉴</td>
         	  <td><input type="text" name="foodList[1].menuName" placeholder="메뉴이름" required="required"></td>
         		<td><input type="text" name="foodList[1].menuPrice" placeholder="가격" required="required"></td>
         		<td><input type="file" name="foodList[1].menuFile" required="required" class="menuFile"></td>
         		<td>
         			<img style="width: 40%" class="menuImg" alt="" src="${pageContext.request.contextPath}/resources/upload/defaultMenu.jpg">
         		</td>
         	</tr>
         		<tr>
         	<td>대표 메뉴</td>
         	  <td><input type="text" name="foodList[2].menuName" placeholder="메뉴이름" required="required"></td>
         		<td><input type="text" name="foodList[2].menuPrice" placeholder="가격" required="required"></td>
         		<td><input type="file" name="foodList[2].menuFile" required="required" class="menuFile"></td>
         		<td>
         			<img style="width: 40%" class="menuImg" alt="" src="${pageContext.request.contextPath}/resources/upload/defaultMenu.jpg">
         		</td>
         	</tr>
         
    			</table>
    			<button type="submit" class="checkBtn">등록</button>
    		</form>
        	</c:otherwise>
        </c:choose>
   </div>
   <br><br>
<script type="text/javascript">
	$(document).ready(function(){
	      function readURL(input,object) {
		  var menuImg=object.parent().parent().children().find(".menuImg");
	          if (input.files && input.files[0]) {
	              var reader = new FileReader(); //파일을 읽기 위한 FileReader객체 생성
	              reader.onload = function (e) {
	              //파일 읽어들이기를 성공했을때 호출되는 이벤트 핸들러
	                  menuImg.attr("src", e.target.result);
	                  //이미지 Tag의 SRC속성에 읽어들인 File내용을 지정
	                  //(아래 코드에서 읽어들인 dataURL형식)
	              }                   
	              reader.readAsDataURL(input.files[0]);
	              //File내용을 읽어 dataURL형식의 문자열로 저장
	          }
	      }//readURL()--

	      //file 양식으로 이미지를 선택(값이 변경) 되었을때 처리하는 코드
	      $(".menuFile").change(function(){
	          alert(this.value); //선택한 이미지 경로 표시
	          readURL(this,$(this));
	      });
	
		$(".resetBtn").click(function(){
			var menuName=$(this).parent().parent().children().find("input.menuName");
			var menuPrice=$(this).parent().parent().children().find("input.menuPrice");
			var menuFile=$(this).parent().parent().children().find("input.menuFile");
			menuName.val("");
			menuPrice.val("");
			menuFile.val("");
		});

	});
</script>