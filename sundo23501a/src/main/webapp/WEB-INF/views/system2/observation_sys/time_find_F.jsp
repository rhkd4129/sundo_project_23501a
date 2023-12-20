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
<div class="container">
	<input type="hidden" name="river_code" value="${flowList.get(0).river_code}">
	<input type="hidden" name="observe_year" value="${flowList.get(0).observe_year}">

		<div class="row">
			<!-- 검색 -->
			<span class="border border-secondary border-2" style="padding:20px; margin:30px" >
				<th>자료유형</th>
				<td><select id="type" >
						<option value="hour" selected="selected">시자료</option>
						<option value="statistics">통계</option>
					</select></td>
				<th>년도</th>
				<td><select id="year" >
					<c:forEach var="FlowYear" items="${flowYearList}">
						<option value="${FlowYear.observe_year}">${FlowYear.observe_year}</option>
					</c:forEach>
					</select></td>	
				<button onclick="ob_search()">검색</button>
			</span> 
			<!-- 태그 -->
			<div style="margin-bottom: 30px">
				<span class="border border-secondary border-2" style="padding:20px; margin:30px" >
						<tr>
							<th><a href="/time_find?river_code=${flowList.get(0).river_code}">수위정보</a></th>
							<th><a href="/time_find_R?river_code=${flowList.get(0).river_code}">강우량정보</a></th>
							<th><a href="/time_find_F?river_code=${flowList.get(0).river_code}">우량정보</a></th>
						</tr>
				</span>
			</div>
		

			<div id="center">
				<h1>일자료(우량)</h1>
				<input type="hidden" name="river_code" value="${flowList.get(0).river_code}">
				<h4>관측소명 : ${flowList.get(0).observe_post}</h4>
				<h6>(단위:mm)</h6>
				<div align="right">
					<button>저장</button>
				</div>
				<table class="table table-hover">
					<tr>
						<th>관측일</th>
						<c:forEach var="cnt" begin="1" end="12" step="1">
							<th>${cnt}월</th>
						</c:forEach>
					</tr>
					
						
						<%--  --%>
					 <c:forEach var="cnt" begin="0" end="${fn:length(flowList)-1}" step="1">
							<tr>	
							<td><a href="/time_edit_F?river_code=${flowList.get(cnt).river_code}&observe_year=${flowList.get(cnt).observe_year}&observe_day=${flowList.get(cnt).observe_day}">${flowList.get(cnt).observe_day}</a></td>
				 			<td>${flowList.get(cnt).january}</td>
							<td>${flowList.get(cnt).february}</td>
							<td>${flowList.get(cnt).march}</td>
							<td>${flowList.get(cnt).april}</td>
							<td>${flowList.get(cnt).may}</td>
							<td>${flowList.get(cnt).june}</td>
							<td>${flowList.get(cnt).july}</td>
							<td>${flowList.get(cnt).august}</td>
							<td>${flowList.get(cnt).september}</td>
							<td>${flowList.get(cnt).october}</td>
							<td>${flowList.get(cnt).november}</td>
							<td>${flowList.get(cnt).december}</td>	 
					</tr>	
				 </c:forEach>
				 
				</table>

			</div>
		</div>
	</div>
	<footer class="footer py-2">
		<div id="footer" class="container">
		</div>
	</footer>
</body>
</html>