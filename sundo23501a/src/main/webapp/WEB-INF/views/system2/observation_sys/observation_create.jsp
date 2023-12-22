<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/header.jsp" %>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
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
	<style>

		header {
			height: 55px;
		}
	</style>
</head>
<body>
<body class="pt-5">


	<header id="header"></header>
	 <div class="container"> 
	 <div class="card">
       <div class="card-body">
		<div id="center">
			<form action="ob_create" method="post">
					<div style="margin: 30px">
					<h2>관측소 등록</h2>
				    	<div align="right">
							<button type="button" class="btn btn-secondary" onclick="location.href='/observation_find'">
								<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-card-list" viewBox="0 0 16 16">
	                            <path d="M14.5 3a.5.5 0 0 1 .5.5v9a.5.5 0 0 1-.5.5h-13a.5.5 0 0 1-.5-.5v-9a.5.5 0 0 1 .5-.5h13zm-13-1A1.5 1.5 0 0 0 0 3.5v9A1.5 1.5 0 0 0 1.5 14h13a1.5 1.5 0 0 0 1.5-1.5v-9A1.5 1.5 0 0 0 14.5 2h-13z"/>
	                            <path d="M5 8a.5.5 0 0 1 .5-.5h7a.5.5 0 0 1 0 1h-7A.5.5 0 0 1 5 8zm0-2.5a.5.5 0 0 1 .5-.5h7a.5.5 0 0 1 0 1h-7a.5.5 0 0 1-.5-.5zm0 5a.5.5 0 0 1 .5-.5h7a.5.5 0 0 1 0 1h-7a.5.5 0 0 1-.5-.5zm-1-5a.5.5 0 1 1-1 0 .5.5 0 0 1 1 0zM4 8a.5.5 0 1 1-1 0 .5.5 0 0 1 1 0zm0 2.5a.5.5 0 1 1-1 0 .5.5 0 0 1 1 0z"/></svg>
							    목록으로
							</button>
						</div>
						<hr>
						<table class="table table-hover">
							<tr>
								<th>관측소명</th>
								<td colspan='3'><input type="text" name="observe_post"></td>
							</tr>
							<tr>
								<th>관측유형</th>
								<td><select name="observe_type">
									<c:forEach var="code" items="${CodeObserveType}">
										<option value="${code.cate_code}">${code.cate_name}</option>
									</c:forEach>
								</select></td>
								<th>표준코드</th>
								<td><select name="river_code">
									<c:forEach var="river" items="${categoryList}">
										<option value="${river.river_code}">${river.river_code}</option>
									</c:forEach>
								</select></td>
							</tr>
							<tr>
								<th>위도</th>
								<td><input type="text" name="latitude"></td>
								<th>경도</th>
								<td><input type="text" name="longitude"></td>
							</tr>
							<tr>
								<th>관측방식</th>
								<td><select name="observe_method">
									<c:forEach var="code" items="${CodeObserveMethod}">
										<option value="${code.cate_code}">${code.cate_name}</option>
									</c:forEach>
								</select></td>

								<th>운영기관</th>
								<td><select name="org_code">
									<c:forEach var="org" items="${OrgList}">
										<option value="${org.org_code}">${org.org_name}</option>
										<input type="hidden" name="org_area" value="${org.org_area}">
									</c:forEach>
								</select></td>
							</tr>
						</table>
						<div align="center">
							<button type="submit" class="btn btn-secondary">
							 <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-clipboard2" viewBox="0 0 16 16">
                             <path d="M3.5 2a.5.5 0 0 0-.5.5v12a.5.5 0 0 0 .5.5h9a.5.5 0 0 0 .5-.5v-12a.5.5 0 0 0-.5-.5H12a.5.5 0 0 1 0-1h.5A1.5 1.5 0 0 1 14 2.5v12a1.5 1.5 0 0 1-1.5 1.5h-9A1.5 1.5 0 0 1 2 14.5v-12A1.5 1.5 0 0 1 3.5 1H4a.5.5 0 0 1 0 1z"/>
                             <path d="M10 .5a.5.5 0 0 0-.5-.5h-3a.5.5 0 0 0-.5.5.5.5 0 0 1-.5.5.5.5 0 0 0-.5.5V2a.5.5 0 0 0 .5.5h5A.5.5 0 0 0 11 2v-.5a.5.5 0 0 0-.5-.5.5.5 0 0 1-.5-.5"/></svg>
							    등록
							</button>
						</div>
					</div>
					</form>
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