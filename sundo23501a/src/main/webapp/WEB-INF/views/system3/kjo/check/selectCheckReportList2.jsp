<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ include file="/WEB-INF/views/header.jsp" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>수자원 시설물 관리시스템 - 점검이력조회</title>
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

    #contents1{
        font-size: 14pt;
        margin: 0 1% 0 0;
    }
    #contents2{
        font-size: 14pt;
        margin: 0 3% 0 0;
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
        function pageGo(doc_no){
            window.location.href = "/getcheckresult?doc_no=" + doc_no;

        }

        function pageing(facility_code, currentPage) {
            window.location.href = "/selectcheckReportlist2?facility_code=" + facility_code+"&currentPage="+currentPage;
        }
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
		
		<div style="margin:10px 0px;">
	        <div style="display: flex">
	            <div id="contents1">시설물 명칭:</div>
	            <div id="contents2">${cate_name}</div>
	
	            <div id="contents1">시설물 코드:</div>
	            <div id="contents2">${facility_code}</div>
	        </div>
  		</div>
  		<div style="margin:10px 0px;">
            <table class="listTable">
				<tr class="tableCate">
                    <th style="font-size:10pt;">연번</th>
                    <th style="font-size:10pt;">점검일자</th>
                    <th style="font-size:10pt;">점검자</th>
                    <th style="font-size:10pt;">점검결과</th>
                    <th style="font-size:10pt;">점검일지</th>
                    <th style="font-size:10pt;">비고</th>
                </tr>
                <c:forEach items="${CRList}" var="list">
                    <tr class="tableRow" style="vertical-align: middle">
                        <td>${list.rn}</td>
                        <td>${list.modify_datetime}</td>
                        <td>${list.user_name}</td>
                        <td>${list.check_result}</td>
                        <td><input type="button" class="btn btn-outline-dark btn-sm" onclick="pageGo(${list.doc_no})" value="열기"></td>
                        <td>${list.spec_memo}</td>
                    </tr>
                </c:forEach>
            </table>


            <div id="paging" class="pagination justify-content-center">
                <c:if test="${page.startPage > page.pageBlock}">
                    <div class="page-link" onclick="pageing(${facility_code},${page.startPage - page.pageBlock})">
                        &laquo;<!-- 이전 -->
                    </div>
                </c:if>
                <c:forEach var="i" begin="${page.startPage}" end="${page.endPage}">
                    <div class="page-item  <c:if test="${page.currentPage==i}"> active</c:if>" 
                    onclick="pageing(${facility_code},${i})">
                        <div class="page-link" style="cursor:pointer">${i}</div>
                    </div>
                </c:forEach>
                <c:if test="${page.endPage >= page.pageBlock}">
                    <div class="page-link" onclick="pageing(${facility_code},${page.startPage + page.pageBlock})">
                        &raquo;<!-- 다음 -->
                    </div>
                </c:if>
                <div style="position: absolute; right: 15%;">
                    <input onclick="location.href='/selectCheckReportList'" class="btn btn-dark" type="button" value="이전화면">
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