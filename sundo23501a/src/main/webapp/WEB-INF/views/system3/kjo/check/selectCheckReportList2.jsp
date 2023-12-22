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
        #contents{
            margin: 0 3% 0 0;
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
        function pageGo(doc_no){
            window.location.href = "/getcheckresult?doc_no=" + doc_no;

        }

    </script>
</head>
<body>

    <header id="header"></header>




    <div class="container" style="margin-top: 3%">
        <div class="row">
            <div id="center">
                <div style="display: flex">
                    <div id="contents">시설물 명칭:</div>
                    <div id="contents">${cate_name}</div>

                    <div id="contents">시설물 코드:</div>
                    <div id="contents">${facility_code}</div>
                </div>
                <table>
                    <tr>
                        <th>연번</th>
                        <th>점검일자</th>
                        <th>점검자</th>
                        <th>점검결과</th>
                        <th>점검일지</th>
                        <th>비고</th>
                    </tr>
                        <c:forEach items="${CRList}" var="list">
                        <tr>
                            <td>${list.rn}</td>
                            <td>${list.modify_datetime}</td>
                            <td>${list.user_name}</td>
                            <td>${list.check_result}</td>
                            <td><input type="button" class="btn btn-light" onclick="pageGo(${list.doc_no})" value="열기"></td>
                            <td>${list.spec_memo}</td>
                        </tr>
                        </c:forEach>
                </table>


                <div id="paging" class="pagination justify-content-center">
                    <c:if test="${page.startPage > page.pageBlock}">
                        <div class="page-link" onclick="pageGo(${facility_code},${page.startPage - page.pageBlock})">
                            이전
                        </div>
                    </c:if>
                    <c:forEach var="i" begin="${page.startPage}" end="${page.endPage}">
                        <div class="page-item" onclick="pageGo(${facility_code},${i})">
                            <div class="page-link" style="cursor:pointer">${i}</div>
                        </div>
                    </c:forEach>
                    <c:if test="${page.endPage >= page.pageBlock}">
                        <div class="page-link" onclick="pageGo(${facility_code},${page.startPage + page.pageBlock})">
                            다음
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
