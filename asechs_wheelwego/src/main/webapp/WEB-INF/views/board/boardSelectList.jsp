<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <script>
       $(document).ready(function(){
          $("#freeboard").mouseover(function(){
           
          })//
       })//ready
    </script>
<div class="container text-center">    
  <h3>What We Do</h3><br>
  <div class="row">
    <div class="col-sm-4">
      <a href="${pageContext.request.contextPath}/freeboard_list.do">
      <img src="${pageContext.request.contextPath}/resources/img/자유게시판.png" 
      class="img-rounded _hover_image hover_img" alt="Cinque Terre" style="width:80%" id="freeboard" >
      </a>
      <h3>자유게시판</h3>
    </div>
    <div class="col-sm-4"> 
      <a href="${pageContext.request.contextPath}/board/business_list.do">
      <img src="${pageContext.request.contextPath}/resources/img/창업게시판.png" 
      class="img-rounded" style="width:65%">
    </a>
    </div>
    <div class="col-sm-4"> 
      <a href="${pageContext.request.contextPath}/board/qna_list.do">
      <img src="${pageContext.request.contextPath}/resources/img/qna게시판.png" 
      class="img-rounded w3-hover-black" style="width:65%">       
       </a>
    </div>
    </div>
  </div>