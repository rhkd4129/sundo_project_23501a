<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/header.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>한강 수자원관리 종합 플랫폼 - 접속 통계</title>

<!--CSS START -->
<!-- CSS END -->

<!-- JS START -->
<script type="text/javascript" src="/js/board.js"></script>
<script type="text/javascript" src="/js/common.js"></script>
<script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
<!-- JS END -->
  

<script type="text/javascript">

	var monthArray = new Array(32);

	$(function() {
		
		$.ajax({
			url			: '/main_header_1',
			dataType 	: 'html',
			success		: function(data) {
				$('#header').html(data);
			}
		});
		
		$.ajax({
			url			: '/adminpage_menu',
			dataType 	: 'html',
			success		: function(data) {
				$('#menubar').html(data);
			}
		});
	
		$.ajax({
			url			: '/main_footer',
			dataType 	: 'html',
			success		: function(data) {
				$('#footer').html(data);
			}
		});
	
		$('#idNewWinFlag').click(function(){
			var checked = $(this).is(':checked');
			if(checked) {
				$(this).val("Y");
				setCookie("NewWinFlag", "Y", 1, "/");
			}else {
				$(this).val("N");
				setCookie("NewWinFlag", "N", 1, "/");
			}
		});

		var NEW_WIN_FLAG = getCookie("NewWinFlag");
		if(NEW_WIN_FLAG == 'N') {
			$('#idNewWinFlag').prop('checked', false);
		}else{
			$('#idNewWinFlag').prop('checked', true);
		}
		
		$("#year_month").change(function(){
			searchYearMonth();
		});
		
		//검색
		searchYearMonth();
		
	});	

	function searchYearMonth() {
		
		//var params = getUrlParams();
		//var p_year_month = params.year_month;
		var p_year_month = $("#year_month").val();
		
		$.ajax({
			url			: '/system_log_search',
			data		: {year_month:p_year_month},
			dataType	: 'json',
			success		: function(data) {
				displayData(data);
			},
			error : function(request, status, error) {
				console.log(error)
			}
		});

	}	
	
	function displayData(list) {
		
		//배열 초기화		
		for (var i = 0; i <= 31; i++) {
			monthArray[i] = [i,0,0,0];
		}

		//배열 값셋팅
		//system_category-day, count
		$.each(list, function (index, item) {
			var temp = item.day;
			var system_category = temp.substring(0, temp.indexOf("-"));
			var day = temp.substring(temp.indexOf("-")+1, temp.length);
			var count = item.count;

			console.log(index.toString() + ": system_category="+system_category);
			console.log(index.toString() + ": day="+day);
			console.log(index.toString() + ": count="+count);
			
			if(system_category == "1") { //관리자
				monthArray[day][0] = parseInt(day);
				monthArray[day][1] = parseInt(count);
			}else if(system_category == "2") { //실시간 수문관리
				monthArray[day][0] = parseInt(day);
				monthArray[day][2] = parseInt(count);
			}else if(system_category == "3") { //수자원 시설물
				monthArray[day][0] = parseInt(day);
				monthArray[day][3] = parseInt(count);
			}
		});

		console.log(monthArray);
		
		google.charts.load('current', {packages: ['corechart', 'line']});
		google.charts.setOnLoadCallback(drawCurveTypes);

	}

	function drawCurveTypes() {
		
		var data = new google.visualization.DataTable();
		data.addColumn('number', 'X');
		data.addColumn('number', '관리자');
		data.addColumn('number', '실시간 수문 정보 관리 시스템');
		data.addColumn('number', '수자원 시설물 운영 관리 시스템');

		data.addRows(monthArray);

		var options = {
			hAxis: {
				title: '날짜'
			},
			vAxis: {
				title: '접속통계'
			},
			series: {
				1: {curveType: 'function'}
			}
		};

		var chart = new google.visualization.LineChart(document.getElementById('chart_div'));
		chart.draw(data, options);
	}
	
</script>

<style type="text/css">
header {
    height: 55px;
}
hr{
	margin:0px;
}
.table > thead {
	border-top:2px solid #888888;
}
.searchbox {
	border:2px solid #dee2e6;
	border-radius: 10px;
	padding: 10px;
}
.searchbox th, 
.searchbox td {
	padding: 2px;
}

</style>
</head>
<body>
<!-- HEADER -->
<header id="header"></header>
<!-- CONTENT -->
<div>
	<div class="row">
 		<!-- 메뉴 -->
		<div id="menubar" class="col-2"></div>		
		<!-- 본문 -->
		<div id="center" class="col-10">
			<!------------------------------ //개발자 소스 입력 START ------------------------------->
			<br>
			<div id="idFrameSet">
				<div id="idFrameList">
					<div class="container-fluid">
						<table width="100%" style="height:45px">
							<tr>
								<td style="vertical-align:top"><span class="apptitle">접속 통계</span></td>
								<td align="right">									
								</td>
							</tr>
						</table>
						<form name="frmSearch" action="system_log_list">
							<div class="searchbox">
								<table width="100%">
									<tr>
										<td><h6><b>검색조건</b></h6><hr></td>
									</tr>
									<tr>
										<td>										
											<table>
												<tr>
													<td style="padding-right:10px;font-weight:bold;">월선택</td>
													<td><input type="month" name="year_month" id="year_month" class="form-control" value="${year_month}"></td>
													<td style="padding:0px 10px 0px 20px">
														<button type="button" class="btn btn-dark btn-sm" onclick="searchYearMonth()">검색</button>
														<button type="button" class="btn btn-outline-secondary btn-sm" onclick="goto('system_log_list')" style="cursor:pointer">
										         			<svg xmlns="http://www.w3.org/2000/svg" width="18" height="18" fill="currentColor" class="bi bi-arrow-clockwise" viewBox="0 0 16 16">
																<path fill-rule="evenodd" d="M8 3a5 5 0 1 0 4.546 2.914.5.5 0 0 1 .908-.417A6 6 0 1 1 8 2v1z"></path>
																<path d="M8 4.466V.534a.25.25 0 0 1 .41-.192l2.36 1.966c.12.1.12.284 0 .384L8.41 4.658A.25.25 0 0 1 8 4.466z"></path>
															</svg>
														</button>
													</td>
												</tr>
											</table>
										</td>
									</tr>
								</table>
							</div>
						</form>
						<table width="100%" style="margin-bottom:5px">
							<tr>
								<!-- <td width="100">
									<button type="button" class="btn btn-dark btn-sm" onclick="callAction('write','login_log_write')">작성</button>
								</td>
								<td width="200">
									<div class="form-check form-switch">
										<input class="form-check-input" type="checkbox" role="switch" id="idNewWinFlag" checked="" value="newwin">flexSwitchCheckChecked
										<label class="form-check-label" for="flexSwitchCheckChecked">새 창 열기</label>
									</div>
								</td> -->
								<td width="*" style="text-align:right">
									<c:if test="${not empty keyword}">								
										<a href="system_log_list"><img src="/images/btn_icon_delete2.png" width="18" height="19" style="vertical-align:bottom"></a> 
										검색어( <c:forEach var="code" items="${search_codelist}"><c:if test="${code.cate_code == search}">${code.cate_name}</c:if></c:forEach> = ${keyword} ) 
										<img src="/images/icon_search.png" width="14" height="14" style="vertical-align:bottom"> 검색 건수
									</c:if>
									<c:if test="${keyword eq null}">총 건수</c:if>
									 : ${totalCount}
								</td>
							</tr>
						</table>
						
						<div id="chart_div"></div>
						<div id="chart_div2"></div>
						<div id="chart_div3"></div>
						
						<br><br>
						<div style="display:flex;width:100%;margin:0 auto;justify-content:center;">
							<table>
								<tr>
									<c:forEach var="code" items="${CodeList_system_category}" varStatus="status">
										<td><div style="width:100px;height:2px;margin-left:30px;border:1px solid 
										<c:if test="${status.count == 1}">#3366cc</c:if>
										<c:if test="${status.count == 2}">#dc3912</c:if>
										<c:if test="${status.count == 3}">#ff9900</c:if>
										"></div></td>
										<td><b>${code.cate_name}</b></td>
									</c:forEach>							
									
								</tr>
							</table>
						</div>
						<div style="display:none">
							<table>
								<c:forEach var="data" items="${boardList}">
									<tr><td>${data.day}, ${data.count}</td></tr> 
								</c:forEach>
							</table>
						</div>	
					</div>
				</div>
				<div id="idFrameDoc">
				</div>
			</div>
	  		<!------------------------------ //개발자 소스 입력 END ------------------------------->	
		</div>
	</div>
</div>
<br><br>
<!-- FOOTER -->
<footer class="footer py-2">
  <div id="footer" class="container">
  </div>
</footer>
</body>
</html>