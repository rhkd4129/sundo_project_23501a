<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/header.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>수자원 시설물 관리시스템 - 고장 보고서</title>
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
	
	.btns {
		text-align: right;
		margin-top: 20px;
	}
	
	th {
		background: #EAEAEA;
		padding: 5px 10px;
		height: 40px;
	}
	
	td {
		padding: 5px 10px;
		height: 40px;
	}
	
	.rptTbl th {
		width: 100px;
	}

	.alarmTbl .cate {
		width: 100px;
	}

</style>
</head>
<body>
	<div class="container" style="margin-top: 3%">
		<div class="row">
			<div id="center">
				<p class="title">고장 보고서</p>
				<div>
					<table class="rptTbl">
						<tr>
							<th>시설물 종류</th><td>${breakReport.facility_category }</td>
							<th>시설물 코드</th><td>${breakReport.facility_code }</td>
							<th>작성자</th><td>${breakReport.user_name }</td>
						</tr>
						<tr>
							<th>점검대상</th><td>${breakReport.check_target }</td>
							<th>중분류</th><td>${breakReport.m_category }</td>
							<th>소분류</th><td>${breakReport.s_category }</td>
						</tr>
		
						<tr><th>제목</th><td colspan="5">${breakReport.subject }</td></tr>
						<tr><th>고장일자</th><td colspan="5">${breakReport.break_date }</td></tr>
						<tr><th>고장원인</th><td colspan="5">${breakReport.break_cause }</td></tr>
						<tr><th>현재상황</th><td colspan="5">${breakReport.current_state }</td></tr>
						<tr><th>즉시처리</th>
							<td colspan="5">
								<c:if test="${breakReport.handling_flag == 'Y' }">
									<input type="checkbox" checked="checked">
								</c:if>
								<c:if test="${breakReport.handling_flag != 'Y' }">
									<input type="checkbox">
								</c:if>
								${breakReport.handling_content }
							</td></tr>
						<tr><th>향후계획</th><td colspan="5">${breakReport.future_plan }</td></tr>
						<!-- <tr><th>파일</th><td colspan="5"><input type="file" name="file1"></td></tr> -->
					</table>
		
					<table class="alarmTbl">
						<tr>
							<th rowspan="50" class="cate">알람내역</th>
							<th>알람코드</th><th>알람내용</th><th>알람일시</th>
						</tr>
		
						<c:forEach var="alarmList" items="${alarmList }">
							<tr>
								<td>${alarmList.alarm_code }</td><td>${alarmList.alarm_content }</td><td>${alarmList.alarm_date }</td>
							</tr>
						</c:forEach>
					</table>
					
					<div class="btns">
						<button class="btn btn-dark btn-sm" onclick="location.href='/choice_error_report_list?facility_category=${breakReport.facility_category}&facility_code=${breakReport.facility_code }'">목록</button>
					</div>
				</div>
			</div>
		</div>
	</div>

</body>
</html>