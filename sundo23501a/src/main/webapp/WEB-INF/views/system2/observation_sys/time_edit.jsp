<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/header.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>실시간 수문정보 관리시스템 - 시자료(수위)</title>
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
	width:50px;
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
		<form action="/t_edit" method="post">
			<input type="hidden" name="river_code" value="${waterLevel.river_code}">
			<input type="hidden" name="observe_date" value="${waterLevel.observe_date}">
			<span class="apptitle">시자료(수위)</span>
			<h5><b>관측소명 : <font class="text-info">${waterLevel.observe_post}</font></b></h5>
			<h6><b>(단위:mm)</b></h6>
			<table class="listTable">
				<tr class="tableCate">
					<th>관측일시</th>
					<c:forEach var="cnt" begin="0" end="23" step="1">
						<th>${cnt}</th>
					</c:forEach>
				</tr>
				
				<tr class="tableRow">
					<td><div style="width:70px;font-weight:bold;">${waterLevel.observe_date}</div></td>
					
					<td><input type="text" name="hour_01" class="input-data" value="${waterLevel.hour_01}"></td>
					<td><input type="text" name="hour_02" class="input-data" value="${waterLevel.hour_02}"></td>
					<td><input type="text" name="hour_03" class="input-data" value="${waterLevel.hour_03}"></td>
					<td><input type="text" name="hour_04" class="input-data" value="${waterLevel.hour_04}"></td>
					<td><input type="text" name="hour_05" class="input-data" value="${waterLevel.hour_05}"></td>
					<td><input type="text" name="hour_06" class="input-data" value="${waterLevel.hour_06}"></td>
					<td><input type="text" name="hour_07" class="input-data" value="${waterLevel.hour_07}"></td>
					<td><input type="text" name="hour_08" class="input-data" value="${waterLevel.hour_08}"></td>
					<td><input type="text" name="hour_09" class="input-data" value="${waterLevel.hour_09}"></td>
					<td><input type="text" name="hour_10" class="input-data" value="${waterLevel.hour_10}"></td>
					<td><input type="text" name="hour_11" class="input-data" value="${waterLevel.hour_11}"></td>
					<td><input type="text" name="hour_12" class="input-data" value="${waterLevel.hour_12}"></td>
					<td><input type="text" name="hour_13" class="input-data" value="${waterLevel.hour_13}"></td>
					<td><input type="text" name="hour_14" class="input-data" value="${waterLevel.hour_14}"></td>
					<td><input type="text" name="hour_15" class="input-data" value="${waterLevel.hour_15}"></td>
					<td><input type="text" name="hour_16" class="input-data" value="${waterLevel.hour_16}"></td>
					<td><input type="text" name="hour_17" class="input-data" value="${waterLevel.hour_17}"></td>
					<td><input type="text" name="hour_18" class="input-data" value="${waterLevel.hour_18}"></td>
					<td><input type="text" name="hour_19" class="input-data" value="${waterLevel.hour_19}"></td>
					<td><input type="text" name="hour_20" class="input-data" value="${waterLevel.hour_20}"></td>
					<td><input type="text" name="hour_21" class="input-data" value="${waterLevel.hour_21}"></td>
					<td><input type="text" name="hour_22" class="input-data" value="${waterLevel.hour_22}"></td>
					<td><input type="text" name="hour_23" class="input-data" value="${waterLevel.hour_23}"></td>
					<td><input type="text" name="hour_24" class="input-data" value="${waterLevel.hour_24}"></td>	
				</tr>
			</table>
			<div align="center" style="margin-top:30px">
				<button type="submit" class="btn btn-dark">수정완료</button>
				<input type="button" class="btn btn-secondary" onclick="location.href='/time_find?river_code=${waterLevel.river_code}'" value="닫기">
			</div>
		</form>
	</div>
	
	<footer class="footer py-2">
		<div id="footer" class="container">
		</div>
	</footer>
</body>
</html>