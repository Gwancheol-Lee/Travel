var checkPWD = false;
$(document).ready(function() {
	$("#member_pwd").keyup(function() {
		$("#checkPasswd").text("");
	});

	$("#chk_member_pwd").keyup(function() {
		var checkText = $("#checkPasswd");
		if ($("#member_pwd").val() == "" || $("#chk_member_pwd").val() == "") {
			checkText.css("color", "red");
			checkText.text("필수정보입니다.");
			checkPWD = false;
		} else if ($("#member_pwd").val() != $("#chk_member_pwd").val()) {
			checkPWD = false;
			checkText.text("패스워드가 동일하지 않습니다.");
			checkText.css("color", "red");
		} else {
			checkPWD = true;
			checkText.text("패스워드가 동일합니다.");
			checkText.css("color", "green");
		}
	});

	$("#email_select").change(function() {
		if ($("#email_select").val() == "1") {
			$("#email_addr").val("");
			$("#email_addr").prop("disabled", false);
		} else if ($("#email_select").val() == "") {
			$("#email_addr").val("");
			$("#email_addr").prop("disabled", true);
		} else {
			$("#email_addr").val($("#email_select").val());
			$("#email_addr").prop("disabled", true);
		}
	});

	/*$("#d_product").click(function() {

		var checkArr = new Array();
		$("input[class='d_check']:checked").each(function() {
			checkArr.push($(this).attr("row.payment_id"));
			swal({
				icon : "warning",
				text : "선택 내용을 정말 삭제 하시겠습니까?",
				closeOnClickOutside : false,
				closeOnEsc : false,
				buttons : [ "돌아가기", "삭제하기" ],
			}).then(function(isConfirm) {
				if (isConfirm) {
					swal('삭제 완료!', '내용 삭제가 정상 처리되었습니다.', 'success').then(function(isConfirm) {
						$.ajax({
							url : "deletePay",
							type : "POST",
							data : {
								d_check : checkArr
							},
							success : function() {
								window.location.href = "mypage2";
							}
						});
					});
				}
			});
		});
	});*/
});
function searchPost() {
	new daum.Postcode({
		oncomplete : function(data) {
			var fullAddr = '';
			var extraAddr = '';

			if (data.userSelectedType == 'R') {
				fullAddr = data.roadAddress;
			} else {
				fullAddr = data.jibunAddress;
			}
			if (data.userSelectedType == 'R') {
				if (data.bname !== '') {
					extraAddr += data.bname;
				}
				if (data.buildingName !== '') {
					extraAddr += (extraAddr !== '' ? ', ' + data.buildingName
							: data.buildingName);
				}
				fullAddr += (extraAddr !== '' ? '(' + extraAddr + ')' : '');
			}
			document.getElementById('member_zipcode').value = data.zonecode;
			document.getElementById('member_faddr').value = fullAddr;
			document.getElementById('member_laddr').value = '';
		}
	}).open();
}


// 회원 탈퇴
function deleteMyinfo() {
	var member_id = $("#member_id").val();

	swal({
		icon : "warning",
		text : "정말 탈퇴 하시겠습니까?",
		closeOnClickOutside : false,
		closeOnEsc : false,
		buttons : [ "돌아가기", "탈퇴하기" ],
	}).then(
			function(isConfirm) {
				if (isConfirm) {
					swal('탈퇴 완료!', '회원 탈퇴가 정상 처리되었습니다.', 'success').then(
							function(isConfirm) {
								$.ajax({
									type : "POST",
									url : "deleteMyp",
									data : {
										"member_id" : member_id
									},
									success : function(data) {
										$.ajax({
											type : "GET",
											url : "logout",
											data : {},
											success : function() {
												window.location.href = "main";
											}
										});
									},
									error : function(data) {
										console.log(member_id);
										console.log(myp);
									}
								});
							});
				}
			});
}
//회원정보 수정
function myinfoUp() {
	var member_id = $("#member_id").val();
	var member_pwd = $("#member_pwd").val();
	var member_email = $("#email_id").val() + "@" + $("#email_addr").val();
	var member_phone = $("#num_list").val() + "-" + $("#member_phone1").val()
			+ "-" + $("#member_phone2").val();
	var member_zipcode = $("#member_zipcode").val();
	var member_faddr = $("#member_faddr").val();
	var member_laddr = $("#member_laddr").val();
	var myp = $("#myp").val();
	if (checkPWD == false) {
		console.log("비밀번호 다름");
	}
	if (checkPWD == false) {
		swal("", "필수항목이 비어있습니다. 입력해주세요.", "warning");
	} else {
		swal({
			icon : "warning",
			text : "정말 수정 하시겠습니까? 재 로그인이 필요합니다",
			closeOnClickOutside : false,
			closeOnEsc : false,
			buttons : [ "돌아가기", "수정하기" ],
		})
		.then(
			function(isConfirm) {
				if (isConfirm) {
					swal('수정 완료!', '회원정보 수정을 완료했습니다.', 'success').then( function(isConfirm) {
						$.ajax({
							type : "POST",
							url : "mypageinfo",
							data : {
								"member_id" : member_id,
								"member_pwd" : member_pwd,
								"member_email" : member_email,
								"member_phone" : member_phone,
								"member_zipcode" : member_zipcode,
								"member_faddr" : member_faddr,
								"member_laddr" : member_laddr,
								"myp" : myp
							},
							success : function(data) {
								console.log(member_id);
								console.log(myp);
								window.location.href="login";
							},
							error : function(data) {
								console.log(member_id);
								console.log(myp);
						}
					});
				});
			}
		});
	}
}
// 마이페이지 클릭 이벤트
function myPageBtn() {
	var member_id = $("#member_id").val();
	var myPage = $("#member").val();
	$.ajax({
		type : "GET",
		url : "mypage",
		data : {
			"member_id" : member_id,
			"myPage" : myPage
		},
		success : function(data) {
			window.location.href = "mypage?member_id=" + member_id
					+ "&mypPage=" + myPage;
		}
	});
}
