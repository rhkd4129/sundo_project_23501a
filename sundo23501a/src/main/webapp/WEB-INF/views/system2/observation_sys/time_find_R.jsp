<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ include file="/WEB-INF/views/header.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
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
		
		const tr = {
				river_code  	: river_code,
				start_date		: v_start_date,
				end_date		: v_end_date,
				currentPage		: currentPage
		};
		console.log(tr);
		
		$.ajax({
			url			: "/searchRainFall",
			data		: tr,
			dataType	:'json',
			success		: function(data){
				console.log(data);
				
			
				var table_body = $('#searchR');
				table_body.empty();
				
				$.each(data.list, function (key, rainFall){
				
					const newtr=$('<tr></tr>');
			
					newtr.append('<td><a href="/time_edit_R?river_code='+rainFall.river_code+'&observe_date='+rainFall.observe_date+'}">'+rainFall.observe_date_str+'</a></td>');
					
					for(var h=1; h<=24; h++) {
						if(h <= 9) {
							var hourS = eval("rainFall.hour_0"+h);
						}else{
							var hourS = eval("rainFall.hour_"+h);
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
	function tr_search(){
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
	<input type="hidden" name="river_code" id="river_code" value="${rainFallList.get(0).river_code}">
		<div class="row">
			<!-- 검색 -->
			<span class="border border-secondary border-2" style="padding:20px; margin:30px" >
				<th>자료유형</th>
				<td><select id="type" >
							<option value="hour" selected="selected" id="hour">시자료</option>
							<option value="statistics" id="statistics">통계</option>
					</select></td>
				<th>조회기간</th>
						<input type="date" name="start_date" aria-label="start_date"  id="start_date">
						<input type="date" name="end_date"   aria-label="end_date"  id="end_date">
				<button onclick="tr_search()">검색</button>
			</span> 
			<!-- 태그 -->
			<div style="margin-bottom: 30px">
				<span class="border border-secondary border-2" style="padding:20px; margin:30px" >
						<tr>
							<th><a href="/time_find?river_code=${rainFallList.get(0).river_code}">수위정보</a></th>
							<th><a href="/time_find_R?river_code=${rainFallList.get(0).river_code}">강우량정보</a></th>
							<th><a href="/time_find_F?river_code=${rainFallList.get(0).river_code}">우량정보</a></th>
						</tr>
				</span>
			</div>
		
		
		
			<div id="center">
				<h1>시자료(강우량)</h1>
				<input type="hidden" name="river_code" value="${rainFallList.get(0).river_code}">
				<h4>관측소명 : ${rainFallList.get(0).observe_post}</h4>
				<h6>(단위:mm)</h6>
				<div align="right">
					<button>저장</button>
				</div>
				<table class="table table-hover">
					<tr>
						<th>관측일시</th>
							<c:forEach var="cnt" begin="0" end="23" step="1">
								<th>${cnt}</th>
							</c:forEach>
					</tr>
					
					 <tbody id="searchR">
					 <c:forEach var="rainFall" items="${rainFallList}">
                            	<tr>
                            		<td><a href="/time_edit?river_code=${rainFall.river_code}&observe_date=${rainFall.observe_date}">${rainFall.observe_date}</a></td>
                            		<c:forEach var="h" begin="1" end="24" step="1">
                            			<c:choose>
	                            			<c:when test="${h ge 10}">
	                            				<c:set var="hourS">hour_${h}</c:set>
	                            				<td>${rainFall[hourS]}</td>
	                            			</c:when>
	                            			<c:otherwise>
	                            				<c:set var="hourS">hour_0${h}</c:set>
	                    						<td>${rainFall[hourS]}</td>
	                            			</c:otherwise>
                            			</c:choose>                         			
                            		</c:forEach>
                            	</tr>
                     </c:forEach> 
				</tbody> 
				</table>

				<div id="paging" class="pagination justify-content-center">
				    <c:if test="${page.startPage > page.pageBlock}">
				        <div class="page-link" onclick="location.href='/time_find_R?currentPage=${page.startPage - page.pageBlock}&river_code=${rainFallList.get(0).river_code} '">
				            이전
				        </div>
				    </c:if>
				    <c:forEach var="i" begin="${page.startPage}" end="${page.endPage}">
				        <div class="page-item" onclick="location.href='/time_find_R?currentPage=${i}&river_code=${rainFallList.get(0).river_code}'">
				            <div class="page-link" style="cursor:pointer">${i}</div>
				        </div>
				    </c:forEach>
				    <c:if test="${page.endPage < page.totalPage}">
				        <div class="page-link" onclick="location.href='/time_find_R?currentPage=${page.startPage + page.pageBlock}}&river_code=${rainFallList.get(0).river_code}'">
				            다음
				        </div>
				    </c:if>
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