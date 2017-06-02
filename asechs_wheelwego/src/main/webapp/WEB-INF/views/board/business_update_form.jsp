<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

   <!-- 호겸 게시판 글 수정하기 -->
<meta http-equiv="X-UA-Compatible" content="IE=edge"> 
<meta name="viewport" content="width=device-width, initial-scale=1"> 
<!-- Bootstrap --> 
<link href="css/bootstrap.min.css" rel="stylesheet"> 
<!-- jQuery (necessary for Bootstrap's JavaScript plugins) --> 
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script> 

<script src="js/bootstrap.min.js"></script> 
<script type="text/javascript">
	$(document).ready(function(){
		$("#cancelBtn").click(function(){//취소버튼 작동
			location.href="${pageContext.request.contextPath}/business_list.do";
		})
	})//ready
</script>
<div class="panel panel-default"> 
<div class="panel-heading"><h3>자유게시판 수정</h3></div> 

<div class="panel-body">

<div class="container"> 
<form action="business_updateBoard.do" method="post">  
		<div class="row"> 
			<div class="col-md-3">
			<div class="form-group"> 
			<label for="name">글번호</label> 
			<input type="text" class="form-control" name="no" id="no" value="${requestScope.detail_freeboard.no}" readonly> 
			</div> 
			</div> 
			
			<div class="col-md-4"> 
			<div class="form-group"> 
			<label for="writer">작성자</label> 
			<input type="text" class="form-control" name="id" id="writer" value="${requestScope.detail_freeboard.id }" readonly> 
			</div> 
			</div> 
		</div> 
		
		<div class="col-md-8"> 
		<div class="form-group"> 
		<label for="title">글제목</label> 
		<input type="text" class="form-control" name ="title" id="title" value="${requestScope.detail_freeboard.title }" required="required"> 
		</div> </div>
		 
		<div class="col-md-8"> 
		<div class="form-group"> 
		<label for="content">글내용</label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		<font size=2 >${requestScope.detail_freeboard.timePosted} &nbsp;&nbsp; 조회수 : ${requestScope.detail_freeboard.hits}</font>
		<textarea class="form-control" rows="10" name="content" id="content" required="required">${requestScope.detail_freeboard.content }</textarea> 
		</div></div><br><br><br><br><br>
		
		<div class="form-group,col-md-8"> 
		<label for="File">첨부파일 1</label> 
		<input type="file" id="File1"> 
		</div> 
		<div class="form-group,col-md-8"> 
		<label for="File">첨부파일 2</label> 
		<input type="file" id="File2"> 
		</div> 
		<div class="form-group,col-md-8"> 
		<label for="File">첨부파일 3</label> 
		<input type="file" id="File3"> 
		</div> 
		
		<div class="center-block" style='width:400px'> 
		<input type="reset"  class="btn btn-info" value="다시작성">	
		<input type="submit"  class="btn btn-info" value="수정" >
		<input type="button"  class="btn btn-info" value="취소" id="cancelBtn"></div> 
</form> 
</div> 
</div> <!--panel end--> 
</div> 
    