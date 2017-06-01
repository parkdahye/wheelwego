<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
  <!-- 강정호 글쓰기 폼 작성 -->
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
<script type="text/javascript">
	$(document).ready(function(){
		$("#cancelBtn").click(function(){
			location.href="${pageContext.request.contextPath}/freeboard_list.do"
		});//취소버튼 작동
		
		
	});//ready
</script>

<div class="panel panel-default"> 
<!-- Default panel contents --> 
<div class="panel-heading"><h2>자유게시판 글쓰기</h2></div> 

<div class="panel-body">

<div class="container"> 
<form enctype="multipart/form-data" action="${pageContext.request.contextPath }/freeboard_write.do" method="post">  
		<div class="row"> 
			
			<div class="col-md-6"> 
			<div class="form-group"> 
			<label for="writer">작성자</label> 
			<input type="text" class="form-control" name="writer" id="writer" value="${sessionScope.memberVO.memberName }" readonly> 
			</div> 
			</div>
			<input type="hidden" id="id" name="id" value="${sessionScope.memberVO.id }">
		</div> 

		<div class="form-group"> 
		<label for="title">글제목</label> 
		<input type="text" class="form-control" name ="title" id="title" value="" required="required"> 
		</div>  
		
		<div class="form-group"> 
		<label for="content">글내용</label> 
		<textarea class="form-control" rows="10" name="content" id="content" required="required"></textarea> 
		</div> 
		
		<div class="form-group"> 
		<label for="File">첨부파일 1</label> 
		<input type="file" name="file[0]"> 
		</div> 
		<div class="form-group"> 
		<label for="File">첨부파일 2</label> 
		<input type="file" name="file[1]"> 
		</div> 
		<div class="form-group"> 
		<label for="File">첨부파일 3</label> 
		<input type="file" name="file[2]"> 
		</div> 
		
		<div class="center-block" style='width:200px'> 
		<input type="submit" value="등록하기">
		<input type="reset" value="다시쓰기">
		<input type="button" value="취소" id="cancelBtn"></div> 
</form> 


</div> 
</div> <!--panel end--> 
</div> 
</body> 


<!-- 기존에 서정우 선생님이 알려주신 글쓰기 폼 -->
<%-- <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/board.css" type="text/css">
  <form action="${pageContext.request.contextPath}/write.do" method="post" id="write_form">
   <table class="inputForm" >
    <caption>글쓰기</caption>
    <tbody>
    <tr>
     <td>제목</td>
     <td colspan="3">
     <input type="text" id="title" name="title" size="48">
     </td>
    </tr>
    <tr>
     <td>이름</td>
     <td>${sessionScope.mvo.name}</td>     
    </tr>
    <tr>
     <td colspan="4" align="left">
     &nbsp;&nbsp;
     <textarea cols="53" rows="15" id="content" name="content"></textarea>
     </td>
    </tr> 
    <tr>
     <td colspan="4" align="center" >
      <img id="writeBtn" class="action" src="${pageContext.request.contextPath}/resources/img/write_btn.jpg" >
      <img id="resetBtn" class="action" src="${pageContext.request.contextPath}/resources/img/cancel.gif" >      
     </td>  
    </tr>
    </tbody>
   </table>
  </form> --%>
  
  
  
