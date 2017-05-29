<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:set var="customer" value="일반회원"/>

회원가입이 완료되었습니다! 당신의 아이디는 ${requestScope.memberVO.id}, 회원 유형은  
<c:choose>
   <c:when test="${requestScope.memberVO.memberType == customer}"> 일반회원입니다.<br> </c:when>
   <c:otherwise>사업자회원입니다.<br></c:otherwise>
</c:choose>