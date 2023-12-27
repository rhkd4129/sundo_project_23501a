<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/header.jsp" %>   
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>실시간 수문정보 관리시스템 - 일자료(우량)</title>
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
	height: 35px;
}
.tableCate th {
	border-left: solid white 1px;
	border-right: solid white 1px;
}
.tableRow {
	border-bottom: solid lightgray 1px;
	height: 35px;
}
.underline {
	border-bottom:2px solid #fff;
}
.input-data{
	width:100%;
	height:30px;
	border:1px solid #aabbcc;
	border-radius: 5px;
	text-align:right;
	background-color:#f0faff;
}
</style>
<script>

	$(function() {
	
		$.ajax({
			url			: '/main_header_2',
			async		: false,
			dataType 	: 'html',
			success		: function(data) {
				$('#header').html(data);
			}
		});
		$("#sub-list-1").addClass('underline');
	
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
	<div class="container" style="margin-top:20px">
		<form action="/t_edit_F" method="post">
			<input type="hidden" name="river_code" value="${flow.river_code}">
			<input type="hidden" name="observe_year" value="${flow.observe_year}">
			<input type="hidden" name="observe_day" value="${flow.observe_day}">	
			<span class="apptitle">일자료(우량)</b></span>
			<h5><b>관측소명 : <font class="text-info">${flow.observe_post}</font></b></h5>
			<h6><b>(단위:mm)</b></h6>
			<table class="listTable">
				<tr class="tableCate">
					<th>관측일</th>
					<c:forEach var="cnt" begin="1" end="12" step="1">
						<th>${cnt}월</th>
					</c:forEach>
				</tr>
				<tr class="tableRow">
					<td><div style="width:70px;font-weight:bold;">${flow.observe_day}일</div></td>
		 			<td><input type="text" name="january" class="input-data" value="${flow.january}"></td>
		 			<td><input type="text" name="february" class="input-data" value="${flow.february}"></td>
		 			<td><input type="text" name="march" class="input-data" value="${flow.march}"></td>
		 			<td><input type="text" name="april" class="input-data" value="${flow.april}"></td>
		 			<td><input type="text" name="may" class="input-data" value="${flow.may}"></td>
		 			<td><input type="text" name="june" class="input-data" value="${flow.june}"></td>
		 			<td><input type="text" name="july" class="input-data" value="${flow.july}"></td>
		 			<td><input type="text" name="august" class="input-data" value="${flow.august}"></td>
		 			<td><input type="text" name="september" class="input-data" value="${flow.september}"></td>
		 			<td><input type="text" name="october" class="input-data" value="${flow.october}"></td>
		 			<td><input type="text" name="november" class="input-data" value="${flow.november}"></td>
		 			<td><input type="text" name="december" class="input-data" value="${flow.december}"></td> 
				</tr>
			</table>
			<div align="center" style="margin-top:30px">
				<button type="submit" class="btn btn-dark">수정완료</button>
				<input type="button" class="btn btn-secondary" onclick="location.href='/time_find_F?river_code=${flow.river_code}&observe_year=${flow.observe_year}'" value="닫기">
			</div>
		</form>
	</div>
	
	<footer class="footer py-2">
		<div id="footer" class="container">
		</div>
	</footer>
</body>
</html>