<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/header.jsp" %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>한강 수자원관리 종합 플랫폼 - 내 정보 설정</title>

<link rel="stylesheet" href="/bootstrap-5.3.2-examples/css/modals.css"><!-- 모달창 -->		
<!--CSS START -->
<style>
	/* 좌측 프로필 컨텐츠 스타일 */
    #contents .mypage, .myenv  {
        background-color: rgba(var(--bs-tertiary-bg-rgb)) !important;
        padding: 20px;
        border-radius: 8px;
        box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
        margin: 15px;
    }
    
    #contents .mytitle {
        font-size: 20px;
    	font-weight: bold;
    }

    #contents .mypage img {
        border-radius: 50%;
        margin-bottom: 15px;
        width: 200px;
        height:200px;
    }

    #contents .mypage h2 {
        color: #007bff;
    }

    #contents .mypage h3 {
        color: #6c757d;
    }
    
	.userEnvTable th, td {
		padding: 9px;
	}
	
	#mypage_check_pw_msg {
		padding-top: 10px;
		padding-bottom: 10px;
		color: var(--bs-form-invalid-color);
	}

</style>

<!-- CSS END -->

<!-- JS START -->
<script type="text/javascript" src="http://code.jquery.com/jquery-latest.min.js"></script>
<!-- JS END -->

<script type="text/javascript">
	$(function() {
		var system_category = "${userInfoDto.system_category}";
		$.ajax({
			url			: '/main_header_'+system_category,
			async		: false,
			dataType 	: 'html',
			success		: function(data) {
				$('#header').html(data);
			}
		});
			
		$.ajax({
			url			: '/main_footer',
			async		: false,
			dataType 	: 'html',
			success		: function(data) {
				$('#footer').html(data);
			}
		});
		
		
		var mypage_msg = "${msg}";
		
		//개인정보 수정 성공시
		if(mypage_msg != "" && mypage_msg == "success") {
			if(location.href.indexOf("mypage_update_result") > 0) {
				alert("수정 완료하였습니다.");
				location.href = "/mypage_main";
			}
		}

		//개인정보 수정 : 비번재확인 실패시
		if(mypage_msg != "" && mypage_msg != "success") {
			$("#btnMypageUpdate").click(); //모달창 다시띄움([개인정보 수정] 버튼 클릭)
		}
		
		//비번재확인 모달창 닫을때 메시지 지우기 닫기
		$("#closeModal").click(function(){
			$("#mypage_check_pw_msg").html("");
		});
		
	});

</script>
<style type="text/css">
header {
    height: 55px;
}
</style>
</head>
<body>

<!-- HEADER -->
<header id="header"></header>

<!-- CONTENT -->
<div class="container-fluid">
	<div class="row">
 		
 		<!-- 메뉴 -->
		<div id="menubar" class="menubar border-right col-md-3 col-lg-2 p-0 bg-body-tertiary">
			<div class="flex-shrink-0 p-3">
			    <ul class="list-unstyled ps-0">
			      <li class="mb-1">
			        <button class="btn btn-toggle d-inline-flex align-items-center rounded border-0 collapsed" data-bs-toggle="collapse" data-bs-target="#mypost-collapse" aria-expanded="true">
					마이 페이지
			        </button>
			        <div class="collapse show" id="mypost-collapse">
			          <ul class="btn-toggle-nav list-unstyled fw-normal pb-1">
			            <li><a href="/mypage_main" class="link-body-emphasis d-inline-flex text-decoration-none rounded">내 정보 설정</a></li>
			          </ul>
			        </div>
			      </li>
			    </ul>
			</div>
		</div>
		
		<!-- 본문 -->
		<main id="center" class="col-md-9 ms-sm-auto col-lg-10 px-md-4">
			<!------------------------------ //개발자 소스 입력 START ------------------------------->
						
			<div id="contents" class="container-fluid">
				<div class="row">
               
					<div class="mypage col-lg-5">
						<table width="100%" height="100%">
                        	<tr height="25"><td align="center"><span class="mytitle">개인정보</span></td></tr>
	                        <tr height="*">
	                        	<td>
						
									<div class="row g-3">
									
										<div class="col-12">
											<label for="username" class="form-label">아이디</label>
											<div class="input-group has-validation">
												<span class="input-group-text">ID</span>
												<input type="text" class="form-control" value="${userInfoDto.user_id }" readonly>
												<div class="invalid-feedback"></div>
											</div>
										</div>
										
										<div class="col-12">
											<label for="address" class="form-label">이름</label>
											<input type="text" class="form-control" value="${userInfoDto.user_name}" readonly>
											<div class="invalid-feedback"></div>
										</div>
										
										<div class="col-md-12">
											<label for="address" class="form-label">EMAIL</label>
											<input type="text" class="form-control" value="${userInfoDto.user_email}" readonly>
											<div class="invalid-feedback"></div>
										</div>
										
										<div class="col-md-12">
											<label for="address" class="form-label">TEL</label>
											<input type="text" class="form-control" value="${userInfoDto.user_tel}" readonly>
											<div class="invalid-feedback"></div>
										</div>
										
										<div class="col-md-12">
											<label for="address" class="form-label">기간명</label>
											<input type="text" class="form-control" value="${userInfoDto.org_name}" readonly>
											<div class="invalid-feedback"></div>
										</div>
									
										<div class="col-md-12">
											<label for="address" class="form-label">소속부서</label>
											<input type="text" class="form-control" value="${userInfoDto.user_department}" readonly>
											<div class="invalid-feedback"></div>
										</div>
									
										<div class="col-md-12">
											<label for="address" class="form-label">직급</label>
											<input type="text" class="form-control" value="${userInfoDto.user_position}" readonly>
											<div class="invalid-feedback"></div>
										</div>
									
									</div>
									<p class="my-4"></p>
									
									<!-- <a href="/mypage_check_pw"> -->
									<button type="button" id="btnMypageUpdate" class="w-100 btn btn-success btn-lg" data-bs-toggle="modal" data-bs-target="#mypage_check_pw">개인정보 수정</button>
									<!-- </a> -->
								</td>
							</tr>
						</table>
					</div>
 

				</div>
			</div>
			
<div class="modal fade" id="mypage_check_pw" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<h5 class="modal-title" id="staticBackdropLabel">비밀번호 재확인</h5>
				<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
			</div>
			<form action="/mypage_update" method="post">
				<div class="modal-body">
					<h6>회원님의 정보를 안전하게 보호하기 위해 비밀번호를 다시 확인해주세요</h6>
					<p></p>
					<label>아이디</label>
					<div style="margin-bottom:10px"><input type="text" class="form-control" name="user_id" id="user_id" placeholder="Id" value="${user_id}"></div>
					<label>비밀번호</label>
					<div style="margin-bottom:10px"><input type="password" class="form-control" name="user_pw" id="user_pw" placeholder="Password"></div>
					<div id="mypage_check_pw_msg">${msg}</div>
				</div>
				<div class="modal-footer">
					<button type="submit" class="btn btn-danger">확인</button>
					<button type="button" id="closeModal" class="btn btn-secondary" data-bs-dismiss="modal">닫기</button>
				</div>
			</form>
		</div>
	</div>
</div>

			<!------------------------------ //개발자 소스 입력 END ------------------------------->
		</main>		
		
	</div>
</div>

<!-- FOOTER -->
<footer class="footer py-2">
  <div id="footer" class="container">
  </div>
</footer>
    
</body>
</html>