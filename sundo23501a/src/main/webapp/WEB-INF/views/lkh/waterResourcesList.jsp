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
    		 <c:forEach var="resource" items="${findfacility_category}">
            	<option value="${resource.facility_category}">${resource.facility_category}</option>
             </c:forEach>
        </select>
        
    	관리기간
    	<select name="org_code"> <!-- 여기서 "selectBoxName"은 적절한 이름으로 변경하세요. -->
    		 <c:forEach var="organization" items="${organization_category}">
            	<option value="${organization.org_code}">${organization.org_name}</option>
             </c:forEach>
        </select>
        
        행정구역
        <select name="org_area"> <!-- 여기서 "selectBoxName"은 적절한 이름으로 변경하세요. -->
    		 <c:forEach var="organization" items="${organization_category}">
            	<option value="${organization.org_area}">${organization.org_area}</option>
             </c:forEach>
        </select>    
        
         시설물코드 <input type="text" name="facility_code"> <button type="submit">검색</button>
    
	</form>	

<table border="1">
    <thead>
        <tr>
        	 <th>연번</th>	
        	 <th>시설물 종류</th>
        	 <th>시설물코드</th>
        	 
        	 <th>시설물유형</th>
        	 
        	 <th>행정구역</th>
        	 <th>관리기관</th>
            
     
        </tr>
    </thead>
    <tbody>
        <!-- waterResourcesList에서 데이터를 반복하여 출력 -->
        <c:forEach var="waterResources" items="${waterResourcesList}">
            <tr>
            	<td>${waterResources.rn}</td>
             	<td>${waterResources.facility_category}</td>
                <td>${waterResources.facility_code}</td>
               	<td>${waterResources.cate_name}</td>
             	<td>${waterResources.org_area}</td>   
             	<td>${waterResources.org_name}</td>                                
            </tr>
        </c:forEach>
    </tbody>
    

    
</table>
	
	    <div id="paging">
	    <c:if test="${page.startPage > page.pageBlock}">
	        <div onclick="location.href='/waterResourcesList?currentPage=${page.startPage - page.pageBlock}'">
	            <p>[이전]</p>
	        </div>
	    </c:if>
	    <c:forEach var="i" begin="${page.startPage}" end="${page.endPage}">
	        <div class="page-item" onclick="location.href='/waterResourcesList?currentPage=${i}'">
	            <div class="page-link" style="cursor:pointer">${i}</div>
	        </div>
	    </c:forEach>
	    <c:if test="${page.endPage <= page.pageBlock}">
	        <div onclick="location.href='/waterResourcesList?currentPage=${page.startPage + page.pageBlock}'">
	            <p>[다음]</p>
	        </div>
	    </c:if>
	</div>
	
</body>
</html>