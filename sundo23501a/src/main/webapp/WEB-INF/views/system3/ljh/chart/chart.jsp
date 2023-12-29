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

		footer {
			margin-top: 20px;
		}

		.flex_center {
			display: flex;
		}

		.chartMenu {
			border: solid 1px silver;
			padding: 20px;
			width: 20%;
		}

		.chart {
			width: 80%;
			padding: 0px 50px;
		}

		.chart p {
			text-align: center;
			padding: 15px;
			font-size: 17pt;
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

		#paging {
			margin: 30px 30px 0px 30px;
		}

		.pagination {
			--bs-pagination-border-color: white;
			--bs-pagination-color: gray;
			--bs-pagination-hover-color: black;
			--bs-pagination-hover-bg: white;
		}

		.tableCate th {
			border-left: solid white 1px;
			border-right: solid white 1px;
		}

		.tableCate {
			border-top: solid gray 2px;
			background: #EAEAEA;
			height: 40px;
		}

		.tableRow {
			border-bottom: solid lightgray 1px;
			height: 40px;
		}
		.underline {
			border-bottom:2px solid #fff;
		}
	</style>
	<script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
	<script>

		$(function() {

			$.ajax({
				url			: '/main_header_3',
				async		: false,
				dataType 	: 'html',
				success		: function(data) {
					$('#header').html(data);
				}
			});
			$("#sub-list-3").addClass('underline');

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
<header id="header"></header>
<br>
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
						<tr class="tableCate"><th>연번</th><th>시설물 종류</th><th>시설물 코드</th><th>고장 일시</th><th>조치 일시</th></tr>
						<c:forEach var="arList" items="${actionRptList }">
							<tr class="tableRow">
								<td>${arList.rn}</td>
								<td>${arList.facility_category}</td>
								<td>${arList.facility_code}</td>
								<td>${arList.break_date}</td>
								<td>${arList.action_date}</td>
							</tr>
						</c:forEach>
					</table>

					<div id="paging" class="pagination pagination-sm justify-content-center">
						<c:if test="${page.startPage > page.pageBlock}">
							<div class="page-link" onclick="location.href='chart?currentPage=${page.startPage - page.pageBlock}'">&laquo;</div>
						</c:if>

						<c:forEach var="i" begin="${page.startPage}" end="${page.endPage}">
							<div class="page-item" onclick="location.href='chart?currentPage=${i}'">
								<div class="page-link" style="cursor:pointer">${i}</div>
							</div>
						</c:forEach>

						<c:if test="${page.endPage < page.totalPage}">
							<div class="page-link" onclick="location.href='chart?currentPage=${page.startPage + page.pageBlock}'">&raquo;</div>
						</c:if>
					</div>
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