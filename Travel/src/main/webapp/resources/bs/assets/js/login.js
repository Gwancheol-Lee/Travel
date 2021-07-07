function logout() {
	$.ajax({
		type : "GET",
		url : "logout",
		data : {},
		success : function(data) {
			alert("로그아웃 되었습니다");
			location.href="main";
		}
	});
}

$(document).ready(function() {
		//로그인 버튼 눌렀을 때, 빈칸 있으면 알람   
		$("#signinbtn").on("click", function() {
			var member_id = $("#member_id").val();
			var member_pwd = $("#member_pwd").val();
			if (member_id == "") {
				alert("아이디를 입력해 주세요");
				$("#member_id").focus();
				return;
			}

			if (member_pwd == "") {
				alert("비밀번호를 입력해 주세요");
				$("#member_pwd").focus();
				return;
			}
			// 가입된 회원 여부 검사
			else {
				$.ajax({
					type : "POST",
					url : "checkMember",
					data : {
						"member_id" : member_id,
						"member_pwd" : member_pwd
					},
					success : function(data) {
						if (data != 0) {
							$.ajax({
								type : "POST",
								url : "login",
								data : {
									"member_id" : member_id,
									"member_pwd" : member_pwd
								},
								success : function() {
									window.location.href = "main";
								}
							});
						} else {
							alert("아이디 또는 비밀번호가 일치하지 않습니다");
						}
					},
					error : function(data) {
						console.log(data);
					}
				});
			}
		});
	});