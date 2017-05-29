<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="tiles"  uri="http://tiles.apache.org/tags-tiles" %>   
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Wheel, We go!</title>

 <!-- jQuery -->
    <script src="${pageContext.request.contextPath}/resources/vendor/jquery/jquery.min.js"></script>

    <!-- Bootstrap Core JavaScript -->
    <script src="${pageContext.request.contextPath}/resources/vendor/bootstrap/js/bootstrap.min.js"></script>
    <!-- Plugin JavaScript -->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-easing/1.3/jquery.easing.min.js"></script>
  
  
    <!-- Bootstrap Core CSS -->
    <link href="${pageContext.request.contextPath}/resources/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
    <!-- Theme CSS -->
    <link href="${pageContext.request.contextPath}/resources/css/asechs.css" rel="stylesheet">
    <!-- Custom Fonts -->
    <link href="${pageContext.request.contextPath}/resources/vendor/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css">
    <link href="https://fonts.googleapis.com/css?family=Montserrat:400,700" rel="stylesheet" type="text/css">
    <link href="https://fonts.googleapis.com/css?family=Lato:400,700,400italic,700italic" rel="stylesheet" type="text/css">
</head>
<body id="page-top" class="index">
	<div id="header">
		<tiles:insertAttribute name="header" />
	</div>
	<div class="container">
	<div id="page_main">
			<tiles:insertAttribute name="main" />
		</div>
	</div>
		<div id="page_footer">
			<tiles:insertAttribute name="footer" />
		</div>
</body>
</html>