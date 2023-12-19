<%@ page language="java" contentType="text/html; charset=UTF-8"
		pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/header.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

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
	header {
		height: 55px;
	}

</style>
<script>

	$(function() {

		$.ajax({
			url			: '/main_header_3',
			dataType 	: 'html',
			success		: function(data) {
				$('#header').html(data);
			}
		});

		$.ajax({
			url			: '/main_footer',
			dataType 	: 'html',
			success		: function(data) {
				$('#footer').html(data);
			}
		});
	});
	
	
	function searchAction(currentPage) {
		var facility_category = $('#facility_category_list').val();
		var user_name = $('#user_name').val();
		var create_datetime = $('#create_datetime').val();
		var action_date = $('#action_date').val();
		
		const actkey = {
				facility_category : facility_category,
				user_name : user_name,
				create_datetime : create_datetime,
				action_date : action_date,
				currentPage : currentPage
		}
		
		console.log(actkey);
		
		$.ajax({
			url		: "/search_action",
			data	: actkey,
			dataType: 'json',
			success	: function(data) {
				console.log(data);
				console.log(data.list);
				console.log(data.obj);
				
				var arTable = $('#arTable');
				arTable.empty();
				
				$.each(data.list, function(key, values){
					const newtr = $('<tr class="tableRow"></tr>')
					
					newtr.append('<td>' + values.rn + '</td>');
					newtr.append('<td>' + values.create_datetime + '</td>');
					newtr.append('<td>' + values.facility_category + '</td>');
					newtr.append('<td>' + values.action_date + '</td>');
					newtr.append('<td>' + values.user_name + '</td>');
					newtr.append('<td><input type="button" class="btn btn-outline-dark btn-sm" value="열기" onclick="location.href=' + "'/action_report_read?doc_no=" + values.doc_no + "'" + '"></td>');
					
					arTable.append(newtr);
				})
				
				arTable.html();
				
				// 페이징
				const obj = data.obj;
				
				var pagingDiv = $('#paging');
				pagingDiv.empty();
				
				var pagingStr = '';
				
				if (obj.startPage > obj.pageBlock) {
					pagingStr += '<div class="page-link" onclick="searchAction(' + (obj.startPage - obj.pageBlock) + ')"><p>이전</p></div>';
				}
				
				for (var i = obj.startPage; i <= obj.endPage; i++) {
					pagingStr += '<div class="page-item" onclick="searchAction(' + i + ')"><div class="page-link">' + i + '</div></div>';
				}
				
				if (obj.endPage >= obj.pageBlock) {
					pagingStr += '<div class="page-link" onclick="searchAction(' + (obj.startPage + obj.pageBlock) + ')"><p>다음</p></div>';
				}
				
				pagingStr += '</div>';
				pagingDiv.html(pagingStr);
				
				
			}
			
		})
		
		
	}
	

</script>
</head>
<body>

<header id="header"></header>


<div class="container" style="margin-top: 3%">
	<div class="row">
		<div id="center">
			<div>
				<p class="title">고장/조치 결과 보고 목록</p>
				<div class="btn-group tapBtn">
					<button type="button" class="btn btn-outline-dark" onclick="location.href='/error_report_list'">고장 보고서</button>
					<button type="button" class="btn btn-outline-dark" onclick="location.href='/action_report_list'">조치 결과 보고서</button>
				</div>
				
				<div>
					<table>
						<tr>
							<td>시설물 종류</td>
							<td>
								<select id="facility_category_list">
									<c:forEach var="wcList" items="${waterCategory }">
										<option name="facility_category" value="${wcList.facility_category }">${wcList.facility_category }</option>
									</c:forEach>
								</select>
							</td>
							<td>작성자</td>
							<td><input type="text" name="user_name" id="user_name"></td>
							<td>등록일자</td>
							<td><input type="date" name="create_datetime" id="create_datetime"></td>
							<td>조치/복구 일자</td>
							<td><input type="date" name="action_date" id="action_date"></td>
							<td>
								<input class="btn btn-dark btn-sm" type="button" value="검색" onclick="searchAction()">
							</td>
						</tr>
					</table>
				</div>
				
				<div class="insertBtn">
					<button type="button" class="btn btn-dark btn-sm" onclick="location.href='/action_report_write_form'">조치 결과 보고서 작성 &gt;</button>
				</div>

				<table class="listTable">
					<tr class="tableCate">
						<th>연번</th><th>등록 일자</th><th>시설물 종류</th><th>조치/복구 일자</th><th>작성자</th><th>조치 결과 보고서</th>
					</tr>
					<tbody id="arTable">
						<c:forEach var="arList" items="${actionRptList }">
							<tr class="tableRow">
								<td>${arList.rn }</td><td>${arList.create_datetime }</td><td>${arList.facility_category }</td>
								<td>${arList.action_date }</td><td>${arList.user_name }</td>
								<td><input type="button" class="btn btn-outline-dark btn-sm" value="열기" onclick="location.href='/action_report_read?doc_no=${arList.doc_no }'"></td>
							</tr>
						</c:forEach>
					</tbody>
				</table>

				<div id="paging" class="pagination justify-content-center">
					<c:if test="${page.startPage > page.pageBlock}">
						<div class="page-link" onclick="searchAction(${page.startPage - page.pageBlock})">
                            이전
                        </div>
					</c:if>

					<c:forEach var="i" begin="${page.startPage}" end="${page.endPage}">
						<div class="page-item" onclick="searchAction(${i})">
                            <div class="page-link" style="cursor:pointer">${i}</div>
                        </div>
					</c:forEach>

					<c:if test="${page.endPage < page.totalPage}">
						<div class="page-link" onclick="searchAction(${page.startPage + page.pageBlock})">
                            다음
                        </div>
					</c:if>
				</div>
			</div>
		</div>
	</div>
</div>
<footer class="footer py-2">
	<div id="footer" class="container">
	</div>
</footer>

</body>
</html>