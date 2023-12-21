<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/header.jsp" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
	header {
		height: 55px;
	}
	
	.listTable {
		width: 100%;
		text-align: center;
	}

	.tableCate {
		border-top: solid gray 2px;
		background: #EAEAEA;
		height: 40px;
	}
	
		.tableCate th {
		border-left: solid white 1px;
		border-right: solid white 1px;
	}

	.tableRow {
		border-bottom: solid lightgray 1px;
		height: 40px;
	}
	
	
</style>
	<script>

		$(function() {

			$.ajax({
				url			: '/main_header_21',
				dataType 	: 'html',
				success		: function(data) {
					$('#header').html(data);
				}
			});

			$.ajax({
				url			: '/main_footer',
				dataType 	: 'html',
				success		: function(data) {
					$('#footer').html(data);
				}
			});
		});

	</script>
</head>
<body>
<div class="container">
	<input type="hidden" name="river_code" value="${flowList.get(0).river_code}">
	<input type="hidden" name="observe_year" value="${flowList.get(0).observe_year}">

		<div class="row">
			<!-- 검색 -->
			<div class="card">
		    	<div class="card-body">
				<table>
					<tr>
						<th>자료유형</th>
						<td><select id="type" class="form-select form-select-sm" >
								<option value="hour" selected="selected">시자료</option>
								<option value="statistics">통계</option>
							</select></td>
						<th width="10%">년도</th>
						<td width="30%">
							<select id="year" class="form-select form-select-sm">
								<c:forEach var="FlowYear" items="${flowYearList}">
									<option value="${FlowYear.observe_year}">${FlowYear.observe_year}</option>
								</c:forEach>
							</select>
						</td>	
						<td width="10%">
						<button onclick="ob_search()" class="btn btn-dark" >검색</button>
						</td>
					</tr>
				</table>
				</div>
			</div>
			
			<!-- 태그 -->
			<div class="card">
		    	<div class="card-body">
					<table>
						<tr>
							<th><a href="/time_find?river_code=${flowList.get(0).river_code}">수위정보</a></th>
							<th><a href="/time_find_R?river_code=${flowList.get(0).river_code}">강우량정보</a></th>
							<th><a href="/time_find_F?river_code=${flowList.get(0).river_code}">우량정보</a></th>
						</tr>
					</table>		
				</div>
			</div>
		

			<div id="center">
				<h1>일자료(우량)</h1>
				<input type="hidden" name="river_code" value="${flowList.get(0).river_code}">
				<h4>관측소명 : ${flowList.get(0).observe_post}</h4>
				<h6>(단위:mm)</h6>
				<div align="right">
					<button type="button" class="btn btn-secondary pull-right" onclick="ob_save()">
		                <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-clipboard2-check-fill" viewBox="0 0 16 16">
		                <path d="M10 .5a.5.5 0 0 0-.5-.5h-3a.5.5 0 0 0-.5.5.5.5 0 0 1-.5.5.5.5 0 0 0-.5.5V2a.5.5 0 0 0 .5.5h5A.5.5 0 0 0 11 2v-.5a.5.5 0 0 0-.5-.5.5.5 0 0 1-.5-.5"/>
		                <path d="M4.085 1H3.5A1.5 1.5 0 0 0 2 2.5v12A1.5 1.5 0 0 0 3.5 16h9a1.5 1.5 0 0 0 1.5-1.5v-12A1.5 1.5 0 0 0 12.5 1h-.585c.055.156.085.325.085.5V2a1.5 1.5 0 0 1-1.5 1.5h-5A1.5 1.5 0 0 1 4 2v-.5c0-.175.03-.344.085-.5m6.769 6.854-3 3a.5.5 0 0 1-.708 0l-1.5-1.5a.5.5 0 1 1 .708-.708L7.5 9.793l2.646-2.647a.5.5 0 0 1 .708.708Z"/></svg>
		                저장
		             </button>
				</div>
				<table class="listTable">
					<tr class="tableCate">
						<th>관측일</th>
						<c:forEach var="cnt" begin="1" end="12" step="1">
							<th>${cnt}월</th>
						</c:forEach>
					</tr>
					<tbody id="searchF">
					 <c:forEach var="cnt" begin="0" end="${fn:length(flowList)-1}" step="1">
						<tr class="tableRow">	
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
				 </tbody>
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