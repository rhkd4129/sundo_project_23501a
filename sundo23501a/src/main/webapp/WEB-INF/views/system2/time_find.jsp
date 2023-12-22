<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/header.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

	<style>
		header {
			height: 55px;
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
		
		//시자료 검색
/* 		function search_1(){
			var startdate = $('#startdate').val();
			var enddate = $('#enddate').val();
			
			const tw = {
					type		: type
					startdate	: startdate
					enddate		: enddate		
			};
			
			console.log(tw);
			
			$.ajax({
				url:"/searchWaterLevel",
				data: tw,
				dataType:'json',
				success: function(data){
					console.log(data);
					
					var table_body = $('#searchW');
					table_body.empty();
					
				$.each(data.list, function (key, waterlevel){
					const newtr=$('');				
					
					newtr.append('<tr>');
					newtr.append('<td><a href="/time_edit?river_code=${'+waterlevel.river_code+'}&observe_date=${'+waterlevel.observe_date+'}">${'+waterlevel.observe_date+'}</a></td>');
					newtr.append('<c:forEach var="h" begin="1" end="24" step="1">');
					newtr.append('<c:choose>');
					newtr.append('<c:when test="${h ge 10}">');
					newtr.append('<c:set var="hourS">hour_${h}</c:set>');
					newtr.append('<td>${'+ waterlevel[hourS]+'}</td>');
					newtr.append('</c:when>');
					newtr.append('<c:otherwise>');
					newtr.append('<c:set var="hourS">hour_0${h}</c:set>');
					newtr.append('<td>${'+ waterlevel[hourS]+'}</td>');
					newtr.append('</c:otherwise>');
					newtr.append('</c:choose>');                        			
					newtr.append('</c:forEach>');
					newtr.append('</tr>');
					
					table_body.append(newtr);
				}
			});			
		}
		
		//통계 검색
		function search_2(){
			
		}
		
		//검색
 		function tw_search(){
			var type = $('#type').val();
			
			if(type == "hour") {
				//시자료 hour
				search_1();
			}else{
				//통계 statistics
				search_2();
			}
		}  */

	</script>

</head>
<body>

	<div class="container">
	<input type="hidden" name="river_code" value="${waterLevelList.get(0).river_code}">
		<div class="row">
			<!-- 검색 -->
			<span class="border border-secondary border-2" style="padding:20px; margin:30px" >
				<th>자료유형</th>
				<td><select id="type" >
							<option value="hour" selected="selected" id="hour">시자료</option>
							<option value="statistics" id="statistics">통계</option>
					</select></td>
				<th>조회기간</th>
						<input type="date" name="startdate" aria-label="startdate"  id="startdate">
						<input type="date" name="enddate"   aria-label="enddate"  id="enddate">
				<button onclick="tw_search()">검색</button>
			</span> 
			<!-- 태그 -->
			<div style="margin-bottom: 30px">
				<span class="border border-secondary border-2" style="padding:20px; margin:30px" >
						<tr>
							<th><a href="/time_find?river_code=${waterLevelList.get(0).river_code}">수위정보</a></th>
							<th><a href="/time_find_R?river_code=${waterLevelList.get(0).river_code}">강우량정보</a></th>
							<th><a href="/time_find_F?river_code=${waterLevelList.get(0).river_code}">우량정보</a></th>
						</tr>
				</span>
			</div>
		

			<div id="center">
				<h1>시자료(수위)</h1>
				<input type="hidden" name="river_code" value="${waterLevelList.get(0).river_code}">
				<h4>관측소명 : ${waterLevelList.get(0).observe_post}</h4>
				<h6>(단위:mm)</h6>
				<div align="right">
					<button>저장</button>
				</div>
				<table class="table table-hover">
					<tr>
						<th>관측일시</th>
							<%-- <c:forEach var="cnt" begin="0" end="23" step="1">
								<th>${cnt}</th>
							</c:forEach> --%>
					</tr>
					
				 <tbody id="searchW">
					<%-- <c:forEach var="waterlevel" items="${waterLevelList}">
                            	<tr>
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
                     </c:forEach>  --%>
				</tbody> 
				</table>


				<%-- <nav aria-label="Page navigation example">
					<ul class="pagination justify-content-center">
					
						<c:if test="${page.startPage > page.pageBlock }">
							<li class="page-item"><a class="page-link" href="time_find?currentPage=${page.startPage - page.pageBlock}&river_code=${waterLevelList.get(0).river_code}" tabindex="-1" aria-disabled="true">이전</a></li>
						</c:if>
					
						<c:forEach var="i" begin="${page.startPage }" end="${page.endPage }">
							<c:choose>
								<c:when test="${page.currentPage==i}">
									<li class="page-item active">
										<a class="page-link" href="time_find?currentPage=${i}&river_code=${waterLevelList.get(0).river_code}">${i}</a>
									</li>
								</c:when>
								<c:otherwise>
									<li class="page-item">
										<a class="page-link" href="time_find?currentPage=${i}&river_code=${waterLevelList.get(0).river_code}">${i}</a>
									</li>
								</c:otherwise>
							</c:choose>
						</c:forEach>
					
						<c:if test="${page.endPage < page.totalPage }">
							<li class="page-item">
								<a class="page-link" href="time_find?currentPage=${page.startPage + page.pageBlock}&river_code=${waterLevelList.get(0).river_code}">다음</a>
							</li>
						</c:if>
					</ul>
				</nav> --%>
			</div>
		</div>
	</div>
	<footer class="footer py-2">
		<div id="footer" class="container">
		</div>
	</footer>

</body>
</html>