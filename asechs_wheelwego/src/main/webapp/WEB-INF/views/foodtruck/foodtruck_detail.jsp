<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<div class="container">
  <div class="list-group col-lg-3 text-center">
  <h4>Search Result</h4>
  <c:forEach items="${truckList}" var="truckInfo">
    <a href="#" class="list-group-item">${truckInfo.foodtruckName}</a>
    </c:forEach>
  </div>
</div>