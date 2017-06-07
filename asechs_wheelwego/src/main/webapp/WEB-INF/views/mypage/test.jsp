<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<title>W3.CSS</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<style>
.w3-button {width:150px;}
</style>
<script type="text/javascript">
function geoFindMe() {
	  if (!navigator.geolocation){
		 alert("지오로케이션을 지원하지 않습니다!");
		 return;
	  }
	  function success(position) {
	    var latitude  = position.coords.latitude;
	    var longitude = position.coords.longitude;
	    location.href = "${pageContext.request.contextPath}/afterLogin_mypage/setTruckGPS.do?sellerId=${sessionScope.memberVO.id}&latitude="+latitude+"&longitude="+longitude;  
	  };

	  function error() {
		  alert("사용자의 위치를 찾을 수 없습니다!");
	  };
	  navigator.geolocation.getCurrentPosition(success, error);
}
</script>
<body>

<div class="w3-container">
  <br>
  <center><button class="w3-button w3-orange" onclick="geoFindMe()">위치 자동설정</button></center><br>
  <center><button class="w3-button w3-orange">위치 수동설정</button></center><br>
</div>
</body>
</html>




	
	



