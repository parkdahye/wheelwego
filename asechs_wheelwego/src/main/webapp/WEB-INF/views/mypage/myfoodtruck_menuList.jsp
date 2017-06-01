<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        <div class="_40h7m" >
        <c:choose>
        	<c:when test="${menuList!='[]'}">
       <form method="post" action="${pageContext.request.contextPath}/afterLogin_mypage/updateMenuList.do" enctype="multipart/form-data">
        <table style="border: none; padding: 15px]">
        	<c:forEach items="${menuList}" var="foodVO" begin="0" end="2" varStatus="status">
         	<tr>
         		<td>대표 메뉴${foodVO.menuId}<input type="hidden" name="menuId" value="${foodVO.menuId }"></td>
         		<td><input type="text" name="foodList[${status.index}].menuName" placeholder="메뉴이름" value="${foodVO.menuName}"></td>
         		<td><input type="text" name="foodList[${status.index}].menuPrice" placeholder="가격" value="${foodVO.menuPrice}"></td>
         		<td><input type="file" name="foodList[${status.index}].menuFile">
         		</td>
         		<td>
         			<img style="width: 30%"alt="" src="${pageContext.request.contextPath}/resources/upload/${foodVO.fileVO.filepath}">
         		</td>
         		<td><button type="button">수정</button></td>
         		<td><button type="button">삭제</button></td>
         	</tr>
         	</c:forEach>
         	</table>
         	</form>
        	</c:when>
        	<c:otherwise>
         <form method="post" action="${pageContext.request.contextPath}/afterLogin_mypage/registerMenuList.do" enctype="multipart/form-data">
        	<table style="border: none; padding: 15px]">
        		<tr>
        	 	<td>대표 메뉴</td>
         	  <td><input type="text" name="foodList[0].menuName" placeholder="메뉴이름"></td>
         		<td><input type="text" name="foodList[0].menuPrice" placeholder="가격"></td>
         		<td><input type="file" name="foodList[0].menuFile"></td>
         	</tr>
         		<tr>
         	<td>대표 메뉴</td>
         	  <td><input type="text" name="foodList[1].menuName" placeholder="메뉴이름"></td>
         		<td><input type="text" name="foodList[1].menuPrice" placeholder="가격"></td>
         		<td><input type="file" name="foodList[1].menuFile"></td>
         	</tr>
         		<tr>
         	<td>대표 메뉴</td>
         	  <td><input type="text" name="foodList[2].menuName" placeholder="메뉴이름"></td>
         		<td><input type="text" name="foodList[2].menuPrice" placeholder="가격"></td>
         		<td><input type="file" name="foodList[2].menuFile"></td>
         	</tr>
         
    			</table>
    			<input type="submit" value="등록"> 
    		</form>
        	</c:otherwise>
        </c:choose>
   </div>
   <br><br>
