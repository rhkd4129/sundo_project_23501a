<%--<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>--%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ include file="/WEB-INF/views/header.jsp" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>수자원 시설물 관리시스템 - 점검결과작성</title>
<style>
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
            $("#sub-list-1").addClass('underline');

            $.ajax({
                url			: '/main_footer',
                dataType 	: 'html',
                success		: function(data) {
                    $('#footer').html(data);
                }
            });
        });

    </script>

    <%--    <script type="text/javascript" src="http://code.jquery.com/jquery-latest.min.js"></script>--%>
    <!-- COMMON END -->
    <script type="text/javascript">

        let facility_category;
        let org_area;
        let cate_name;
        let facility_code;

        function getcheckresult(gfacility_code){
            console.log("getcheckresult");
            location.href = '/checkresultform?facility_code=' + gfacility_code;

        }

        function searchWaterResources(currentPage, search ) {

            let wr;

            if (search) {
                console.log("true");
                facility_category = $('#facility_code_List').val();
                org_area = $('#org_area_List').val();
                cate_name = $('#cate_name').val();
                facility_code = $('#facility_code').val();

            }
            wr = {
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

                    if (data.objList.length) {
                        // console.log("EMPTY");
                        console.log(data.objList.length);

                        var table_body = $('#table_body');
                        table_body.empty();
                        const newtr = $('<tr></tr>');
                        // data.

                        $.each(data.objList, function (key, values) {
                            console.log(values);
                            const newtr = $('<tr></tr>').addClass("tableRow");

                            newtr.append('<td>' + values.rn + '</td>');
                            newtr.append('<td>' + values.facility_category + '</td>');
                            newtr.append('<td>' + values.cate_name + '</td>');
                            newtr.append('<td>' + values.facility_code + '</td>');
                            newtr.append('<td>' + values.first_area + '</td>');
                            newtr.append('<td>' + values.second_area + '</td>');
                            newtr.append('<td>' + values.org_name + '</td>');
                            // newtr.append('<td><input type="button" onclick="getcheckresult(' + values.facility_code + ')" value="입력"></td>');
                            newtr.append('<td><input class="btn btn-outline-dark btn-sm" type="button" value="입력" onclick="getcheckresult(' + values.facility_code + ')" ></td>');

                            table_body.append(newtr);
                        });
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
                            jspPagination += '<div class="page-link" onclick="searchWaterResources(' + (obj.startPage - obj.pageBlock) + ',false)">이전</div>';
                        }

                        for (var i = obj.startPage; i <= obj.endPage; i++) {
                            jspPagination += '<div class="page-item ';
                            if(obj.currentPage == i) {
                            	jspPagination += 'active';
                            }
                            jspPagination += '" onclick="searchWaterResources(' + i + ',false)"><div class="page-link">' + i + '</div></div>';
                        }

                        if (obj.endPage >= obj.pageBlock) {
                            jspPagination += '<div class="page-link" onclick="searchWaterResources(' + (obj.startPage + obj.pageBlock) + ',false)">다음</div>';
                        }
                        jspPagination += '</div>';
                        paginationDiv.html(jspPagination); // JSP 페이지 네비게이션 코드를 추가
                    } else {
                        alert('값이 없습니다.');
                    }

                    facility_category = '';
                    org_area = '';
                    cate_name = '';
                    facility_code = '';

                }

            })

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
		<div class="searchbox">
            <table>
                <tr>
                    <td style="width:80px;text-align:right;font-weight:bold;">시설물 종류</td>
                    <td>
                        <select class="form-select" id="facility_code_List" onchange="getWrList()">
                            <c:forEach items="${wrctgList}" var="list">
                                <option name="facility_category"
                                        value="${list.facility_category}">${list.facility_category}</option>
                            </c:forEach>
                        </select>
                    </td>
                    <td style="width:70px;text-align:right;font-weight:bold;">행정구역</td>
                    <td>
                        <select class="form-select" id="org_area_List">
                            <c:forEach items="${orgList}" var="list">
                                <option name="facility_addr" value="${list.org_area}">${list.org_area_name}</option>
                            </c:forEach>
                        </select>
                    </td>
                    <td style="width:80px;text-align:right;font-weight:bold;">시설물 유형</td>
                    <td>
                        <input class="form-control" type="text" name="cate_name" id="cate_name">
                    </td>
                    <td style="width:80px;text-align:right;font-weight:bold;">시설물 코드</td>
                    <td>
                        <input class="form-control" type="text" name="facility_code" id="facility_code" placeholder="XXXXXXXXXXX">
                    </td>
                    <td style="padding-left:10px">
                        <input class="btn btn-dark btn-sm" type="button" id="search_button" value="검색" onclick="searchWaterResources(1,true)">
                    </td>
                </tr>
            </table>
        </div>
        
        <div style="margin:10px 0px;">
            <table class="listTable">
				<tr class="tableCate">
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
                    <tr class="tableRow">
                        <td>${list.rn}</td>
                        <td>${list.facility_category}</td>
                        <td>${list.cate_name}</td>
                        <td>${list.facility_code}</td>
                        <td>${list.first_area}</td>
                        <td>${list.second_area}</td>
                        <td>${list.org_name}</td>
                        <td><input type="button" value="입력" class="btn btn-outline-dark btn-sm" onclick="getcheckresult(${list.facility_code})">

                    </tr>
                </c:forEach>
                </tbody>
            </table>
            <div id="paging" class="pagination justify-content-center">
                <c:if test="${page.startPage > page.pageBlock}">
                    <div class="page-link" onclick="searchWaterResources(${page.startPage - page.pageBlock},false)">
                        &laquo;<!-- 이전 -->
                    </div>
                </c:if>
                <c:forEach var="i" begin="${page.startPage}" end="${page.endPage}">
                    <div class="page-item  <c:if test="${page.currentPage==i}"> active</c:if>" 
                    onclick="searchWaterResources(${i},false)">
                        <div class="page-link" style="cursor:pointer">${i}</div>
                    </div>
                </c:forEach>
                <c:if test="${page.endPage <= page.pageBlock}">
                    <div class="page-link" onclick="searchWaterResources(${page.startPage + page.pageBlock},false)">
                        &raquo;<!-- 다음 -->
                    </div>
                </c:if>
            </div>
	</div>
	
	<footer class="footer py-2">
	    <div id="footer" class="container">
	    </div>
	</footer>
	
</body>
</html>