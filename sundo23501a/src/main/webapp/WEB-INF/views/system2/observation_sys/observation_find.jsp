<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/header.jsp" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>실시간 수문정보 관리시스템 - 관측소 목록</title>
<style type="text/css">
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
/* .pagination {
	--bs-pagination-border-color: white;
	--bs-pagination-color: gray;
	--bs-pagination-hover-color: black;
	--bs-pagination-hover-bg: white;
} */
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
		$("#sub-list-1").addClass('underline');

		$.ajax({
			url			: '/main_footer',
			dataType 	: 'html',
			success		: function(data) {
				$('#footer').html(data);
			}
		});	
		
	});

	function ob_search(currentPage) {
		var observe_method = $('#observe_method').val();
		var org_code = $('#org_code').val();
		var observe_post = $('#observe_post').val();
	 		
		const ob = {
				observe_method : observe_method,
				org_code	   : org_code,
				observe_post   : observe_post,
				currentPage : currentPage
		};
	 		
		console.log(ob);
		
		$.ajax({
			url:"/searchObservation",
			data: ob,
			dataType: 'json',
			success: function(data){
				console.log(data);
				
				var table_body = $('#searchO');
				table_body.empty();
				
				$.each(data.list, function (key, values){
					const newtr=$('<tr class="tableRow"></tr>');
					
					newtr.append('<td>' + values.rn + '</td>');
					newtr.append('<td><a href="' + '/observation_detail?observe_code=' + values.observe_code + '">' + values.observe_post + '</a></td>');
					newtr.append('<td>' + values.river_code + '</td>');
					newtr.append('<td>' + values.latitude + '</td>');
					newtr.append('<td>' + values.longitude + '</td>');
					newtr.append('<td>' + values.observe_method_name + '</td>');
					newtr.append('<td>' + values.org_name + '</td>');
					newtr.append('<td style="cursor:pointer" onclick="location.href="' + '/time_find?river_code=' + values.river_code + '"><img src="/images/egovframework/cmmn/search.svg"></td>');
					
					table_body.append(newtr);
				});
				table_body.html();  
				
				// 페이징
				const obj = data.obj;
				
				var pagingDiv = $('#paging');
				pagingDiv.empty();
				
				var pagingStr = '';
				
				if (obj.startPage > obj.pageBlock) {
				   pagingStr += '<div class="page-link" onclick="ob_search(' + (obj.startPage - obj.pageBlock) + ')"><p>&laquo;</p></div>';
				}
				
				for (var i = obj.startPage; i <= obj.endPage; i++) {
				   pagingStr += '<div class="page-item" onclick="ob_search(' + i + ')"><div class="page-link">' + i + '</div></div>';
				}
				
				if (obj.endPage < obj.totalPage) {
				   pagingStr += '<div class="page-link" onclick="ob_search(' + (obj.startPage + obj.pageBlock) + ')"><p>&raquo;</p></div>';
				}
				
				pagingStr += '</div>';
				pagingDiv.html(pagingStr);

	       }
	    });
	}
</script>

</head>
<body>
	<i class="bi bi-clipboard2-check-fill"></i>
	<header id="header"></header>
	<br>
	<div class="container">
		<table width="100%" style="height:45px">
			<tr>
				<td style="vertical-align:top"><span class="apptitle">관측소 목록</span></td>
				<td align="right">
				</td>
			</tr>
		</table>
		<div class="searchbox">
			<input type="hidden" name="observe_code" value="${observation.observe_code}">
			<input type="hidden" name="river_code" value="${observation.river_code}">
	           
			<table>
				<tr>
					<th style="width:70px;text-align:right;font-weight:bold;">관측방식</th>
					<td>
						<select id="observe_method"  class="form-select">
							<c:forEach var="code" items="${CodeObserveMethod}">
								<option value="${code.cate_code}">${code.cate_name}</option>
							</c:forEach>
						</select></td>
					<th style="width:70px;text-align:right;font-weight:bold;">운영기관</th>
					<td>
						<select id="org_code" class="form-select">
							<c:forEach var="org" items="${OrgList}">
								<option value="${org.org_code}">${org.org_name}</option>
							</c:forEach>
						</select></td>
					<th style="width:70px;text-align:right;font-weight:bold;">관측소명</th>
					<td><input id="observe_post" type="text" class="form-control"></td>
					<td style="width:100px;padding-left:10px">
					<button onclick="ob_search()" class="btn btn-dark btn-sm">검색</button></td>
				</tr>
			</table>
		</div>
		
		<form action="/observation_create" method="get">
			<div align="right" style="margin:10px 0px;">
				<button type="submit" class="btn btn-dark pull-right">
	                <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-clipboard2" viewBox="0 0 16 16">
	                <path d="M3.5 2a.5.5 0 0 0-.5.5v12a.5.5 0 0 0 .5.5h9a.5.5 0 0 0 .5-.5v-12a.5.5 0 0 0-.5-.5H12a.5.5 0 0 1 0-1h.5A1.5 1.5 0 0 1 14 2.5v12a1.5 1.5 0 0 1-1.5 1.5h-9A1.5 1.5 0 0 1 2 14.5v-12A1.5 1.5 0 0 1 3.5 1H4a.5.5 0 0 1 0 1z"/>
	                <path d="M10 .5a.5.5 0 0 0-.5-.5h-3a.5.5 0 0 0-.5.5.5.5 0 0 1-.5.5.5.5 0 0 0-.5.5V2a.5.5 0 0 0 .5.5h5A.5.5 0 0 0 11 2v-.5a.5.5 0 0 0-.5-.5.5.5 0 0 1-.5-.5"/></svg>
	                등록
              </button>
              <button type="button" class="btn btn-secondary pull-right" onclick="ob_save()">
	                <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-clipboard2-check-fill" viewBox="0 0 16 16">
	                <path d="M10 .5a.5.5 0 0 0-.5-.5h-3a.5.5 0 0 0-.5.5.5.5 0 0 1-.5.5.5.5 0 0 0-.5.5V2a.5.5 0 0 0 .5.5h5A.5.5 0 0 0 11 2v-.5a.5.5 0 0 0-.5-.5.5.5 0 0 1-.5-.5"/>
	                <path d="M4.085 1H3.5A1.5 1.5 0 0 0 2 2.5v12A1.5 1.5 0 0 0 3.5 16h9a1.5 1.5 0 0 0 1.5-1.5v-12A1.5 1.5 0 0 0 12.5 1h-.585c.055.156.085.325.085.5V2a1.5 1.5 0 0 1-1.5 1.5h-5A1.5 1.5 0 0 1 4 2v-.5c0-.175.03-.344.085-.5m6.769 6.854-3 3a.5.5 0 0 1-.708 0l-1.5-1.5a.5.5 0 1 1 .708-.708L7.5 9.793l2.646-2.647a.5.5 0 0 1 .708.708Z"/></svg>
	                저장
              </button>
			</div>
			<div>
				<table class="listTable">
					<tr class="tableCate">
						<th>연번</th>
						<th>관측소명</th>
						<th>표준코드</th>
						<th>위도(dd)</th>
						<th>경도(dd)</th>
						<th>관측방식</th>
						<th>운영기관</th>
						<th>조회</th>
					</tr>
					<tbody id="searchO">
					<c:forEach var="Observation" items="${observationList}" varStatus="status">
						<tr class="tableRow">
							<td>${status.count}</td>
							<td><a href="/observation_detail?observe_code=${Observation.observe_code}">${Observation.observe_post}</a></td>
							<td>${Observation.river_code} </td>
							<td>${Observation.latitude}</td>
							<td>${Observation.longitude}</td>
							<td>${Observation.observe_method_name}</td>
							<td>${Observation.org_name}</td>
							<td style="cursor:pointer" onclick="location.href='/time_find?river_code=${Observation.river_code}'"><img src="/images/egovframework/cmmn/search.svg"></td>
						</tr>
					</c:forEach>
					</tbody>
				</table>
			</div>
		</form>
		<div id="paging" class="pagination justify-content-center">
		    <c:if test="${page.startPage > page.pageBlock}">
		        <div class="page-link" onclick="location.href='/observation_find?currentPage=${page.startPage - page.pageBlock}'">&laquo;</div>
		    </c:if>
		    <c:forEach var="i" begin="${page.startPage}" end="${page.endPage}">
		        <div class="page-item <c:if test="${page.currentPage==i}"> active</c:if>" 
		        onclick="location.href='/observation_find?currentPage=${i}'">
		            <div class="page-link" style="cursor:pointer">${i}</div>
		        </div>
		    </c:forEach>
		    <c:if test="${page.endPage < page.totalPage}">
		        <div class="page-link" onclick="location.href='/observation_find?currentPage=${page.startPage + page.pageBlock}'">&raquo;</div>
		    </c:if>
		</div>
	</div>
	
	<footer class="footer py-2">
		<div id="footer" class="container">
		</div>
	</footer>

</body>
</html>