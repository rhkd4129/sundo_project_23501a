<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
	table {
		width: 80%;
	}
</style>
</head>
<body>
	<div>
		<h1>조치 결과 보고서 작성</h1>
		<table border="1">
			<tr>
				<th>시설물 종류</th>
				<td>
 					<select id="waterCategorySelect" name="facility_category">
						<option>전체</option>
<%-- 						<c:forEach var="water" items="${waterCategory }">
							<option value="${water.facility_category }">${water.facility_category }</option>
						</c:forEach> --%>
					</select>
				</td>
				<th>시설물 코드</th>
				<td>
 					<div id="wrCodeOption">
						<select id="wrCodeSelect" name="facility_code">
							<option>전체</option>	
						</select>
					</div>
				</td>
				<th>작성자</th><td><input type="text" name="user_id"></td>	<!-- 로그인한 사용자 이름 자동 표출 필요 -->
			</tr>
			
			<tr>
				<th>점검대상</th>
				<td>
					<select name="check_target">
						<option>전체</option>
<%-- 							<c:forEach var="checkCode" items="${checkCodeList }">
								<c:if test="${checkCode.field_name == 'check_target' }">
									<option value="${checkCode.cate_name }">${checkCode.cate_name }</option>
								</c:if>
							</c:forEach> --%>
					</select>
				</td>
				<th>중분류</th>
				<td>
					<select name="m_category">
						<option>전체</option>
<%-- 							<c:forEach var="checkCode" items="${checkCodeList }">
								<c:if test="${checkCode.field_name == 'm_category' }">
									<option value="${checkCode.cate_name }">${checkCode.cate_name }</option>
								</c:if>
							</c:forEach> --%>
					</select>
				</td>
				<th>소분류</th>
				<td>
					<select name="s_category">
						<option>전체</option>
<%-- 							<c:forEach var="checkCode" items="${checkCodeList }">
								<c:if test="${checkCode.field_name == 's_category' }">
									<option value="${checkCode.cate_name }">${checkCode.cate_name }</option>
								</c:if>
							</c:forEach> --%>
					</select>
				</td>
			</tr>
			
			<tr>
				<th>고장/발생 일자</th><td><input type="date" name=""></td>
				<th>조치/복구 일자</th><td><input type="date" name=""></td>
			</tr>
			<tr><th>고장내역</th><td><textarea></textarea></td></tr>
			<tr><th>조치내역</th><td><textarea></textarea></td></tr>
			<tr><th>특이사항</th><td><textarea></textarea></td></tr>
			<tr><th>향후계획</th><td><textarea></textarea></td></tr>
			<tr><th>파일첨부</th><td></td></tr>
		</table>
		
		<button onclick="location.href='/action_report_list'">돌아가기</button>
		<button >고장보고서 보기</button>
		<button type="submit">저장</button>
	</div>
</body>
</html>