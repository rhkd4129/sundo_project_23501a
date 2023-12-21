@ -1,367 +1,391 @@
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/header.jsp" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>실시간 수문정보 관리시스템  </title>
    <link rel="stylesheet" type="text/css" href="/css/map.css">

    <link rel="stylesheet"  href="http://localhost:8090/geoserver/openlayers3/ol.css"   type="text/css">
    <link rel="stylesheet"  href="http://localhost:8090/geoserver/openlayers3/ol.css"   type="text/css">
    <link rel="stylesheet" href="http://localhost:8090/geoserver/openlayers3/ol.css" type="text/css">
    <script src="http://localhost:8090/geoserver/openlayers3/ol.js" type="text/javascript"></script>
    <script>
        let view;
        let a;
        let init_pos;
        let map;
        let datatype ="";
        let getdatatype ="";
        let standdatatype ="";
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
            a = 'a';
            init_pos = ol.proj.fromLonLat([126.9780, 37.5665])
            view = new ol.View({
                center:init_pos,
                zoom:10
            })


            map = new ol.Map({
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
                                'LAYERS':'lee:SUMUN_POS',
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
                                'LAYERS':'lee:OBSERVATION_POS',
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
                    })

                ],
                view: view,
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


        });
        function layerClick(currentPage, mapping){
            console.log(currentPage);
            // console.log(mapping);
                const ov = {"currentPage": currentPage}


                $.ajax({
                    url: mapping,
                    data: ov,
                    success: function (data) {
                        getdatatype = data.type;
                        console.log("server get type: " + getdatatype);
                        /*관측소 요청*/
                        if (getdatatype == "Observation") {
                            console.log(data.objList);
                            showobsrv(getdatatype, data);   //  화면에 뿌리는 함수

                        }
                        /*관측소 요청*/

                        /*레이어요청*/
                        else if (getdatatype == "Layer") {
                            console.log("Layer");
                            showlayer(getdatatype, data);   //  화면에 뿌리는 함수
                        }
                        /*레이어요청*/
                        /*북마크요청*/
                        else if (getdatatype == "BookMark") {
                            console.log("BookMark");
                            showBookMark(getdatatype, data);   //  화면에 뿌리는 함수
                        }
                        /*북마크요청*/


                    }
                })


        }

        let OPEN = false;
        let CON = false;

        //  좌측 레이어 클릭 시 팝업  ON / OFF
        function rightlayerShow(getdatatype) {
            var rightLayer = document.getElementById('right_layer');
            if (!rightLayer) {
                console.error("Element 'right_layer' not found.");
                return;
            }

            if(datatype != getdatatype || getdatatype == standdatatype){
                console.log("elel");
                console.log(standdatatype);
                console.log(datatype);

                datatype = getdatatype;
                rightLayer.style.display = 'block';
                $('#layer_top').empty();
                $('#layer_mid').empty();
                $('#layer_mid2').empty();
                $('#layer_mid3').empty();
                $('#layer_bot').empty();
                $('#list').empty();

            }
            else if (datatype == getdatatype) {
                datatype = getdatatype;
                rightLayer.style.display = 'none';
                standdatatype = getdatatype;
                console.log("standdatatype");
                console.log(standdatatype);
                console.log(datatype);
            }
        }

        function showBookMark(getdatatype, data) {
            rightlayerShow(getdatatype);
            let list = $('#list');

            const newcon = $('<div></div>');
            const newp = $('<p></p>');
            newp.append(data.type);
            newcon.append(newp);
            list.append(newcon);


        }

        function showlayer(getdatatype, data) {
            rightlayerShow(getdatatype);
            // 새로운 div 요소 생성
            var layerMid = $('#layer_mid3');






            layerMid.append('<div id="list_level_1">하천도</div>');
            layerMid.append('<div id="list_level_2">서울 한강</div>');
            layerMid.append('<div id="list_level_2">경기도 한강</div>');
            layerMid.append('<div id="list_level_2">서울 한강 수계</div>');
            layerMid.append('<div id="list_level_2">경기 한강 수계</div>');

            layerMid.append('<div id="list_level_1">수문</div>');

            layerMid.append('<div id="list_level_1">관측소</div>');
            layerMid.append('<div id="list_level_1">수자원 시설물</div>');

            // 하위 항목에 대한 처리
            layerMid.append('<div id="list_level_2">댐</div>');
            layerMid.append('<div id="list_level_2">저수지</div>');
            layerMid.append('<div id="list_level_2">펌프장</div>');
            layerMid.append('<div id="list_level_2">취소문</div>');
            layerMid.append('<div id="list_level_2">배소문</div>');

            // 하위 항목을 수자원 시설물 아래에 추가



        }



        function showobsrv(getdatatype, data) {
            console.log(data);
            rightlayerShow(getdatatype);

            var layerMid = $('#layer_mid');

            layerMid.append('<div>관측소</div>');
            layerMid.append('<input type="button" class="btn btn-dark" id = "total" value="'+ data.obj.total+' ">');

            var layerMid = $('#layer_mid2');
            layerMid.append('<div>관측소명</div>');

            var layerTop = document.getElementById('layer_top');
            if (!layerTop) {
                console.error("Element 'layer_top' not found.");
                return;
            }
            layerTop.innerHTML = '';

            var selectElement = document.createElement('select');
            var optionElement = document.createElement('option');

            optionElement.text = '전체';
            selectElement.classList.add('form-select');
            selectElement.style.width = 'auto';
            selectElement.appendChild(optionElement);
            layerTop.appendChild(selectElement);

            var inputElement = document.createElement('input');
            inputElement.setAttribute('placeholder', '관측소명을 입력하세요');
            inputElement.classList.add('form-control');
            layerTop.appendChild(inputElement);

            var searchButton = document.createElement('input');
            searchButton.setAttribute('type', 'button');
            searchButton.setAttribute('value', '검색');
            searchButton.setAttribute('id', 'search');
            searchButton.classList.add('btn', 'btn-dark');

            layerTop.appendChild(searchButton);

            const objList = data.objList;

            let list = $('#list');

            list.empty();
            $.each(objList, function (key, values) {
                const newcon = $('<div></div>');
                newcon.click(function () {
                    getLatLong(values.observe_code);
                });
                newcon.append(values.observe_post);
                newcon.append('<input type="hidden" value="' + values.latitude + '" id="lat' + values.observe_code + '">');
                newcon.append('<input type="hidden" value="' + values.longitude + '" id="long' + values.observe_code + '">');
                list.append(newcon);
            });
            var layerBot = document.getElementById('layer_bot');
            var paginationDiv = document.createElement('div');
            paginationDiv.setAttribute('id', 'paging');
            layerBot.appendChild(paginationDiv);

            var jspPagination = '';
            let obj = data.obj;
            var newPath = 'obsrvlist'; // 적절한 경로로 변경

            if (obj.startPage > obj.pageBlock) {
                jspPagination += '<div id="page-link" onclick="layerClick(' + (obj.startPage - obj.pageBlock) + ', \'' + newPath + '\')">이전</div>';
            }

            for (var i = obj.startPage; i <= obj.endPage; i++) {
                jspPagination += '<div id="page-item" onclick="layerClick(' + i + ', \'' + newPath + '\')"><div class="page-link">' + i + '</div></div>';
            }

            if (obj.endPage >= obj.pageBlock) {
                jspPagination += '<div id="page-link" onclick="layerClick(' + (obj.startPage + obj.pageBlock) + ', \'' + newPath + '\')">다음</div>';
            }
            jspPagination += '</div>';


            paginationDiv.innerHTML = jspPagination; // 페이징 코드 추가

        }


        function getLatLong(observe_code){  //  좌표 반환
            console.log(observe_code);
            let latvalue = $('#lat' + observe_code).val();
            let longvalue = $('#long' + observe_code).val();
            // console.log(latvalue);
            // console.log(longvalue);
            alert("latvalue"+latvalue +"longvalue"+ longvalue);
            const coordinates = [parseFloat(longvalue), parseFloat(latvalue)];  // 좌표를 배열로 변환
            moveToCoordinates(coordinates,10)
        }

        function moveToCoordinates(coordinates, zoom) {     //  화면이동
            console.log("corr");
            console.log(coordinates);
            // let view = new ol.View();
            console.log(view);
            view.animate({
                center: ol.proj.fromLonLat(coordinates),
                duration: 2000,  // 애니메이션 지속 시간 (2초)
                zoom: zoom,
            });
        }
    </script>
</head>
<body style="height: 84%">
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
            <div id="layer_box" onclick="layerClick(1,'layerlist')">
                <input type="button" class="btn" value="레이어" style="width: 100%; height: 100%">

            </div>
            <div id="bookmark_box" onclick="layerClick(1,'bookmarklist')">
                <input type="button" class="btn" value="북마크" style="width: 100%; height: 100%">

            </div>

        </div>
        <div id="right_layer" style="display: none">
            <div id="layer_top">

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
            <div id="layer_mid3">
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
                <div id="paging" class="pagination"></div>

            </div>

        </div>

    </div>
</div>



<footer class="footer py-2">
    <div id="footer" class="container">
    </div>
</footer>

<script type="text/javascript">


</script>
</body>
</html>

