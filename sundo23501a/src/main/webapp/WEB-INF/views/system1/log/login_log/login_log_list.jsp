<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/header.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>한강 수자원관리 종합 플랫폼 - 로그인 이력</title>

<!--CSS START -->
<!-- CSS END -->

<!-- JS START -->
<script type="text/javascript" src="/js/board.js"></script>
	<script type="text/javascript" src="/js/common.js"></script>
<!-- JS END -->

<script type="text/javascript">
	$(function() {
		
		$.ajax({
			url			: '/main_header_1',
			dataType 	: 'html',
			success		: function(data) {
				$('#header').html(data);
			}
		});
		
		$.ajax({
			url			: '/adminpage_menu',
			dataType 	: 'html',
			success		: function(data) {
				$('#menubar').html(data);
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
		
		$('input[name=from_date]').change(function(){
			document.frmSearch.submit();
		});
		
		$('input[name=to_date]').change(function(){
			document.frmSearch.submit();
		});

		$('select[name=system_category]').change(function(){
			document.frmSearch.submit();
		});
	});	
	
	
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
.searchbox th, 
.searchbox td {
	padding: 2px;
}
</style>
</head>
<body>
<!-- HEADER -->
<header id="header"></header>
<!-- CONTENT -->
<div>
	<div class="row">
 		<!-- 메뉴 -->
		<div id="menubar" class="col-2"></div>		
		<!-- 본문 -->
		<div id="center" class="col-10">
			<!------------------------------ //개발자 소스 입력 START ------------------------------->
			<br>			
			<div id="idFrameSet">
				<div id="idFrameList">
					<div class="container-fluid">
						<table width="100%" style="height:45px">
							<tr>
								<td style="vertical-align:top"><span class="apptitle">로그인 이력</span></td>
								<td align="right">									
								</td>
							</tr>
						</table>
						<form name="frmSearch" action="login_log_list">
							<div class="searchbox">
								<table width="100%">
									<tr>
										<td><h6><b>검색조건</b></h6><hr></td>
									</tr>
									<tr>
										<td>										
											<table>
												<tr>
													<td style="padding-right:10px;font-weight:bold;">로그인 기간</td>
													<td><input type="date" name="from_date" class="form-control" value="${from_date}"></td>
													<td>~</td>
													<td><input type="date" name="to_date" class="form-control" value="${to_date}"></td>
													<td style="padding:0px 10px 0px 20px;font-weight:bold;">사용자</td>
													<td><input type="text" name="user_name" class="form-control" value="${user_name}"></td>
													<td></td>
												</tr>
												<tr>
													<td style="padding-right:10px;font-weight:bold;">시스템</td>
													<td colspan="3">
														<select class="form-select" name="system_category" style="font-size:0.8rem">
															<option value="all">전체</option>
															<c:forEach var="code" items="${CodeList_system_category}">
																<option value="${code.cate_code}" 
																<c:if test="${system_category == code.cate_code}">selected</c:if>
																>${code.cate_name}</option>
															</c:forEach>
														</select>
													</td>
													<td style="padding:0px 10px 0px 20px;font-weight:bold;">IP주소</td>
													<td><input type="text" class="form-control me-2" style="font-size:0.8rem" name="ip" value="${ip}"></td>
													<td style="padding:0px 10px 0px 20px">
														<button type="submit" class="btn btn-dark btn-sm">검색</button>
														<button type="button" class="btn btn-outline-secondary btn-sm" onclick="goto('login_log_list')" style="cursor:pointer">
										         			<svg xmlns="http://www.w3.org/2000/svg" width="18" height="18" fill="currentColor" class="bi bi-arrow-clockwise" viewBox="0 0 16 16">
																<path fill-rule="evenodd" d="M8 3a5 5 0 1 0 4.546 2.914.5.5 0 0 1 .908-.417A6 6 0 1 1 8 2v1z"></path>
																<path d="M8 4.466V.534a.25.25 0 0 1 .41-.192l2.36 1.966c.12.1.12.284 0 .384L8.41 4.658A.25.25 0 0 1 8 4.466z"></path>
															</svg>
														</button>
													</td>
												</tr>
											</table>
										</td>
									</tr>
								</table>
							</div>
						</form>					
						<table width="100%" style="margin-bottom:5px">
							<tr>
								<!-- <td width="100">
									<button type="button" class="btn btn-dark btn-sm" onclick="callAction('write','login_log_write')">작성</button>
								</td>
								<td width="200">
									<div class="form-check form-switch">
										<input class="form-check-input" type="checkbox" role="switch" id="idNewWinFlag" checked="" value="newwin">flexSwitchCheckChecked
										<label class="form-check-label" for="flexSwitchCheckChecked">새 창 열기</label>
									</div>
								</td> -->
								<td width="*" style="text-align:right">
									<c:if test="${not empty keyword}">								
										<a href="login_log_list"><img src="/images/btn_icon_delete2.png" width="18" height="19" style="vertical-align:bottom"></a> 
										검색어( <c:forEach var="code" items="${search_codelist}"><c:if test="${code.cate_code == search}">${code.cate_name}</c:if></c:forEach> = ${keyword} ) 
										<img src="/images/icon_search.png" width="14" height="14" style="vertical-align:bottom"> 검색 건수
									</c:if>
									<c:if test="${keyword eq null}">총 건수</c:if>
									 : ${totalCount}
								</td>
							</tr>
						</table>
						<table class="table table-hover">
							<colgroup>
								<col width="5%"></col>
								<col width="15%"></col>
								<col width="15%"></col>
								<col width="25%"></col>
								<col width="20%"></col>
								<col width="20%"></col>
							</colgroup>
							<thead class="table-light">
								<tr>
									<th>No.</th>
									<th>아이디</th>
									<th>성명</th>
									<th>로그인일시</th>
									<th>IP주소</th>
									<th>시스템</th>
								</tr>
							</thead>
							<tbody>
							<c:set var="num" value="${page.total-page.start+1}"></c:set>
							<c:forEach items="${boardList}" var="board">
								<tr>
									<td>${board.rn}</td>
									<td>${board.user_id}</td>
									<td>${board.user_name}</td>
									<td><fmt:formatDate value="${board.login_datetime}" type="date" pattern="yyyy-MM-dd hh:mm:ss"/></td>
									<td>${board.ip}</td>
									<td>${board.system_name}</td>
								</tr>
								<c:set var="num" value="${num-1}"></c:set>
							</c:forEach>
							</tbody>
						</table>
						<nav aria-label="Page navigation example">
						  <ul class="pagination justify-content-center">
						    
							<c:if test="${page.startPage > page.pageBlock}">
							   	<li class="page-item"><a class="page-link" href="javascript:gotoPage('${page.startPage-page.pageBlock}')" tabindex="-1" aria-disabled="true">&laquo;</a></li><!-- 이전 -->
							</c:if>
						    <c:forEach var="i" begin="${page.startPage}" end="${page.endPage}">
								<c:choose>
									<c:when test="${page.currentPage==i}"><li class="page-item active"></c:when>
									<c:otherwise><li class="page-item"></c:otherwise>
								</c:choose>
								<a class="page-link" href="javascript:gotoPage('${i}')">${i}</a></li>
							</c:forEach>						
						    <c:if test="${page.endPage < page.totalPage}">
						    	<li class="page-item"><a class="page-link" href="javascript:gotoPage('${page.startPage+page.pageBlock}')">&raquo;</a></li><!-- 다음 -->
						    </c:if>
						    
						  </ul>
						</nav>
									
					</div>
				</div>
				<div id="idFrameDoc">
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