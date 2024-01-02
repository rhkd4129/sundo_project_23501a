<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/header.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>한강 수자원관리 종합 플랫폼 - 기관소개</title>

<!--CSS START -->
<!-- CSS END -->

<!-- JS START -->
<!-- JS END -->

<script type="text/javascript">
	$(function() {
		
		$.ajax({
			url			: '/main_header',
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
	
		$('#idNewWinFlag').click(function(){
			var checked = $(this).is(':checked');
			if(checked) {
				$(this).val("Y");
				setCookie("NewWinFlag", "Y", 1, "/");
			}else {
				$(this).val("N");
				setCookie("NewWinFlag", "N", 1, "/");
			}
		});

		var NEW_WIN_FLAG = getCookie("NewWinFlag");
		if(NEW_WIN_FLAG == 'N') {
			$('#idNewWinFlag').prop('checked', false);
		}else{
			$('#idNewWinFlag').prop('checked', true);
		}
	});	
	
	function popup(url, w, h) {
		var pwidth = 800;
		var pheight = 800;
		if(w != null) pwidth = w;
		if(h != null) pheight = h;

		var left = Math.ceil((window.screen.width - pwidth)/2);
		var top  = Math.ceil((window.screen.height - pheight)/2);

		var options = "location=no, directories=no, resizable=yes, status=no, toolbar=no, menubar=no, scrollbars=auto"
		            + ", height="+pheight+", width="+pwidth+", left="+left+", top="+top;

		window.open(url, "_blank", options);
	}
	
	function callAction(action, mapping_name) {
		var checked = false;
		if($('#idNewWinFlag')) { //목록창에만 새 창 열기 체크박스 존재
			checked = $("#idNewWinFlag").is(':checked');
		}
		if(checked || opener) { //목록에 새 창 열기 체크되어 있거나, 이미 문서가 열린 경우 opener가 있는 경우(새 창 열기로 연 경우)
			popup(mapping_name);
		}else{	//프레임에서 열기 이거나, opener가 없는 경우(=프레임에서 문서가 열린 경우)
			$('#idFrameSet').addClass("frame_set");
			$('#idFrameList').addClass("frame_left");
			$('#idFrameDoc').addClass("frame_right");
			$.ajax({
				url			: mapping_name,
				dataType 	: 'html',
				success		: function(data) {
					$('#idFrameDoc').html(data);
				}
			});
		}
	}

	//문서 버튼 >> 닫기
	function closeDoc() {
		if(opener) {
			if(opener.location.href.indexOf("_list") > 0) { //목록에서 뜬 경우만 새로고침
				opener.location.reload();
			}
			window.close();
		}else{
			location.reload();
		}
	}
	
</script>
<style type="text/css">
header {
    height: 55px;
}
hr{
	margin:0px;
}
.table > thead {
	border-top:2px solid #888888;
}
.searchbox {
	border:2px solid #dee2e6;
	border-radius: 10px;
	padding: 10px;
}
.searchbox th, td {
	padding: 2px;
}
.tr-link {
	cursor:pointer;
}
</style>
</head>
<body>
<!-- HEADER -->
<header id="header"></header>
<!-- CONTENT -->
<div class="container">
	<div class="row">	
		<!-- 본문 -->
		<div id="center">
			<!------------------------------ //개발자 소스 입력 START ------------------------------->
			<br>
			<div id="idFrameSet">
				<div id="idFrameList">
					<div class="container-fluid">
						<table width="100%" style="height:45px">
							<tr>
								<td style="vertical-align:top"><span class="apptitle">기관 소개</span></td>
								<td align="right">									
								</td>
							</tr>
						</table>
						<table class="table table-hover">
							<thead class="table-light">
								<tr>
									<th>한강홍수통제소</th>
								</tr>
							</thead>
							<tbody>
								<tr>
									<td>
<pre>
물이란 우리가 살아가는데 제일 중요한 요소 중 하나로서 모든 생명의 근원으로 인간과의 뗄 수 없는 관계에 있습니다.
예부터 치산치수는 치국의 근본으로 삼아 왔으며 이는 오늘날에도 민생안전의 기본이 되고 있습니다. 
우리나라는 최근 10여년 동안 엘리뇨 현상, 지구 온난화와 같은 기후변화의 영향으로 매년 여름철에 집중호우와 강한 태풍이 발생하여 홍수피해가 대형화 추세에 있고, 
겨울과 봄철에는 가뭄이 빈발하고 있는 실정입니다. 

이에 저희 한강홍수통제소는 여름철의 홍수를 과학적으로 잘 관리하고 생활용수, 공업용수, 농업용수의 효율적인 배분을 통해서 홍수와 가뭄피해를 최대한 줄여 나가고자 합니다. 
저희 한강홍수통제소는 1974년 개소 이래 한강 유역뿐만 아니라 임진강, 안성천 유역까지 홍수예보를 하고 있고 유관기관(행정안전부, 기상청, 수자원공사, 서울시 등)에 실시간 정보를 제공하고 있습니다.
</pre>
									</td>
								</tr>
							</tbody>
						</table>
						<table class="table table-hover">
							<thead class="table-light">
								<tr>
									<th>수자원 관리 종합플랫폼</th>
								</tr>
							</thead>
							<tbody>
								<tr>
									<td>
<pre>
한국수자원공사의 주요 사업은 통합물관리사업(유역통합 물관리센터, 보 · 하천 · 하구둑 · 댐 운영, 수자원 정보 조사·관리, 시설물 안전관리), 물공급사업(광역상수도, 지방상수도, 맞춤형 산업용수, 하수도), 
수변사업(수변지역에 신도시 조성, 첨단산업단지 조성), 에너지사업(수력발전, 조력발전, 수상태양광), 해외사업(댐 개발, 수력 발전, 상수도공급 및 수도시설 운영효율화 사업) 등이다. 
해외사업 주요 실적으로, 파키스탄 파트린드(Patrind) 수력발전 BOT 사업, 적도기니의 상수도운영관리사업, 필리핀 앙갓(Angat) 수력발전 사업, 중국 연길시 유수율제고 컨설팅사업 등이 있다.

한국수자원공사가 관리중인 댐은 소양강, 충주, 횡성, 안동, 임하, 합천, 남강, 밀양, 군위, 김천부항, 보현산, 용담, 대청, 섬진강, 주암, 부안, 보령, 장흥 등 
18개의 다목적 댐과 평화, 군남 등 2개의 홍수조절댐 그리고 낙동강하구둑 등이다. 위성을 이용해 수계별로 물 관리 시스템을 구축했고 이를 통해 연간 약 100억 톤의 물을 공급한다. 홍수와 가뭄 대비도 함께 하고 있다.

상수도 건설 및 관리 분야에서는 한강하류권, 북한강권, 동해권, 남한강권, 낙동강북부권, 낙동강중부권, 낙동강남부권, 금강북구권, 금강남부권, 남강권, 섬진강권, 영산강권 등 
전국을 12개 광역 급수권으로 구분해 권역별로 필요한 물을 공급한다.

수변사업 분야에서는 시화지구의 시화멀티테크노밸리(MTV)와 송산그린시티 조성사업, 부산 에코델타시티, 부여 규암지구, 나주 노안지구, 구미하이테크밸리 등의 조성사업을 맡고 있다. 
이 외에도 한국수자원공사는 4대강 살리기 사업을 담당하고 있다. 상수도 광역행정 문제를 보완하는 국가공기업이기도 하다. 
수돗물 정수 및 배급은 각 지방자치단체 소관이지만, 그 수돗물 정수에 필요한 원수를 공급해주는 것은 대부분 한국수자원공사의 역할이다.
</pre>									
									</td>
								</tr>
							</tbody>
						</table>
					</div>
				</div>
			</div>
	  		<!------------------------------ //개발자 소스 입력 END ------------------------------->	
		</div>
	</div>
</div>
<!-- FOOTER -->
<footer class="footer py-2">
  <div id="footer" class="container">
  </div>
</footer>
</body>
</html>