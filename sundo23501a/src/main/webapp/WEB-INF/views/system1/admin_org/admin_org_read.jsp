<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/header.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>한강 수자원관리 종합 플랫폼 - 기관관리</title>

<!--CSS START -->
<style>

.prjlistbox {
	--bs-alert-color: var(--bs-primary-text-emphasis);
    --bs-alert-bg: var(--bs-primary-bg-subtle);
    
    --bs-alert-padding-x: 1rem;
    --bs-alert-padding-y: 1rem;
    --bs-alert-margin-bottom: 1rem;
    --bs-alert-border-color: transparent;
    --bs-alert-border: var(--bs-border-width) solid var(--bs-alert-border-color);
    --bs-alert-border-radius: var(--bs-border-radius);
    --bs-alert-link-color: inherit;
    position: relative;
    padding: var(--bs-alert-padding-y) var(--bs-alert-padding-x);
    margin-bottom: var(--bs-alert-margin-bottom);
    color: var(--bs-alert-color);
    background-color: var(--bs-alert-bg);
    border: var(--bs-alert-border);
    border-radius: var(--bs-alert-border-radius);
}
</style>
<!-- CSS END -->

<!-- JS START -->
<script type="text/javascript" src="/js/board.js"></script>
<!-- JS END -->

</head>
<body>
<!-- CONTENT -->
<!------------------------------ //개발자 소스 입력 START ------------------------------->
	<div class="container-fluid">
		<div id="idDocTitle" style="height:34px">
			<span class="apptitle">문서 조회</span>
		</div>
		<table width="100%" style="margin-top:10px;">
			<tr>
				<td style="text-align:right">
					<%-- <c:if test="${(userInfo.user_id eq board.user_id) or (userInfo.user_id eq 'admin')}"> --%>
						<button type="button" class="btn btn-dark btn-sm" onclick="callAction('edit','admin_org_edit?org_code=${board.org_code}')">수정</button>
						<button type="button" class="btn btn-dark btn-sm" onclick="callAction('delete','admin_org_delete?org_code=${board.org_code}')">삭제</button>
					<%-- </c:if> --%>
					<button type="button" class="btn btn-dark btn-sm" onclick="closeDoc()">닫기</button>
				</td>
			</tr>
		</table>						
		<table class="table" width="100%" style="margin-top:7px">
			<colgroup>
				<col width="20%"></col>
				<col width="80%"></col>
			</colgroup>
			<tr> 
				<th>기관명</th>
				<td>
					${board.org_name}
				</td>
			</tr>
			<tr>
				<th>행정구역</th>
				<td>${board.org_area_name}</td>
			</tr>
			<tr>
				<th>주소</th>
				<td>${board.org_addr}</td>
			</tr>
			<tr>
				<th>전화번호</th>
				<td>${board.org_tel}</td>
			</tr>
		</table>
	</div>
<!------------------------------ //개발자 소스 입력 END ------------------------------->
</body>
</html>