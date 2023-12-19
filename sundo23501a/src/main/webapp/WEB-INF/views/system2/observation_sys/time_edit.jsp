<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/header.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div id="center">
		<form action="/t_edit" method="post">
			<h1>시자료(수위)</h1>
			<input type="hidden" name="river_code" value="${waterLevel.river_code}">
			<input type="hidden" name="observe_date" value="${waterLevel.observe_date}">
			<h4>관측소명 : ${waterLevel.observe_post}</h4>
			<h6>(단위:mm)</h6>
			<table class="table table-hover">
				<tr>
					<th>관측일시</th>
						<c:forEach var="cnt" begin="0" end="23" step="1">
							<th>${cnt}</th>
						</c:forEach>
				</tr>
				<tr>
					<td>${waterLevel.observe_date}</td>
					
						<td><input type="text" name="hour_01" style="width: 60px" value="${waterLevel.hour_01}"></td>
						<td><input type="text" name="hour_02" style="width: 60px" value="${waterLevel.hour_02}"></td>
						<td><input type="text" name="hour_03" style="width: 60px" value="${waterLevel.hour_03}"></td>
						<td><input type="text" name="hour_04" style="width: 60px" value="${waterLevel.hour_04}"></td>
						<td><input type="text" name="hour_05" style="width: 60px" value="${waterLevel.hour_05}"></td>
						<td><input type="text" name="hour_06" style="width: 60px" value="${waterLevel.hour_06}"></td>
						<td><input type="text" name="hour_07" style="width: 60px" value="${waterLevel.hour_07}"></td>
						<td><input type="text" name="hour_08" style="width: 60px" value="${waterLevel.hour_08}"></td>
						<td><input type="text" name="hour_09" style="width: 60px" value="${waterLevel.hour_09}"></td>
						<td><input type="text" name="hour_10" style="width: 60px" value="${waterLevel.hour_10}"></td>
						<td><input type="text" name="hour_11" style="width: 60px" value="${waterLevel.hour_11}"></td>
						<td><input type="text" name="hour_12" style="width: 60px" value="${waterLevel.hour_12}"></td>
						<td><input type="text" name="hour_13" style="width: 60px" value="${waterLevel.hour_13}"></td>
						<td><input type="text" name="hour_14" style="width: 60px" value="${waterLevel.hour_14}"></td>
						<td><input type="text" name="hour_15" style="width: 60px" value="${waterLevel.hour_15}"></td>
						<td><input type="text" name="hour_16" style="width: 60px" value="${waterLevel.hour_16}"></td>
						<td><input type="text" name="hour_17" style="width: 60px" value="${waterLevel.hour_17}"></td>
						<td><input type="text" name="hour_18" style="width: 60px" value="${waterLevel.hour_18}"></td>
						<td><input type="text" name="hour_19" style="width: 60px" value="${waterLevel.hour_19}"></td>
						<td><input type="text" name="hour_20" style="width: 60px" value="${waterLevel.hour_20}"></td>
						<td><input type="text" name="hour_21" style="width: 60px" value="${waterLevel.hour_21}"></td>
						<td><input type="text" name="hour_22" style="width: 60px" value="${waterLevel.hour_22}"></td>
						<td><input type="text" name="hour_23" style="width: 60px" value="${waterLevel.hour_23}"></td>
						<td><input type="text" name="hour_24" style="width: 60px" value="${waterLevel.hour_24}"></td>	
				</tr>

			</table>
			<div align="center">
				<button type="submit">수정</button>
				<input type="button" onclick="location.href='/time_find?river_code=${waterLevel.river_code}'" value="닫기">
			</div>
		</form>
	</div>
	
</body>
</html>