<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/header.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>수자원 시설물 관리시스템 - 고장/조치 결과보고</title>

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
.subject {
	width: 350px;
}
.tapBtn button {
	display: flex;
	padding: 5px 100px;
}
.underline {
	border-bottom:2px solid #fff;
}
</style>
<script>

	$(function() {

		$.ajax({
			url			: '/main_header_3',
			async		: false,
			dataType 	: 'html',
			success		: function(data) {
				$('#header').html(data);
			}
		});
		$("#sub-list-4").addClass('underline');

		$.ajax({
			url			: '/main_footer',
			dataType 	: 'html',
			success		: function(data) {
				$('#footer').html(data);
			}
		});
	});
	
	
	function searchError(currentPage) {
		var facility_category = $('#facility_category_list').val();
		var user_name = $('#user_name').val();
		var create_datetime = $('#create_datetime').val();
		
		const errkey = {
				facility_category : facility_category,
				user_name : user_name,
				create_datetime : create_datetime,
				currentPage : currentPage
		}
		
		console.log(errkey);
		
		$.ajax({
			url		: "/search_error",
			data	: errkey,
			dataType: 'json',
			success	: function(data) {
				// console.log(data);
				// console.log(data.list);
				// console.log(data.obj);
				
				var brTable = $('#brTable');
				brTable.empty();
				
				$.each(data.list, function(key, values) {
					// console.log(values);
					const newtr = $('<tr class="tableRow"></tr>');
					
					newtr.append('<td>' + values.rn + '</td>');
					newtr.append('<td>' + values.create_datetime + '</td>');
					newtr.append('<td>' + values.facility_category + '</td>');
					newtr.append('<td>' + values.subject + '</td>');
					newtr.append('<td>' + values.user_name + '</td>');
					newtr.append('<td><input type="button" class="btn btn-outline-dark btn-sm" value="열기" onclick="location.href=' + "'/error_report_read?doc_no=" + values.doc_no + "'" + '"></td>');
					
					brTable.append(newtr);
				})
				
				brTable.html();
				
				// 페이징
				const obj = data.obj;
				
				var pagingDiv = $('#paging');
				pagingDiv.empty();
				
				var pagingStr = '';
				
				if (obj.startPage > obj.pageBlock) {
					pagingStr += '<div class="page-link" onclick="searchError(' + (obj.startPage - obj.pageBlock) + ')"><p>&laquo;</p></div>';
				}
				
				for (var i = obj.startPage; i <= obj.endPage; i++) {
					pagingStr += '<div class="page-item ';
                    if(obj.currentPage == i) {
                    	pagingStr += 'active';
                    }
                    pagingStr += '" onclick="searchError(' + i + ')"><div class="page-link">' + i + '</div></div>';
				}
				
				if (obj.endPage < obj.totalPage) {
					pagingStr += '<div class="page-link" onclick="searchError(' + (obj.startPage + obj.pageBlock) + ')"><p>&raquo;</p></div>';
				}
				
				pagingStr += '</div>';
				pagingDiv.html(pagingStr);
				
			}
		});
	};
	
</script>
</head>
<body>
	<header id="header"></header>
	<br>
	<div class="container">
		<table width="100%" style="height:45px">
			<tr>
				<td style="width:320px;vertical-align:top;text-align:center"><span class="apptitle">고장/조치 결과 보고 목록</span></td>
			</tr>
			<tr>
				<td>
					<div style="padding:10px 0px;text-align:center">
						<div class="btn-group btn-group tapBtn">
							<button type="button" id="errorBtn" class="btn btn-dark" onclick="location.href='/error_report_list'">고장 보고서</button>
							<button type="button" id="actionBtn" class="btn btn-outline-dark" onclick="location.href='/action_report_list'">조치 결과 보고서</button>
						</div>
					</div>
				</td>
			</tr>
		</table>
		<div class="searchbox">
			<table>
				<tr>
					<th style="width:80px;text-align:right;font-weight:bold;">시설물 종류</th>
					<td>
						<select id="facility_category_list" class="form-select">
							<option value="all">전체</option>
							<c:forEach var="wcList" items="${waterCategory }">
								<option name="facility_category" value="${wcList.facility_category }">${wcList.facility_category }</option>
							</c:forEach>
						</select>
					</td>
					<th style="width:70px;text-align:right;font-weight:bold;">작성자</th>
					<td><input type="text" name="user_name" id="user_name" class="form-control"></td>
					<th style="width:70px;text-align:right;font-weight:bold;">등록일자</th>
					<td><input type="date" name="create_datetime" id="create_datetime" class="form-control"></td>
					<td style="padding-left:10px">
						<input class="btn btn-dark btn-sm" type="button" value="검색" onclick="searchError()">
					</td>
				</tr>
			</table>
		</div>
		
		<div>
			<div align="right" style="margin:10px 0px;">		
				<button type="button" class="btn btn-dark btn-sm" onclick="location.href='/error_report_write_form'">고장 보고서 작성 &gt;</button>
			</div>

			<table class="listTable">
				<tr class="tableCate"><th>연번</th><th>등록 일자</th><th>시설물 종류</th><th class="subject">제목</th><th>작성자</th><th>고장 보고서</th></tr>
				<tbody id="brTable">
					<c:forEach var="brList" items="${breakRptList}">
						<tr class="tableRow">
							<td>${brList.rn }</td><td>${brList.create_datetime }</td><td>${brList.facility_category }</td>
							<td>${brList.subject }</td><td>${brList.user_name }</td>
							<td><input type="button" class="btn btn-outline-dark btn-sm" value="열기" onclick="location.href='/error_report_read?doc_no=${brList.doc_no }'"></td>
						</tr>
					</c:forEach>
				</tbody>
			</table>

			<div id="paging" class="pagination justify-content-center">
				<c:if test="${page.startPage > page.pageBlock}">
					<div class="page-link" onclick="location.href='error_report_list?currentPage=${page.startPage - page.pageBlock}'">&laquo;</div>
				</c:if>

				<c:forEach var="i" begin="${page.startPage}" end="${page.endPage}">
					<div class="page-item <c:if test="${page.currentPage==i}"> active</c:if>"
					onclick="location.href='error_report_list?currentPage=${i}'">
						<div class="page-link" style="cursor:pointer">${i}</div>
					</div>
				</c:forEach>

				<c:if test="${page.endPage < page.totalPage}">
					<div class="page-link" onclick="location.href='error_report_list?currentPage=${page.startPage + page.pageBlock}'">&raquo;</div>
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