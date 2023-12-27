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
	
	.buttons {
		width: 80px;
	}
	
	.actionRead {
		width: 130px;
	}

	header {
		height: 55px;
	}
.underline {
	border-bottom:2px solid #fff;
}
</style>

	<script>

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

	</script>
<script type="text/javascript">
	function goBack(){
		location.href="/action_report_list";
	};
	
	$(function() {
		$('#waterCategorySelect').change(function() {
			var category = $(this).val();
			var sendurl = 'get_facility_code?facility_category=' + category;
			
			$.ajax({
				url		: sendurl,
				dataType: 'json',
				success : function(rtndata) {
					// console.log(rtndata);
					
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
								// console.log(rtndata);
								
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
	
	
	// form 입력값 체크
	function chk() {
		if (actionForm.facility_category.value == '전체') {
			alert("시설물 종류를 선택하세요.");
			return false;
		}
		
		if (actionForm.facility_code.value == '전체') {
			alert("시설물 코드를 선택하세요.");
			return false;
		}
		
		if (actionForm.check_target.value == '전체') {
			alert("점검대상을 선택하세요.");
			return false;
		}
		
		if (actionForm.m_category.value == '전체') {
			alert("중분류를 선택하세요.");
			return false;
		}
		
		if (actionForm.s_category.value == '전체') {
			alert("소분류를 선택하세요.");
			return false;
		}
	};
	
	
	function ErrorRpt() {
		
		var facility_category = $('#waterCategorySelect').val();
		var facility_code = $('#wrCodeSelect').val();
		
		const facility = {
			facility_category : facility_category,
			facility_code : facility_code
		}
		
 		if (facility_category != '전체' && facility_code != '전체') {
			// alert(facility_category + facility_code);
			
			var _width = '800';
			var _height = '700';
			var _left = Math.ceil(( window.screen.width - _width )/2);
			var _top = Math.ceil(( window.screen.height - _height )/2);
			
			window.open(
				'/choice_error_report_list?facility_category=' + facility_category + '&facility_code=' + facility_code,
				'_blank',
				'width=' + _width + ', height=' + _height + ', top=' + _top + ', left=' + _left
			);
			
		} else {
			alert('조회할 시설물 종류와 코드를 선택하세요');
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
					<p class="title">고장 결과 보고서 작성</p>		
			
					<form action="action_report_write" method="post" name="actionForm" onsubmit="return chk()">
						<table>
							<thead>
							<tr>
								<th>시설물 종류</th>
								<td>
									<select id="waterCategorySelect" name="facility_category">
										<option value="전체">전체</option>
										<c:forEach var="water" items="${waterCategory }">
											<option value="${water.facility_category }">${water.facility_category }</option>
										</c:forEach>
									</select>
								</td>
								<th>시설물 코드</th>
								<td>
									<div id="wrCodeOption">
										<select id="wrCodeSelect" name="facility_code">
											<option value="전체">전체</option>
										</select>
									</div>
								</td>
								<th>작성자</th>
								<td><input type="hidden" name="user_id" required="required" value="${user_id}">${user_name}</td>
							</tr>

							<tr>
								<th>점검대상</th>
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
								<th>중분류</th>
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
								<th>소분류</th>
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
							<tr>
								<th>고장/발생 일자</th><td colspan="2"><input type="date" class="date form-control" name="break_date" required="required"></td>
								<th>조치/복구 일자</th><td colspan="2"><input type="date" class="date form-control" name="action_date" required="required"></td>
							</tr>
							<tr><th>고장내역</th><td colspan="5"><textarea name="break_content" required="required" rows="3" class="form-control"></textarea></td></tr>
							<tr><th>조치내역</th><td colspan="5"><textarea name="action_content" required="required" rows="3" class="form-control"></textarea></td></tr>
							<tr><th>특이사항</th><td colspan="5"><textarea name="spec_memo" rows="3" class="form-control"></textarea></td></tr>
							<tr><th>향후계획</th><td colspan="5"><textarea name="future_plan" rows="3" class="form-control"></textarea></td></tr>
							</tbody>
						</table>
						<div class="btns">
							<input type="button" class="btn btn-dark btn-sm buttons" onclick="goBack()" value="돌아가기"/>
							<input type="button" class="btn btn-dark btn-sm actionRead" onclick="ErrorRpt()" value="고장보고서 보기">
							<input type="submit" class="btn btn-dark btn-sm buttons" value="저장">
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