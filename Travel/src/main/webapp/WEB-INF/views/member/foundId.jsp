<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE HTML>
<html lang="ko">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>임시 비밀번호 발급</title>
<script src="http://code.jquery.com/jquery-latest.js"></script>
<script type="text/javascript" src="resources/bs/assets/js/findIdPwd.js"
	charset="UTF-8"></script>
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
<link rel="stylesheet" type="text/css" href="resources/css/forgotPW.css">
</head>
<style>
b {
	font-style: italic;
	font-weight: bolder;
	border-bottom: black;
	text-align: center;
}
</style>
<body>
	<form action="javascript:window.close();">
		<section>
			<div>
				<div id="login-form">
					<h1>찾으시는 아이디는</h1>
					<br> <b>${findId.member_id}</b> &nbsp; 입니다.
				</div>
				<hr class="my-4">
				<div style="text-align: center;">
						<input type="button" onclick="window.close();" value="확인">
				</div>
			</div>
		</section>
	</form>
</body>
</html>