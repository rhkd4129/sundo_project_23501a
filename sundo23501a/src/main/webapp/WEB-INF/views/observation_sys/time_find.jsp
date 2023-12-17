<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>시자료</h1>
	<h2>관측소명
		<select name="observe_post">
			<c:forEach var="Water" items="${waterLevelList}">
				<c:if test="">
				<option value="${Water.river_code}">${Water.observe_post}</option>
			</c:forEach>
	</h2>
	<h4>(단위:mm)</h4>
	<table>
	
	
	</table>
</body>
</html>