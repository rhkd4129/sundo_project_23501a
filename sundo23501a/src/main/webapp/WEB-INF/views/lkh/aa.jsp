<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/header.jsp" %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h2>Water Resources Table</h2>

<table border="1">
    <thead>
        <tr>
            <th>Facility Code</th>
            <th>Facility Category</th>
            <th>Facility Address</th>
            <th>Facility Type</th>
            <th>Org Code</th>
            <th>Latitude</th>
            <th>Longitude</th>
            <th>Create Datetime</th>
            <th>Modify Datetime</th>
        </tr>
    </thead>
    <tbody>
        <!-- waterResourcesList에서 데이터를 반복하여 출력 -->
        <c:forEach var="resource" items="${waterResourcesList}">
            <tr>
                <td>${resource.facility_code}</td>
                <td>${resource.facility_category}</td>
                <td>${resource.facility_addr}</td>
                <td>${resource.facility_type}</td>
                <td>${resource.org_code}</td>
                <td>${resource.latitude}</td>
                <td>${resource.longitude}</td>
                <td>${resource.create_datetime}</td>
                <td>${resource.modify_datetime}</td>
            </tr>
        </c:forEach>
    </tbody>
</table>
	
	
	
</body>
</html>