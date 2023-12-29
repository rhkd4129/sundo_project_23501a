<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/header.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>수자원 시설물 관리시스템 - 고장 결과 보고서</title>
<style type="text/css">
	.title {
		text-align: center;
		font-size: 25px;
		font-weight: bold;
	}
	
	table {
		width: 100%;
		border-top: solid gray 2px;
		border-bottom: solid gray 2px;
	}
	
	tr {
		border-bottom: solid lightgray 1px;
		border-top: solid lightgray 1px;
	}
	
	th {
		background: #EAEAEA;
		padding: 5px 10px;
		height: 40px;
		width: 150px;
	}
	
	td {
		padding: 5px 10px;
		height: 40px;
	}
	
	select {
		width: 100%;
		height: 35px;
		border: none;
	}
	
	textarea, input {
		width: 100%;
	}
	
	.date {
		height: 35px;
		width: 200px;
	}
	
	.btns {
		text-align: right;
		margin-top: 20px;
	}
	
	button {
		width: 80px;
	}
	
	header {
		height: 55px;
	}
.underline {
	border-bottom:2px solid #fff;
}	
</style>
<script type="text/javascript">

	$(function() {

		$.ajax({
			url			: '/main_header_3',
			async		: false,
			dataType 	: 'html',
			success		: function(data) {
				$('#header').html(data);
			}
		});
		$("#sub-list-4").addClass('underline');
	
		$.ajax({
			url			: '/main_footer',
			dataType 	: 'html',
			success		: function(data) {
				$('#footer').html(data);
			}
		});
	});

	
	$(function() {
		$('#waterCategorySelect').change(function() {
			var category = $(this).val();
			var sendurl = 'get_facility_code?facility_category=' + category;
			
			$.ajax({
				url		: sendurl,
				dataType: 'json',
				success : function(rtndata) {
					console.log(rtndata);
					
					var wrCodeOption = $('#wrCodeOption');
					var options = "";
					
					options += '<select id="wrCodeSelect" name="facility_code">';
					options += '<option>전체</option>';
					
					for(var i = 0; i < rtndata.length; i++) {
						options += '<option value="' + rtndata[i].facility_code + '">' + rtndata[i].facility_code + '</option>';
					}
					
					options += '</select>';
	
					wrCodeOption.empty();
					wrCodeOption.append(options);
					
					$('#wrCodeSelect').change(function() {
						var wrCode = $(this).val();
						var sendurl = 'get_alarm?facility_code=' + wrCode;
						
						$.ajax({
							url		: sendurl,
							dataType: 'json',
							success	: function(rtndata) {
								console.log(rtndata);
								
								var alarmBox = $('#alarmBox');
								var alarms = "";
								
								alarms += '<tr><th rowspan="' + rtndata.length+1 + '">알람내역</th><th>알람코드</th><th>알람내용</th><th>알람일시</th><th>확인</th></tr>';
								
								for(var i = 0; i < rtndata.length; i++) {
									alarms += '<tr><td>' + rtndata[i].alarm_code + '</td>' 
											+ '<td>' + rtndata[i].alarm_content	+ '</td>'
											+ '<td>' + rtndata[i].alarm_date + '</td>'
											+ '<td><input type="checkbox" name="alarm_code" value="' + rtndata[i].alarm_code + '"></td></tr>';
								}
								
								alarmBox.empty();
								alarmBox.append(alarms);
							}
						});
					});
				}
			});
		});
	});
	
</script>
</head>
<body>
	<header id="header" style="margin-top: 3%"></header>
	
	<div class="container">
		<div class="row">
			<div id="center">
				<p class="title">조치 결과 보고서 수정</p>
				<form action="action_report_update" method="post">
					<input type="hidden" name="doc_no" value="${actionRpt.doc_no}">
					<table class="rptTbl">
						<thead>
							<tr>
								<th>시설물 종류</th>
								<td>
									<select id="waterCategorySelect" name="facility_category">
										<c:forEach var="water" items="${waterCategory }">
											<c:if test="${water.facility_category == actionRpt.facility_category }">
												<option value="${water.facility_category }" selected="selected">${water.facility_category }</option>
											</c:if>
											<c:if test="${water.facility_category != actionRpt.facility_category }">
												<option value="${water.facility_category }">${water.facility_category }</option>
											</c:if>
										</c:forEach>
									</select>
								</td>
								<th>시설물 코드</th>
								<td>
									<div id="wrCodeOption">
										<select id="wrCodeSelect" name="facility_code">
											<c:forEach var="wrCodeList" items="${wrCodeList }">
												<c:if test="${wrCodeList.facility_code == actionRpt.facility_code}">
													<option value="${wrCodeList.facility_code }" selected="selected">${wrCodeList.facility_code }</option>
												</c:if>
												<c:if test="${wrCodeList.facility_code != actionRpt.facility_code}">
													<option value="${wrCodeList.facility_code }">${wrCodeList.facility_code }</option>
												</c:if>
											</c:forEach>
										</select>
									</div>
								</td>
								<th>작성자</th>
								<td><input type="hidden" name="user_id" value="${actionRpt.user_id }">${actionRpt.user_name }</td>	<!-- 로그인한 사용자 이름 자동 표출 필요 -->
							</tr>
							<tr>
								<th>점검대상</th>
								<td>
									<select name="check_target">
										<c:forEach var="checkCode" items="${checkCodeList }">
											<c:choose>
												<c:when test="${checkCode.field_name == 'check_target' && checkCode.cate_name == actionRpt.check_target}">
													<option value="${checkCode.cate_name }" selected="selected">${checkCode.cate_name }</option>
												</c:when>
												<c:when test="${checkCode.field_name == 'check_target' && checkCode.cate_name != actionRpt.check_target}">
													<option value="${checkCode.cate_name }">${checkCode.cate_name }</option>
												</c:when>
											</c:choose>
										</c:forEach>
									</select>
								</td>
								<th>중분류</th>
								<td>
									<select name="m_category">
										<c:forEach var="checkCode" items="${checkCodeList }">
											<c:choose>
												<c:when test="${checkCode.field_name == 'm_category' && checkCode.cate_name == actionRpt.m_category}">
													<option value="${checkCode.cate_name }" selected="selected">${checkCode.cate_name }</option>
												</c:when>
												<c:when test="${checkCode.field_name == 'm_category' && checkCode.cate_name != actionRpt.m_category}">
													<option value="${checkCode.cate_name }">${checkCode.cate_name }</option>
												</c:when>
											</c:choose>
										</c:forEach>
									</select>
								</td>
								<th>소분류</th>
								<td>
									<select name="s_category">
										<c:forEach var="checkCode" items="${checkCodeList }">
											<c:choose>
												<c:when test="${checkCode.field_name == 's_category' && checkCode.cate_name == actionRpt.s_category}">
													<option value="${checkCode.cate_name }" selected="selected">${checkCode.cate_name }</option>
												</c:when>
												<c:when test="${checkCode.field_name == 's_category' && checkCode.cate_name != actionRpt.s_category}">
													<option value="${checkCode.cate_name }">${checkCode.cate_name }</option>
												</c:when>
											</c:choose>
										</c:forEach>
									</select>
								</td>
							</tr>
						</thead>
						<tbody>
							<tr>
								<th>고장/발생 일자</th>
								<td colspan="2"><input type="date" class="date form-control" name="break_date" value="${actionRpt.break_date }"></td>
								<th>조치/복구 일자</th>
								<td colspan="2"><input type="date" class="date form-control" name="action_date" value="${actionRpt.action_date }"></td>					
							</tr>
							<tr><th>고장내역</th><td colspan="5"><textarea rows="3" class="form-control" name="break_content">${actionRpt.break_content }</textarea></td></tr>
							<tr><th>조치내역</th><td colspan="5"><textarea rows="3" class="form-control" name="action_content">${actionRpt.action_content }</textarea></td></tr>
							<tr><th>특이사항</th><td colspan="5"><textarea rows="3" class="form-control" name="spec_memo">${actionRpt.spec_memo }</textarea></td>
							<tr><th>향후계획</th><td colspan="5"><textarea rows="3" class="form-control" name="future_plan">${actionRpt.future_plan }</textarea></td></tr>
						</tbody>
					</table>
					<div class="btns">
						<button type="button" class="btn btn-dark btn-sm" onclick="location.href='/action_report_read?doc_no=${actionRpt.doc_no}'">돌아가기</button>
						<button type="submit" class="btn btn-dark btn-sm">저장</button>
					</div>
				</form>
			</div>
		</div>
	</div>
	<footer class="footer py-2">
		<div id="footer" class="container">
		</div>
	</footer>
</body>
</html>