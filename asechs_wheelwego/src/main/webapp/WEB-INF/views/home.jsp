<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<script>
var x = document.getElementById("demo");

function getLocation() {
    if (navigator.geolocation) {
        navigator.geolocation.getCurrentPosition(showPosition, showError);
    } else { 
        x.innerHTML = "Geolocation is not supported by this browser.";
    }
}

function showPosition(position) {
    x.innerHTML = "Latitude: " + position.coords.latitude + 
    "<br>Longitude: " + position.coords.longitude;
}

function showError(error) {
    switch(error.code) {
        case error.PERMISSION_DENIED:
            x.innerHTML = "User denied the request for Geolocation."
            break;
        case error.POSITION_UNAVAILABLE:
            x.innerHTML = "Location information is unavailable."
            break;
        case error.TIMEOUT:
            x.innerHTML = "The request to get user location timed out."
            break;
        case error.UNKNOWN_ERROR:
            x.innerHTML = "An unknown error occurred."
            break;
    }
}
</script>
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
                 <a class="dropdown-toggle" href="#" data-toggle="dropdown"><i class="fa fa-map-marker fa-3x"></i></a>
                 <div class="dropdown-menu" style="padding: 15px; padding-bottom: 15px;" id="roundCorner">
	              <form action="[YOUR ACTION]" method="post" accept-charset="UTF-8">
					   <input class="btn btn-warning" type="submit" style="width: 100%;" value="수동검색" style=""/>
					  <input class="btn btn-warning" style="width: 100%;" type="submit" value="현재위치 자동검색" />
					</form>				
	            </div>
                </li>
              </ul>
            </div>
               <div class="col-lg-4">
			  <!-- 푸드트럭 검색 폼 -->
			  <form class="subscribe_form" action="${pageContext.request.contextPath}/searchFoodTruckList.do" method="get">
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
                        <img class="img-circle center-block food-img img-responsive"
                           src="resources/img/foodtruck/${truckVO.foodtruckFilepath}"
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
