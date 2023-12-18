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
	.title {
		text-align: center;
		font-size: 25pt;
	}

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
		background: #EAEAEA;
		height: 40px;
	}
	
	.tableCate th {
		border-left: solid white 1px;
		border-right: solid white 1px;
	}
	
	.tableRow {
		border-bottom: solid lightgray 1px;
		height: 40px;
	}
</style>
</head>
<body>
	<div>
		<p class="title">고장/조치 결과 보고 목록</p>
		<div class="btn-group tapBtn">
			<button type="button" class="btn btn-outline-dark" onclick="location.href='/error_report_list'">고장 보고서</button>
			<button type="button" class="btn btn-outline-dark" onclick="location.href='/action_report_list'">조치 결과 보고서</button>
		</div>
		<div class="insertBtn">
			<button type="button" class="btn btn-dark btn-sm" onclick="location.href='/action_report_write_form'">조치 결과 보고서 작성 &gt;</button>
		</div>
		
		<table class="listTable">
			<tr class="tableCate">
				<th>연번</th><th>등록 일자</th><th>시설물 종류</th><th>조치/복구 일자</th><th>작성자</th><th>조치 결과 보고서</th>
			</tr>
			<c:forEach var="arList" items="${actionReportList }">
				<tr class="tableRow">
					<td>${arList.rn }</td><td>${arList.create_datetime }</td><td>${arList.facility_category }</td>
					<td>${arList.action_date }</td><td>${arList.user_name }</td>
					<td><input type="button" class="btn btn-outline-dark btn-sm" value="열기" onclick="location.href='/action_report_read?doc_no=${arList.doc_no }'"></td>
				</tr>
			</c:forEach>
		</table>
		
		<ul class="pagination justify-content-center">
			<c:if test="${page.startPage > page.pageBlock}">
				<a href="action_report_list?currentPage=${page.startPage - page.pageBlock}">[이전]</a>
			</c:if>

			<c:forEach var="i" begin="${page.startPage}" end="${page.endPage}">
				<a href="action_report_list?currentPage=${i}">[${i}]</a>
			</c:forEach>

			<c:if test="${page.endPage < page.totalPage}">
				<a href="action_report_list?currentPage=${page.startPage + page.pageBlock}">[다음]</a>
			</c:if>
		</ul>
	</div>
</body>
</html>