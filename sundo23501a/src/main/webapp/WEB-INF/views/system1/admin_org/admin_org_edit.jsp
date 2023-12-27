<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/header.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>한강 수자원관리 종합 플랫폼 - 기관관리</title>

<!--CSS START -->
<!-- CSS END -->

<!-- JS START -->
<script type="text/javascript" src="/js/board.js"></script>
<!-- JS END -->

<script type="text/javascript">
$(function() {
	$('#notify_flag_chkbox').click(function(){
		var checked = $(this).is(':checked');
		if(checked) {
			$(this).val("Y");
			$('input[name=notify_flag]').val("Y");
		}
		else {
			$(this).val("N");
			$('input[name=notify_flag]').val("N");
		}
	});
});

</script>
</head>
<body>
<!-- CONTENT -->
			<!------------------------------ //개발자 소스 입력 START ------------------------------->
			<div class="container-fluid">
					<form name="formOrg" action="admin_org_update" method="post">
						<input type="hidden" name="org_code" value="${board.org_code}">
						<div style="height:34px">
							<span class="apptitle">문서 수정</span>
						</div>
						<table width="100%" style="margin-top:7px">
							<tr>
								<td style="text-align:right">
									<button type="submit" class="btn btn-dark btn-sm">저장</button>
									<button type="button" class="btn btn-dark btn-sm" onclick="closeDoc()">닫기</button>
								</td>
							</tr>
						</table>
						<table class="table" width="100%">
							<colgroup>
								<col width="20%"></col>
								<col width="80%"></col>
							</colgroup>
							<tr>
								<th>기관명</th>
								<td><input type="text" class="form-control" name="org_name" required="required" value="${board.org_name}"></td>
							</tr>
							<tr>
								<th>행정구역</th>								
								<td>
									<select class="form-select" name="org_area" style="font-size:0.8rem">
										<c:forEach var="obj" items="${orgAreaList}">
											<option value="${obj.org_area}" 
											<c:if test="${board.org_area == obj.org_area}">selected</c:if>
											>${obj.org_area_name}</option>
										</c:forEach>
									</select>
								</td>
							</tr>
							<tr>
								<th>주소</th>
								<td><input type="text" class="form-control" name="org_addr" required="required" value="${board.org_addr}"></td>
							</tr>
							<tr>
								<th>전화번호</th>
								<td><input type="text" class="form-control" name="org_tel" required="required" value="${board.org_tel}"></td>
							</tr>			
						</table>
					</form>
			</div>
	  		<!------------------------------ //개발자 소스 입력 END ------------------------------->
</body>
</html>