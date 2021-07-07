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
<script type="text/javascript" src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script type="text/javascript" src="https://code.jquery.com/jquery-3.4.1.js"></script>
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
<script src="http://code.jquery.com/jquery-latest.js"></script>
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
</head>
<%@ include file="../include/menu.jsp" %>
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
							<h5 class="card-title text-center">회원가입</h5>
							<form id="signform" method="post">
								<!-- form_Id -->
								<div class="form-group input-group">
									<div class="input-group-prepend">
										<span class="input-group-text"> <i class="fa fa-user"></i>
										</span>
									</div>
									<input name="name" id="member_name" class="form-control" placeholder="이름 입력" type="text" autofocus required>
								</div>
								<div class="member_name regex"></div>

								<div class="form-group input-group">
									<div class="input-group-prepend">
										<span class="input-group-text"> 
											<i class="fas fa-user-lock"></i>
										</span>
									</div>
									<input name="id" id="member_id" class="form-control" placeholder="아이디 입력" type="text" required> 
									<br>
								</div>
								<div class="regex_align">
									<div class="member_id regex"></div>
								</div>

								<div class="form-group">
									<input class="btn3 btn3-primary btn-block" id="checkId"
										type="button" value="아이디 확인">
								</div>
								
								<!-- form_Password -->
								<div class="form-group input-group">
									<div class="input-group-prepend">
										<span class="input-group-text"> <i class="fa fa-lock"></i>
										</span>
									</div>
									<input name="member_pwd" id="member_pwd" class="form-control" placeholder="패스워드 입력" type="password" required>
								</div>
								<div class="member_pwd regex"></div>
								<!-- form-group// -->
								<div class="form-group input-group">
									<div class="input-group-prepend">
										<span class="input-group-text"> <i class="fa fa-lock"></i>
										</span>
									</div>
								<input name="repassword" id="repassword" class="form-control" placeholder="패스워드 재 입력" type="password" required>
								</div>
								<div class="repassword regex"></div>
								
								<div class="input-group">
									<div class="input-group-prepend">
										<span class="input-group-text"> 
											<i class="fa fa-envelope"></i>
										</span>
									</div>
									
								<input name="id" id="member_email" class="form-control" placeholder="이메일 입력" type="text" required> 
								<br> 
								<span class="input-group-text2">@</span>
								<input name="member_address" id="member_address" class="form-control" placeholder="주소 입력" type="text" disabled>
								<select class="custom-select1" id="select_address">
									<option value="" selected>::선택하세요::</option>
									<option value="naver.com">naver.com</option>
									<option value="gmail.com">gmail.com</option>
									<option value="hanmail.net">hanmail.net</option>
									<option value="nate.com">nate.com</option>
									<option value="1">직접입력</option>
								</select>
								</div>
								<em>*비밀번호 찾기 시 이메일로 비밀번호가 발송됩니다.</em>
								<div class="regex_align">
									<div class="member_email regex"></div>
									<div class="member_address regex"></div>
								</div>
								
								<div class="form-group">
									<input class="btn3 btn3-primary btn-block" id="checkEmail"
										type="button" value="이메일 확인">
								</div>
								
								<div class="form-group input-group">
									<div class="input-group-prepend">
										<span class="input-group-text"> <i class="fa fa-phone"></i>
										</span>
									</div>
								<select id="num_list">
									<option value="" selected>::선택::</option>
									<option value="010">010</option>
									<option value="011">011</option>
									<option value="016">016</option>
								</select> 
									- 
									<input type="text" id="member_phone1" class="form-control" maxlength="4" size="4" />
									- 
									<input type="text" id="member_phone2" class="form-control" maxlength="4" size="4" />
								</div>
								<div class="member_phone regex"></div>

								
								<div class="form-group input-group">
									<div class="input-group-prepend">
										<span class="input-group-text">
											<i class="fas fa-birthday-cake"></i>
										</span>
									</div>
								<select class="custom-select3" id="birth_year">
									<option value="">년</option>
									<c:forEach var="i" begin="0" end="${2019-1900}">
										<c:set var="yearOption" value="${2019-i}" />
										<option value="${yearOption}">${yearOption}</option>
									</c:forEach>
								</select>
								<select class="custom-select3" id="birth_month">
								<option value="">월</option>
									<c:forEach var="j" begin="0" end="${12-1}">
										<c:set var="monthOption" value="${12-j}" />
										<option value="${monthOption}">${monthOption}</option>
									</c:forEach>
								</select> 
								<input type="text" id="birth_day" size="3" class="form-control" maxlength="2" placeholder="일"/><br>
								<label id="birchk"></label>
								</div>
								<div class="member_birthday regex"></div>
								
								<div class="form-group input-group">
									<div class="input-group-prepend">
										<span class="input-group-text">
											<i class="fas fa-map-marked-alt"></i>
										</span>
									</div>
								<input type="text" name="member_zipcode" class="form-control" id="member_zipcode" class="input" readonly size="10">
								<input type="button" class="find_address pointer"onclick="searchPost()" value="우편번호 찾기">
								</div>
								<div class="form-group input-group">
								<input type="text" name="member_faddr" id="member_faddr" class="form-control" size="60" readonly>								
								</div>
								<div class="form-group input-group">
								<input type="text" name="member_laddr" id="member_laddr" class="form-control" size="60" placeholder="나머지 주소 입력">
								</div>
								<!-- form-group// -->
								<div class="form-group">
									<input type="button" class="btn btn-primary btn-block" id="signupbtn" value="회원가입">
								</div>
								<hr class="my-4">
								<p class="text-center">
									아이디가 있으신가요?
								<a href="javascript:location.href='login'">로그인</a>
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
<%@ include file="../include/csinfo.jsp" %>
</html>