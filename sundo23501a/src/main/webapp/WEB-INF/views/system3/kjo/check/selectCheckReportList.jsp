<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ include file="/WEB-INF/views/header.jsp" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Insert title here</title>

    <style>
        /* 추가 스타일링을 위한 CSS */
        tr:hover {
            background-color: #f5f5f5;
            cursor: pointer;
        }

        header {
            height: 55px;
        }
    </style>

    <script type="text/javascript">
        $(function (){
            doubliClickEvents();
        })

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

        function doubliClickEvents(){
            var trElements = document.querySelectorAll('.cont');

            console.log(trElements.length);
            trElements.forEach(function (trElement) {
                console.log("fdsfds");
                trElement.addEventListener('dblclick', function () {
                    // 더블클릭할 때 수행할 동작을 여기에 추가합니다.
                    console.log("fds");

                    var doc_no = trElement.getAttribute('data-doc-no');

                    window.location.href = "/getcheckresult?doc_no=" + doc_no;
                    // getcheckresultform
                });
            });
        }


        function searchCheckReportList(currentPage) {


            const wr = {
                currentPage : currentPage,
                facility_category : $("#facility_category_List").val(),
                org_area : $("#org_area_List").val(),  //  행정기관
                org_name : $("#org_name_List").val(),       //  관리기관
                user_department : $("#user_department").val(),      //  소속
                firstdate : $("#find_date1").val(),
                secdate : $("#find_date2").val(),
                cate_name : $("#cate_name").val(),
                facility_code : $("#facility_code").val(),
                research : $("#research").val()
            }
            console.log(wr);
            $.ajax({
                url: "/getcheckresultform",
                data: wr,

                success(data) {
                    let table_body = $("#table_body");
                    const CRList = data.objList;
                    const obj = data.obj;
                    table_body.empty();

                    $.each(CRList, function (key, values) {
                        const newtr = $('<tr></tr>');
                        newtr.addClass("cont");
                        newtr.attr('data-doc-no', values.doc_no); // jQuery를 사용하여 data-doc-no 속성 추가
                        newtr.append('<td>' + values.rn + '</td>');
                        newtr.append('<td>' + values.facility_category + '</td>');
                        newtr.append('<td>' + values.facility_code + '</td>');
                        newtr.append('<td>' + values.org_area_name + '</td>');
                        newtr.append('<td>' + values.org_name + '</td>');
                        newtr.append('<td>' + values.check_date + '</td>');
                        newtr.append('<td>' + values.check_result + '</td>');
                        newtr.append('<td>' + values.user_name + '</td>');
                        table_body.append(newtr);
                    });
                    var paginationDiv = $('#paging'); // 페이지네이션을 표시할 div
                    paginationDiv.empty(); // 페이지네이션을 초기화

                    var jspPagination = '';

                    if (obj.startPage > obj.pageBlock) {
                        jspPagination += '<div class="page-link" onclick="searchCheckReportList(' + (obj.startPage - obj.pageBlock) + ')">이전</div>';
                    }

                    for (var i = obj.startPage; i <= obj.endPage; i++) {
                        jspPagination += '<div class="page-item" onclick="searchCheckReportList(' + i + ')"><div class="page-link">' + i + '</div></div>';
                    }

                    if (obj.endPage >= obj.pageBlock) {
                        jspPagination += '<div class="page-link" onclick="searchCheckReportList(' + (obj.startPage + obj.pageBlock) + ')">다음</div>';
                    }
                    jspPagination += '</div>';
                    paginationDiv.html(jspPagination); // JSP 페이지 네비게이션 코드를 추가


                    doubliClickEvents();
                }
            })

        }


    </script>
</head>
<body>

    <header id="header"></header>




    <div class="container" style="margin-top: 3%">
        <div class="row">
            <div id="center">
                <form action="" id="">
                    <table>
                        <tr>
                            <td>시설물 종류:</td>
                            <td>
                                <select class="form-select" id="facility_category_List">
                                    <c:forEach items="${wrctgList}" var="list">
                                        <option name="facility_category"
                                                value="${list.facility_category}">${list.facility_category}</option>
                                    </c:forEach>
                                    <option name="facility_category"
                                            value="전체" selected>전체
                                    </option>
                                </select></td>
                            <td>행정구역:</td>
                            <td>
                                <select class="form-select" id="org_area_List">
                                    <c:forEach items="${orgList}" var="list">
                                        <option name="org_area" value="${list.org_area}">${list.org_area_name}</option>
                                    </c:forEach>
                                    <option name="org_area"
                                            value="전체" selected>전체
                                    </option>
                                </select>
                            </td>
                            <td>관리기관:</td>

                            <td>
                                <select class="form-select" id="org_name_List">
                                    <c:forEach items="${organizationList}" var="list">
                                        <option name="org_name" value="${list.org_name}">${list.org_name}</option>
                                    </c:forEach>
                                    <option name="org_name"
                                            value="전체" selected>전체
                                    </option>
                                </select>
                            </td>
                            <td>점검자 소속:</td>
                            <td><input type="text" id="user_department"></td>

                        </tr>
                        <tr>
                            <td>조회기간:</td>
                            <td><input type="date" name="find_date1" id="find_date1"></td>
                            <td>~</td>
                            <td><input type="date" name="find_date2" id="find_date2"></td>

                            <td>시설물 명칭:</td>
                            <td><input type="text" name="cate_name" id="cate_name"></td>
                            <td>시설물 코드:</td>
                            <td><input type="text" name="facility_code" id="facility_code"></td>

                            <td><input type="button" onclick="searchCheckReportList()" value="조회"></td>
                            <td><input type="checkbox" id="research">결과 내 재검색</td>

                        </tr>
                    </table>
                </form>
                <table>
                    <tr>
                        <th>연번</th>
                        <th>시설물 종류</th>
                        <th>시설물 코드</th>
                        <th>행정구역</th>
                        <th>관리기관</th>
                        <th>최종점검일</th>
                        <th>최종점검결과</th>
                        <th>점검자</th>
                    </tr>

                    <tbody id="table_body">

<%--                    <tbody id="table_body">--%>
                    <c:forEach items="${wrList}" var="list">
                        <tr>
                            <td>${list.rn}</td>
                            <td>${list.facility_category}</td>
                            <td>${list.facility_code}</td>
                            <td>${list.org_name}</td>
                            <td>${list.org_area_name}</td>
                            <c:if test="${list.modify_datetime == null}">
                                <td>점검없음</td>
                            </c:if>
                            <c:if test="${list.modify_datetime != null}">
                                <td>${list.modify_datetime}</td>
                            </c:if>

                            <c:if test="${list.modify_datetime == null}">
                                <td>점검결과없음</td>
                            </c:if>
                            <c:if test="${list.modify_datetime != null}">
                                <td>${list.check_result}</td>
                            </c:if>

                            <c:if test="${list.modify_datetime == null}">
                                <td>점검자없음</td>
                            </c:if>
                            <c:if test="${list.modify_datetime != null}">
                                <td>${list.user_name}</td>
                            </c:if>

                        </tr>
                    </c:forEach>


                    </tbody>

                </table>

                <div id="paging" class="pagination justify-content-center">
                    <c:if test="${page.startPage > page.pageBlock}">
                        <div class="page-link" onclick="searchCheckReportList(${page.startPage - page.pageBlock})">
                            이전
                        </div>
                    </c:if>
                    <c:forEach var="i" begin="${page.startPage}" end="${page.endPage}">
                        <div class="page-item" onclick="searchCheckReportList(${i})">
                            <div class="page-link" style="cursor:pointer">${i}</div>
                        </div>
                    </c:forEach>
                    <c:if test="${page.endPage >= page.pageBlock}">
                        <div class="page-link" onclick="searchCheckReportList(${page.startPage + page.pageBlock})">
                            다음
                        </div>
                    </c:if>
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
