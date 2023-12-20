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

	</script>

</head>
<body>

	<div class="container">
	<input type="hidden" name="river_code" value="${rainFallList.get(0).river_code}">
		<div class="row">
			<!-- 검색 -->
			<span class="border border-secondary border-2" style="padding:20px; margin:30px" >
				<th>자료유형</th>
				<td><select id="type" >
							<option value="hour" selected="selected">시자료</option>
							<option value="statistics">통계</option>
					</select></td>
				<th>조회기간</th>
						<input type="date" name="startdate" aria-label="startdate" >
						<input type="date" name="enddate"   aria-label="enddate" >
				<button onclick="ob_search()">검색</button>
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
							<c:forEach var="cnt" begin="0" end="23" step="1">
								<th>${cnt}</th>
							</c:forEach>
					</tr>

					<c:forEach var="cnt" begin="0" end="${fn:length(waterLevelList)-1}" step="1">
						<tr>
							<td><a href="/time_edit?river_code=${waterLevelList.get(cnt).river_code}&observe_date=${waterLevelList.get(cnt).observe_date}">${waterLevelList.get(cnt).observe_date}</a></td>

							<td>${waterLevelList.get(cnt).hour_01}</td>
							<td>${waterLevelList.get(cnt).hour_02}</td>
							<td>${waterLevelList.get(cnt).hour_03}</td>
							<td>${waterLevelList.get(cnt).hour_04}</td>
							<td>${waterLevelList.get(cnt).hour_05}</td>
							<td>${waterLevelList.get(cnt).hour_06}</td>
							<td>${waterLevelList.get(cnt).hour_07}</td>
							<td>${waterLevelList.get(cnt).hour_08}</td>
							<td>${waterLevelList.get(cnt).hour_09}</td>
							<td>${waterLevelList.get(cnt).hour_10}</td>
							<td>${waterLevelList.get(cnt).hour_11}</td>
							<td>${waterLevelList.get(cnt).hour_12}</td>
							<td>${waterLevelList.get(cnt).hour_13}</td>
							<td>${waterLevelList.get(cnt).hour_14}</td>
							<td>${waterLevelList.get(cnt).hour_15}</td>
							<td>${waterLevelList.get(cnt).hour_16}</td>
							<td>${waterLevelList.get(cnt).hour_17}</td>
							<td>${waterLevelList.get(cnt).hour_18}</td>
							<td>${waterLevelList.get(cnt).hour_19}</td>
							<td>${waterLevelList.get(cnt).hour_20}</td>
							<td>${waterLevelList.get(cnt).hour_21}</td>
							<td>${waterLevelList.get(cnt).hour_22}</td>
							<td>${waterLevelList.get(cnt).hour_23}</td>
							<td>${waterLevelList.get(cnt).hour_24}</td>

						</tr>
					</c:forEach>

					<%-- 		<c:forEach var="cnt" begin="0" end="${fn:length(waterLevelList)-1}" step="1">
                                <tr>
                                    <td>${waterLevelList.get(cnt).observe_date}</td>

                                    <c:forEach var="h" begin="01" end="24" step="1">
                                        <td>${waterLevelList.get(cnt).hour_(h)}</td>
                                    </c:forEach>
                                </tr>
                            </c:forEach> --%>


				</table>


				<nav aria-label="Page navigation example">
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
				</nav>
			</div>
		</div>
	</div>
	<footer class="footer py-2">
		<div id="footer" class="container">
		</div>
	</footer>

</body>
</html>