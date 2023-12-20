<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/header.jsp" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>수자원 등록 </title>

    <link rel="stylesheet"  href="http://localhost:8090/geoserver/openlayers3/ol.css"   type="text/css">
    <link rel="stylesheet" href="http://localhost:8090/geoserver/openlayers3/ol.css" type="text/css">
<%--    <script>--%>
<%--        <link rel="stylesheet"  href="http://localhost:8090/geoserver/openlayers3/ol.css"   type="text/css">--%>
<%--        <link rel="stylesheet" href="http://localhost:8090/geoserver/openlayers3/ol.css" type="text/css">--%>
<%--    </script>--%>
    <script src="http://localhost:8090/geoserver/openlayers3/ol.js" type="text/javascript"></script>
    <script>
        $(function() {

            $.ajax({
                url			: '/main_header_2',
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
        function layerClick(currentPage, mapping){

            console.log("fd");
            var con = document.getElementById("right_layer");

            // var con = $('#right_layer');
            if(con.style.display=='none'){
                con.style.display = 'block';
            }else{
                con.style.display = 'none';
            }
            $.ajax({
                url: mapping,
                data: currentPage,
                success: function (data) {
                    console.log("succ");
                    console.log(data);
                    const objList = data.objList;
                    let list = $('#list');
                    let newdiv = $('<div></div>');

                    list.empty();
                    $.each(objList, function (key, values) {
                        const llll = $('<div></div>');
                        llll.click(function () {
                            getLatLong(values.observe_code);
                        });
                        llll.append(values.observe_post);
                        llll.append('<input type="hidden" value="' + values.latitude + '" id="lat' + values.observe_code + '">');
                        llll.append('<input type="hidden" value="' + values.longitude + '" id="long' + values.observe_code + '">');
                        list.append(llll);
                    });
                }

            })
        }
        function getLatLong(observe_code){
            console.log(observe_code);
            let latvalue = $('#lat' + observe_code).val();
            let longvalue = $('#long' + observe_code).val();

            // console.log(latvalue);
            // console.log(longvalue);
            alert("latvalue"+latvalue +"longvalue"+ longvalue);

        }

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
            /*background-color: dimgray;*/
            display: flex;
            position: absolute;
            width: 24%;
            height: 100%;
            z-index: 5;

        }
        #left_layer{
            background-color: #2c0b0e;
            width: 25%;
            height: 84%;
        }
        #right_layer{
            width: 75%;
            height: 84%;
            background-color: whitesmoke;
        }

        #obsrv_box{
            width: 100%;
            height: 10%;
            background-color: red;

        }
        #layer_box{
            width: 100%;
            height: 10%;
            background-color: yellow;
        }
        #bookmark_box{
            width: 100%;
            height: 10%;
            background-color: green;
        }
        #layer_top {
            display: flex;
            justify-content: center;

        }
        #layer_mid{
            display: flex;
            justify-content: space-around;
        }
        #layer_mid2{
            display: flex;
            justify-content: space-around;
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
        <div id="left_layer">
            <div id="obsrv_box" onclick="layerClick(1 ,'obsrvlist')">
                <input type="button" class="btn" value="관측소" style="width: 100%; height: 100%">

            </div>
            <div id="layer_box" onclick="layerClick(1,'obsrvlist')">
                <input type="button" class="btn" value="레이어" style="width: 100%; height: 100%">

            </div>
            <div id="bookmark_box" onclick="layerClick(1,'obsrvlist')">
                <input type="button" class="btn" value="북마크" style="width: 100%; height: 100%">

            </div>

        </div>
        <div id="right_layer" style="display: none">
            <div id="layer_top">
                <select>
                    <option>전체</option>
                </select>
                <input placeholder="관측소명을 입력하세요" >
                <input type="button" value="검색" id="search">
            </div>
            <div id="layer_mid">
                <div>관측소</div>
                <div id="total">total</div>


            </div>
            <div id="layer_mid2">
                <div>
                    관측소명
                </div>
                <div>
                    누적강우량
                </div>
            </div>
            <div id="list">

            </div>
            <div id="layer_bot">
                <div id="paging"></div>

            </div>

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



