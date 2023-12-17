<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

	<style>
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
			background-color: #f2f2f2;
		}
	</style>
</head>
<body>
	<h2>수자원 정보</h2>
	<button type="button" onclick="location.href='/waterResourcesList' ">목록으로</button>
	<table>
		<thead>
		<tr>
			<th>시설물코드</th>
			<th>관리기관</th>
			<th>행정구역</th>
			<th>시설물 주소</th>
			<th>시설물 종류</th>
			<th>시설물 유형</th>
			<th>위도</th>
			<th>경도</th>
		</tr>
		</thead>
		<tbody>
		<tr>
			<td> ${waterResources.facility_code} </td>
			<td> ${waterResources.org_name}  </td>
			<td> ${waterResources.org_area_name}  </td>

			<td> ${waterResources.facility_addr}  </td>
			<td> ${waterResources.facility_category}  </td>
		    <%--	<td> ${waterResources.facility_type}  </td>--%>
			<td> ${waterResources.cate_name}  </td>


			<td> ${waterResources.latitude}  </td>
			<td> ${waterResources.longitude}  </td>
		</tr>
		<!-- Add more rows as needed -->
		</tbody>
	</table>


	<button type="button" onclick="location.href='/waterResourcesUpdateForm?facility_code=${waterResources.facility_code}'">수정</button>

	<button type="button" onclick="location.href='/waterResourcesListForm' ">삭제</button>
</body>
</html>