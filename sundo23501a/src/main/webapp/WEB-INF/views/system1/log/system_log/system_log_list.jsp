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
			
	});	
	
	
</script>

<script type="text/javascript">

google.charts.load('current', {packages: ['corechart', 'line']});
google.charts.setOnLoadCallback(drawBasic);
google.charts.setOnLoadCallback(drawBasic2);
google.charts.setOnLoadCallback(drawBasic3);

function drawBasic() {

      var data = new google.visualization.DataTable();
      data.addColumn('number', 'X');
      data.addColumn('number', '관리자');
      
      data.addRows([
        [0, 0],   [1, 40],  [2, 33],  [3, 27],  [4, 18],  [5, 9],
        [6, 31],  [7, 17],  [8, 23],  [9, 10],  [10, 52], [11, 15],
        [12, 40], [13, 30], [14, 22], [15, 17], [16, 34], [17, 38],
        [18, 22], [19, 24], [20, 12], [21, 15], [22, 36], [23, 47],
        [24, 30], [25, 20], [26, 22], [27, 41], [28, 39], [29, 13],
        [30, 25], [31, 30]
      ]);

      
      var options = {
        hAxis: {
          title: '날짜'
        },
        vAxis: {
          title: '접속통계'
        }
      };

      var chart = new google.visualization.LineChart(document.getElementById('chart_div'));

      chart.draw(data, options);
      
      $('#chart_div').find('path').attr('stroke', '#ff5500');
}
function drawBasic2() {

    var data = new google.visualization.DataTable();
    data.addColumn('number', 'X');
    data.addColumn('number', '실시간 수문 정보 관리 시스템');
    
    data.addRows([
      [0, 0],   [1, 10],  [2, 23],  [3, 17],  [4, 18],  [5, 9],
      [6, 11],  [7, 27],  [8, 33],  [9, 40],  [10, 32], [11, 35],
      [12, 30], [13, 40], [14, 42], [15, 47], [16, 44], [17, 48],
      [18, 52], [19, 54], [20, 42], [21, 55], [22, 56], [23, 57],
      [24, 60], [25, 50], [26, 52], [27, 51], [28, 49], [29, 53],
      [30, 55], [31, 60]
    ]);

    
    var options = {
      hAxis: {
        title: '날짜'
      },
      vAxis: {
        title: '접속통계'
      }
    };

    var chart = new google.visualization.LineChart(document.getElementById('chart_div2'));

    chart.draw(data, options);
    
    $('#chart_div2').find('path').attr('stroke', '#0055dd');
}
function drawBasic3() {

    var data = new google.visualization.DataTable();
    data.addColumn('number', 'X');
    data.addColumn('number', '수자원 시설물 운영 관리 시스템');
    
    data.addRows([
      [0, 0],   [1, 20],  [2, 53],  [3, 57],  [4, 28],  [5, 29],
      [6, 31],  [7, 37],  [8, 33],  [9, 40],  [10, 12], [11, 15],
      [12, 20], [13, 40], [14, 22], [15, 37], [16, 34], [17, 18],
      [18, 12], [19, 24], [20, 12], [21, 25], [22, 26], [23, 17],
      [24, 40], [25, 30], [26, 22], [27, 11], [28, 39], [29, 13],
      [30, 25], [31, 30]
    ]);

    
    var options = {
      hAxis: {
        title: '날짜'
      },
      vAxis: {
        title: '접속통계'
      }
    };

    var chart = new google.visualization.LineChart(document.getElementById('chart_div3'));

    chart.draw(data, options);
    
    $('#chart_div3').find('path').attr('stroke', '#55aa00');
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
													<td><input type="month" name="year_month" class="form-control" value="${year_month}"></td>
													<td style="padding:0px 10px 0px 20px">
														<button type="submit" class="btn btn-dark btn-sm">검색</button>
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
										<c:if test="${status.count == 1}">#ff5500</c:if>
										<c:if test="${status.count == 2}">#0055dd</c:if>
										<c:if test="${status.count == 3}">#55aa00</c:if>
										"></div></td>
										<td><b>${code.cate_name}</b></td>
									</c:forEach>
								</tr>
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