<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="tiles"  uri="http://tiles.apache.org/tags-tiles" %>   
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div id="header"><tiles:insertAttribute name="header" /></div>
	<div id="main" class="col-sm-7 text-left"><tiles:insertAttribute name="main" /></div>
	<div id="right" class="col-sm-2 sidenav"><tiles:insertAttribute name="right" /></div>
	<div id="footer"><tiles:insertAttribute name="footer" /></div>
</body>
</html>