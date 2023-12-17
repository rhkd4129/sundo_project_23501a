<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Insert title here</title>
    <script type="text/javascript"
            src="http://code.jquery.com/jquery-latest.min.js"></script>
    <!-- COMMON END -->


    <script type="text/javascript">


    </script>
</head>
<body>
<form action="" id="">
    <table>
        <tr>
            <td>시설물 종류:</td>
            <td>
                <select class="form-select" id="facility_code_List" onchange="getWrList()">
                    <c:forEach items="${wrctgList}" var="list">
                        <option name="facility_category"
                                value="${list.facility_category}">${list.facility_category}</option>
                    </c:forEach>
                    <option name="facility_category"
                            value="전체" selected>전체</option>
                </select></td>
            <td>행정구역:</td>
            <td>
                <select class="form-select" id="org_area_List">
                    <c:forEach items="${orgList}" var="list">
                        <option name="org_area" value="${list.org_area}">${list.org_area_name}</option>
                    </c:forEach>
                    <option name="org_area"
                            value="전체" selected>전체</option>
                </select>
            </td>
            <td>관리기관:</td>

            <td>
                <select class="form-select" id="org_name_List">
                    <c:forEach items="${organizationList}" var="list">
                        <option name="org_name" value="${list.org_name}">${list.org_name}</option>
                    </c:forEach>
                    <option name="org_name"
                            value="전체" selected>전체</option>
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

            <td><input type="button" value="조회"></td>
            <td><input type="checkbox">결과 내 재검색</td>

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

    <tr>
    </tr>
</table>

</body>
</html>