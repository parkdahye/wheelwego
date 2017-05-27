<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <!-- Navigation -->
    <nav id="mainNav" class="navbar navbar-default navbar-fixed-top navbar-custom">
        <div class="container">
            <!-- Brand and toggle get grouped for better mobile display -->
            <div class="navbar-header page-scroll">
                <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">
                    <span class="sr-only">Toggle navigation</span> Menu <i class="fa fa-bars"></i>
                </button>
                <a class="navbar-brand" href="#page-top">Wheel, We go!</a>
            </div>

            <!-- Collect the nav links, forms, and other content for toggling -->
            <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
                <ul class="nav navbar-nav navbar-right">
                    <li class="hidden">
                        <a href="#page-top"></a>
                    </li>
                    <li class="page-scroll">
                        <a href="">MyPage</a>
                    </li>
                    <li class="page-scroll">
                    <c:choose >
                    	<c:when test="${sessionScope.memberVO==null}">                    	
                        <a  href="#myModal" data-toggle="modal" >Login</a>
                    	</c:when>
                    	<c:otherwise>
                    		<a href="" >${sessionScope.memberVO.memberName} 님</a>
                    	</c:otherwise>
                    </c:choose>
				</li>
				<c:if test="${sessionScope.memberVO!=null }">
					<li class="page-scroller">
						<a href="${pageContext.request.contextPath}/logout.do" id="logoutLink">로그아웃</a>
					</li>
				</c:if>
                </ul>
            </div>
            <!-- /.navbar-collapse -->
        </div>
        <!-- /.container-fluid -->
    </nav>
    
    
      <!-- Modal -->
  <div class="modal fade" id="myModal" role="dialog">
    <div class="modal-dialog">
    
      <!-- Modal content-->
      <div class="modal-content">
        <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal">&times;</button>
          <h4 class="modal-title">Modal Header</h4>
        </div>
        <div class="modal-body">
         <form class="form-signin" method="post" action="${pageContext.request.contextPath}/login.do">       
      <input type="text" class="form-control" name="id" placeholder="아이디를 입력하세요" required="" autofocus="" /><br>
      <input type="password" class="form-control" name="password" placeholder="비밀번호를 입력하세요" required=""/><br><br>      
        <input type="checkbox" value="remember-me" id="rememberMe" name="rememberMe"> Remember me<br><br>
        <a href="/forgot_id" class="forgot-password pull-right">아이디가 생각나지 않으세요?</a><br>
          <a href="/forgot_password" class="forgot-password pull-right" >비밀번호가 생각나지 않으세요?</a><br><br>
      <button class="btn btn-lg btn-primary btn-block" type="submit" id="loginBtn">Login</button>   
    </form>
        </div>
        <div class="modal-footer">
          <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
        </div>
      </div>
    </div>
  </div>
  
  <Script type="text/javascript">
   	$(document).ready(function(){
   		$("#logoutLink").click(function(){
   			if(confirm("로그아웃 하시겠습니까?")==false){
   				return false;
   			}
   		});
   	});
  </Script>
  