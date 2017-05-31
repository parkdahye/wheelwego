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


<div class="panel panel-default"> 
<!-- Default panel contents --> 
<div class="panel-heading"><h2>자유게시판 글쓰기</h2></div> 

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
  
  
  
