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
<header id="header"></header>
	<div class="container">
		<div class="row">
			<div id="center">
				<form action="/t_edit_F" method="post">
				<input type="hidden" name="river_code" value="${flow.river_code}">
				<input type="hidden" name="observe_year" value="${flow.observe_year}">
				<input type="hidden" name="observe_day" value="${flow.observe_day}">	
						<div id="center">
							<h1>일자료(우량)</h1>
							<h4>관측소명 : ${flow.observe_post}</h4>
							<h6>(단위:mm)</h6>
						<table class="listTable">
							<tr class="tableCate">
								<th>관측일</th>
								<c:forEach var="cnt" begin="1" end="12" step="1">
									<th>${cnt}월</th>
								</c:forEach>
							</tr>
							<tr class="tableRow">
								<td>${flow.observe_day}</td>
					 			<td><input type="text" name="january" style="width: 60px" value="${flow.january}"></td>
					 			<td><input type="text" name="february" style="width: 60px" value="${flow.february}"></td>
					 			<td><input type="text" name="march" style="width: 60px" value="${flow.march}"></td>
					 			<td><input type="text" name="april" style="width: 60px" value="${flow.april}"></td>
					 			<td><input type="text" name="may" style="width: 60px" value="${flow.may}"></td>
					 			<td><input type="text" name="june" style="width: 60px" value="${flow.june}"></td>
					 			<td><input type="text" name="july" style="width: 60px" value="${flow.july}"></td>
					 			<td><input type="text" name="august" style="width: 60px" value="${flow.august}"></td>
					 			<td><input type="text" name="september" style="width: 60px" value="${flow.september}"></td>
					 			<td><input type="text" name="october" style="width: 60px" value="${flow.october}"></td>
					 			<td><input type="text" name="november" style="width: 60px" value="${flow.november}"></td>
					 			<td><input type="text" name="december" style="width: 60px" value="${flow.december}"></td> 
							</tr>	
						</table>
							<div align="center">
							<button type="submit" class="btn btn-dark">수정완료</button>
							<input type="button" class="btn btn-secondary" onclick="location.href='/time_find_F?river_code=${flow.river_code}&observe_year=${flow.observe_year}'" value="닫기">
						</div>
					</div>
				</form>
			</div>
		</div>	
</div>
	<footer class="footer py-2">
		<div id="footer" class="container">
		</div>
	</footer>
</body>
</html>