<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/board.css" type="text/css">
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<script>
	$(document).ready(function(){
		// 목록으로 가기
		$("#boardListBtn").click(function()	{
			location.href="${pageContext.request.contextPath}/freeboard_list.do";
		})// 목록버튼 끝
		$("#modifyBtn").click(function()	{
			location.href="${pageContext.request.contextPath}/freeboard_update_form.do?no="+${requestScope.detail_freeboard.no};
		})// 수정버튼 끝
		$("#deleteBtn").click(function()	{
			var info=confirm("게시물을 삭제합니까?");
			if(info){				
			location.href="${pageContext.request.contextPath}/freeboardDelete.do?no="+${requestScope.detail_freeboard.no};
			}else{
			}
		})// 삭제버튼 끝
	})//ready
</script>
<table class="content">
	<tr>
			<td>NO : ${requestScope.detail_freeboard.no}</td>
			<td colspan="2"><input type="text" name="title" value="${requestScope.detail_freeboard.title }" required="required"></td>
		</tr>
		 <tr>
			<td>작성자 :  <input type="text" name="id" value="${requestScope.detail_freeboard.id }" readonly="readonly"></td>
			<td> ${requestScope.detail_freeboard.timePosted}</td>
			<td>조회수 : ${requestScope.detail_freeboard.hits}</td> 
		</tr>
		<tr>
			<td colspan="3">
			<textarea  name="content" required="required">"${requestScope.detail_freeboard.content }"</textarea>
			</td> 
		</tr>
		<tr>
			<td valign="middle" align="center" colspan="3">
			<button type="button" class="btn btn-info"  id="boardListBtn">목록</button>
			 <button type="button" class="btn btn-info"  id="modifyBtn">수정</button>
			 <c:if test="${requestScope.detail_freeboard.id==sessionScope.memberVO.id}">
			<button type="button" class="btn btn-info"  id="deleteBtn">삭제</button>
			<%-- login 적용 시 위로 두칸 올린다 --%>
			 </c:if>
			 <br><br>		
			 </td>
		</tr>
	</table>

