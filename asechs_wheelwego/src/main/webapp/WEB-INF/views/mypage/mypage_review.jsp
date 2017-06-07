<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<style>
.star_point_list{
  font-size:10pt;
  color:gold;
  cursor:pointer;
}
</style>

   <div class=" text-center"> <h1 class="page-header">MY Page</h1> </div>
<div align="center">
  <button type="button" id="deleteAccountBtn" class="btn btn-warning">회원탈퇴</button>&nbsp;&nbsp;
  <button type="button" id="updateBtn" class="btn btn-warning">회원정보수정</button>&nbsp;&nbsp;
	<button type="button" id="wishlistBtn"class="btn btn-warning">단골트럭</button>&nbsp;&nbsp;
<button type="button" id="reviewBtn"class="btn btn-warning">MY REVIEW</button>&nbsp;&nbsp;
</div>
<br><br>

 <div class="row">
 <div class="col-sm-2"></div>
 <div class="container col-sm-8">
  <c:choose>
		<c:when test="${reviewList!='[]'}">      
  <table class="table table-hover">
    <thead>
      <tr>
        <th>No</th>
        <th>TruckNo</th>
        <th>Content</th>
        <th>Score</th>
        <th>Date</th>
        <th></th>
      </tr>
    </thead>
    <tbody>
    <c:forEach items="${reviewList}" var="reviewVO" varStatus="status">
      <tr>
        <td>${status.index+1}<input type="hidden" name="reviewNo" value="${reviewVO.reviewNo}"></td>
        <td>${reviewVO.foodtruckNumber}</td>
        <td>${reviewVO.reviewContent}</td>
        <td>
    <c:choose>
    <c:when test="${reviewVO.grade eq '1'}">
    <input type="radio" name="grade" id="star-1" value="1"/>
    <label for="star-1" class="star_point_list" style="width:10px">
      <span><i class="fa fa-star" aria-hidden="true"></i></span>
    </label>
    </c:when>
    <c:when test="${reviewVO.grade eq '2'}">
    <input type="radio" name="grade" id="star-1" value="1"/>
    <label for="star-1" class="star_point_list" style="width:10px">
      <span><i class="fa fa-star" aria-hidden="true"></i></span>
    </label>
    <input type="radio" name="grade" id="star-2" value="2"/>
    <label for="star-2" class="star_point_list" style="width:10px">
      <span><i class="fa fa-star" aria-hidden="true"></i></span>
    </label>
    </c:when>
    <c:when test="${reviewVO.grade eq '3'}">
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
    </c:when>
    <c:when test="${reviewVO.grade eq '4'}">
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
    </c:when>
    <c:otherwise>
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
    </c:otherwise>
</c:choose>
</td>
        <td>${reviewVO.reviewTimeposted}</td>
        <td>
        <button type="button" class="updateBtn btn btn-default btn-sm">
          <span class="	glyphicon glyphicon-pencil"></span>
        </button>
         <button type="button" class="deleteBtn btn btn-default btn-sm">
          <span class="glyphicon glyphicon-remove"></span>
        </button>
		</td>
      </tr>
     </c:forEach>
    </tbody>
  </table>
  </c:when>
  		<c:otherwise>
			등록된 리뷰가 없습니다.
		</c:otherwise>
	</c:choose>
</div>
<div class="col-sm-2"></div>
</div>

 <Script type="text/javascript">
 	$(document).ready(function(){
 		$(".updateBtn").click(function(){
 			var reviewNo=$(this).parent().parent().find("input[name=reviewNo]").val();
 			if(confirm("등록된 리뷰를 수정하시겠습니까?")){
 				location.href="${pageContext.request.contextPath}/afterLogin_mypage/mypage_review_update.do?reviewNo="+reviewNo;
 			}
 		});
 		$(".deleteBtn").click(function(){
 			var reviewNo=$(this).parent().parent().find("input[name=reviewNo]").val();
 			var row=$(this).parent().parent();
 			if(confirm("등록된 리뷰를 삭제하시겠습니까?")){
 				$.ajax({
 					url:"${pageContext.request.contextPath}/afterLogin_mypage/deleteMyReview.do",
 					type:"post",
 					data:"reviewNo="+reviewNo,
 					success:function(data){
 						if(data=="deleteOk"){
 							alert("삭제하였습니다.");
 							//row.remove();
 							location.href="${pageContext.request.contextPath}/afterLogin_mypage/showMyReviewList.do?customerId=${sessionScope.memberVO.id}";
 						}
 					} 					
 				});
 			}
 		});
 	});
 	
 	$(document).ready(function(){
		$("#deleteAccountBtn").click(function(){
			if(confirm("계정을 삭제하시겠습니까?")){
				location.href="${pageContext.request.contextPath}/afterLogin_mypage/checkPasswordForm.do?command=deleteAccount";
			}
		});
		$("#updateBtn").click(function(){
				location.href="${pageContext.request.contextPath}/afterLogin_mypage/checkPasswordForm.do?command=update_form";
		});
		$("#wishlistBtn").click(function(){
			location.href="${pageContext.request.contextPath}/afterLogin_mypage/wishlist.do";
	});
		$("#reviewBtn").click(function(){
			location.href="${pageContext.request.contextPath}/afterLogin_mypage/showMyReviewList.do?customerId=${sessionScope.memberVO.id}";
	});
});
 </Script>