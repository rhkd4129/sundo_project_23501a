<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/header.jsp" %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h2>Water Resources Table</h2>

	<form action="waterResourcesList">
    			
    	 시설물종류 	
    	<select name="facility_category"> <!-- 여기서 "selectBoxName"은 적절한 이름으로 변경하세요. -->
    		 <c:forEach var="code" items="${codeList}">
            	<option value="${code.cate_name}">${code.cate_name}</option>
             </c:forEach>
        </select>
        
    	관리기간
    	<select name="org_code"> <!-- 여기서 "selectBoxName"은 적절한 이름으로 변경하세요. -->
    		 <c:forEach var="organization" items="${organizationList}">
            	<option value="${organization.org_code}">${organization.org_name}</option>
             </c:forEach>
        </select>
        
        행정구역
        <select name="org_area"> <!-- 여기서 "selectBoxName"은 적절한 이름으로 변경하세요. -->
    		 <c:forEach var="organization" items="${organizationList}">
            	<option value="${organization.org_area}">${organization.org_area}</option>
             </c:forEach>
        </select>    
        
         시설물코드 <input type="text" name="facility_code"> <button type="submit">검색</button>
    
	</form>	

<table border="1">
    <thead>
        <tr>
        	 <th>시설물 종류</th>
        	 <th>시설물코드</th>
        	 <th>시설물유형</th>
        	 <th>행정구역</th>
        	 <th>관리기관</th>
            
     
        </tr>
    </thead>
    <tbody>
        <!-- waterResourcesList에서 데이터를 반복하여 출력 -->
        <c:forEach var="resource" items="${waterResourcesList}">
            <tr>
             	<td>${resource.facility_category}</td>
                <td>${resource.facility_code}</td>
               	 <td>${resource.facility_type}</td>
             	 <td>${resource.org_area}</td>
             	<td>${resource.org_name}</td>                                
            </tr>
        </c:forEach>
    </tbody>
</table>
	
	
	
</body>
</html>