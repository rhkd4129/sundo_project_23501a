<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<table>
	<tr>
		<td>시설물 종류: </td>
		<td>
			<select class="form-select" id="facility_code_List">
			    <c:forEach items="${WRList}" var="list">
					<option name="facility_code" value="${list.facility_code}">${list.facility_category}
					${list.facility_category}</option>
			    </c:forEach>
			</select>
		</td>
		<td>행정구역: </td>
		<td>
			<select class="form-select" id="facility_code_List">
			    <c:forEach items="${WRList}" var="list">
					<option name="facility_code" value="${list.facility_code}">${list.facility_category}
					${list.facility_category}</option>
			    </c:forEach>
			</select>
		</td>
	</tr>
</table>


</body>
</html>