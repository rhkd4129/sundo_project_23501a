<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/header.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>실시간 수문정보 관리시스템 - 수자원 수정</title>
</head>
<style>
header {
	height: 55px;
}
table {
	border-collapse: collapse;
	width: 100%;
}
th, td {
	border: 1px solid #ddd;
	padding: 8px;
	text-align: left;
}
th {
	text-align: center;
	background-color: #f2f2f2;
}
.btn_group{
	margin-top: 10%;
	margin-bottom: 2%;
	text-align: center;
}
.underline {
	border-bottom:2px solid #fff;
}
.doc-title table {
	widtd:100%;
	height:45px;
}
.doc-title th,
.doc-title td {
	border:0px;
	border-bottom:3px solid #2C3E50;
}
</style>
<script>
    $(function() {

        $.ajax({
            url			: '/main_header_2',
            async		: false,
            dataType 	: 'html',
            success		: function(data) {
                $('#header').html(data);
            }
        });
        $("#sub-list-2").addClass('underline');

        $.ajax({
            url			: '/main_footer',
            dataType 	: 'html',
            success		: function(data) {
                $('#footer').html(data);
            }
        });
    });
</script>
<body class="pt-3">

    <header id="header"></header>

    <div class="container">
		<div class="card" style="padding:30px">
			<form action ="waterResourcesUpdate" method="post">
				<table class="doc-title">
					<tr>
						<td style="vertical-align:top"><span class="apptitle">수자원 정보</span></td>
						<td>
							<div align="right">
								<button type="button" class="btn btn-secondary" onclick="location.href='/waterResourcesList'">
									<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-card-list" viewBox="0 0 16 16">
		                            <path d="M14.5 3a.5.5 0 0 1 .5.5v9a.5.5 0 0 1-.5.5h-13a.5.5 0 0 1-.5-.5v-9a.5.5 0 0 1 .5-.5h13zm-13-1A1.5 1.5 0 0 0 0 3.5v9A1.5 1.5 0 0 0 1.5 14h13a1.5 1.5 0 0 0 1.5-1.5v-9A1.5 1.5 0 0 0 14.5 2h-13z"/>
		                            <path d="M5 8a.5.5 0 0 1 .5-.5h7a.5.5 0 0 1 0 1h-7A.5.5 0 0 1 5 8zm0-2.5a.5.5 0 0 1 .5-.5h7a.5.5 0 0 1 0 1h-7a.5.5 0 0 1-.5-.5zm0 5a.5.5 0 0 1 .5-.5h7a.5.5 0 0 1 0 1h-7a.5.5 0 0 1-.5-.5zm-1-5a.5.5 0 1 1-1 0 .5.5 0 0 1 1 0zM4 8a.5.5 0 1 1-1 0 .5.5 0 0 1 1 0zm0 2.5a.5.5 0 1 1-1 0 .5.5 0 0 1 1 0z"/></svg>
								    목록으로
								</button>
							</div>													
						</td>
					</tr>
				</table>
				<br>
                <table>
					<tr>
						<th>시설물 코드</th>
						<td colspan="3"><input type="text" value="${waterResources.facility_code}" name="facility_code" class="form-control"></td>
					</tr>
					<tr>
						<th>시설물 종류</th>
						<td>
							<select id="facility_category" name="facility_category" class="form-select">
                                <c:forEach var="resource" items="${findfacility_category}">
                                    <option value="${resource.facility_category}">${resource.facility_category}</option>
                                </c:forEach>
                            </select>
						</td>
						<th>관리 기관</th>
						<td>
                            <select name="org_code" class="form-select">
                                <c:forEach var="organization" items="${organization_category}">
                                    <option value="${organization.org_code}">${organization.org_name}</option>
                                </c:forEach>
                            </select>
						</td>
					</tr>
					<tr>
						<th>시설물 유형</th>
						<td>
							<select id="facility_type" name="facility_type" class="form-select">
                                <c:forEach var="code" items="${codeList}">
                                    <option value="${code.cate_code}">${code.cate_name}</option>
                                </c:forEach>
                            </select>
						</td>
						<th>행정 구역</th>
						<td>
                            <select name="org_area" class="form-select">
                                <c:forEach var="org_area" items="${orgArea_category}">
                                    <option value="${org_area.org_area}">${org_area.org_area_name}</option>
                                </c:forEach>
                            </select>
                            <%--<select name="org_area" >
                                <c:forEach var="resources" items="${waterResources}">
                                    <c:set var="isSelected" value=""/>
                                    <c:forEach var="orgArea" items="${orgArea_category}">
                                        <c:if test="${resources.org_area eq orgArea.org_area}">
                                            <c:set var="isSelected" value="selected"/>
                                        </c:if>
                                    </c:forEach>
                                    <option value="${resources.org_area}" ${isSelected}>${resources.org_area_name}</option>
                                </c:forEach>
                            </select>--%>
						</td>
					</tr>
					<tr>
						<th>위도</th>
						<td><input type="text"  value="${waterResources.latitude}" name="latitude" class="form-control"></td>
						<th>경도</th>
						<td><input type="text" value="${waterResources.longitude}" name="longitude" class="form-control"></td>
					</tr>
					<tr>
						<th>주소</th>
						<td colspan="3">
							<input type="text" value="${waterResources.facility_addr}" name="facility_addr" class="form-control">
						</td>
					</tr>
				</table>
				
				<div class="btn_group">
					<button type="submit" class="btn btn-dark">수정하기</button>
				</div>
			</form>
		</div>
	</div>

    <footer class="footer py-2">
        <div id="footer" class="container">
        </div>
    </footer>
</body>
</html>