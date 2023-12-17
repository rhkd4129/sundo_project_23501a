<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
<script type="text/javascript">
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
	<div>
		<h1>고장 보고서 작성</h1>
		<form action="error_report_write" method="post">
			<table border="1">
				<thead>
					<tr>
						<th>시설물 종류</th>
						<td>
							<select id="waterCategorySelect" name="facility_category">
								<option>전체</option>
								<c:forEach var="water" items="${waterCategory }">
									<option value="${water.facility_category }">${water.facility_category }</option>
								</c:forEach>
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
									<c:forEach var="checkCode" items="${checkCodeList }">
										<c:if test="${checkCode.field_name == 'check_target' }">
											<option value="${checkCode.cate_name }">${checkCode.cate_name }</option>
										</c:if>
									</c:forEach>
							</select>
						</td>
						<th>중분류</th>
						<td>
							<select name="m_category">
								<option>전체</option>
									<c:forEach var="checkCode" items="${checkCodeList }">
										<c:if test="${checkCode.field_name == 'm_category' }">
											<option value="${checkCode.cate_name }">${checkCode.cate_name }</option>
										</c:if>
									</c:forEach>
							</select>
						</td>
						<th>소분류</th>
						<td>
							<select name="s_category">
								<option>전체</option>
									<c:forEach var="checkCode" items="${checkCodeList }">
										<c:if test="${checkCode.field_name == 's_category' }">
											<option value="${checkCode.cate_name }">${checkCode.cate_name }</option>
										</c:if>
									</c:forEach>
							</select>
						</td>
					</tr>
				
					<tr><th>제목</th><td colspan="5"><input type="text" name="subject"></td></tr>
					<tr><th>고장일자</th><td colspan="5"><input type="date" name="break_date"></td></tr>
					<tr><th>고장원인</th><td colspan="5"><textarea name="break_cause"></textarea></td></tr>
					<tr><th>현재상황</th><td colspan="5"><textarea name="current_state"></textarea></td></tr>
					<tr><th>즉시처리</th><td colspan="5"><input type="checkbox" name="handling_flag" value="Y">
													   <input type="text" name="handling_content"></td></tr>
					<tr><th>향후계획</th><td colspan="5"><textarea name="future_plan"></textarea></td></tr>
					<!-- <tr><th>파일첨부</th><td colspan="5"><input type="file" name="file1"></td></tr> -->
				</thead>
				
				<tbody id="alarmBox">
 					<tr>
						<th rowspan="50">알람내역</th>
						<th>알람코드</th><th>알람내용</th><th>알람일시</th><th>확인</th>
					</tr>
					<tr>
						<th> </th><th> </th><th> </th><th><input type="checkbox"></th>
					</tr>
				</tbody>
				
				<tfoot>
					<tr>
						<td colspan="6">
							<button onclick="location.href='/error_report_list'">돌아가기</button>
							<button type="submit">저장</button>
						</td>
					</tr>
				</tfoot>
			</table>
		</form>
	</div>
</body>
</html>