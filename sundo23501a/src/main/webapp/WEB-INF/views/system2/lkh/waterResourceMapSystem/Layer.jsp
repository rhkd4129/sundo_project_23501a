<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/header.jsp" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>수자원 등록 </title>
    <script>
        <link rel="stylesheet"  href="http://localhost:8090/geoserver/openlayers3/ol.css"   type="text/css">
            <link rel="stylesheet" href="http://localhost:8090/geoserver/openlayers3/ol.css" type="text/css">
    </script>
    <script src="http://localhost:8090/geoserver/openlayers3/ol.js" type="text/javascript"></script>
    <script>
        $(function() {

            $.ajax({
                url         : '/main_header_2',
                dataType    : 'html',
                success      : function(data) {
                    $('#header').html(data);
                }
            });

            $.ajax({
                url         : '/main_footer',
                dataType    : 'html',
                success      : function(data) {
                    $('#footer').html(data);
                }
            });
        });

    </script>
    <style>

        header {
            height: 55px;
        }

        body {
            font-family: Verdana, Geneva, Arial, Helvetica, sans-serif;
            font-size: small;
        }

        iframe {
            width: 100%;
            height: 250px;
            border: none;
        }

        #map {
            /*clear: both;*/
            /*position: relative;*/
            /*width: 1003px;*/
            /*height: 600px;*/
            border: 1px solid black;
        }

        #wrapper {
            width: 1003px;
        }


        h1 {
            color: blue;
        }

        hr {
            border: solid 1px yellow;
        }

        .custom-mouse-position {
            color: blue;
            font-family: Arial;
            font-size: 10pt;
        }
        #layer{
            position: absolute;
            width: 30%;
            height: 100%;

        }
    </style>
</head>
<body style="
    height: 84%">
<header id="header"></header>

<div style="border: solid 1px black">
    <button id="activateLayerButton">서울 한강 </button>
    <button id="sumun">경기 한강 </button>
    <button id="sumun2">수문위치 </button>
    <button id="sumun3"> 관측소 위치</button>
</div>

<div style="border: solid 1px black">

    <button id="dam">댐 </button>
    <button id="waterway_pos">관개수로 </button>
    <button id="pump"> 펌프장</button>
</div>
<div id="map">
    <div id="layer">
        <div>

        </div>


    </div>

</div>



<footer class="footer py-2">
    <div id="footer" class="container">
    </div>
</footer>

<script type="text/javascript">
    var map = new ol.Map({
        target: 'map',
        layers: [
            new ol.layer.Tile({
                source: new ol.source.OSM()
            }),
            new ol.layer.Image({
                source: new ol.source.ImageWMS({
                    url: 'http://localhost:8090/geoserver/wms',
                    params: {
                        'LAYERS': 'lee:SEOUL_HANGANG_HACUN',
                        'TILED': true
                    },
                    serverType: 'geoserver'
                }),
                visible: false // 초기에는 레이어를 숨겨둠
            }),

            new ol.layer.Image({
                source: new ol.source.ImageWMS({
                    url: 'http://localhost:8090/geoserver/wms',
                    params: {
                        'LAYERS':'lee:GYEONGGI_HANGANG_HACUN',
                        'TILED': true
                    },
                    serverType: 'geoserver'
                }),
                visible: false // 초기에는 레이어를 숨겨둠
            }),
            new ol.layer.Image({
                source: new ol.source.ImageWMS({
                    url: 'http://localhost:8090/geoserver/wms',
                    params: {
                        'LAYERS':'lee:sumun_pos',
                        'TILED': true
                    },
                    serverType: 'geoserver'
                }),
                visible: false // 초기에는 레이어를 숨겨둠
            }),
            new ol.layer.Image({
                source: new ol.source.ImageWMS({
                    url: 'http://localhost:8090/geoserver/wms',
                    params: {
                        'LAYERS':'lee:observation_pos',
                        'TILED': true
                    },
                    serverType: 'geoserver'
                }),
                visible: false // 초기에는 레이어를 숨겨둠
            }),
            new ol.layer.Image({
                source: new ol.source.ImageWMS({
                    url: 'http://localhost:8090/geoserver/wms',
                    params: {
                        'LAYERS':'lee:dam_pos',
                        'TILED': true
                    },
                    serverType: 'geoserver'
                }),
                visible: false // 초기에는 레이어를 숨겨둠
            }),
            new ol.layer.Image({
                source: new ol.source.ImageWMS({
                    url: 'http://localhost:8090/geoserver/wms',
                    params: {
                        'LAYERS':'lee:waterway_pos',
                        'TILED': true
                    },
                    serverType: 'geoserver'
                }),
                visible: false // 초기에는 레이어를 숨겨둠
            })
        ],
        view: new ol.View({
            center: ol.proj.fromLonLat([126.9780, 37.5665]), // 서울 시청 좌표
            zoom: 10
        })
    });

    $('#activateLayerButton').on('click', function () {
        toggleLayerVisibility(1); // 두 번째 레이어의 가시성 토글
    });

    $('#sumun').on('click', function () {
        toggleLayerVisibility(2); // 세 번째 레이어의 가시성 토글
    });

    $('#sumun2').on('click', function () {
        toggleLayerVisibility(3); // 세 번째 레이어의 가시성 토글
    });
    $('#sumun3').on('click', function () {
        toggleLayerVisibility(4); // 세 번째 레이어의 가시성 토글
    });
    $('#dam').on('click', function () {
        toggleLayerVisibility(5); // 세 번째 레이어의 가시성 토글
    });
    $('#waterway_pos').on('click', function () {
        toggleLayerVisibility(6); // 세 번째 레이어의 가시성 토글
    });

    function toggleLayerVisibility(layerIndex) {
        var layer = map.getLayers().getArray()[layerIndex];
        layer.setVisible(!layer.getVisible());
    }
</script>
</body>
</html>


