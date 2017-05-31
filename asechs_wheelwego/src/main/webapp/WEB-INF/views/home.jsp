<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!-- Header -->
<header>
   <div class="container" id="maincontent" tabindex="-1">
      <div class="row">
         <div class="col-lg-12">
            <div class="intro-text">
               <h1 class="name">Wheel<img src="${pageContext.request.contextPath}/resources/img/포크.png">  we go!</h1>
               <hr>
               </div>

            <div class="col-lg-3"></div>
            <div class="social col-lg-1">
              <ul>
                <li>
                  <!-- <a href=""><i class="fa fa-map-marker fa-3x"></i></a> -->
                 <a class="dropdown-toggle" href="#" data-toggle="dropdown"><i class="fa fa-map-marker fa-3x"></i></a>
                 <div class="dropdown-menu" style="padding: 15px; padding-bottom: 0px;">
	              <form action="[YOUR ACTION]" method="post" accept-charset="UTF-8">
					  <input id="user_username" style="margin-bottom: 15px;" type="text" name="user[username]" size="30" />
					  <input id="user_password" style="margin-bottom: 15px;" type="password" name="user[password]" size="30" />
					  <input id="user_remember_me" style="float: left; margin-right: 10px;" type="checkbox" name="user[remember_me]" value="1" />
					  <label class="string optional" for="user_remember_me"> Remember me</label>
					  <input class="btn btn-primary" style="clear: left; width: 100%; height: 32px; font-size: 13px;" type="submit" name="commit" value="Sign In" />
					</form>
	            </div>
                </li>
              </ul>
            </div>
               <div class="col-lg-4">
			  <!-- 푸드트럭 검색 폼 -->
			  <form class="subscribe_form" action="${pageContext.request.contextPath}/searchFoodTruckList.do" method="post">
              <input type="text" value="" placeholder="Search foodtruck!" class="email" id="search" name="name" required="" >
              <input type="submit" class="subscribe" name="search" value="Search">

            </form>
           </div>
             <div class="col-lg-4"></div>
         </div>
      </div>
   </div>
</header>

<section id="portfolio">
   <div class="container">

         <div class="col-lg-12 text-center">
            <h2 class="page-header">recommend list</h2><br><br><br>
         </div>
         
      <div class="row" >
      <!-- begin, end 값을 설정하여 전체 트럭 목록 중, 6개만 랜덤으로 뽑아낸다 -->
      <c:forEach items="${trucklist}" begin="0" end="8" var="truckVO">
         <div class="col-lg-4 col-sm-6 portfolio-item" >
            <div class="flip-container"
               ontouchstart="this.classList.toggle('hover');" style="margin: 0 auto;">
               <div class="flipper">
                  <a href="#portfolioModal1" class="portfolio-link"
                     data-toggle="modal">
                     <div class="front" >
                        <img class="img-circle  center-block food-img img-responsive"
                           src="${pageContext.request.contextPath}/resources/upload/${truckVO.fileVO.filepath}"
                           alt="" >
                     </div>
                     <div class="back cbx-back-side">
                        <div class="text-center back-single-text">
                           <p>${truckVO.foodtruckName}</p><p class="truck-simple-info"><br><br><br>${truckVO.introduction}<br>위치<br>평점</p>
                        </div>
                     </div>
                  </a>
               </div>
            </div>
         </div>
         </c:forEach>

       </div>
      <!-- row -->
      <hr>
   </div>
   <!-- container -->
</section>
