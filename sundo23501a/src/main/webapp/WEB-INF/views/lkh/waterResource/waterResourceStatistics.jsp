<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/header.jsp" %>

<!DOCTYPE html>
<html>
<head>

    <meta charset="UTF-8">
    <title>수자원 목록</title>
    <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>

    <script>
        $(function() {
            $.ajax({
                url: "/doughnut_chart",
                //data:data
                dataType: 'json',
                success: function (response) {
                    console.log(response);
                    const doughnutCtx = document.getElementById('doughnut_1').getContext('2d');
                    const doughnut_data = {
                        labels: ['댐', '관개수로', '저수지','펌프'],
                        datasets: [{
                            data: response,
                            backgroundColor: [
                                'rgba(255, 99, 132, 0.5)', // 빨간색
                                'rgba(54, 162, 235, 0.5)', // 파란색
                                'rgba(176, 136, 255, 0.5)', // 보라색
                                'rgba(255, 99, 132, 0.5)'  // 빨간색 배경

                            ],
                            borderColor: [
                                'rgb(255, 99, 132)', // 빨간색
                                'rgb(54, 162, 235)', // 파란색
                                'rgb(176, 136, 255)', // 보라색
                                'rgb(255, 99, 132)'  // 빨간색 테두리
                            ],
                            borderWidth: 1
                        }]
                    };

                    createDrawChart(doughnutCtx, 'doughnut', doughnut_data, doughnut_options);
                }
        });

        // 옵션 정의
        const  doughnut_options = {
            plugins: {
                title: {
                    display: true,
                    text: '마강 수산자원시설물'
                },
                legend: {// display: false // 범례 삭제
                },
                tooltip: {// enabled: false // 툴팁 비활성화
                },
                datalabels: {
                    display: true, // 데이터 레이블 표시
                    color: 'white', // 데이터 레이블의 텍스트 색상
                    font: {
                        weight: 'bold'
                    },
                    formatter: (value, context) => {
                        return context.chart.data.labels[context.dataIndex] + ': ' + value;
                    },
                    // anchor: 'end', // 데이터 레이블 위치 설정
                    // align: 'end' // 데이터 레이블 위치 설정
                }
            }
        };


        function createDrawChart(ctx, chart_type ,data, options) {
            return new Chart(ctx, {
                type: chart_type,
                data: data,
                options: options
            });
        }
        });
    </script>

    <style>
        /* Flex container 설정 */
        .flex-container {
            display: flex;
            flex-wrap: wrap;
        }

        /* Flex item 설정 */
        .flex-item {
            flex: 1; /* 비율 조절 (1:2) */
            margin: 10px;
        }
    </style>
</head>
<body>


<%--

    <div class="doughnut_1" style="width: 1500px; height: 1500px";>
        <canvas id="doughnut_1"></canvas>
    </div>

--%>
<div class="container-fluid">
    <h2><a href="/waterResourcesList">정보</a> | <a href="/waterResourceStatistics">통계</a></h2>
    <div class="flex-container">
        <!-- 첫 번째 그래프 영역 (비율 1) -->
        <div class="doughnut_1">
            <canvas id="doughnut_1"></canvas>
        </div>

        <!-- 두 번째 그래프 영역 (비율 2) -->
        <div class="flex-item">
            <canvas id="chart2"></canvas>
        </div>
    </div>
</div>




</body>
</html>