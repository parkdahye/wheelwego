<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 

<script>
$(document).ready(function(){
	$("input#clearBtn").click(function(){
		  var foodtruckNumber = $(this).attr('name');
		  var id = "${sessionScope.memberVO.id}";
		  
		  if(confirm("즐겨찾기를 해제하시겠습니까?") == false) {
                return false;
		  }		  
		  	
	      $.ajax({
	          type:"POST",
	          url:"${pageContext.request.contextPath}/afterLogin_mypage/deleteWishList.do",
	          data : {id: id, foodtruckNumber: foodtruckNumber} ,
	          success:function(data){
	        	  location.reload();
	          },
	          error:function(request,status,error){
	              alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
	          }
	       });
	});	
});
</script>
    

<div class="col-sm-12" >
     <!--  <div class="flip-container"
               ontouchstart="this.classList.toggle('hover');" style="margin: 0 auto;"> -->
        		
      		<c:forEach items="${requestScope.wishlist}" var="wishList">
      		<div class="col-sm-4">
      		<div style="position:relative;">
			 <a href="${pageContext.request.contextPath}/foodTruckAndMenuDetail.do?foodtruckNo=${wishList.foodtruckNumber}"><img height="250px" width="260px" src="${pageContext.request.contextPath}/resources/upload/${wishList.fileVO.filepath}" style="position:absoulte;  z-index: 2; "></a>
			 	<div class='overlay'><div class='overlaytext'>
								<h4>${wishList.foodtruckName}</h4>
								판매자&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;${wishList.sellerId}<br>
								푸드트럭소개&nbsp;&nbsp;&nbsp;${wishList.introduction}<br>
								</div>
								</div>
			 	<input  type="image" id="clearBtn" name = "${wishList.foodtruckNumber}" src = "${pageContext.request.contextPath }/resources/img/hearton.png" 
			 	style=" position:absolute; width: 45px; top : 10px; cursor:pointer; opacity: 0.8; z-index: 1;" >
			 </div>
			 </div>	
			 	<%-- 	<input type='hidden' name='id' value='${sessionScope.memberVO.id}'/>  --%> 
       		</c:forEach>
        		</div>  		
<!--       <div style="position: absolute; margin-left: 10px; margin-top: 10px;">
      		
      </div> -->
      <!-- row -->
      <hr>
  
   <!-- container -->


<%--    <c:forEach items="${sessionScope.wishlistVO.customer_id.wishlist}" var="wishlist">
   </c:forEach>
 --%>
<%--  <c:forEach items="${requestScope.wishlist }" var="wishlist">
 	${wishlist.trucknumber }
 </c:forEach> --%>
<%--  <table>
 	<thead>
 		<tr>
 			<th>트럭번호</th>
 			<th>회원아이디</th>
 		</tr>
 	</thead>
 	<tbody>
 		<c:forEach items="${requestScope.wishlist }" var="wishlist">
 		<tr>
 			<td>${wishlist.foodtruckNumber }</td>
 			<td>${wishlist.customerId }</td>
 		</tr>
 		</c:forEach>
 	</tbody>
 </table>
  --%>
     
<%-- <input id="search" type="image" src="${pageContext.request.contextPath }/resources/img/foodtruck/hearton.png" style="width: 45px; opacity: 0.8;" onclick="test();"> --%>
<%-- <div>
	<c:forEach items="${requestScope.wishlist }" var="wishList">
	${wishList.foodtruckNumber}
    <div style="position: absolute;">
        <a href="${pageContext.request.contextPath }/afterLogin_foodtruck/foodtruck_detail.do">
                
		<img src="${pageContext.request.contextPath }/resources/upload/${truckVO.fileVO.filepath}" >
		</a>
    </div>
    <div style="position: absolute; margin-left: 10px; margin-top: 10px;">
    	<form method="post" action="${pageContext.request.contextPath}/afterLogin_mypage/deleteWishList.do" id="delForm">
	        <div style="position: relative; top: 5px; left: 5px;">
	        <input  TYPE="IMAGE" src="${pageContext.request.contextPath }/resources/img/foodtruck/hearton.png" style="width: 45px; opacity: 0.8;" name="Submit" value="Submit" >
	        </div>
	        <input type='hidden' name='foodTruckNumber' value='${wishList.foodtruckNumber}'/>
	        <input type='hidden' name='id' value='${sessionScope.memberVO.id}'/>    	
    	</form>
    </div>
	</c:forEach>
</div> --%>
 
 
 
 
 
 
 
 
 
 
 
 
 
 