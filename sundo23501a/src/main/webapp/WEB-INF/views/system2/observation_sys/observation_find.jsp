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

	function ob_search(){
		var observe_method = $('#observe_method').val();
		var org_code = $('#org_code').val();
		var observe_post = $('#observe_post').val();
		
		const ob = {
				observe_method : observe_method,
				org_code	   : org_code,
				observe_post   : observe_post
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
					const newtr=$('<tr></tr>');
					
					newtr.append('<td>' + values.rn + '</td>');
					newtr.append('<td onclick="location.href=' + "'/observation_detail?observe_code=" + values.observe_post + "'" + '">' + values.observe_post + '</td>');
					newtr.append('<td>' + values.river_code + '</td>');
					newtr.append('<td>' + values.latitude + '</td>');
					newtr.append('<td>' + values.longitude + '</td>');
					newtr.append('<td>' + values.observe_method_name + '</td>');
					newtr.append('<td>' + values.org_name + '</td>');
					newtr.append('<td onclick="location.href=' + "'/time_find?river_code=" + values.river_code + "'" + '"><img src="/images/egovframework/cmmn/search.svg"></td>');
					
					table_body.append(newtr);
				})
				table_body.html();
				
				const obj = data.obj;

                var paginationDiv = $('#paging'); // 페이지네이션을 표시할 div
                paginationDiv.empty(); // 페이지네이션을 초기화
                // <div id="c_b" className="pagination">
                var jspPagination = '';

                if (obj.startPage > obj.pageBlock) {
                    jspPagination += '<div class="page-link" onclick="/searchObservation(' + (obj.startPage - obj.pageBlock) + ')"><p>이전</p></div>';
                }

                for (var i = obj.startPage; i <= obj.endPage; i++) {
                    jspPagination += '<div class="page-item" onclick="/searchObservation(' + i + ')"><div class="page-link">' + i + '</div></div>';
                }

                if (obj.endPage >= obj.pageBlock) {
                    jspPagination += '<div class="page-link" onclick="/searchObservation(' + (obj.startPage + obj.pageBlock) + ')"><p>다음</p></div>';
                }
                jspPagination += '</div>';
                paginationDiv.html(jspPagination); // JSP 페이지 네비게이션 코드를 추가
			}
		})
		
	}
</script>

</head>
<body>

<header id="header"></header>

<div class="container">
	<div class="row">
		<div id="center">
			
				<input type="hidden" name="observe_code" value="${observation.observe_code}">
				<input type="hidden" name="river_code" value="${observation.river_code}">

				<div style="margin: 30px">
					<h2>관측소 목록</h2>
				</div>
				<div>
			<!-- <span class="border border-secondary border-2" style="padding:20px; margin:30px" > -->
				<table>
					<tr>
					<th>관측방식</th>
					<td><select id="observe_method" >
							<c:forEach var="code" items="${CodeObserveMethod}">
								<option value="${code.cate_code}">${code.cate_name}</option>
							</c:forEach>
						</select></td>
					<th>운영기관</th>
					<td><select id="org_code">
							<c:forEach var="org" items="${OrgList}">
								<option value="${org.org_code}">${org.org_name}</option>
							</c:forEach>
						</select></td>
					<th>관측소명</th><td><input id="observe_post" type="text"></td>
					<td><button onclick="ob_search()">검색</button></td>
					</tr>
				</table>
			<!-- </span> -->
				</div>
				<form action="/observation_create" method="get">
				<div align="right" style="margin-top: 20px; margin:30px">
					<button type="submit">등록</button>
					<button onclick="ob_save()">저장</button>
				</div>
				<div style="margin:30px">
					<hr>
					<table  class="table table-hover">
						<colgroup>
							<col width="5%"></col>
							<col width="20%"></col>
							<col width="10%"></col>
							<col width="10%"></col>
							<col width="10%"></col>
							<col width="10%"></col>
							<col width="10%"></col>
							<col width="10%"></col>
						</colgroup>
						<tr>
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
							<tr>
								<td>${status.count}</td>
								<td onclick="location.href='/observation_detail?observe_code=${Observation.observe_code}'">${Observation.observe_post}</td>
								<td>${Observation.river_code} </td>
								<td>${Observation.latitude}</td>
								<td>${Observation.longitude}</td>
								<td>${Observation.observe_method_name}</td>
								<td>${Observation.org_name}</td>
								<td onclick="location.href='/time_find?river_code=${Observation.river_code}'"><img src="/images/egovframework/cmmn/search.svg"></td>
							</tr>
						</c:forEach>
						</tbody>
					</table>
				</div>
			</form>
			
			
			<div id="paging" class="pagination justify-content-center">
			    <c:if test="${page.startPage > page.pageBlock}">
			        <div class="page-link" onclick="location.href='/observation_find?currentPage=${page.startPage - page.pageBlock}'">
			            이전
			        </div>
			    </c:if>
			    <c:forEach var="i" begin="${page.startPage}" end="${page.endPage}">
			        <div class="page-item" onclick="location.href='/observation_find?currentPage=${i}'">
			            <div class="page-link" style="cursor:pointer">${i}</div>
			        </div>
			    </c:forEach>
			    <c:if test="${page.endPage < page.totalPage}">
			        <div class="page-link" onclick="location.href='/observation_find?currentPage=${page.startPage + page.pageBlock}'">
			            다음
			        </div>
			    </c:if>
			</div>
                 
<%-- 			
				<ul class="pagination justify-content-center">

					<c:if test="${page.startPage > page.pageBlock }">
						<li class="page-item"><a class="page-link" href="observation_find?currentPage=${page.startPage - page.pageBlock }" tabindex="-1" aria-disabled="true">이전</a></li>
					</c:if>
					<c:forEach var="i" begin="${page.startPage }" end="${page.endPage }">
						<c:choose>
							<c:when test="${page.currentPage==i}"><li class="page-item active"></c:when>
							<c:otherwise><li class="page-item"></c:otherwise>
						</c:choose>
						<a class="page-link" href="observation_find?currentPage=${i}">${i}</a></li>
					</c:forEach>

					<c:if test="${page.endPage < page.totalPage }">
						<li class="page-item"><a class="page-link" href="observation_find?currentPage=${page.startPage + page.pageBlock }')">다음</a></li>
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