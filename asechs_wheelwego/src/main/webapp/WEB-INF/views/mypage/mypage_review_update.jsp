<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <form method="post" id="updateForm" action="${pageContext.request.contextPath}/afterLogin_mypage/updateMyReview.do">
 
 <input type="radio" name="grade" id="star-1" value="1"/>
    <label for="star-1" class="star_point">
      <span><i class="fa fa-star" aria-hidden="true"></i></span>
    </label>
    <input type="radio" name="grade" id="star-2" value="2"/>
    <label for="star-2" class="star_point">
      <span><i class="fa fa-star" aria-hidden="true"></i></span>
    </label>
    <input type="radio" name="grade" id="star-3" value="3" checked="checked"/>
    <label for="star-3" class="star_point">
      <span><i class="fa fa-star" aria-hidden="true"></i></span>
    </label>
    <input type="radio" name="grade" id="star-4" value="4"/>
    <label for="star-4" class="star_point">
      <span><i class="fa fa-star" aria-hidden="true"></i></span>
    </label>
    <input type="radio" name="grade" id="star-5" value="5"/>
    <label for="star-5" class="star_point">
      <span><i class="fa fa-star" aria-hidden="true"></i></span>
    </label>


	
	<table class="content">
	<tr>
		<td>
			<table>
				<tr>
					<td>
					<input type="hidden" name="reviewNo" value="${reviewVO.reviewNo}">
					트럭번호: <input type="text" name="foodtruckNumber" value="${reviewVO.foodtruckNumber}" readonly="readonly"></input>
					| 작성자:<input type="text"  name="customerId" value="${reviewVO.customerId}" readonly="readonly"></input>	
					| 작성일자:<input type="text"  name="reviewTimeposted" value="${reviewVO.reviewTimeposted}" readonly="readonly"></input>	
					</td>
				<tr>
					<td>						
		<textarea rows="5" cols="100" id="content" name="reviewContent" required="required" style="resize: none;">${reviewVO.reviewContent}</textarea>
					</td>
				</tr>
				<tr>
				<td valign="middle">						
					<input type="submit" value="수정하기" class="action"></input>			
					</td>				
				</tr>
			</table>
		</td>
	</tr>
</table>
</form>	

<Script>
	var grade=	"${reviewVO.grade}";
$(document).ready(function(){
	var gradeRadio=$(":input[name=grade]");
	for(var i=0; i<gradeRadio.length;i++){
		if(grade==gradeRadio[i].value){
			//alert(gradeRadio[i].value);
			gradeRadio[i].checked=true;
		}
	}
		//alert(gradeRadio);
})
</Script>