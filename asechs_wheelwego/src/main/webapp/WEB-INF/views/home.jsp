<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>


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
			  <form class="subscribe_form" action="#" method="post">
              <input required="required" value="" placeholder="Search foodtruck!" class="email" id="email" name="email" type="text" >

              <input class="subscribe" name="email" value="Search" type="submit">
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
         <div class="col-lg-4 col-sm-6 portfolio-item" >
            <div class="flip-container"
               ontouchstart="this.classList.toggle('hover');" style="margin: 0 auto;">
               <div class="flipper">
                  <a href="#portfolioModal1" class="portfolio-link"
                     data-toggle="modal">
                     <div class="front" >
                        <img class="img-circle  center-block food-img img-responsive"
                           src="${pageContext.request.contextPath}/resources/img/truck3.jpg"
                           alt="" >
                     </div>
                     <div class="back cbx-back-side">
                        <div class="text-center back-single-text">
                           <p>트럭1</p><p class="truck-simple-info"><br><br><br>메뉴<br>위치<br>평점</p>
                        </div>
                     </div>
                  </a>
               </div>
            </div>
         </div>
         
         <div class="col-lg-4 col-sm-6 portfolio-item">

            <div class="flip-container"
               ontouchstart="this.classList.toggle('hover');"  style="margin: 0 auto;">
               <div class="flipper">
                  <a href="#portfolioModal1" class="portfolio-link"
                     data-toggle="modal">
                     <div class="front">
                        <img class="img-circle img-responsive center-block food-img"
                           src="${pageContext.request.contextPath}/resources/img/truck7.jpg"
                           alt="" width="200" height="200">
                     </div>
                     <div class="back cbx-back-side">
                        <div class="text-center back-single-text">
                           <p>트럭7</p><p class="truck-simple-info"><br><br><br>메뉴<br>위치<br>평점</p>
                        </div>
                     </div>
                  </a>
               </div>
            </div>
         </div>
         <div class="col-lg-4 col-sm-6 portfolio-item">
            <div class="flip-container"
               ontouchstart="this.classList.toggle('hover');"  style="margin: 0 auto;">
               <div class="flipper">
                  <a href="#portfolioModal1" class="portfolio-link"
                     data-toggle="modal">
                     <div class="front">
                        <img class="img-circle img-responsive center-block food-img"
                           src="${pageContext.request.contextPath}/resources/img/truck2.jpg"
                           alt="" width="200" height="200">
                     </div>
                     <div class="back cbx-back-side">
                        <div class="text-center back-single-text">
                           <p>트럭~~</p><p class="truck-simple-info"><br><br><br>메뉴<br>위치<br>평점</p>
                        </div>
                     </div>
                  </a>
               </div>
            </div>
         </div>
         <div class="col-lg-4 col-sm-6 portfolio-item">
            <div class="flip-container"
               ontouchstart="this.classList.toggle('hover');"  style="margin: 0 auto;">
               <div class="flipper">
                  <a href="" class="portfolio-link">
                     <div class="front">
                        <img class="img-circle img-responsive center-block food-img"
                           src="${pageContext.request.contextPath}/resources/img/truck4.jpg"
                           alt="" width="200" height="200">
                     </div>
                     <div class="back cbx-back-side">
                        <div class="text-center back-single-text">
                           <p>트럭4</p><p class="truck-simple-info"><br><br><br>메뉴<br>위치<br>평점</p>
                        </div>
                     </div>
                  </a>
               </div>
            </div>
         </div>
         <div class="col-lg-4 col-sm-6 portfolio-item">
            <div class="flip-container"
               ontouchstart="this.classList.toggle('hover');"  style="margin: 0 auto;">
               <div class="flipper">
                  <a href="#portfolioModal1" class="portfolio-link"
                     data-toggle="modal">
                     <div class="front">
                        <img class="img-circle img-responsive center-block food-img"
                           src="${pageContext.request.contextPath}/resources/img/truck5.jpg"
                           alt="" width="200" height="200">
                     </div>
                     <div class="back cbx-back-side">
                        <div class="text-center back-single-text">
                           <p>트럭5</p><p class="truck-simple-info"><br><br><br>메뉴<br>위치<br>평점</p>
                        </div>
                     </div>
                  </a>
               </div>
            </div>
         </div>
         <div class="col-lg-4 col-sm-6 portfolio-item">
            <div class="flip-container"
               ontouchstart="this.classList.toggle('hover');"  style="margin: 0 auto;">
               <div class="flipper">
                  <a href="#portfolioModal1" class="portfolio-link"
                     data-toggle="modal">
                     <div class="front">
                        <img class="img-circle img-responsive center-block food-img"
                           src="${pageContext.request.contextPath}/resources/img/truck6.jpg"
                           alt="" width="200" height="200">
                     </div>
                     <div class="back cbx-back-side">
                        <div class="text-center back-single-text">
                           <p>트럭6</p><p class="truck-simple-info"><br><br><br>메뉴<br>위치<br>평점</p>
                        </div>
                     </div>
                  </a>
               </div>
            </div>
         </div>
         <div class="col-lg-4 col-sm-6 portfolio-item">
            <div class="flip-container"
               ontouchstart="this.classList.toggle('hover');"  style="margin: 0 auto;">
               <div class="flipper">
                  <a href="#portfolioModal1" class="portfolio-link"
                     data-toggle="modal">
                     <div class="front">
                        <img class="img-circle  center-block food-img"
                           src="${pageContext.request.contextPath}/resources/img/truck3.jpg"
                           alt="" >
                     </div>
                     <div class="back cbx-back-side">
                        <div class="text-center back-single-text">
                           <p>트럭3</p><p class="truck-simple-info"><br><br><br>메뉴<br>위치<br>평점</p>
                        </div>
                     </div>
                  </a>
               </div>
            </div>
         </div>
         <div class="col-lg-4 col-sm-6 portfolio-item">
            <div class="flip-container"
               ontouchstart="this.classList.toggle('hover');"  style="margin: 0 auto;">
               <div class="flipper">
                  <a href="#portfolioModal1" class="portfolio-link"
                     data-toggle="modal">
                     <div class="front">
                        <img class="img-circle img-responsive center-block food-img"
                           src="${pageContext.request.contextPath}/resources/img/truck7.jpg"
                           alt="" width="200" height="200">
                     </div>
                     <div class="back cbx-back-side">
                        <div class="text-center back-single-text">
                           <p>트럭7</p><p class="truck-simple-info"><br><br><br>메뉴<br>위치<br>평점</p>
                        </div>
                     </div>
                  </a>
               </div>
            </div>
         </div>
         <div class="col-lg-4 col-sm-6 portfolio-item">
            <div class="flip-container"
               ontouchstart="this.classList.toggle('hover');"  style="margin: 0 auto;">
               <div class="flipper">
                  <a href="#portfolioModal1" class="portfolio-link"
                     data-toggle="modal">
                     <div class="front">
                        <img class="img-circle img-responsive center-block food-img"
                           src="${pageContext.request.contextPath}/resources/img/truck2.jpg"
                           alt="" width="200" height="200">
                     </div>
                     <div class="back cbx-back-side">
                        <div class="text-center back-single-text">
                           <p>트럭~~</p><p class="truck-simple-info"><br><br><br>메뉴<br>위치<br>평점</p>
                        </div>
                     </div>
                  </a>
               </div>
            </div>
         </div>
       </div>
      <!-- row -->
      <hr>
   </div>
   <!-- container -->
</section>
