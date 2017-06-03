<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
 <div class="_40h7m" >
	<c:choose>
		<c:when test="${reviewList!='[]'}">
		<table style="border: none; padding: 15px">
				<tr>
					<th>No</th><th>트럭<th>리뷰내용</th><th>평점</th><th>등록날짜</th><th>수정/삭제</th>
				</tr>
			<c:forEach items="${reviewList}" var="reviewVO" varStatus="status">
				<tr>
					<td>${status.index+1}<input type="hidden" name="reviewNo" value="${reviewVO.reviewNo}"></td>
					<td>${reviewVO.foodtruckNumber}</td><td><div style="width:300px; overflow:hidden; white-space:nowrap; text-overflow:ellipsis ">${reviewVO.reviewContent}</div></td>
					<td>${reviewVO.grade}</td><td>${reviewVO.reviewTimeposted}</td>
					<td>
						<button type="button" class="updateBtn">수정</button>
						<button type="button" class="deleteBtn">삭제</button>
					</td>
				</tr>
			</c:forEach>
			</table>
		</c:when>
		<c:otherwise>
			등록된 리뷰가 없습니다.
		</c:otherwise>
	</c:choose>
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
 </Script>