<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Inconsolata">
<style>
body, html {
    height: 100%;
    font-family: "Inconsolata", sans-serif;
}
.bgimg {
    background-position: center;
    background-size: cover;
    background-image: url("${pageContext.request.contextPath}/resources/img/foodtruck/${truckDetailInfo.fileVO.filepath}");
    min-height: 75%;
}
.menu {
    display: none;
}
/*별점*/
input[name="grade"]{
  display:none;
}

.star_point{
  font-size:20pt;
  color:gold;
  cursor:pointer;
}
.star_point_list{
  font-size:15pt;
  color:gold;
  cursor:pointer;
}
input[name="grade"]:checked + .star_point~label{
    color:lightgray;
}
</style>

<!-- Header -->
<header class="bgimg w3-display-container" id="home">
  <div class="w3-display-bottomleft w3-center w3-padding-large w3-hide-small">
    <span class="w3-tag">Open from 6am to 5pm</span>
  </div>
   <div class="container" id="maincontent" tabindex="-1">
      <div class="row">
         <div class="col-lg-12">
            <div class="intro-text">
               <h1 class="name" style="color:light-grey">${truckDetailInfo.foodtruckName}</h1>
               </div>
         </div>
      </div>
   </div>
     <div class="w3-display-bottomright w3-center w3-padding-large">
    <span class="w3-tag">15 Adr street, 5015</span>
  </div>
</header>

<!-- Add a background color and large text to the whole page -->
<div class="w3-sand w3-large">

<!-- About Container -->
<div class="w3-container" id="about">
  <div class="w3-content" style="max-width:700px">
    <h5 class="w3-center w3-padding-32"><span class="w3-tag w3-wide">ABOUT US</span></h5>
<p style="text-align:center;"><i>${truckDetailInfo.introduction}</i></p><br>
<div class="w3-panel w3-leftbar w3-light-grey" >
    <p><strong>Opening hours:</strong> everyday from 6am to 5pm.</p>
    <p><strong>Address:</strong> 15 Adr street, 5015, NY</p>
</div>
  </div>
</div>

<!-- Menu Container -->
<div class="w3-container" id="menu">
  <div class="w3-content" style="max-width:700px">
 
    <h5 class="w3-center w3-padding-48"><span class="w3-tag w3-wide">THE MENU</span></h5>
  
    <div class="w3-row w3-center w3-card-2 w3-padding">
      <a href="javascript:void(0)" onclick="openMenu(event, 'Eat');" id="myLink">
        <div class="w3-col s6 tablink">Eat</div>
      </a>
      <a href="javascript:void(0)" onclick="openMenu(event, 'Drinks');">
        <div class="w3-col s6 tablink">Drink</div>
      </a>
    </div>

    <div id="Eat" class="w3-container menu w3-padding-48 w3-card-2">
       <c:forEach items="${requestScope.truckDetailInfo.foodList}" var="foodList">
      <h5>${foodList.menuName }</h5>
      <p class="w3-text-grey">${foodList.menuPrice}</p><br>
      </c:forEach>
    </div>

    <div id="Drinks" class="w3-container menu w3-padding-48 w3-card-2">
      <h5>Coffee</h5>
      <p class="w3-text-grey">Regular coffee 2.50</p><br>
    
      <h5>Chocolato</h5>
      <p class="w3-text-grey">Chocolate espresso with milk 4.50</p><br>
    
      <h5>Corretto</h5>
      <p class="w3-text-grey">Whiskey and coffee 5.00</p><br>
    
      <h5>Iced tea</h5>
      <p class="w3-text-grey">Hot tea, except not hot 3.00</p><br>
    
      <h5>Soda</h5>
      <p class="w3-text-grey">Coke, Sprite, Fanta, etc. 2.50</p>
    </div>  

     <c:forEach items="${requestScope.truckDetailInfo.foodList}" var="foodList">
    <img src="${pageContext.request.contextPath}/resources/img/menu/${foodList.fileVO.filepath}" style="width:100%;max-width:1000px;margin-top:32px;">
 	</c:forEach>
  </div>
</div>

<!-- Contact/Area Container -->
<div class="w3-container" id="where" style="padding-bottom:32px;">
  <div class="w3-content" style="max-width:700px">
    <h5 class="w3-center w3-padding-48"><span class="w3-tag w3-wide">WHERE TO FIND US</span></h5>
    <p style="text-align:center">Find us at some address at some place.</p>
    <div id="googleMap" class="w3-sepia" style="width:100%;height:400px;"></div>

    <c:if test="${sessionScope.memberVO!=null}">
    <h5 class="w3-center w3-padding-32"><span class="w3-tag w3-wide">REVIEW</span></h5>
   <form action="${pageContext.request.contextPath}/afterLogin_foodtruck/registerReview.do" target="_blank" method="post">
    <input type="radio" name="grade" id="star-1" value="1"/>
    <label for="star-1" class="star_point" style="width:20px">
      <span><i class="fa fa-star" aria-hidden="true"></i></span>
    </label>
    <input type="radio" name="grade" id="star-2" value="2"/>
    <label for="star-2" class="star_point" style="width:20px">
      <span><i class="fa fa-star" aria-hidden="true"></i></span>
    </label>
    <input type="radio" name="grade" id="star-3" value="3" checked="checked"/>
    <label for="star-3" class="star_point" style="width:20px">
      <span><i class="fa fa-star" aria-hidden="true"></i></span>
    </label>
    <input type="radio" name="grade" id="star-4" value="4"/>
    <label for="star-4" class="star_point" style="width:20px">
      <span><i class="fa fa-star" aria-hidden="true"></i></span>
    </label>
    <input type="radio" name="grade" id="star-5" value="5"/>
    <label for="star-5" class="star_point" style="width:20px">
      <span><i class="fa fa-star" aria-hidden="true"></i></span>
    </label>
<table class="content">
<div class="form-group">
   <tr>
      <td>
         <table>
            <tr>
               <div class="form-group">
			      <textarea class="form-control" rows="5" cols="100" id="content" name="reviewContent" required="required" style="resize: none;"></textarea>
			   </div>
            </tr>
            <tr>
               <input type="button" id="registerBtn" value="Register" class="btn btn-default" style="float: right;"/>                
            </tr>
         </table>
         <hr>
      </td>
   </tr>
   </div>
</table>
</form>
</c:if>
    <form>
    <!-- review 결과 table -->
    <h5 class="w3-center w3-padding-32"><span class="w3-tag w3-wide">REVIEW LIST</span></h5>      
  <table class="table table-hover" id="table">
    <thead>
      <tr>
        <th>SCORE</th>
        <th>COMMENT</th>
        <th>WRITER</th>
        <th>DATE</th>
        <th></th>
      </tr>
    </thead>
    <tbody>
     <c:forEach items="${reviewlist.reviewList}" var="reviewVO">
      <tr>
<!-- 별점 리스트 img -->
<c:choose>
    <c:when test="${reviewVO.grade eq '1'}">
    <td>
    <input type="radio" name="grade" id="star-1" value="1"/>
    <label for="star-1" class="star_point_list" style="width:10px">
      <span><i class="fa fa-star" aria-hidden="true"></i></span>
    </label>
    </td>
    </c:when>
    <c:when test="${reviewVO.grade eq '2'}">
    <td>
    <input type="radio" name="grade" id="star-1" value="1"/>
    <label for="star-1" class="star_point_list" style="width:10px">
      <span><i class="fa fa-star" aria-hidden="true"></i></span>
    </label>
    <input type="radio" name="grade" id="star-2" value="2"/>
    <label for="star-2" class="star_point_list" style="width:10px">
      <span><i class="fa fa-star" aria-hidden="true"></i></span>
    </label>
    </td>
    </c:when>
    <c:when test="${reviewVO.grade eq '3'}">
    <td>
    <input type="radio" name="grade" id="star-1" value="1"/>
    <label for="star-1" class="star_point_list" style="width:10px">
      <span><i class="fa fa-star" aria-hidden="true"></i></span>
    </label>
    <input type="radio" name="grade" id="star-2" value="2"/>
    <label for="star-2" class="star_point_list" style="width:10px">
      <span><i class="fa fa-star" aria-hidden="true"></i></span>
    </label>
    <input type="radio" name="grade" id="star-3" value="3" checked="checked"/>
    <label for="star-3" class="star_point_list" style="width:10px">
      <span><i class="fa fa-star" aria-hidden="true"></i></span>
    </label>
    </td>
    </c:when>
    <c:when test="${reviewVO.grade eq '4'}">
    <td>
    <input type="radio" name="grade" id="star-1" value="1"/>
    <label for="star-1" class="star_point_list" style="width:10px">
      <span><i class="fa fa-star" aria-hidden="true"></i></span>
    </label>
    <input type="radio" name="grade" id="star-2" value="2"/>
    <label for="star-2" class="star_point_list" style="width:10px">
      <span><i class="fa fa-star" aria-hidden="true"></i></span>
    </label>
        <input type="radio" name="grade" id="star-3" value="3" checked="checked"/>
    <label for="star-3" class="star_point_list" style="width:10px">
      <span><i class="fa fa-star" aria-hidden="true"></i></span>
    </label>
    <input type="radio" name="grade" id="star-4" value="4"/>
    <label for="star-4" class="star_point_list" style="width:10px">
      <span><i class="fa fa-star" aria-hidden="true"></i></span>
    </label>
    </td>
    </c:when>
    <c:otherwise>
    <td>
    <input type="radio" name="grade" id="star-1" value="1"/>
    <label for="star-1" class="star_point_list" style="width:10px">
      <span><i class="fa fa-star" aria-hidden="true"></i></span>
    </label>
    <input type="radio" name="grade" id="star-2" value="2"/>
    <label for="star-2" class="star_point_list" style="width:10px">
      <span><i class="fa fa-star" aria-hidden="true"></i></span>
    </label>
    <input type="radio" name="grade" id="star-3" value="3" checked="checked"/>
    <label for="star-3" class="star_point_list" style="width:10px">
      <span><i class="fa fa-star" aria-hidden="true"></i></span>
    </label>
    <input type="radio" name="grade" id="star-4" value="4"/>
    <label for="star-4" class="star_point_list" style="width:10px">
      <span><i class="fa fa-star" aria-hidden="true"></i></span>
    </label>
    <input type="radio" name="grade" id="star-5" value="5"/>
    <label for="star-5" class="star_point_list" style="width:10px">
      <span><i class="fa fa-star" aria-hidden="true"></i></span>
    </label>
    </td>
    </c:otherwise>
</c:choose>
<!-- 별점 리스트 img -->
        <td>${reviewVO.reviewContent}</td>
        <td>${reviewVO.customerId}</td>
        <td>${reviewVO.reviewTimeposted}</td>
        <c:if test="${sessionScope.memberVO.id!=null}">
        <td><input type="hidden" value="${reviewVO.reviewNo}" name="reviewNo">
        <input type="hidden" value="${truckDetailInfo.foodtruckNumber}" name="truckNo">
        <span role="button" class="glyphicon glyphicon-remove" id="deleteBtn"></span></td>
        </c:if>
      </tr>
      </c:forEach>
    </tbody>
  </table>
<!-- review 결과 테이블 -->
</form>
  </div>
</div>

<!-- End page content -->
</div>

<!-- Add Google Maps -->
<script>
function myMap()
{
  myCenter=new google.maps.LatLng(41.878114, -87.629798);
  var mapOptions= {
    center:myCenter,
    zoom:12, scrollwheel: false, draggable: false,
    mapTypeId:google.maps.MapTypeId.ROADMAP
  };
  var map=new google.maps.Map(document.getElementById("googleMap"),mapOptions);

  var marker = new google.maps.Marker({
    position: myCenter,
  });
  marker.setMap(map);
}

// Tabbed Menu
function openMenu(evt, menuName) {
  var i, x, tablinks;
  x = document.getElementsByClassName("menu");
  for (i = 0; i < x.length; i++) {
     x[i].style.display = "none";
  }
  tablinks = document.getElementsByClassName("tablink");
  for (i = 0; i < x.length; i++) {
     tablinks[i].className = tablinks[i].className.replace(" w3-dark-grey", "");
  }
  document.getElementById(menuName).style.display = "block";
  evt.currentTarget.firstElementChild.className += " w3-dark-grey";
}
document.getElementById("myLink").click();
</script>
<script>
   $(document).ready(function(){
      $("#registerBtn").click(function(){
         var grade = $("input[name=grade]:checked").val();
         var reviewContent = $("#content").val();
         var d = new Date();
         if(confirm("리뷰를 등록하시겠습니까?")){
            $.ajax({
            	type:"post",
            	url:"${pageContext.request.contextPath}/afterLogin_foodtruck/registerReview.do",
                data:"grade="+grade+"&reviewContent="+reviewContent+"&customerId=${sessionScope.memberVO.id}"+"&foodtruckNumber=${truckDetailInfo.foodtruckNumber}"
                +"&reviewTimeposted="+d.toString(),
                success:function(result){
                	alert("등록되었습니다.");
                	location.href="${pageContext.request.contextPath}/foodTruckAndMenuDetail.do?foodtruckNo=${truckDetailInfo.foodtruckNumber}";   	
                }
            })
         }
      });  
      $("#deleteBtn").click(function(){
    	  var reviewNo=$(this).parent().parent().find(":input[name=reviewNo]").val();
    	  var truckNo =$(this).parent().parent().find(":input[name=truckNo]").val();
  		if(confirm("리뷰를 삭제하시겠습니까?")){
  			$.ajax({
  				url:"${pageContext.request.contextPath}/afterLogin_mypage/deleteMyReview.do",
  				data:"reviewNo="+reviewNo,
  				success:function(result){
  					alert("삭제되었습니다.");
  					location.href="${pageContext.request.contextPath}/foodTruckAndMenuDetail.do?foodtruckNo="+truckNo;   	
  				}
  			})
  		}
  	});
   });
</script>

<script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyBu-916DdpKAjTmJNIgngS6HL_kDIKU0aU&callback=myMap"></script>

