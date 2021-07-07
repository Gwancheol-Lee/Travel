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
<script type="text/javascript"
	src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script type="text/javascript"
	src="https://code.jquery.com/jquery-3.4.1.js"></script>
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
							<h5 class="card-title text-center">로그인</h5>
							<form class="form-signin" id="signinform" action="" method="get">

								<div class="form-label-group1">
									<label for="member_id"></label> <input type="email"
										id="member_id" class="form-control" placeholder="아이디를 입력하세요"
										required autofocus>
								</div>

								<div class="form-label-group2">
									<label for="member_pwd"></label> <input type="password"
										id="member_pwd" class="form-control" placeholder="패스워드를 입력하세요"
										required>
								</div>

								<input class="btn btn-lg btn-primary btn-block text-uppercase"
									id="signinbtn" type="button" value="로그인">

								<div class="form-label-group3">
									<a href="javascript:location.href='findIdPwd'" style="cursor: pointer;">아이디·비밀번호찾기</a>
									<a href="javascript:location.href='signUp'">회원가입</a>
								</div>
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