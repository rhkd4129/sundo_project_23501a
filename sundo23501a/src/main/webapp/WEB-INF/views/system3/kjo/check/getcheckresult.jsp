<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ include file="/WEB-INF/views/header.jsp" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>수자원 시설물 관리시스템 - 점검이력조회</title>
<script type="text/javascript"
        src="http://code.jquery.com/jquery-latest.min.js"></script>
<!-- COMMON END -->
<style type="text/css">
header {
	height: 55px;
}
.searchbox {
	border:2px solid #dee2e6;
	border-radius: 10px;
	padding: 10px;
}
.listTable {
	width: 100%;
	text-align: center;
}
.tableCate {
	border-top: solid gray 2px;
	background: #EAEAEA;
	height: 35px;
}
.tableCate th {
	border-left: solid white 1px;
	border-right: solid white 1px;
}
.tableRow {
	border-bottom: solid lightgray 1px;
	height: 35px;
}
#paging {
	margin: 10px;
}
.underline {
	border-bottom:2px solid #fff;
}
.tableInfo {
	border-collapse: collapse;
	width: 100%;
	margin: 10px 0px;
}
.tableInfo th, .tableInfo td {
	border-top: 1px solid #ddd;
	border-bottom: 1px solid #ddd;
	padding: 8px;
	text-align: left;
}
.tableInfo th {
	text-align: center;
	background-color: #f2f2f2;
}

container{
    width: 80%;
}
ul{
    padding: 0;
}
li{	
    list-style: none;
}
.ul-item ul, .ul-item li{
	padding:8px 0px;
	text-align: left;
}

</style>

    <script type="text/javascript">

        $(function() {

            $.ajax({
                url         : '/main_header_3',
                async		: false,
                dataType    : 'html',
                success      : function(data) {
                    $('#header').html(data);
                }
            });
            $("#sub-list-2").addClass('underline');

            $.ajax({
                url         : '/main_footer',
                dataType    : 'html',
                success      : function(data) {
                    $('#footer').html(data);
                }
            });
        });


    </script>
</head>
<body>

	<header id="header"></header>
	<br>
	<div class="container">
		<table width="100%" style="height:45px">
			<tr>
				<td style="vertical-align:top"><span class="apptitle">점검이력조회</span></td>
				<td align="right">
				</td>
			</tr>
		</table>
		<table class="tableInfo">
        	<tr>
                <th style="width:80px;text-align:right;font-weight:bold;">시설물코드</th>
                <td>
                	<input type="hidden" id="facility_code" value="${CheckReport.facility_code}">
                	<font class="text-primary" style="font-size:15px"><b>${CheckReport.facility_code}</b></font>
                </td>
                <th style="width:70px;text-align:right;font-weight:bold;">시설물</th>
                <td id="facility_category">
                	<font class="text-success" style="font-size:15px"><b>${CheckReport.facility_category}</b></font>
                </td>
                <th style="width:50px;text-align:right;font-weight:bold;">유형</th>
                <td id="cate_name">
                	<font class="text-success" style="font-size:15px"><b>${CheckReport.cate_name}</b></font>
                </td>
            </tr>
        </table>
        <div class="searchbox">
        	<table>
                <tr>
                    <td style="width:70px;text-align:right;font-weight:bold;">점검일자</td>
                    <td><input class="form-control" type="date" name="check_date" id="check_date" value="${CheckReport.modify_datetime}"></td>

                    <td style="width:70px;text-align:right;font-weight:bold;">기상상황</td>
                    <td>
                        <select class="form-select" id="weather" name="weather">
                            <option value="맑음" ${CheckReport.weather eq '맑음' ? 'selected' : ''}>맑음</option>
                            <option value="흐림" ${CheckReport.weather eq '흐림' ? 'selected' : ''}>흐림</option>
                            <option value="비" ${CheckReport.weather eq '비' ? 'selected' : ''}>비</option>
                        </select>
                    </td>
					<td style="width:80px;text-align:right;font-weight:bold;">점검자 소속</td>
                    <td><input class="form-control" type="text" name="user_department" id="user_department" value="${CheckReport.user_department}">
                    </td>
                    <td style="width:50px;text-align:right;font-weight:bold;">직급</td>
                    <td><input class="form-control" type="text" name="user_position" id="user_position" value="${CheckReport.user_position}">
                    </td>
                    <td style="width:50px;text-align:right;font-weight:bold;">이름</td>
                    <td><input class="form-control" type="text" name="user_name" id="user_name" value="${CheckReport.user_name}">
                    </td>
				</tr>
            </table>
        </div>
        
        <div style="margin:10px 0px;">
            <table class="listTable">
            	<colgroup>
            		<col width="10%">
            		<col width="30%">
            		<col width="10%">
            		<col width="50%">
            	</colgroup>
                <tr class="tableCate">
                    <th>점검위치</th>
                    <th>점검 항목</th>
                    <th>평가 점수</th>
                    <th>비고</th>
                </tr>
                <tr class="tableRow">
                    <td>마루</td>
                    <td>
                        <ul class="ul-item">
                            <li>-균열 및 단차</li>
                            <li>-수축이음부의 열림</li>
                            <li>-기타사항</li>
                        </ul>
                    </td>
                    <td>
                        <ul>
                            <c:forEach items="${FloorList}" var="floor" >
                                <li>
                                    <select class="check_grade form-select" id="check_grade${floor.rn}">
                                        <option value="a" ${floor.check_grade eq 'a' ? 'selected' : ''}>a</option>
                                        <option value="b" ${floor.check_grade eq 'b' ? 'selected' : ''}>b</option>
                                        <option value="c" ${floor.check_grade eq 'c' ? 'selected' : ''}>c</option>
                                    </select>
                                </li>
                            </c:forEach>
                        </ul>
                    </td>
                    <td>
                        <ul>
                            <c:forEach items="${FloorList}" var="item" >
                                <li>
                                    <input class="note form-control" id="note${item.rn}" type="text" name="input${item.rn}" value="${item.note}">
                                </li>
                            </c:forEach>
                        </ul>
                    </td>
                </tr>
                <tr class="tableRow">
                    <td>상류면</td>
                    <td>
                        <ul class="ul-item">
                            <li>-수축이음부의 열림</li>
                            <li>-균열</li>
                            <li>-박락</li>
                            <li>-기타사항</li>
                        </ul>
                    </td>
                    <td>
                        <ul>
                            <c:forEach items="${TopCLList}" var="top" >
                                <li>
                                    <select class="check_grade form-select" id="check_grade${top.rn}">
                                        <option value="a" ${top.check_grade eq 'a' ? 'selected' : ''}>a</option>
                                        <option value="b" ${top.check_grade eq 'b' ? 'selected' : ''}>b</option>
                                        <option value="c" ${top.check_grade eq 'c' ? 'selected' : ''}>c</option>
                                    </select>
                                </li>
                            </c:forEach>

                        </ul>
                    </td>
                    <td>
                        <ul>
                            <c:forEach items="${TopCLList}" var="top" >
                                <li>
                                    <input class="note form-control" id="note${top.rn}" type="text" name="input${top.rn}" value="${top.note}">
                                </li>
                            </c:forEach>
                        </ul>
                    </td>
                </tr>
                <tr class="tableRow">
                    <td>하류면</td>
                    <td>
                        <ul class="ul-item">
                            <li>-균열 및 단차</li>
                            <li>-수축 및 수평시공이음부를 통한 누수</li>
                            <li>-균열 및 박락</li>
                            <li>-기타사항</li>
                        </ul>
                    </td>
                    <td>
                        <ul>
                            <c:forEach items="${BotList}" var="bot" >
                                <li>
                                    <select class="check_grade form-select" id="check_grade${bot.rn}">
                                        <option value="a" ${bot.check_grade eq 'a' ? 'selected' : ''}>a</option>
                                        <option value="b" ${bot.check_grade eq 'b' ? 'selected' : ''}>b</option>
                                        <option value="c" ${bot.check_grade eq 'c' ? 'selected' : ''}>c</option>
                                    </select>
                                </li>
                            </c:forEach>
                        </ul>
                    </td>
                    <td>
                        <ul>
                            <c:forEach items="${BotList}" var="bot" >
                                <li>
                                    <input class="note form-control" id="note${bot.rn}" type="text" name="input${bot.rn}" value="${bot.note}">
                                </li>
                            </c:forEach>
                        </ul>
                    </td>
                </tr>
                <tr class="tableRow">
                    <td>검사량</td>
                    <td>
                        <ul class="ul-item">
                            <li>-횡방향 검사량에서의 균열</li>
                            <li>-상류 종방향 검사량에서의 균열</li>
                        </ul>
                    </td>
                    <td>
                        <ul>
                            <c:forEach items="${IpqList}" var="ipq" >
                                <li>
                                    <select class="check_grade form-select" id="check_grade${ipq.rn}">
                                        <option value="a" ${ipq.check_grade eq 'a' ? 'selected' : ''}>a</option>
                                        <option value="b" ${ipq.check_grade eq 'b' ? 'selected' : ''}>b</option>
                                        <option value="c" ${ipq.check_grade eq 'c' ? 'selected' : ''}>c</option>
                                    </select>
                                </li>
                            </c:forEach>
                        </ul>
                    </td>
                    <td>
                        <ul>
                            <c:forEach items="${IpqList}" var="ipq" >
                                <li>
                                    <input class="note form-control" id="note${ipq.rn}" type="text" name="input${ipq.rn}" value="${ipq.note}">
                                </li>
                            </c:forEach>
                        </ul>
                    </td>
                </tr>
                <tr class="tableRow" style="background-color:#f0faff">
                    <td><b>점검결과 :</b></td>

                    <td colspan="3" style="padding:5px 0px">
                        <select class="form-select" id="check_result" name="check_result">
                            <option value="맑음" ${CheckReport.check_result eq '보수필요' ? 'selected' : ''}>보수필요</option>
                            <option value="흐림" ${CheckReport.check_result eq '양호' ? 'selected' : ''}>양호</option>
                        </select>
                    </td>
                </tr>
                <tr class="tableRow" style="background-color:#f0faff">
                    <td >특이사항:</td>
                    <td colspan="3" style="padding:5px 0px"><input class="form-control" id="spec_memo" type="text" value="${CheckReport.spec_memo}"></td>
                </tr>
            </table>
			<div align="right" style="margin-top:10px">
	            <input class="btn btn-dark" type="button" value="목록" onclick="location.href='/selectcheckReportlist2?facility_code=' + ${CheckReport.facility_code}+'&currentPage=1'">
	            <input class="btn btn-dark" type="button" value="삭제">
	            <input class="btn btn-dark" onclick="window.location.reload()" type="button" value="초기화">
	            <input class="btn btn-dark" type="button" value="저장" id="saveButton">
			</div>
		</div>
    </div>

	<footer class="footer py-2">
	    <div id="footer" class="container">
	    </div>
	</footer>

</body>
</html>