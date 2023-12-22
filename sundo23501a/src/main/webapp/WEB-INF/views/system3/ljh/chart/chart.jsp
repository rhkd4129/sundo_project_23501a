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
	
	.flex_center {
		display: flex;
	}
	
	.chartMenu {
		border: solid 1px silver;
		padding: 20px;
		width: 250px;
	}
	
	.chart {
		width: 70%;
		padding: 0px 50px 50px 50px;
/* 		border: solid 1px; */
	}
	
	.chart p {
		text-align: center;
		padding: 15px;
		font-size: 15pt;
		font-weight: bold;
	}
	
	.menuTitle {
		text-align: center;
		font-size: 20pt;
		font-weight: bold;
		padding-bottom: 15px;
	}
	
	.menuList {
		font-size: 12pt;
    	padding: 0px 20px;
	}

	.menuList a {
		text-decoration: none;
		color: black;
	}
	
	.chartTbl {
		width: 100%;
		text-align: center;
		margin-top: 50px;
	}
	
</style>
<script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
<script>
	
	$(function() {

		$.ajax({
			url			: '/main_header_3',
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


	$(function() {
		$.ajax({
			url		: '/errorChart',
			dataType: 'json',
			success	: function(rtnData) {
				console.log(rtnData);
				var errorData = rtnData.list;
				var actionData = rtnData.secList;
				console.log(errorData);
				console.log(actionData);

				var ctx = document.getElementById('errChart').getContext('2d');
				var chart = new Chart(ctx, {
					type: 'bar',
					data: {
						labels: ['관개수로', '댐', '저수지', '펌프장'],
						datasets: [{
							label: '고장',
							data: errorData,
							backgroundColor: '#CC3D3D',
				        }, {
							label: '조치',
							data: actionData,
							backgroundColor: '#48f',
						}]
					},
					options: {
						responsive: true,
						scales: {
							y: {
								beginAtZero: true
							},
							x: {
								grid: {
									display: false,
									drawTicks: true
								}
							}
						},
						maxBarThickness: 40,
						plugins: {
							legend: {
					            position: 'top',
					            align: 'end'
					        }	
						}
					}
				});
			}
		});
	})
	
</script>
</head>
<body>
	<header id="header" style="margin-top: 3%"></header>

	<div class="container">
		<div class="row">
			<div id="center">
				<div class="flex_center">
					<div class="chartMenu">
						<p class="menuTitle">점검이력통계</p>
						<p class="menuList"><a href="/chart">고장 및 조치 통계</a></p>
						<p class="menuList">일지 작성 통계</p>
						<p class="menuList">기간 별 알람 통계</p>
						<p class="menuList">점검대상 별 알람 통계</p>
						<p class="menuList">장애유형 별 알람 통계</p>
					</div>
					
					<div class="chart">
						<p>고장 및 조치 통계</p>
						<canvas id="errChart"></canvas>
						
						<table class="chartTbl">
							<tr><th>연번</th><th>시설물 종류</th><th>시설물 코드</th><th>고장 일시</th><th>조치 일시</th></tr>
							<tr>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
							</tr>
						</table>
					</div>
				</div>
			</div>
		</div>
	</div>
	
	<footer class="footer py-2">
		<div id="footer" class="container">
		</div>
    </footer>

</body>
</html>