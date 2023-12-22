<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/header.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
	header {
		height: 55px;
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
<script>

	$(function() {
	
		$.ajax({
			url			: '/main_header_21',
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

	function search_1(currentPage){

		var river_code = $('#river_code').val();
		var v_start_date = $('#start_date').val();
		var v_end_date = $('#end_date').val();
		
		const tw = {
				river_code  	: river_code,
				start_date		: v_start_date,
				end_date		: v_end_date,
				currentPage		: currentPage
		};
		console.log(tw);
		
		$.ajax({
			url			: "/searchWaterLevel",
			data		: tw,
			dataType	:'json',
			success		: function(data){
				console.log(data);
				
			
				var table_body = $('#searchW');
				table_body.empty();
				
				$.each(data.list, function (key, waterlevel){
				
					const newtr=$('<tr class="tableRow"></tr>');
			
					newtr.append('<td><a href="/time_edit?river_code='+waterlevel.river_code+'&observe_date='+waterlevel.observe_date_str+'}">'+waterlevel.observe_date_str+'</a></td>');
					
					for(var h=1; h<=24; h++) {
						if(h <= 9) {
							var hourS = eval("waterlevel.hour_0"+h);
						}else{
							var hourS = eval("waterlevel.hour_"+h);
						}
						newtr.append('<td>' + hourS + '</td>');					
					}
					
					table_body.append(newtr);
				});
				
				table_body.html();
				
				 const obj = data.obj;

				var pagingDiv = $('#paging');
				pagingDiv.empty();
				
				var pagingStr = '';
				
				if (obj.startPage > obj.pageBlock) {
				   pagingStr += '<div class="page-link" onclick="search_1(' + (obj.startPage - obj.pageBlock) + ')"><p>&laquo;</p></div>';
				}
				
				for (var i = obj.startPage; i <= obj.endPage; i++) {
				   pagingStr += '<div class="page-item" onclick="search_1(' + i + ')"><div class="page-link">' + i + '</div></div>';
				}
				
				if (obj.endPage < obj.totalPage) {
				   pagingStr += '<div class="page-link" onclick="search_1(' + (obj.startPage + obj.pageBlock) + ')"><p>&raquo;</p></div>';
				}
				
				pagingStr += '</div>';
				pagingDiv.html(pagingStr);
				
			}
		});
	}
	
	//통계 검색
	function search_2(){
		
	}
	
	// 검색 버튼
	function tw_search(){
		var type = $('#type').val();
		if(type == "hour") {
			//시자료 hour
			search_1();
		}else{
			//통계 statistics
			search_2();
		}
	}
</script>
</head>
<body>

	<div class="container">
		<input type="hidden" name="river_code" id="river_code" value="${waterLevelList.get(0).river_code}">
		<div class="row">
			<!-- 검색 -->
			<div class="card">
		    	<div class="card-body">
				<table>
					<tr>
						<th width="10%">자료유형</th>
						<td width="20%">
							<select id="type" class="form-select form-select-sm">
									<option value="hour" selected="selected" id="hour">시자료</option>
									<option value="statistics" id="statistics">통계</option>
							</select>
						</td>
						<th width="10%">조회기간</th>
						<td width="20%">
							<table>
								<tr>
									<td><input type="date" name="start_date" id="start_date" class="form-control" ></td>
									<td> ~ </td>
									<td><input type="date" name="end_date" id="end_date" class="form-control" ></td>
								</tr>
							</table>
						</td>
						<td width="10%">
						<button onclick="tw_search()" class="btn btn-dark" >검색</button>
						</td>
					</tr>
				</table>
				</div>
			</div>
			<!-- 태그 -->
			<div class="card">
		    	<div class="card-body">
					<table>
						<tr>
							<th width="30%" ><a href="/time_find?river_code=${waterLevelList.get(0).river_code}">수위정보</a></th>
							<th width="30%" ><a href="/time_find_R?river_code=${waterLevelList.get(0).river_code}">강우량정보</a></th>
							<th width="30%" ><a href="/time_find_F?river_code=${waterLevelList.get(0).river_code}">우량정보</a></th>
						</tr>
					</table>		
				</div>
			</div>
			
			<div id="center">
				<h1>시자료(수위)</h1>
				<input type="hidden" name="river_code" value="${waterLevelList.get(0).river_code}">
				<h4>관측소명 : ${waterLevelList.get(0).observe_post}</h4>
				<h6>(단위:mm)</h6>
				<div align="right">
					<button type="button" class="btn btn-secondary pull-right" onclick="ob_save()">
		                <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-clipboard2-check-fill" viewBox="0 0 16 16">
		                <path d="M10 .5a.5.5 0 0 0-.5-.5h-3a.5.5 0 0 0-.5.5.5.5 0 0 1-.5.5.5.5 0 0 0-.5.5V2a.5.5 0 0 0 .5.5h5A.5.5 0 0 0 11 2v-.5a.5.5 0 0 0-.5-.5.5.5 0 0 1-.5-.5"/>
		                <path d="M4.085 1H3.5A1.5 1.5 0 0 0 2 2.5v12A1.5 1.5 0 0 0 3.5 16h9a1.5 1.5 0 0 0 1.5-1.5v-12A1.5 1.5 0 0 0 12.5 1h-.585c.055.156.085.325.085.5V2a1.5 1.5 0 0 1-1.5 1.5h-5A1.5 1.5 0 0 1 4 2v-.5c0-.175.03-.344.085-.5m6.769 6.854-3 3a.5.5 0 0 1-.708 0l-1.5-1.5a.5.5 0 1 1 .708-.708L7.5 9.793l2.646-2.647a.5.5 0 0 1 .708.708Z"/></svg>
		                저장
		             </button>
				</div>
				<table class="listTable">
					<tr class="tableCate">
						<th>관측일시</th>
							 <c:forEach var="cnt" begin="0" end="23" step="1">
								<th>${cnt}</th>
							</c:forEach> 
					</tr>		
				 <tbody id="searchW">
					 <c:forEach var="waterlevel" items="${waterLevelList}">
                       	<tr class="tableRow">
                       		<td><a href="/time_edit?river_code=${waterlevel.river_code}&observe_date=${waterlevel.observe_date}">${waterlevel.observe_date}</a></td>
                       		<c:forEach var="h" begin="1" end="24" step="1">
                       			<c:choose>
                        			<c:when test="${h ge 10}">
                        				<c:set var="hourS">hour_${h}</c:set>
                        				<td>${waterlevel[hourS]}</td>
                        			</c:when>
                        			<c:otherwise>
                        				<c:set var="hourS">hour_0${h}</c:set>
                						<td>${waterlevel[hourS]}</td>
                        			</c:otherwise>
                       			</c:choose>                         			
                       		</c:forEach>
                       	</tr>
                     </c:forEach> 
				</tbody> 
				</table>
				
				 <div id="paging" class="pagination pagination-sm justify-content-center">
				    <c:if test="${page.startPage > page.pageBlock}">
				        <div class="page-link" onclick="location.href='/time_find?currentPage=${page.startPage - page.pageBlock}&river_code=${waterLevelList.get(0).river_code} '">
				            이전
				        </div>
				    </c:if>
				    <c:forEach var="i" begin="${page.startPage}" end="${page.endPage}">
				        <div class="page-item" onclick="location.href='/time_find?currentPage=${i}&river_code=${waterLevelList.get(0).river_code}'">
				            <div class="page-link" style="cursor:pointer">${i}</div>
				        </div>
				    </c:forEach>
				    <c:if test="${page.endPage < page.totalPage}">
				        <div class="page-link" onclick="location.href='/time_find?currentPage=${page.startPage + page.pageBlock}}&river_code=${waterLevelList.get(0).river_code}'">
				            다음
				        </div>
				    </c:if>
				</div>		 	
				
				
				
			</div>
		</div>
	</div>
</body>
</html>