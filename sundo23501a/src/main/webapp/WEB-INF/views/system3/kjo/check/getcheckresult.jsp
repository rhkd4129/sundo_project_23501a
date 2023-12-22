<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ include file="/WEB-INF/views/header.jsp" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Insert title here</title>
    <script type="text/javascript"
            src="http://code.jquery.com/jquery-latest.min.js"></script>
    <!-- COMMON END -->
    <style type="text/css">
        container{
            width: 80%;
        }
        ul{
            padding: 0;
        }
        li{
            list-style: none;
        }
        header {
            height: 10px;
        }
    </style>

    <script type="text/javascript">

        $(function() {

            $.ajax({
                url			: '/main_header_3',
                dataType 	: 'html',
                success		: function(data) {
                    $('#header').html(data);
                }
            });

            $.ajax({
                url			: '/main_footer',
                dataType 	: 'html',
                success		: function(data) {
                    $('#footer').html(data);
                }
            });
        });


    </script>
</head>
<body>

<header id="header" style="margin-top: 3%"></header>

<div class="container" style="margin-top: 3%">
    <div class="row">
        <div id="center">

    <table class="table">
        <tr>
            <td>시설물코드</td>
            <input type="hidden" id="facility_code" value="${CheckReport.facility_code}">
            <td>${CheckReport.facility_code}</td>
            <td>시설물</td>
            <td id="facility_category">${CheckReport.facility_category }</td>
            <td>유형</td>
            <td id="cate_name">${CheckReport.cate_name }</td>
        </tr>
        <tr class="table">
            <td>점검일자:</td>
            <td><input class="form-control" type="date" name="check_date" id="check_date" value="${CheckReport.modify_datetime}"></td>

            <td>기상상황:</td>
            <td>
                <select class="form-select" id="weather" name="weather">
                    <option value="맑음" ${CheckReport.weather eq '맑음' ? 'selected' : ''}>맑음</option>
                    <option value="흐림" ${CheckReport.weather eq '흐림' ? 'selected' : ''}>흐림</option>
                    <option value="비" ${CheckReport.weather eq '비' ? 'selected' : ''}>비</option>
                </select>
            </td>

            <td>점검자 소속:</td>
            <td><input class="form-control" type="text" name="user_department" id="user_department" value="${CheckReport.user_department}">
            </td>
            <td>직급:</td>
            <td><input class="form-control" type="text" name="user_position" id="user_position" value="${CheckReport.user_position}">
            </td>
            <td>이름:</td>
            <td><input class="form-control" type="text" name="user_name" id="user_name" value="${CheckReport.user_name}">
            </td>

        </tr>
        <tr>
            <th>점검위치</th>
            <th colspan="4">점검 항목</th>
            <th>평가 점수</th>
            <th colspan="4">비고</th>
        </tr>
        <tr>
            <td>마루</td>
            <td colspan="4">
                <ul>
                    <li>균열 및 단차</li>
                    <li>수축이음부의 열림</li>
                    <li>기타사항</li>
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
            <td colspan="4">
                <ul>
                    <c:forEach items="${FloorList}" var="item" >
                        <li>
                            <input class="note form-control" id="note${item.rn}" type="text" name="input${item.rn}" value="${item.note}">
                        </li>
                    </c:forEach>
                </ul>
            </td>
        </tr>

        <tr>
            <td>상류면</td>
            <td colspan="4">
                <ul>
                    <li>수축이음부의 열림</li>
                    <li>균열</li>
                    <li>박락</li>
                    <li>기타사항</li>
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
            <td colspan="4">
                <ul>
                    <c:forEach items="${TopCLList}" var="top" >
                        <li>
                            <input class="note form-control" id="note${top.rn}" type="text" name="input${top.rn}" value="${top.note}">
                        </li>
                    </c:forEach>
                </ul>
            </td>
        </tr>
        <tr>
            <td>하류면</td>
            <td colspan="4">
                <ul>
                    <li>균열 및 단차</li>
                    <li>수축 및 수평시공이음부를 통한 누수</li>
                    <li>균열 및 박락</li>
                    <li>기타사항</li>
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
            <td colspan="4">
                <ul>
                    <c:forEach items="${BotList}" var="bot" >
                        <li>
                            <input class="note form-control" id="note${bot.rn}" type="text" name="input${bot.rn}" value="${bot.note}">
                        </li>
                    </c:forEach>
                </ul>
            </td>
        </tr>
        <tr>
            <td>검사량</td>
            <td colspan="4">
                <ul>
                    <li>횡방향 검사량에서의 균열</li>
                    <li>상류 종방향 검사량에서의 균열</li>
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
            <td colspan="4">
                <ul>
                    <c:forEach items="${IpqList}" var="ipq" >
                        <li>
                            <input class="note form-control" id="note${ipq.rn}" type="text" name="input${ipq.rn}" value="${ipq.note}">
                        </li>
                    </c:forEach>
                </ul>
            </td>
        </tr>
        <tr>
            <td>점검결과:</td>

            <td colspan="9">
                <select class="form-select" id="check_result" name="check_result">
                    <option value="맑음" ${CheckReport.check_result eq '보수필요' ? 'selected' : ''}>보수필요</option>
                    <option value="흐림" ${CheckReport.check_result eq '양호' ? 'selected' : ''}>양호</option>
                </select>
            </td>
        </tr>
        <tr>
            <td >특이사항:</td>
            <td colspan="9"><input class="form-control" id="spec_memo" type="text" value="${CheckReport.spec_memo}"></td>
        </tr>

    </table>

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