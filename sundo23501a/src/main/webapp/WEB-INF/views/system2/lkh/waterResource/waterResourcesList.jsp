<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/header.jsp" %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>실시간 수문정보 관리시스템 - 수자원 목록</title>
<style>
/* #facilityTable {
	border-collapse: collapse;
	width: 100%;
}
#facilityTable th, 
#facilityTable td {
	border: 1px solid #ddd;
	padding: 8px;
	text-align: left;
}
#facilityTable th {
	background-color: #f2f2f2;
} */
header {
	height: 55px;
}
.searchbox {
	border:2px solid #dee2e6;
	border-radius: 10px;
	padding: 10px;
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
#paging {
	margin: 10px;
}
.underline {
	border-bottom:2px solid #fff;
}

</style>

	<script>
		// 페이지 로드 시 자동으로 데이터를 받아오는 함수 호출
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

		// 데이터를 받아오는 함수
		function fetchData() {
			// Ajax를 이용하여 서버로 데이터 요청
			$.ajax({
				url: '/waterResourcesListA', // 비동기 데이터를 처리할 서블릿이나 JSP 페이지의 경로
				type: 'GET',
				dataType: 'json', // 받아올 데이터 타입 (JSON 형식으로 받아오는 경우)
				contentType : "application/json; charset=utf-8",
				success: function(data) {
					displayData(data.waterResourcesList);
				},
				error: function() {
					// 데이터를 받아오지 못했을 때 처리
					alert("에러");
					$('#result').text('데이터를 가져오는데 실패했습니다.');
				}
			});
		}

		function displayData(data) {
			var tableBody = $('#facilityTable tbody');
			// 기존에 표시되어 있는 데이터 삭제
			tableBody.empty();
			// 데이터를 테이블에 추가
			$.each(data, function(index, waterResources) {
				console.log(waterResources.rn);
				var row = '<tr>' +
						'<td>' + waterResources.rn + '</td>' +
						'<td><a href="waterResourcesListDetail?facility_code=' + waterResources.facility_code + '">' + waterResources.facility_code + '</a></td>'+
						'<td>' + waterResources.facility_category + '</td>' +
						'<td>' + waterResources.cate_name + '</td>' +
						'<td>' + waterResources.org_area_name + '</td>' +
						'<td>' + waterResources.org_name + '</td>' +
						'</tr>';
				tableBody.append(row)
			})

		}

		function Listsearch() {
			var facilityCategory = $("select[name='facility_category']").val();
			var orgCode = $("select[name='org_code']").val();
			var orgArea = $("select[name='org_area']").val();
			var keywordFacilityCode = $("input[name='keyword_facility_code']").val();

			// 입력값을 JSON 형식으로 구성
			var lkh_waterResources = {
				facility_category: facilityCategory,
				org_code: orgCode,
				org_area: orgArea,
				keyword_facility_code: keywordFacilityCode
			};

			$.ajax({
				type: "GET", // 여전히 GET 메서드 사용
				url: "/waterResourcesListA",
				dataType: 'json',
				contentType: "application/json; charset=utf-8",
				data: lkh_waterResources, // 객체 직접 전달
				success: function(data) {
					displayData(data.waterResourcesList);
				},
				error: function(error) {
					alert("Error: " + error.responseText);
				}
			});
		}
	</script>
</head>
<body>
    <header id="header"></header>
	<br>
	<div class="container">
		<table width="100%" style="height:45px">
			<tr>
				<td style="width:100px;vertical-align:top"><span class="apptitle">수자원</span></td>
				<td>
					<div style="margin-top:-8px">
						<div class="btn-group btn-group tapBtn">
							<button type="button" class="btn btn-dark" onclick="location.href='/waterResourcesList'">정보</button>
							<button type="button" class="btn btn-outline-dark" onclick="location.href='/waterResourceStatistics'">통계</button>
						</div>			
					</div>
				</td>
			</tr>
		</table>
		<div class="searchbox">
			<table>
				<tr>
					<td style="width:70px;text-align:right;font-weight:bold;">시설물 종류</td>
					<td>
						<select name="facility_category" class="form-select">
							<c:forEach var="resource" items="${findfacility_category}">
								<option value="${resource.facility_category}">${resource.facility_category}</option>
							</c:forEach>
						</select>
					</td>
					<td style="width:70px;text-align:right;font-weight:bold;">관리 기관</td>
					<td>
						<select name="org_code" class="form-select">
							<c:forEach var="organization" items="${organization_category}">
								<option value="${organization.org_code}">${organization.org_name}</option>
							</c:forEach>
						</select>
					</td>
					<td style="width:70px;text-align:right;font-weight:bold;">행정 구역</td>
					<td>
						<select name="org_area" class="form-select">
							<c:forEach var="org_area" items="${orgArea_category}">
								<option value="${org_area.org_area}">${org_area.org_area_name}</option>
							</c:forEach>
						</select>
					</td>
					<td style="width:70px;text-align:right;font-weight:bold;">시설물 코드</td>
					<td>
						<input type="text" name="keyword_facility_code" class="form-control">
					</td>
					<td style="padding:0px 10px 0px 20px">
						<button onclick="Listsearch()"  class="btn btn-dark btn-sm">검색</button>									
					</td>
				</tr>												
			</table>
		</div>
				
		<div>
			<div align="right" style="margin:10px 0px;">
				<button type="button" class="btn btn-dark pull-right"  onclick="location.href='/waterResourcesInsertForm' ">
	                <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-clipboard2" viewBox="0 0 16 16">
	                <path d="M3.5 2a.5.5 0 0 0-.5.5v12a.5.5 0 0 0 .5.5h9a.5.5 0 0 0 .5-.5v-12a.5.5 0 0 0-.5-.5H12a.5.5 0 0 1 0-1h.5A1.5 1.5 0 0 1 14 2.5v12a1.5 1.5 0 0 1-1.5 1.5h-9A1.5 1.5 0 0 1 2 14.5v-12A1.5 1.5 0 0 1 3.5 1H4a.5.5 0 0 1 0 1z"/>
	                <path d="M10 .5a.5.5 0 0 0-.5-.5h-3a.5.5 0 0 0-.5.5.5.5 0 0 1-.5.5.5.5 0 0 0-.5.5V2a.5.5 0 0 0 .5.5h5A.5.5 0 0 0 11 2v-.5a.5.5 0 0 0-.5-.5.5.5 0 0 1-.5-.5"/></svg>
	                등록
              </button>
              <button type="button" class="btn btn-secondary pull-right" onclick="location.href='/waterResourcesInsertForm' ">
	                <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-clipboard2-check-fill" viewBox="0 0 16 16">
	                <path d="M10 .5a.5.5 0 0 0-.5-.5h-3a.5.5 0 0 0-.5.5.5.5 0 0 1-.5.5.5.5 0 0 0-.5.5V2a.5.5 0 0 0 .5.5h5A.5.5 0 0 0 11 2v-.5a.5.5 0 0 0-.5-.5.5.5 0 0 1-.5-.5"/>
	                <path d="M4.085 1H3.5A1.5 1.5 0 0 0 2 2.5v12A1.5 1.5 0 0 0 3.5 16h9a1.5 1.5 0 0 0 1.5-1.5v-12A1.5 1.5 0 0 0 12.5 1h-.585c.055.156.085.325.085.5V2a1.5 1.5 0 0 1-1.5 1.5h-5A1.5 1.5 0 0 1 4 2v-.5c0-.175.03-.344.085-.5m6.769 6.854-3 3a.5.5 0 0 1-.708 0l-1.5-1.5a.5.5 0 1 1 .708-.708L7.5 9.793l2.646-2.647a.5.5 0 0 1 .708.708Z"/></svg>
	                저장
              </button>
			</div>
			<table class="listTable" id="facilityTable">
				
				<thead>
				<tr class="tableCate">
					<th>연번</th>
					<th>시설물코드</th>
					<th>시설물 종류</th>
					<th>시설물유형</th>
					<th>관리기관</th>
					<th>행정구역</th>
					<th>주소</th>
					<th>위도</th>
					<th>경도</th>
					<!-- 추가 필요한 컬럼들을 여기에 추가 -->
				</tr>
				</thead>
				<tbody>
				<c:forEach items="${waterResourcesList}" var="waterResource">
					<tr class="tableRow">
						<td>${waterResource.rn}</td>
						<td><a href="waterResourcesListDetail?facility_code=${waterResource.facility_code}">${waterResource.facility_code}</a></td>
						<td>${waterResource.facility_category}</td>
						<td>${waterResource.cate_name}</td>
						<td>${waterResource.org_name}</td>
						<td>${waterResource.org_area_name}</td>
						<td>${waterResource.facility_addr}</td>
						<td>${waterResource.latitude}</td>
						<td>${waterResource.longitude}</td>
					</tr>
				</c:forEach>

				</tbody>
			</table>
			<br>
			<div id="paging" class="pagination justify-content-center">
				<c:if test="${page.startPage > page.pageBlock}">
					<div class="page-item" onclick="location.href='/waterResourcesList?currentPage=${page.startPage - page.pageBlock}'">
						<div class="page-link">&laquo;</div><!-- 이전 -->
					</div>
				</c:if>
				<c:forEach var="i" begin="${page.startPage}" end="${page.endPage}">
					<div class="page-item <c:if test="${page.currentPage==i}"> active</c:if>"
					 onclick="location.href='/waterResourcesList?currentPage=${i}'">
						<div class="page-link" style="cursor:pointer">${i}</div>
					</div>
				</c:forEach>
				<c:if test="${page.endPage <= page.pageBlock}">
					<div class="page-item" onclick="location.href='/waterResourcesList?currentPage=${page.startPage + page.pageBlock}'">
						<div class="page-link">&raquo;</div><!-- 다음 -->
					</div>
				</c:if>
			</div>
		</div>
	</div>

	<footer class="footer py-2">
		<div id="footer" class="container">
		</div>
	</footer>
</body>
</html>