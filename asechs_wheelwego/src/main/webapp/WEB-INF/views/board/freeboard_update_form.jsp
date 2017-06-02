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
  <head> 
<meta charset="utf-8"> 
<meta http-equiv="X-UA-Compatible" content="IE=edge"> 
<meta name="viewport" content="width=device-width, initial-scale=1"> 
<!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags --> 
<title>글쓰기</title> 

<!-- Bootstrap --> 
<link href="css/bootstrap.min.css" rel="stylesheet"> 

<!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries --> 
<!-- WARNING: Respond.js doesn't work if you view the page via file:// --> 
<!--[if lt IE 9]> 
<script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script> 
<script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script> 
<![endif]--> 
</head> 
<body> 

<!-- jQuery (necessary for Bootstrap's JavaScript plugins) --> 
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script> 
<!-- Include all compiled plugins (below), or include individual files as needed --> 
<script src="js/bootstrap.min.js"></script> 


<div class="panel panel-default"> 
<!-- Default panel contents --> 
<div class="panel-heading"><h3>자유게시판 수정하기</h3></div> 

<div class="panel-body">

<div class="container"> 
<form action="" method="post">  

	<form role="form"> 
	
	<div class="row"> 
		<div class="col-md-6">
		<div class="form-group"> 
		<label for="name">NAME</label> 
		<input type="text" class="form-control" name="name" id="name" placeholder="Enter name"> 
		</div> 
		</div> 
		
		
		
		<div class="col-md-6"> 
		<div class="form-group"> 
		<label for="pass">Password</label> 
		<input type="password" class="form-control" name="pass" id="pass" placeholder="Enter password"> 
		</div> 
		</div> 
	</div> 
	
	
	<div class="form-group"> 
	<label for="email">Email address</label> 
	<input type="email" class="form-control" name ="email" id="email" placeholder="Enter email"> 
	</div> 
	
	
	<div class="form-group"> 
	<label for="subject">Title</label> 
	<input type="text" class="form-control" name ="subject" id="subject" placeholder="Enter title"> 
	</div>  
	
	
	<div class="form-group"> 
	<label for="content">Comment:</label> 
	<textarea class="form-control" rows="10" name="content" id="content"></textarea> 
	
	</div> 
	
	<div class="form-group"> 
	<label for="File">File input</label> 
	<input type="file" id="File"> 
	</div> 
	
	
	<div class="center-block" style='width:200px'> 
	<input type="submit" value="저장하기">
	<input type="reset" value="다시쓰기">
	<input type="button" value="취소" onclick=""></div> 
	
	</form> 
</form> 


</div> 
</div> <!--panel end--> 
</div> 

</div> 
</body> 

