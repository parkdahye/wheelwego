<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
   <%-- 정호,호겸 창업게시판 상세보기 --%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<meta http-equiv="X-UA-Compatible" content="IE=edge"> 
<meta name="viewport" content="width=device-width, initial-scale=1"> 
<!-- Bootstrap --> 
<link href="css/bootstrap.min.css" rel="stylesheet"> 
<!-- jQuery (necessary for Bootstrap's JavaScript plugins) --> 
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script> 
<script src="js/bootstrap.min.js"></script> 
<script type="text/javascript">
	$(document).ready(function(){
		// 목록으로 가기
		$("#boardListBtn").click(function()	{
			location.href="${pageContext.request.contextPath}/business_list.do";
		})//수정버튼
		$("#modifyBtn").click(function()	{
			location.href="${pageContext.request.contextPath}/business_update_form.do?no="+${requestScope.detail_freeboard.no};
		})// 삭제버튼
		$("#deleteBtn").click(function()	{
			var info=confirm("게시물을 삭제합니까?");
			if(info){				
			location.href="${pageContext.request.contextPath}/businessDelete.do?no="+${requestScope.detail_freeboard.no};
			}else{
			}
		})// 삭제버튼 끝
	})//ready
</script> 
<div class="panel panel-default"> 
<div class="panel-heading"><h3>자유게시판 상세보기</h3></div> 
<div class="panel-body">
<div class="container"> 
<%-- 상세보기--%>
		<div class="row"> 
			<div class="col-md-3">
			<div class="form-group"> 
			<label for="name">글번호</label> 
			<input type="text" class="form-control" value="${requestScope.detail_freeboard.no}" readonly> 
			</div> 
			</div> 
			
			<div class="col-md-4"> 
			<div class="form-group"> 
			<label for="writer">작성자</label> 
			<input type="text" class="form-control"value="${requestScope.name.memberName}" readonly> 
			</div> 
			</div> 
		</div> 
		
		<%-- 글 제목   --%>
		<div class="col-md-8"> 
		<div class="form-group"> 
		<label for="title">글제목</label> 
		<input type="text" class="form-control" value="${requestScope.detail_freeboard.title }" readonly> 
		</div> </div>
		 
		 <%-- 글 내용--%>
		<div class="col-md-8"> 
		<div class="form-group"> 
		<label for="content">글내용</label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		<font size=2 >${requestScope.detail_freeboard.timePosted} &nbsp;&nbsp; 
		조회수 : ${requestScope.detail_freeboard.hits}</font>
		<textarea class="form-control" rows="10" readonly>${requestScope.detail_freeboard.content }</textarea> 
		</div></div><br><br><br><br><br>
		
		<%-- 사진 들어갈 공간 임시로 올림 --%>
		<div class="form-group,col-md-8"> 
		<img src="${pageContext.request.contextPath }/resources/img/truck.jpg" width="300px" height="200px">
		</div> 
		<%-- 목록, 수정 , 삭제 버튼  --%>
		<div class="center-block" style='width:400px'> 
		<button type="button" class="btn btn-info"  id="boardListBtn">목록</button>
			<%-- login 적용 시 위로 두칸 올린다 --%>
			 <button type="button" class="btn btn-info"  id="modifyBtn">수정</button>
			 <c:if test="${requestScope.detail_freeboard.id==sessionScope.memberVO.id}">
			<button type="button" class="btn btn-info"  id="deleteBtn">삭제</button>
			 </c:if>
			 </div> 
</div> 
</div> <!--panel end--> 
</div> 
    