<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
    
<%-- <input id="search" type="image" src="${pageContext.request.contextPath }/resources/img/foodtruck/hearton.png" style="width: 45px; opacity: 0.8;" onclick="test();"> --%>
<div>
	<c:forEach items="${requestScope.wishlist }" var="wishList">
	${wishList.foodtruckNumber}
    <div style="position: absolute;">
        <a href="${pageContext.request.contextPath }/afterLogin_foodtruck/foodtruck_detail.do">
		<img src="${pageContext.request.contextPath }/resources/img/foodtruck/${wishList.foodtruckFilepath }" >
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
</div>
 
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
 
 
 
 
 
 
 
 
 
 
 
 
 
 