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
		width: 150px;
	}

	.alarmTbl .cate {
		width: 150px;
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
	function delErrorRpt() {
		var answer = confirm('보고서를 삭제하시겠습니까?')
		
		if (answer) {
			var doc_no = '${breakReport.doc_no}';
			var sendurl = "/error_report_delete?doc_no=" + doc_no;
			
			$.ajax({
				url		: sendurl,
				dataType: 'json',
				success : function(data) {
					console.log(data);
					
					alert("삭제되었습니다");
					location.href="/error_report_list";
				}
			});
		
		} else {
			return false;
		}		
	};

</script>
</head>
<body>

	<header id="header"></header>
	
	<div class="container" style="margin-top: 3%">
		<div class="row">
			<div id="center">
				<p class="title">고장 보고서 상세 페이지</p>
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
						<button class="btn btn-dark btn-sm" onclick="location.href='/error_report_list'">목록</button>
						<button class="btn btn-dark btn-sm" onclick="location.href='/error_report_update_form?doc_no=${breakReport.doc_no}'">수정</button>
						<button class="btn btn-dark btn-sm" onclick="delErrorRpt()">삭제</button>
					</div>
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