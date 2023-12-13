<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
			    <c:forEach items="${wrctgList}" var="list">
					<option name="facility_code" value="${list.facility_code}">${list.facility_category}</option>
			    </c:forEach>
			</select>
		</td>
		<td>행정구역: </td>
		<td>
			<select class="form-select" id="facility_addr_List">
			    <c:forEach items="${wradrList}" var="list">
					<option name="facility_addr" value="${list.facility_addr}">${list.facility_addr}</option>
			    </c:forEach>
			</select>
		</td>
		<td>시설물 명칭: </td>
		<td>
			<input type="text" name="">
		</td>
		<td>시설물 코드: </td>
		<td>
			<input type="text" name="" placeholder="XXXXXXXXXXX">
		</td>
		<td>
			<input type="button" id="search_button" value="검색">
		</td>
	</tr>
	<tr>
		<th>연번</th>
		<th>시설물 종류</th>
		<th>시설물 코드</th>
		<th>1급 행정구역</th>
		<th>2급 행정구역</th>
		<th>관리기관</th>
		<th>결과 작성</th>
	</tr>
	<c:forEach items="${wrList}" var="list">
		<tr>
			<td>${list.rn}</td>
			<td>${list.facility_category}</td>
			<td>${list.facility_code}</td>
			<td>${list.first_area}</td>
			<td>${list.second_area}</td>
			<td>${list.org_name}</td>
			<td><input type="button" value="입력">
			
		</tr>
	</c:forEach>

	<div id="paging" class="pagination justify-content-center">
	    <c:if test="${page.startPage > page.pageBlock}">
	        <div onclick="location.href='/api/water_resourcesList?currentPage=${page.startPage - page.pageBlock}'">
	            <p>[이전]</p>
	        </div>
	    </c:if>
	    <c:forEach var="i" begin="${page.startPage}" end="${page.endPage}">
	        <div class="page-item" onclick="location.href='/api/water_resourcesList?currentPage=${i}'">
	            <div class="page-link" style="cursor:pointer">${i}</div>
	        </div>
	    </c:forEach>
	    <c:if test="${page.endPage <= page.pageBlock}">
	        <div onclick="location.href='/api/water_resourcesList?currentPage=${page.startPage + page.pageBlock}'">
	            <p>[다음]</p>
	        </div>
	    </c:if>
	</div>
	</table>


</body>
</html>