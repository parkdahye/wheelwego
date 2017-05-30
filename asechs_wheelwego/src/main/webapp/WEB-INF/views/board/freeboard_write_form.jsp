<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/board.css" type="text/css">
  <form action="${pageContext.request.contextPath}/write.do" method="post" id="write_form">
   <table class="inputForm" >
    <caption>글쓰기</caption>
    <tbody>
    <tr>
     <td>제목</td>
     <td colspan="3">
     <input type="text" id="title" name="title" size="48">
     </td>
    </tr>
    <tr>
     <td>이름</td>
     <td>${sessionScope.mvo.name}</td>     
    </tr>
    <tr>
     <td colspan="4" align="left">
     &nbsp;&nbsp;
     <textarea cols="53" rows="15" id="content" name="content"></textarea>
     </td>
    </tr> 
    <tr>
     <td colspan="4" align="center" >
      <img id="writeBtn" class="action" src="${pageContext.request.contextPath}/resources/img/write_btn.jpg" >
      <img id="resetBtn" class="action" src="${pageContext.request.contextPath}/resources/img/cancel.gif" >      
     </td>  
    </tr>
    </tbody>
   </table>
  </form>
