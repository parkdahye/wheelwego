<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<style>
 .container-fluid {
      padding: 40px 50px 30px 40px;
  }
  .bg-grey {
      background-color: #f6f6f6;
  }
  .thumbnail {
      padding: 0 0 15px 0;
      border: 1px solid light grey;
      height:280px;
      position: relative;
      display: block;
  }
  .thumbnail img {
     /*  width: 100%;
      height:100%; */
      margin-bottom: 10px;
      
  }
  .col-sm-6{
  width: 50%;
  height: 300px;
  }
/*   img:hover {
    opacity: 0.5;
    filter: alpha(opacity=50); /* For IE8 and earlier */
} */
</style>
<Script type="text/javascript">

$(document).ready(function(){
   $("input#insertBtn").click(function(){
     var foodtruckNumber = $(this).attr('name');
     var id = "${sessionScope.memberVO.id}";
    // var img1=document.getElementById("${pageContext.request.contextPath }/resources/img/foodtruck/heartoff.png");
   
    if(id==""){
       alert("로그인이 필요합니다.");
    }else{
     $.ajax({
      type:"post",
      url:"${pageContext.request.contextPath}/afterLogin_foodtruck/registerBookMark.do",
      data: {id: id, foodtruckNumber: foodtruckNumber},
      success:function(data){
         if(data=="on"){
            alert("단골트럭으로 등록!");
            $(this).css("background-image","${pageContext.request.contextPath}/resources/img/hearton.png");
            location.reload();      
         }else{
            alert("단골트럭 등록해제");         
            location.reload();
         }
      }
   });
    }
});
});
</script>

<script type="text/javascript">
   <c:forEach items="${requestScope.pagingList.truckList}" var="truckInfo" varStatus="status">
   var mapInfo = naver.maps.Service.reverseGeocode({
        location: new naver.maps.LatLng("${truckInfo.latitude}", "${truckInfo.longitude}"),
    }, function(status, response) {
        if (status !== naver.maps.Service.Status.OK) {
            //return alert('Something wrong!');
        }

        var result = response.result, // 검색 결과의 컨테이너
            items = result.items; // 검색 결과의 배열
            
            document.getElementById("${truckInfo.foodtruckName}").innerHTML = items[0].address;
    });
   </c:forEach>
</script>
<div class="container-fluid text-center bg-grey">
  <h4>FOODTRUCK LIST</h4><br>
  <div class="row text-center" style="position:relative;">
  <c:forEach items="${requestScope.pagingList.truckList}" var="truckInfo">

    <div class="col-sm-6">
      <div class="thumbnail">
      <a href="${pageContext.request.contextPath}/foodTruckAndMenuDetail.do?foodtruckNo=${truckInfo.foodtruckNumber}&latitude=${truckInfo.latitude}&longitude=${truckInfo.longitude}">
        <img src="${pageContext.request.contextPath}/resources/upload/${truckInfo.fileVO.filepath}" style="width:300px;height:180px;">
        </a>
        <input type="image" id="insertBtn" name = "${truckInfo.foodtruckNumber}" src = "${pageContext.request.contextPath }/resources/img/heartoff.png" >
        <p><strong>${truckInfo.foodtruckName}</strong></p>
        <p style="font-size:17px;" id="${truckInfo.foodtruckName}"></p>
      </div>
    </div>
  </c:forEach>
  </div>
</div>

<p class="paging text-center">
   <c:set var="pb" value="${requestScope.pagingList.pagingBean}"></c:set>
   <!-- 
         step2 1) 이전 페이지 그룹이 있으면 이미지 보여준다. (img/left_arrow_btn.gif)
                     페이징빈의 previousPageGroup 이용 
               2)  이미지에 이전 그룹의 마지막 페이지번호를 링크한다. 
                      hint)   startPageOfPageGroup-1 하면 됨        
    -->      
   <c:if test="${pb.previousPageGroup}">
   <a href="${pageContext.request.contextPath}/pagingTruckList.do?pageNo=${pb.startPageOfPageGroup-1}">
   <!-- <img src="img/left_arrow_btn.gif"> -->
   ◀&nbsp; </a>   
   
   </c:if>
   <!-- step1. 1)현 페이지 그룹의 startPage부터 endPage까지 forEach 를 이용해 출력한다
               2) 현 페이지가 아니면 링크를 걸어서 서버에 요청할 수 있도록 한다.
                  현 페이지이면 링크를 처리하지 않는다.  
                  PagingBean의 nowPage
                  jstl choose 를 이용  
                  예) <a href="list.do?pageNo=...">               
    -->      
   <c:forEach var="i" begin="${pb.startPageOfPageGroup}" end="${pb.endPageOfPageGroup}">
   <c:choose>
   <c:when test="${pb.nowPage!=i}">
   <a href="${pageContext.request.contextPath}/searchFoodTruckByName.do?pageNo=${i}&latitude=${param.latitude}&longitude=${param.longitude}&name=${requestScope.name}">${i}</a> 
   </c:when>
   <c:otherwise>
   ${i}
   </c:otherwise>
   </c:choose>
   &nbsp;
   </c:forEach>    
   <!-- 
         step3 1) 다음 페이지 그룹이 있으면 이미지(img/right_arrow_btn.gif) 보여준다. 
                     페이징빈의 nextPageGroup 이용 
               2)  이미지에 이전 그룹의 마지막 페이지번호를 링크한다. 
                      hint)   endPageOfPageGroup+1 하면 됨        
    -->   
   <c:if test="${pb.nextPageGroup}">
   <a href="${pageContext.request.contextPath}/pagingTruckList.do?pageNo=${pb.endPageOfPageGroup+1}">
   ▶<!-- <img src="img/right_arrow_btn.gif"> --></a>
   </c:if>
   </p>