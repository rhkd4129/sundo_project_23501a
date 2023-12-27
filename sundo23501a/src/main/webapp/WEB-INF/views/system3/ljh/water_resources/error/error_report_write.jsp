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
	
	th {
		background: #EAEAEA;
		padding: 5px 10px;
	}
	
	td {
		padding: 5px 10px;
	}
	
	select {
		width: 100%;
		height: 35px;
		border: none;
	}
	
	textarea {
		width: 100%;
	}
	
	.subject {
		width: 100%;
		height: 35px;
	}
	
	.date {
		height: 35px;
		width: 200px;
	}
	
	.btns {
		text-align: right;
		margin-top: 20px;
	}
	
	
	.cate {
		width: 150px;
	}
	
	.rptTbl th {
		width: 150px;
	}

	.alarmTbl .cate {
		width: 150px;
	}

	.alarmTbl th, .alarmTbl td {
		height: 35px;
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
					options += '<option value="전체">전체</option>';
					
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
								
								alarms += '<tr><th rowspan="' + rtndata.length+1 + '" class="cate">알람내역</th><th>알람코드</th><th>알람내용</th><th>알람일시</th><th>확인</th></tr>';
								
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
	
	
	// form 입력값 체크
	function chk() {
		if (errorForm.facility_category.value == '전체') {
			alert("시설물 종류를 선택하세요.");
			return false;
		}
		
		if (errorForm.facility_code.value == '전체') {
			alert("시설물 코드를 선택하세요.");
			return false;
		}
		
		if (errorForm.check_target.value == '전체') {
			alert("점검대상을 선택하세요.");
			return false;
		}
		
		if (errorForm.m_category.value == '전체') {
			alert("중분류를 선택하세요.");
			return false;
		}
		
		if (errorForm.s_category.value == '전체') {
			alert("소분류를 선택하세요.");
			return false;
		}
	};
	
</script>
</head>
<body>
		<header id="header" style="margin-top: 3%"></header>


		<div class="container">
			<div class="row">
				<div id="center">
					<div>
						<p class="title">고장 보고서 작성</p>
						<form action="error_report_write" method="post" name="errorForm" onsubmit="return chk()">
							<table class="rptTbl">
								<thead>
								<tr>
									<th class="cate">시설물 종류</th>
									<td>
										<select id="waterCategorySelect" name="facility_category">
											<option value="전체">전체</option>
											<c:forEach var="water" items="${waterCategory }">
												<option value="${water.facility_category }">${water.facility_category }</option>
											</c:forEach>
										</select>
									</td>
									<th class="cate">시설물 코드</th>
									<td>
										<div id="wrCodeOption">
											<select id="wrCodeSelect" name="facility_code">
												<option value="전체">전체</option>
											</select>
										</div>
									</td>
									<th class="cate">작성자</th>
									<td><input type="hidden" name="user_id" required="required" value="${user_id}">${user_name}</td>
								</tr>
								<tr>
									<th class="cate">점검대상</th>
									<td>
										<select name="check_target">
											<option value="전체">전체</option>
											<c:forEach var="checkCode" items="${checkCodeList }">
												<c:if test="${checkCode.field_name == 'check_target' }">
													<option value="${checkCode.cate_name }">${checkCode.cate_name }</option>
												</c:if>
											</c:forEach>
										</select>
									</td>
									<th class="cate">중분류</th>
									<td>
										<select name="m_category">
											<option value="전체">전체</option>
											<c:forEach var="checkCode" items="${checkCodeList }">
												<c:if test="${checkCode.field_name == 'm_category' }">
													<option value="${checkCode.cate_name }">${checkCode.cate_name }</option>
												</c:if>
											</c:forEach>
										</select>
									</td>
									<th class="cate">소분류</th>
									<td>
										<select name="s_category">
											<option value="전체">전체</option>
											<c:forEach var="checkCode" items="${checkCodeList }">
												<c:if test="${checkCode.field_name == 's_category' }">
													<option value="${checkCode.cate_name }">${checkCode.cate_name }</option>
												</c:if>
											</c:forEach>
										</select>
									</td>
								</tr>
								</thead>
								<tbody>
								<tr><th class="cate">제목</th><td colspan="5"><input type="text" class="form-control subject" name="subject" required="required"></td></tr>
								<tr><th class="cate">고장일자</th><td colspan="5"><input type="date" class="form-control date" name="break_date" required="required"></td></tr>
								<tr><th class="cate">고장원인</th><td colspan="5"><textarea rows="4" name="break_cause" class="form-control"></textarea></td></tr>
								<tr><th class="cate">현재상황</th><td colspan="5"><textarea rows="4" name="current_state" class="form-control"></textarea></td></tr>
								<tr>
									<th class="cate">즉시처리</th>
									<td colspan="5">
										<table style="border:0px">
											<tr style="border:0px">
												<td width="30" style="border:0px"><input type="checkbox" name="handling_flag" value="Y"></td>
												<td width="*" style="border:0px"><input type="text" class="form-control" name="handling_content"></td>
											</tr>
										</table>
									</td>
								</tr>
								<tr><th class="cate">향후계획</th><td colspan="5"><textarea rows="4" name="future_plan" class="form-control"></textarea></td></tr>
								</tbody>
							</table>
							<table class="alarmTbl">
								<tbody id="alarmBox">
								<tr>
									<th rowspan="50" class="cate">알람내역</th>
									<th>알람코드</th><th>알람내용</th><th>알람일시</th><th>확인</th>
								</tr>
								<tr>
									<td> </td><td> </td><td> </td><td><input type="checkbox"></td>
								</tr>
								</tbody>
							</table>
							<div class="btns">
								<button class="btn btn-dark btn-sm" onclick="location.href='/error_report_list'">돌아가기</button>
								<button type="submit" class="btn btn-dark btn-sm">저장</button>
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