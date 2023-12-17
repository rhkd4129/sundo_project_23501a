<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Insert title here</title>
    <script type="text/javascript" src="http://code.jquery.com/jquery-latest.min.js"></script>
    <!-- COMMON END -->

    <script type="text/javascript">
        // function getWrList() {
        //     var facility_category = $('#facility_code_List').val();
        //     console.log(facility_category);
        //
        //     $.ajax({
        //         url: "/facility_code_List",
        //         method: "GET",  // 여기를 "POST"에서 "GET"으로 변경
        //         data: {"facility_category": facility_category},
        //         success: function (data) {
        //             console.log("Ajax success:", data);
        //
        //             var sel = $('#facility_addr_List');
        //             sel.empty();
        //
        //             $.each(data, function (key, values) {
        //                 console.log("hikey");
        //                 var newOpt = $('<option name="facility_addr" value="' + values.facility_addr + '"> ' + values.facility_addr + '</option>');
        //                 sel.append(newOpt);
        //             });
        //         }
        //     });
        // }
        function getcheckresult(gfacility_code){
            console.log("getcheckresult");
            location.href = '/checkresultform?facility_code=' + gfacility_code;

        }

        function searchWaterResources(currentPage) {
            var facility_category = $('#facility_code_List').val();
            var org_area = $('#org_area_List').val();
            var cate_name = $('#cate_name').val();
            var facility_code = $('#facility_code').val();


            const wr = {
                facility_category: facility_category,
                org_area: org_area,
                cate_name: cate_name,
                facility_code: facility_code,
                currentPage: currentPage
            };

            console.log(wr);
            $.ajax({
                url: "/searchWaterResources",
                contentType: 'application/json; charset:utf-8',
                data: wr,
                dataType: 'json',
                success: function (data) {
                    console.log(data);
                    console.log(data.obj);
                    console.log(data.objList);

                    var table_body = $('#table_body');
                    table_body.empty();
                    const newtr = $('<tr></tr>');
                    // data.
                    $.each(data.objList, function (key, values) {
                        console.log(values);
                        const newtr = $('<tr></tr>');

                        newtr.append('<td>' + values.rn + '</td>');
                        newtr.append('<td>' + values.facility_category + '</td>');
                        newtr.append('<td>' + values.cate_name + '</td>');
                        newtr.append('<td>' + values.facility_code + '</td>');
                        newtr.append('<td>' + values.first_area + '</td>');
                        newtr.append('<td>' + values.second_area + '</td>');
                        newtr.append('<td>' + values.org_name + '</td>');
                        // newtr.append('<td><input type="button" onclick="getcheckresult(' + values.facility_code + ')" value="입력"></td>');
                        newtr.append('<td><input type="button" value="입력" onclick="getcheckresult(' + values.facility_code + ')" ></td>');

                        table_body.append(newtr);
                    })
                    table_body.html();
                    // paging
                    const obj = data.obj;
                    console.log("hi");
                    console.log(obj);

                    var paginationDiv = $('#paging'); // 페이지네이션을 표시할 div
                    paginationDiv.empty(); // 페이지네이션을 초기화
                    // <div id="c_b" className="pagination">
                    var jspPagination = '';

                    if (obj.startPage > obj.pageBlock) {
                        jspPagination += '<div onclick="searchWaterResources(' + (obj.startPage - obj.pageBlock) + ')"><p>[이전]</p></div>';
                    }

                    for (var i = obj.startPage; i <= obj.endPage; i++) {
                        jspPagination += '<div class="page-item" onclick="searchWaterResources(' + i + ')"><div class="page-link">' + i + '</div></div>';
                    }

                    if (obj.endPage >= obj.pageBlock) {
                        jspPagination += '<div onclick="searchWaterResources(' + (obj.startPage + obj.pageBlock) + ')"><p>[다음]</p></div>';
                    }
                    jspPagination += '</div>';
                    paginationDiv.html(jspPagination); // JSP 페이지 네비게이션 코드를 추가
                }

            })

        }


    </script>
</head>

<table>
    <tr>
        <td>시설물 종류:</td>
        <td>
            <select class="form-select" id="facility_code_List" onchange="getWrList()">
                <c:forEach items="${wrctgList}" var="list">
                    <option name="facility_category"
                            value="${list.facility_category}">${list.facility_category}</option>
                </c:forEach>
            </select>
        </td>
        <td>행정구역:</td>
        <td>
            <select class="form-select" id="org_area_List">
                <c:forEach items="${orgList}" var="list">
                    <option name="facility_addr" value="${list.org_area}">${list.org_area_name}</option>
                </c:forEach>
            </select>
        </td>
        <td>시설물 유형:</td>
        <td>
            <input type="text" name="cate_name" id="cate_name">
        </td>
        <td>시설물 코드:</td>
        <td>
            <input type="text" name="facility_code" id="facility_code" placeholder="XXXXXXXXXXX">
        </td>
        <td>
            <input type="button" id="search_button" value="검색" onclick="searchWaterResources()">
        </td>
    </tr>
</table>
<table>
    <tr>
        <th>연번</th>
        <th>시설물 종류</th>
        <th>시설물 유형</th>
        <th>시설물 코드</th>
        <th>1급 행정구역</th>
        <th>2급 행정구역</th>
        <th>관리기관</th>
        <th>결과 작성</th>
    </tr>
    <tbody id="table_body">
    <c:forEach items="${wrList}" var="list">
        <tr>
            <td>${list.rn}</td>
            <td>${list.facility_category}</td>
            <td>${list.cate_name}</td>
            <td>${list.facility_code}</td>
            <td>${list.first_area}</td>
            <td>${list.second_area}</td>
            <td>${list.org_name}</td>
            <td><input type="button" value="입력" onclick="getcheckresult(${list.facility_code})">

        </tr>
    </c:forEach>



    </tbody>
</table>
<div id="paging" class="pagination justify-content-center">
    <c:if test="${page.startPage > page.pageBlock}">
        <div onclick="location.href='/water_resourcesList?currentPage=${page.startPage - page.pageBlock}'">
            <p>[이전]</p>
        </div>
    </c:if>
    <c:forEach var="i" begin="${page.startPage}" end="${page.endPage}">
        <div class="page-item" onclick="location.href='/water_resourcesList?currentPage=${i}'">
            <div class="page-link" style="cursor:pointer">${i}</div>
        </div>
    </c:forEach>
    <c:if test="${page.endPage <= page.pageBlock}">
        <div onclick="location.href='/water_resourcesList?currentPage=${page.startPage + page.pageBlock}'">
            <p>[다음]</p>
        </div>
    </c:if>
</div>
</body>

</html>