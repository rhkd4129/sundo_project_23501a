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
	<form action="/observation_create" method="get">
		<input type="hidden" name="observe_code" value="${Observation.observe_code}">
		
		<h2>관측소 목록</h2>
		<div>
			<th>관측방식</th>
			<td><select id="observe_method">
				<option value="all" selected>전체</option>
					<c:forEach var="code" items="${CodeObserveMethod}">
						<option value="${code.cate_code}">${code.cate_name}</option>
					</c:forEach>
				</select></td>
			<th>운영기관</th>
			<td><select id="org_name">
				<option value="all" selected>전체</option>
					<c:forEach var="org" items="${OrgList}">
						<option value="${org.org_code}">${org.org_name}</option>
					</c:forEach>
				</select></td>
			<th>행정구역</th>
			<td><select id="org_area">
				<option value="all" selected>전체</option>
					<c:forEach var="org" items="${categoryList}">
						<option value="${org.org_area}">${org.org_area}</option>
					</c:forEach>
				</select></td>
				
			<th>관측소명</th><input type="text">
			<button onclick="ob_search()">검색</button>
		</div>
		
		<hr>
			<div align="right">
				<button type="submit">등록</button>
				<button onclick="ob_save()">저장</button>
			</div>
		<hr>
		<table>
			<tr>
				<th>연번</th>
				<th>관측소명</th>
				<th>표준코드</th>
				<th>위도(dd)</th>
				<th>경도(dd)</th>
				<th>관측방식</th>
				<th>운영기관</th>
				<th>조회</th>	
			</tr>
				<c:forEach var="Observation" items="${observationList}" varStatus="status">
				<tr>
					<td>${status.count}</td>
					<td onclick="location.href='/observation_detail?observe_code=${Observation.observe_code}'">${Observation.observe_post}</td>
					<td>${Observation.river_code} </td>
					<td>${Observation.latitude}</td>
					<td>${Observation.longitude}</td>
					<td>${Observation.observe_method_name}</td>
					<td>${Observation.org_name}</td>
					<td>${Observation.observe_code}</td>
				</tr>
				</c:forEach>
		</table>
	</form>
</body>
</html>