<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<title>로그인 페이지</title>
<meta name="description"
	content="Free Bootstrap 4 Theme by uicookies.com">
<meta name="keywords"
	content="free website templates, free bootstrap themes, free template, free bootstrap, free website template">
</head>
<%@include file="../include/menu.jsp"%>
<body>
	<section class="probootstrap-cover2 overflow-hidden relative"
		data-stellar-background-ratio="0.5" id="section-home">
		<div class="overlay"></div>
	</section>
	<!-- END section -->
	<section class="probootstrap_section bg-light" id="section-contact">
		<div class="container">

			<div class="row">
				<div class="col-sm-9 col-md-7 col-lg-5 mx-auto">
					<div class="card card-signin my-5">
						<div class="card-body">
							<h4 class="card-title text-center">아이디/비밀번호 찾기</h4>
							<p class="card-title text-center">아래 버튼을 클릭해 주세요</p>
							<span class="icon-pointingButton"> <i
								class="far fa-hand-point-down"></i>
							</span>

							<form class="form-signin">
								<div class="form-label-group1">
									<input class="btn btn-lg btn-primary btn-block text-uppercase" id="show" onclick="javascript:IdShowhide()" type="button" value="아이디찾기">

									<div id="findId">
											<input type="button" class="btn2 btn2-primary btn-block" id="find_Id" onclick="forgotIDView()" value="이메일로 찾기">
											<input type="button" class="btn2 btn2-primary btn-block" id="find_Id" value="휴대폰번호로 찾기">
									</div>
									
								</div>
								<div class="form-label-group2">
									<input class="btn btn-lg btn-primary btn-block text-uppercase" id="show2" onclick="javascript:PwdShowhide()" type="button" value="비밀번호찾기">

									<div id="findPwd">
										<input type="button" class="btn2 btn2-primary btn-block" id="find_Pwd" onclick="forgotPWView()" value="아이디로 찾기">
										<input type="button" class="btn2 btn2-primary btn-block" id="find_Pwd" value="휴대폰번호로 찾기">
									</div>
									
								</div>
								<hr class="my-4">
								<p class="text-center">
									아이디가 없으신가요?<a href="javascript:location.href='signUp'">회원가입</a>
								</p>
							</form>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>
	<!-- END section -->

</body>
<%@include file="../include/csinfo.jsp"%>
</html>