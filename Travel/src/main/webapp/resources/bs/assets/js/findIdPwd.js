// 아이디 찾기 Show&Hide
function IdShowhide() {
	if (document.getElementById("findId").style.display == "block") {
		document.getElementById("findId").style.display = "none";
	} else {
		document.getElementById("findId").style.display = "block";
	}
}

// 비밀번호 찾기 Show&Hide
function PwdShowhide() {
	if (document.getElementById("findPwd").style.display == "block") {
		document.getElementById("findPwd").style.display = "none";
	} else {
		document.getElementById("findPwd").style.display = "block";
	}
}

function forgotIDView() {
	var popupX = (window.screen.width / 2) - 200;
	var popupY = (window.screen.height / 2) - 125;
	window.open("forgotID", "아이디 찾기",
			"status = no, width = 500, height = 200, left = " + popupX
					+ ", top = " + popupY);
}
function foundIdView() {
	var popupX = (window.screen.width / 2) - 200;
	var popupY = (window.screen.height / 2) - 125;
	window.open("foundId", "아이디 처리 화면",
			"status = no, width = 500, height = 200, left = " + popupX
					+ ", top = " + popupY);
}

// 아이디 찾기 처리
function forgotID() {
	var member_email = $("#member_email").val();
	var member_name = $("#member_name").val();
	if (member_email == "") {
		alert("이메일을 입력해 주세요");
		$("#member_email").focus();
		return;
	} else if (member_name == "") {
		alert("이름을 입력해 주세요");
		$("#member_name").focus();
		return;
	} else {
		$.ajax({
			type : "POST",
			url : "forgotIDChkm",
			data : {
				"member_email" : member_email,
				"member_name" : member_name
			},
			success : function(data) {
				if (data != 0) {
					$.ajax({
						type : "POST",
						url : "forgotID",
						data : {
							"member_email" : member_email,
							"member_name" : member_name
						},
						success : function(data) {
							$.ajax({
								type : "GET",
								url : "foundId",
								data : {},
								success : function(data) {
									window.location.href = "foundId";
								}
							});
						}
					});
				} else {
					alert("존재하는 회원 정보가 없습니다");
				}
			}
		});
	}
}

function forgotPWView() {
	var popupX = (window.screen.width / 2) - 200;
	var popupY = (window.screen.height / 2) - 125;
	window.open("forgotPW", "비밀번호 찾기",
			"status = no, width = 500, height = 200, left = " + popupX
					+ ", top = " + popupY);
}

function forgotPW() {
	var member_id = $("#member_id").val();
	var member_email = $("#member_email").val();

	if (member_id == "") {
		alert("아이디를 입력해 주세요");
		$("#member_id").focus();
		return;
		
	} else if (member_email == "") {
		alert("이름을 입력해 주세요");
		$("#member_email").focus();
		return;
		
	} else {
		$(".forgot.regex").html("전송중입니다.. 잠시만 기다려주세요...");
		$.ajax({
			type : "POST",
			url : "forgotPWChkm",
			data : {
				"member_id" : member_id,
				"member_email" : member_email
			},
			success : function(data) {
				if (data != 0) {
					$.ajax({
						type : "POST",
						url : "forgotPW",
						data : {
							"member_id" : member_id,
							"member_email" : member_email
						},
						success : function() {
							alert("비밀번호를 이메일로 발송하였습니다.");
							location.reload(true);
						}
					});
				} else {
					alert("존재하지 않는 회원입니다.");
					$(".forgot.regex").html("");
				}
			}
		});
	}
}