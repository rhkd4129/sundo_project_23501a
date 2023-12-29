<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/header.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>실시간 수문정보 관리시스템 - 수자원 정보</title>

<style>
header {
	height: 55px;
}
table {
	border-collapse: collapse;
	width: 100%;
}
th, td {
	border: 1px solid #ddd;
	padding: 8px;
	text-align: left;
}
th {
	text-align: center;
	background-color: #f2f2f2;
}

.btn_group{
	margin-top: 20%;
	margin-bottom: 2%;
	text-align: center;
}
.underline {
	border-bottom:2px solid #fff;
}
.doc-title table {
	widtd:100%;
	height:45px;
}
.doc-title th,
.doc-title td {
	border:0px;
	border-bottom:3px solid #2C3E50;
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
		$("#sub-list-2").addClass('underline');

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
<body class="pt-3">

	<header id="header"></header>

	<div class="container">
		<div class="card">
			<div style="margin: 30px">
				<table class="doc-title">
					<tr>
						<td style="vertical-align:top"><span class="apptitle">수자원 정보</span></td>
						<td>
							<div align="right">
								<button type="button" class="btn btn-secondary" onclick="location.href='/waterResourcesList'">
								<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-card-list" viewBox="0 0 16 16">
			                           <path d="M14.5 3a.5.5 0 0 1 .5.5v9a.5.5 0 0 1-.5.5h-13a.5.5 0 0 1-.5-.5v-9a.5.5 0 0 1 .5-.5h13zm-13-1A1.5 1.5 0 0 0 0 3.5v9A1.5 1.5 0 0 0 1.5 14h13a1.5 1.5 0 0 0 1.5-1.5v-9A1.5 1.5 0 0 0 14.5 2h-13z"/>
			                           <path d="M5 8a.5.5 0 0 1 .5-.5h7a.5.5 0 0 1 0 1h-7A.5.5 0 0 1 5 8zm0-2.5a.5.5 0 0 1 .5-.5h7a.5.5 0 0 1 0 1h-7a.5.5 0 0 1-.5-.5zm0 5a.5.5 0 0 1 .5-.5h7a.5.5 0 0 1 0 1h-7a.5.5 0 0 1-.5-.5zm-1-5a.5.5 0 1 1-1 0 .5.5 0 0 1 1 0zM4 8a.5.5 0 1 1-1 0 .5.5 0 0 1 1 0zm0 2.5a.5.5 0 1 1-1 0 .5.5 0 0 1 1 0z"/></svg>
							     	목록으로
								</button>
							</div>													
						</td>
					</tr>
				</table>
				<br>
				<table>
					<thead>
					<tr>
						<th>시설물 코드</th>
						<th>시설물 종류</th>
						<th>시설물 유형</th>
						<th>관리 기관</th>
						<th>행정 구역</th>
						<th>시설물 주소</th>
						<th>위도</th>
						<th>경도</th>
					</tr>
					</thead>
					<tbody>
					<tr>
						<td> ${waterResources.facility_code} </td>
						<td> ${waterResources.facility_category}  </td>
						<%--	<td> ${waterResources.facility_type}  </td>--%>
						<td> ${waterResources.cate_name}  </td>
						<td> ${waterResources.org_name}  </td>
						<td> ${waterResources.org_area_name}  </td>
						<td> ${waterResources.facility_addr}  </td>
						<td> ${waterResources.latitude}  </td>
						<td> ${waterResources.longitude}  </td>
					</tr>
					<!-- Add more rows as needed -->
					</tbody>
				</table>

				<div class="btn_group">
					<button class="btn btn-dark" onclick="location.href='/waterResourcesUpdateForm?facility_code=${waterResources.facility_code}'">
					<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-magic" viewBox="0 0 16 16">
                          <path d="M9.5 2.672a.5.5 0 1 0 1 0V.843a.5.5 0 0 0-1 0v1.829Zm4.5.035A.5.5 0 0 0 13.293 2L12 3.293a.5.5 0 1 0 .707.707L14 2.707ZM7.293 4A.5.5 0 1 0 8 3.293L6.707 2A.5.5 0 0 0 6 2.707L7.293 4Zm-.621 2.5a.5.5 0 1 0 0-1H4.843a.5.5 0 1 0 0 1h1.829Zm8.485 0a.5.5 0 1 0 0-1h-1.829a.5.5 0 0 0 0 1h1.829ZM13.293 10A.5.5 0 1 0 14 9.293L12.707 8a.5.5 0 1 0-.707.707L13.293 10ZM9.5 11.157a.5.5 0 0 0 1 0V9.328a.5.5 0 0 0-1 0v1.829Zm1.854-5.097a.5.5 0 0 0 0-.706l-.708-.708a.5.5 0 0 0-.707 0L8.646 5.94a.5.5 0 0 0 0 .707l.708.708a.5.5 0 0 0 .707 0l1.293-1.293Zm-3 3a.5.5 0 0 0 0-.706l-.708-.708a.5.5 0 0 0-.707 0L.646 13.94a.5.5 0 0 0 0 .707l.708.708a.5.5 0 0 0 .707 0L8.354 9.06Z"/></svg>
					수정
					</button>
					
					<button class="btn btn-secondary" onclick="location.href='/waterResourcesListForm'">
					<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-file-earmark-excel" viewBox="0 0 16 16">
                          <path d="M5.884 6.68a.5.5 0 1 0-.768.64L7.349 10l-2.233 2.68a.5.5 0 0 0 .768.64L8 10.781l2.116 2.54a.5.5 0 0 0 .768-.641L8.651 10l2.233-2.68a.5.5 0 0 0-.768-.64L8 9.219l-2.116-2.54z"/>
                          <path d="M14 14V4.5L9.5 0H4a2 2 0 0 0-2 2v12a2 2 0 0 0 2 2h8a2 2 0 0 0 2-2zM9.5 3A1.5 1.5 0 0 0 11 4.5h2V14a1 1 0 0 1-1 1H4a1 1 0 0 1-1-1V2a1 1 0 0 1 1-1h5.5v2z"/></svg>
					삭제
					</button>
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