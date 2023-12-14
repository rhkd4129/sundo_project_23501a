<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="http://code.jquery.com/jquery-latest.min.js"></script>
<!-- COMMON END -->

<script type="text/javascript">
	function getWrList() {
	    var facility_category = $('#facility_code_List').val();
	    console.log(facility_category);
	
	    $.ajax({
	        url: "/facility_code_List",
	        method: "GET",  // 여기를 "POST"에서 "GET"으로 변경
	        data: {"facility_category": facility_category},
	        success: function (data) {
	            console.log("Ajax success:", data);
	
	            var sel = $('#facility_addr_List');
	            sel.empty();
	
	            $.each(data, function (key, values) {
	                console.log("hikey");
	                var newOpt = $('<option name="facility_addr" value="' + values.facility_addr + '"> ' + values.facility_addr + '</option>');
	                sel.append(newOpt);
	            });
	        }
	    });
	}
	
	function searchWaterResources() {
	    var facility_category = $('#facility_code_List').val();
	    var facility_addr = $('#facility_addr_List').val();
	    var cate_name = $('#cate_name').val();
	    var facility_code = $('#facility_code').val();

	    const wr = {
	        facility_category: facility_category,
	        facility_addr: facility_addr,
	        cate_name: cate_name,
	        facility_code: facility_code
	    };
		
		console.log(wr);
		$.ajax({
			url:"/searchWaterResources",
			contentType : 'application/json; charset:utf-8',
			data 		: wr,
			dataType 	: 'json',
	        success: function (data) {
	        	console.log(data);
	        	var table_body = $('#table_body');
	        	table_body.empty();
                const newtr = $('<tr></tr>');
	        	$.each(data, function(key, values){
					console.log(values);
                    /* const newtr = $('<td>'+values+'</td>'); */
                    
	    		
	        	})
	        	
	        }
			
		})
		
	}


</script>
</head>
<body>
<table>
	<tr>
		<td>시설물 종류: </td>
		<td>
			<select class="form-select" id="facility_code_List" onchange="getWrList()">
			    <c:forEach items="${wrctgList}" var="list">
					<option name="facility_category" value="${list.facility_category}">${list.facility_category}</option>
			    </c:forEach>
			</select>
		</td>
		<td>행정구역: </td>
		<td>
			<select class="form-select" id="facility_addr_List">
			    <c:forEach items="${orgList}" var="list">
					<option name="facility_addr" value="${list.org_area}">${list.org_area_name}</option>
			    </c:forEach>
			</select>
		</td>
		<td>시설물 유형: </td>
		<td>
			<input type="text" name="cate_name" id="cate_name">
		</td>
		<td>시설물 코드: </td>
		<td>
			<input type="text" name="facility_code" id="facility_code" placeholder="XXXXXXXXXXX">
		</td>
		<td>
			<input type="button" id="search_button" value="검색" onclick="searchWaterResources()">
		</td>
	</tr>
	<tr>
		<th>연번</th>
		<th>시설물 종류</th>
		<th>시설물 유형</th>
		<th>시설물 코드</th>
		<th>1급 행정구역</th>
		<th>2급 행정구역</th>
		<th>관리기관</th>
		<th>결과 작성</th>
	</tr>
	<div id="table_body">
		<c:forEach items="${wrList}" var="list">
			<tr>
				<td>${list.rn}</td>
				<td>${list.facility_category}</td>
				<td>${list.cate_name}</td>
				<td>${list.facility_code}</td>
				<td>${list.first_area}</td>
				<td>${list.second_area}</td>
				<td>${list.org_name}</td>
				<td><input type="button" value="입력">
				
			</tr>
		</c:forEach>
	
		</table>
		<div id="paging" class="pagination justify-content-center">
		    <c:if test="${page.startPage > page.pageBlock}">
		        <div onclick="location.href='/water_resourcesList?currentPage=${page.startPage - page.pageBlock}'">
		            <p>[이전]</p>
		        </div>
		    </c:if>
		    <c:forEach var="i" begin="${page.startPage}" end="${page.endPage}">
		        <div class="page-item" onclick="location.href='/water_resourcesList?currentPage=${i}'">
		            <div class="page-link" style="cursor:pointer">${i}</div>
		        </div>
		    </c:forEach>
		    <c:if test="${page.endPage <= page.pageBlock}">
		        <div onclick="location.href='/water_resourcesList?currentPage=${page.startPage + page.pageBlock}'">
		            <p>[다음]</p>
		        </div>
		    </c:if>
		</div>
	</div>


</body>
</html>