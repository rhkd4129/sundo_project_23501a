<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ include file="/WEB-INF/views/header.jsp" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>수자원 시설물 관리시스템 - 점검결과작성</title>
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
    <script>

        $(function() {

            $.ajax({
                url         : '/main_header_3',
                async		: false,
                dataType    : 'html',
                success      : function(data) {
                    $('#header').html(data);
                }
            });
            $("#sub-list-1").addClass('underline');

            $.ajax({
                url         : '/main_footer',
                dataType    : 'html',
                success      : function(data) {
                    $('#footer').html(data);
                }
            });
        });

    </script>


    <script type="text/javascript">

        // 저장 버튼 클릭 시
        function btnclick() {
            console.log("안녕하세요");

            let dep = $("#user_department").val();
            let pos = $("#user_position").val();
            let una = $("#user_name").val();
            let facility_code = $("#facility_code").val();
            let check_date = $("#check_date").val();
            let weather = $("#weather").val();
            let check_result = $("#check_result").val();
            let spec_memo = $("#spec_memo").val();




            var selects = $(".check_grade");
            var notes = $(".note");
            let check_grade="";    //  평가등급
            let note="";           //  비고

            // 선택된 check_grade의 <select> 엘리먼트들을 순회하면서 값을 가져옴
            selects.each(function(index, element) {
                check_grade+=$(element).val()+"|";
                // console.log("selects " + (index + 1) + ": " + check_grade);
                // 가져온 값을 사용하거나 필요에 맞게 처리
            });
            // 선택된 note의 <input> 엘리먼트들을 순회하면서 값을 가져옴
            notes.each(function(index, element) {
                note+=$(element).val()+"|";
                // console.log("notes " + (index + 1) + ": " + note);
                // 가져온 값을 사용하거나 필요에 맞게 처리
            });

            // note = note.slice(0, -1);
            // check_grade = check_grade.slice(0, -1);
            //
            // note = note.split('|');
            // check_grade = check_grade.split('|');


            console.log("check_grade");
            console.log(check_grade);
            console.log("note");


            const cr = {
                "facility_code": facility_code,
                "check_date":check_date,
                "weather":weather,

                "user_name":una,
                "user_position":pos,
                "user_department": dep,

                "check_result":check_result,
                "spec_memo":spec_memo,

                "check_grade":check_grade,

                "note":note
            };

            $.ajax({
                type: "post",
                url: "checkresultSave",
                data: cr,
                success: function (response) {
                    // 서버 응답에 대한 로직
                    console.log(response);
                    let url;
                    let code;
                    if (response == 'Error') {
                        url = '/water_resourcesList';
                        location.replace(url);

                    }

                    console.log(url);
                    alert('값을 확인하세요');
                    // location.replace(url);
                },
                error: function (data) {
                    console.log(data);
                    location.replace('/water_resourcesList');

                }

            });
        }


    </script>
</head>
<body>

	<header id="header"></header>
	<br>
	<div class="container">
		<table width="100%" style="height:45px">
			<tr>
				<td style="vertical-align:top"><span class="apptitle">점검결과작성</span></td>
				<td align="right">
				</td>
			</tr>
		</table>
		<table class="tableInfo">
            <tr>
                <th style="width:80px;text-align:right;font-weight:bold;">시설물코드</th>
                <td>
                	<input type="hidden" id="facility_code" value="${WaterResources.facility_code}">
                	<font class="text-primary" style="font-size:15px"><b>${WaterResources.facility_code}</b></font>
                </td>
                <th style="width:70px;text-align:right;font-weight:bold;">시설물</th>
                <td id="facility_category">
                	<font class="text-success" style="font-size:15px"><b>${WaterResources.facility_category}</b></font>
                </td>
                <th style="width:50px;text-align:right;font-weight:bold;">유형</th>
                <td id="cate_name">
                	<font class="text-success" style="font-size:15px"><b>${WaterResources.cate_name}</b></font>
                </td>
            </tr>
        </table>
		<div class="searchbox">
            <table>
                <tr>
                    <td style="width:70px;text-align:right;font-weight:bold;">점검일자</td>
                    <td><input class="form-control" type="date" name="check_date" id="check_date"></td>

                    <td style="width:70px;text-align:right;font-weight:bold;">기상상황</td>
                    <td>
                    	<select class="form-select" id="weather" name="weather">
	                        <option value="맑음">맑음</option>
	                        <option value="흐림">흐림</option>
	                        <option value="비">비</option>
	                    </select>
                    </td>
                    <td style="width:80px;text-align:right;font-weight:bold;">점검자 소속</td>
                    <td><input value="${UserInfo.user_department}"  class="form-control" type="text" name="user_department" id="user_department" disabled>
                    </td>
                    <td style="width:50px;text-align:right;font-weight:bold;">직급</td>
                    <td><input value="${UserInfo.user_position}" class="form-control" type="text" name="user_position" id="user_position" disabled>
                    </td>
                    <td style="width:50px;text-align:right;font-weight:bold;">이름</td>
                    <td><input value="${UserInfo.user_name}" class="form-control" type="text" name="user_name" id="user_name" disabled>
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
                            <li><select class="check_grade form-select" id="check_grade1">
                                <option value="a">a</option>
                                <option value="b">b</option>
                                <option value="c">c</option>
                            </select></li>
                            <li><select class="check_grade form-select" id="check_grade2">
                                <option value="a">a</option>
                                <option value="b">b</option>
                                <option value="c">c</option>
                            </select></li>
                            <li><select class="check_grade form-select" id="check_grade3">
                                <option value="a">a</option>
                                <option value="b">b</option>
                                <option value="c">c</option>
                            </select></li>
                        </ul>
                    </td>
                    <td>
                        <ul>
                            <li><input class="note form-control" id="note1" type="text" name="input1"></li>
                            <li><input class="note form-control" id="note2" type="text" name="input2"></li>
                            <li><input class="note form-control" id="note3" type="text" name="input3"></li>
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
                            <li><select class="check_grade form-select" id=check_grade4>
                                <option value="a">a</option>
                                <option value="b">b</option>
                                <option value="c">c</option>
                            </select></li>
                            <li><select class="check_grade form-select" id=check_grade5>
                                <option value="a">a</option>
                                <option value="b">b</option>
                                <option value="c">c</option>
                            </select></li>
                            <li><select class="check_grade form-select" id=check_grade6>
                                <option value="a">a</option>
                                <option value="b">b</option>
                                <option value="c">c</option>
                            </select></li>
                            <li><select class="check_grade form-select" id=check_grade7>
                                <option value="a">a</option>
                                <option value="b">b</option>
                                <option value="c">c</option>
                            </select></li>
                        </ul>
                    </td>
                    <td>
                        <ul>
                            <li><input class="note form-control" id="note4" type="text" name="input1"></li>
                            <li><input class="note form-control" id="note5" type="text" name="input2"></li>
                            <li><input class="note form-control" id="note6" type="text" name="input3"></li>
                            <li><input class="note form-control" id="note7" type="text" name="input3"></li>
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
                            <li><select class="check_grade form-select" id=check_grade8>
                                <option value="a">a</option>
                                <option value="b">b</option>
                                <option value="c">c</option>
                            </select></li>
                            <li><select class="check_grade form-select" id=check_grade9>
                                <option value="a">a</option>
                                <option value="b">b</option>
                                <option value="c">c</option>
                            </select></li>
                            <li><select class="check_grade form-select" id=check_grade10>
                                <option value="a">a</option>
                                <option value="b">b</option>
                                <option value="c">c</option>
                            </select></li>
                            <li><select class="check_grade form-select" id=check_grade11>
                                <option value="a">a</option>
                                <option value="b">b</option>
                                <option value="c">c</option>
                            </select></li>
                        </ul>
                    </td>
                    <td>
                        <ul>
                            <li><input class="note form-control" id="note8" type="text" name="input2"></li>
                            <li><input class="note form-control" id="note9" type="text" name="input3"></li>
                            <li><input class="note form-control" id="note10" type="text" name="input4"></li>
                            <li><input class="note form-control" id="note11" type="text" name="input4"></li>
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
                            <li><select class="check_grade form-select" id=check_grade12>
                                <option value="a">a</option>
                                <option value="b">b</option>
                                <option value="c">c</option>
                            </select></li>
                            <li><select class="check_grade form-select" id=check_grade13>
                                <option value="a">a</option>
                                <option value="b">b</option>
                                <option value="c">c</option>
                            </select></li>
                        </ul>
                    </td>
                    <td>
                        <ul>
                            <li><input class="note form-control" id="note12" type="text" name="input1"></li>
                            <li><input class="note form-control" id="note13" type="text" name="input2"></li>
                        </ul>
                    </td>
                </tr>
                <tr class="tableRow" style="background-color:#f0faff">
                    <td><b>점검결과 :</b></td>

                    <td colspan="3" style="padding:5px 0px">
                        <select class="form-select" id="check_result" name="check_result">
                            <option value="보수필요">보수필요</option>
                            <option value="양호">양호</option>
                        </select>
                    </td>
                </tr>
                <tr class="tableRow" style="background-color:#f0faff">
                    <td><b>특이사항 :</b></td>
                    <td colspan="3" style="padding:5px 0px"><input class="form-control" id="spec_memo" type="text"></td>
                </tr>
            </table>
            <div align="right" style="margin-top:10px">
	            <input class="btn btn-dark" type="button" value="목록" onclick="location.href='/water_resourcesList'">
	            <input class="btn btn-dark" type="button" value="삭제">
	            <input class="btn btn-dark" type="button" onclick="window.location.reload()" value="초기화">
	            <input class="btn btn-dark" type="button" value="저장" id="saveButton" onclick="btnclick()">
			</div>
		</div>
    </div>

	<footer class="footer py-2">
	    <div id="footer" class="container">
	    </div>
	</footer>

</body>
</html>