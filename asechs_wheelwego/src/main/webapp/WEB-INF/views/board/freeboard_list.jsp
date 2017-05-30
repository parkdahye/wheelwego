<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<title>글목록</title>
<script type="text/javascript">
	
</script>
<body>
	<table class="table table-hover">
		<caption>목록</caption>
		<thead>
			<tr>
				<th class="no">NO</th>
				<th class="title">제목</th>
				<th class="name">이름</th>
				<th class="date">작성일</th>
				<th class="hit">HIT</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach items="${requestScope.freeBoardList }" var="freeBoardList">
				<tr>
					<td>${freeBoardList.no }</td>
					<td><a href="${pageContext.request.contextPath}/board/freeboard_detail_content.do?no=${freeBoardList.no}">${freeBoardList.title }</a></td>
					<td>${freeBoardList.id }</td>
					<td>${freeBoardList.timePosted }</td>
					<td>${freeBoardList.hits }</td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
	<br></br>
