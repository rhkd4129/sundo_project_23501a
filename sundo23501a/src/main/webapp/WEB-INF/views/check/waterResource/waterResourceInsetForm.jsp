<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/header.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>수자원 등록 </title>
<script>
    // 셀렉트 박스 값이 변경될 때 이벤트 핸들러 등록
    $(document).ready(function () {
        $('#facility_category').change(function () {
            var divison = $(this).val();
            var di;
           if("댐" === divison){
        	   di="a";
           }else if("저수지"=== divison){
        	   di="b";
           }else if("펌프장"=== divison){
        	   di="c";
           }else if("관개수로"=== divison){
        	   di="d";
           }
           
           
            
       
            $.ajax({
                url			: '/facilityCategoryType',
                dataType 	: 'json',
                data		: {"divison":di},
                success		: function(codeList) {
              	
                var selectBox = $('#facility_type');

                   
                 selectBox.empty();
                  $.each(codeList, function (index, item) {
                	  selectBox.append('<option value="' + item.cate_code + '">' + item.cate_name + '</option>'); 
                	  
                  });
                }
            });

        });
    });
</script>
</head>
<body>

	<form action ="waterResourcesInsert" method="post">
		<p>
			시설물 코드 <input type="text" name="facility_code">
			  
	    	관리기간
	    	<select name="org_code"> <!-- 여기서 "selectBoxName"은 적절한 이름으로 변경하세요. -->
	    		 <c:forEach var="organization" items="${organization_category}">
	            	<option value="${organization.org_code}">${organization.org_name}</option>
	             </c:forEach>
	        </select>
	        
	        행정구역
	         <select name="org_area"> <!-- 여기서 "selectBoxName"은 적절한 이름으로 변경하세요. -->
    		 	<c:forEach var="org_area" items="${orgArea_category}">
            		<option value="${org_area.org_area}">${org_area.org_area_name}</option>
             </c:forEach>
        	</select>   
	        
		</p>
		
		
		<p>	
			 시설물종류 	
		    	<select id="facility_category" name="facility_category"> <!-- 여기서 "selectBoxName"은 적절한 이름으로 변경하세요. -->
		    		 <c:forEach var="resource" items="${findfacility_category}">
		            	<option value="${resource.facility_category}">${resource.facility_category}</option>
		             </c:forEach>
		        </select>
        
			시설물유형  
				<select id="facility_type" name="facility_type"> 
		    		<c:forEach var="code" items="${codeList}">
		            	<option value="${code.cate_code}">${code.cate_name}</option>
		             </c:forEach>
		        </select>`
		</p>
		
		
		<p>
			위도		 <input type="text" name="latitude">
			경도		 <input type="text" name="longitude">
			주소		 <input type="text" name="facility_addr">	
		</p>
		
		
		
		<button type="submit">작성</button>
	</form>
	
	
</body>
</html>