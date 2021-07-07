<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE HTML>
<html lang="ko">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>아이디 찾기</title>
<script src="http://code.jquery.com/jquery-latest.js"></script>
<script type="text/javascript" src="resources/bs/assets/js/findIdPwd.js"
	charset="UTF-8"></script>
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
<link rel="stylesheet" type="text/css" href="resources/css/forgotPW.css">
</head>
<body>
	<form action="javascript:window.close();">
		<section>
			<div id="login-form">
				<h1>아이디 찾기</h1>
				<fieldset>
					<input type="text" name="member_email" id="member_email"
						placeholder="이메일"> <input type="text" name="member_name"
						id="member_name" placeholder="이름"> <input type="button"
						onclick="forgotID()" value="아이디 찾기">
				</fieldset>
			</div>

		</section>
	</form>
</body>
</html>