<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/header.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
<script>
	$(function() {
		var ctx = document.getElementById('errChart').getContext('2d');
		var chart = new Chart(ctx, {
		    type: 'bar',
		    data: {
		        labels: ['댐', '관개수로', '저수지', '펌프장'],
		        datasets: [{
		            label: '매출',
		            data: [1000, 2000, 1500, 3000],
		            backgroundColor: 'rgba(75, 192, 192, 0.2)',
		            borderColor: 'rgba(75, 192, 192, 1)',
		            borderWidth: 1
		        }]
		    },
		    options: {
		        responsive: true,
		        scales: {
		            y: {
		                beginAtZero: true
		            }
		        }
		    }
		    
		    
		});
		
	})
	
</script>
</head>
<body>
	<header id="header"></header>

    <div class="container">
        <div class="row">
            <div id="center">
                <div class="flex-container">
                    <div class="chart">
                        <canvas id="errChart"></canvas>
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