<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/header.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>수자원 시설물 관리시스템 - 고장 보고서</title>
<style type="text/css">
	.title {
		text-align: center;
		font-size: 25px;
		font-weight: bold;
	}

	.tapBtn {
		display: flex;
    	padding: 20px 100px;
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
	
	#paging {
		margin: 30px;
	}
	
	.pagination {
		--bs-pagination-border-color: white;
		--bs-pagination-color: gray;
		--bs-pagination-hover-color: black;
 		--bs-pagination-hover-bg: white;
	}
</style>
</head>
<body>
	<header id="header" style="margin-top: 3%"></header>
	
	<div class="container">
		<div class="row">
			<div id="center">
				<div>
					<p class="title">고장 보고서</p>
					<table class="listTable">
						<tr class="tableCate"><th>연번</th><th>등록 일자</th><th>시설물 종류</th><th>제목</th><th>작성자</th><th>고장 보고서</th></tr>
						<tbody id="brTable">
							<c:forEach var="brList" items="${breakRptList }">
								<tr class="tableRow">
									<td>${brList.rn }</td><td>${brList.create_datetime }</td><td>${brList.facility_category }</td>
									<td>${brList.subject }</td><td>${brList.user_name }</td>
									<td><input type="button" class="btn btn-outline-dark btn-sm" value="열기" onclick="location.href='/error_report_read?doc_no=${brList.doc_no }&popup=Y'"></td>
								</tr>
							</c:forEach>
						</tbody>
					</table>

 					<div id="paging" class="pagination pagination-sm justify-content-center">
						<c:if test="${page.startPage > page.pageBlock}">
  							<div class="page-link" onclick="location.href='choice_error_report_list?currentPage=${page.startPage - page.pageBlock}'">이전</div>
						</c:if>

						<c:forEach var="i" begin="${page.startPage}" end="${page.endPage}">
  							<div class="page-item" onclick="location.href='choice_error_report_list?currentPage=${i}&facility_category=${breakRptList[0].facility_category}&facility_code=${breakRptList[0].facility_code}'">
								<div class="page-link" style="cursor:pointer">${i}</div>
							</div>
						</c:forEach>

						<c:if test="${page.endPage < page.totalPage}">
  							<div class="page-link" onclick="location.href='choice_error_report_list?currentPage=${page.startPage + page.pageBlock}'">다음</div>
						</c:if>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>