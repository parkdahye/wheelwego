<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/board.css" type="text/css">
<table class="content">
<form>
ID<input type="text" name="id" value="${requestScope.detail_freeboard.id }" readonly="readonly"><br>
작성자<input type="text" name="title" value="${requestScope.detail_freeboard.title }" required="required"><br>
<input type="text" name="content" value="${requestScope.detail_freeboard.content }" required="required"><br>
<input type="text" name="" value="" required="required"><br>
</form>
</table>