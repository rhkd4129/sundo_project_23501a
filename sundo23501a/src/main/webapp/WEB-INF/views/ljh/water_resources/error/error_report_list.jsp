<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-4bw+/aepP/YC94hEpVNVgiZdgIC5+VKNBQNGCHeKRQN+PtmoHDEXuppvnDJzQIu9" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-HwwvtgBNo3bZJJLYd8oVXjrBZt8cqVSpeBNS5n7C8IVInixGAoxmnlMuBnhbgrkm" crossorigin="anonymous"></script>
<style type="text/css">
	.tapBtn {
		display: flex;
    	padding: 20px 100px;
	}
	
	.insertBtn {
		text-align: right;
		margin: 20px 0px;
	}
	
	.listTable {
		width: 100%;
		text-align: center;
	}
	
	.tableCate {
		border-top: solid gray 2px;
	}
	
	.tableRow {
		border-bottom: solid gray 1px;
	}
	
</style>
</head>
<body>
	<div class="container">
		<h1>고장/조치 결과 보고 목록</h1>
		<div class="btn-group tapBtn">
			<button type="button" class="btn btn-outline-dark" onclick="location.href='/error_report_list'">고장 보고서</button>
			<button type="button" class="btn btn-outline-dark" onclick="location.href='/action_report_list'">조치 결과 보고서</button>
		</div>
		<div class="insertBtn">
			<button type="button" class="btn btn-dark btn-sm" onclick="location.href='/error_report_write_form'">고장 보고서 작성</button>
		</div>
		
		<table class="listTable">
			<tr class="tableCate"><th>연번</th><th>등록 일자</th><th>시설물 종류</th><th>제목</th><th>작성자</th><th>고장 보고서</th></tr>
			<c:forEach var="brList" items="${breakReportList }" varStatus="status">
				<tr class="tableRow">
					<td>${status.count }</td><td>${brList.create_datetime }</td><td>${brList.facility_category }</td>
					<td>${brList.subject }</td><td>${brList.user_id }</td>
					<td><input type="button" value="열기" onclick="location.href='/error_report_read?doc_no=${brList.doc_no }'"></td>
				</tr>
			</c:forEach>
			
		</table>
	</div>
</body>
</html>