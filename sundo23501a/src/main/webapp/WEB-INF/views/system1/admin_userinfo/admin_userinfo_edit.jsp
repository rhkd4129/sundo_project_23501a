<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/header.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>한강 수자원관리 종합 플랫폼 - 사용자관리</title>

<!--CSS START -->
<!-- CSS END -->

<!-- JS START -->
<script type="text/javascript" src="/js/board.js"></script>
<!-- JS END -->

<script type="text/javascript">
$(function() {
	$('#idUseFlag').click(function(){
		var checked = $(this).is(':checked');
		if(checked) {
			$(this).val("Y");
			$('input[name=use_flag]').val("Y");
		}else {
			$(this).val("N");
			$('input[name=use_flag]').val("N");
		}
	});

	var USE_FLAG = "${userInfo.use_flag}";
	if(USE_FLAG == 'N') {
		$('#idUseFlag').prop('checked', false);
	}else{
		$('#idUseFlag').prop('checked', true);
	}
	
});

</script>
</head>
<body>
<!-- CONTENT -->
			<!------------------------------ //개발자 소스 입력 START ------------------------------->
			<div class="container-fluid">
					<form:form action="admin_userinfo_update" method="post" 
						                   name="formUserInfo"
						                   modelAttribute="userInfo"
						                   onsubmit="return admin_userinfo_update()" width="100%">
						<input type="hidden" class="form-control" name="user_pw" value="${userInfo.user_pw}" readonly>
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
								<th>권한</th>
								<td>
				        			<select name="system_category"  class="form-select">
				        				<c:forEach var="code" items="${CodeList_system_category}" varStatus="status">
											<option value="${code.cate_code}" 
											<c:if test="${status.count == userInfo.system_category}">selected</c:if>
											>${code.cate_name}</option>				        				
				        				</c:forEach>
				        			</select>
								</td>
							</tr>	
							<tr> 
								<th>작성자</th>
								<td>
									<input type="text" class="form-control" name="user_name" value="${userInfo.user_name}" required="required">
									<small style="color: red"><form:errors path="user_name"/></small>
								</td>
							</tr>
							<tr> 
								<th>아이디</th>
								<td>
									<input type="text" class="form-control" name="user_id" value="${userInfo.user_id}" readonly>
									<small style="color: red"><form:errors path="user_id"/></small>
								</td>
							</tr>
							<tr>
								<th>전화번호</th>
								<td>
									<input type="text" class="form-control" name="user_tel" value="${userInfo.user_tel}" required="required">
									<small style="color: red"><form:errors path="user_tel"/></small>
								</td>
							</tr>
							<tr>
								<th>이메일</th>
								<td>
									<input type="text" class="form-control" name="user_email" value="${userInfo.user_email}" required="required">
									<small style="color: red"><form:errors path="user_email"/></small>
								</td>
							</tr>
							<tr>
								<th>기관정보</th>
								<td>
									<select name="org_code" class="form-select" >
										<c:forEach var="org" items="${orgList}">
											<option value="${org.org_code}">${org.org_name}</option>
										</c:forEach>
									</select>
								</td>
							</tr>
							<tr>
								<th>소속부서</th>
								<td>
									<input type="text" class="form-control" name="user_department" value="${userInfo.user_department}" required="required">
									<small style="color: red"><form:errors path="user_department"/></small>
								</td>
							</tr>
							<tr>
								<th>직급</th>
								<td>
									<input type="text" class="form-control" name="user_position" value="${userInfo.user_position}" required="required">
									<small style="color: red"><form:errors path="user_position"/></small>
								</td>
							</tr>
							<tr>
								<th>사용여부</th>
								<td><input type="hidden" name="use_flag" value="${userInfo.use_flag}">
									<div class="form-check form-switch">
										<input class="form-check-input" type="checkbox" role="switch" id="idUseFlag" checked="" value="${userInfo.use_flag}">
									</div>
								</td>
							</tr>
						</table>
					</form:form>
			</div>
	  		<!------------------------------ //개발자 소스 입력 END ------------------------------->
</body>
</html>