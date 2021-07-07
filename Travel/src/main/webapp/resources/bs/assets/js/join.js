var checkID = false;
var checkYEAR = false;
var checkEMAIL = false;
// 주소 기능
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
					extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
				}
				fullAddr += (extraAddr !== '' ? '(' + extraAddr + ')' : '');
			}
			document.getElementById('member_zipcode').value = data.zonecode;
			document.getElementById('member_faddr').value = fullAddr;
			document.getElementById('member_laddr').focus();
		}
	}).open();
}


function checkBirth() {
	var birthDay;
	var yy = $("#birth_year").val();
	var mm = $("#birth_month").val();
	var dd = $("#birth_day").val();
	var oMsg = $("#birchk");
	
	if (yy == "" && mm == "" && dd == "") {
		oMsg.css("color", "red");
		oMsg.text("태어난 년도 4자리를 정확히 입력해주세요");
		return false;
	}
	
	if (mm.length == 1) {
		mm = "0" + mm;
	}
	
	if (dd.length == 1) {
		dd = "0" + dd;
	}
	
	if(yy == "") {
		oMsg.css("color", "red");
		oMsg.text("태어난 년도를 선택하세요");
		return false;
	}
	
	if(mm == "") {
		oMsg.css("color", "red");
		oMsg.text("태어난 월을 선택하세요");
		return false;
	}
	
	if(dd == "") {
		oMsg.css("color", "red");
		oMsg.text("태어난 일(날짜) 2자리를 정확히 입력하세요.");
		return false;
	}
	
	if(dd.length != 2 || dd.indexOf('e') != -1 || dd.indexOf('E') != -1) {
		oMsg.css("color", "red");
		oMsg.text("태어난 일(날짜) 2자리를 정확히 입력하세요.");
		return false;
	}
	
	birthDay = yy + mm + dd;
	if(!isValidDate(birthDay)) {
		oMsg.css("color", "red");
		oMsg.text("생년월일을 다시 확인해주세요.");
		return false;
	}
	
	var age = calcAge(birthDay);
	
	if(age < 0) {
		oMsg.css("color", "red");
		oMsg.text("외계인이신가요");
		return false;
	} else if (age >= 100) {
		oMsg.css("color", "red");
		oMsg.text("정말이신가요?");
		return false;
	} else if (age < 14) {
		oMsg.css("color", "red");
		oMsg.text("만 14세 미만의 어린이는 가입할 수 없습니다.");
		return false;
	} else {
		checkYEAR = true;
		oMsg.text("");
		return true;
	}
	checkYEAR = true;
	return true;
}

function calcAge(birth) {
	var date = new Date();
	var year = date.getFullYear();
	var month = (date.getMonth() + 1);
	var day = date.getDate();
	if (month < 10) {
		month = "0" + month;
	}
	if (day < 10) {
		day = "0" + day;
	}
	var monthDay = month + "" + day;
	
	birth = birth.replace("-", "").replace("-", "");
	var birthdayy = birth.substr(0, 4);
	var birthdaymd = birth.substr(4, 4);
	
	var age = monthDay < birthdaymd ? year - birthdayy - 1 : year - birthdayy;
	console.log("age: " + age);
	return age;
}

function isValidDate(param) {
	try {
		param = param.replace(/-/g, "");
		
		if(isNaN(param) || param.length != 8) {
			return false;
			checkYEAR = false;
		}
		
		var year = Number(param.substring(0, 4));
		var month = Number(param.substring(4, 6));
		var day = Number(param.substring(6, 8));
		
		if (month < 1 || month > 12) {
			return false;
			checkYEAR = false;
		}
		
		var maxDaysInMonth = [31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31];
		var maxDay = maxDaysInMonth[month - 1];
		
		if (month == 2 && (year % 4 == 0 && year % 100 != 0 || year % 400 == 0)) {
			maxDay = 29;
		}
		
		if (day <= 0 || day > maxDay) {
			return false;
			checkYEAR = false;
		}
		return true;
		checkYEAR = true;
	} catch (err) {
		checkYEAR = false;
	}
}
$(document).ready(function(){
		// 이메일 select 효과
		$("#select_address").change(function() {
			if ($("#select_address").val() == "1") {
				$("#member_address").val("");
				$("#member_address").prop("disabled", false);
			} else if ($("#select_address").val() == "") {
				$("#member_address").val("");
				$("#member_address").prop("disabled", true);
			} else {
				$("#member_address").val($("#select_address").val());
				$("#member_address").prop("disabled", true);
			}
		});
		// 아이디 유효성 검사
		$("#member_id").on("input", function() {
			var id_regex = /^[a-zA-Z\d_+.-]{4,12}$/;
			var id_result = id_regex.exec($("#member_id").val());
			
			if (id_result != null) {
				$(".member_id.regex").html("");
			}
			else {
				$(".member_id.regex").html("<span id='span_f'>영어 소문자,숫자 4-12자리</span>");
			}
		});
		
		// 이메일 유효성 검사
		$("#member_email").on("input", function() {
			var email_regex = /^[a-z][a-z\d_+.-]{2,15}$/;
			var email_result = email_regex.exec($("#member_email").val());
			
			if (email_result != null) {
				$(".member_email.regex").html("");
			}
			else {
				$(".member_email.regex").html("<span id='span_f'>영어 소문자,숫자 4-12자리</span>");
			}
		});

		// 이메일 주소 유효성 검사
		$("#member_address").on("input", function() {
			var address_regex =/^([a-z0-9]+\.)+[a-z0-9]{2,4}$/;
			var address_result = address_regex.exec($("#member_address").val());

			if (address_result != null) {
				$(".member_address.regex").html("");
			} 
			else {
				$(".member_address.regex").html("<span id='span_f'>주소를 확인해 주세요</span>");
			}
		});
		
		
		// 아이디 중복확인 유효성검사             
		$("#checkId").on("click", function() {
			var member_id = $("#member_id").val();

			var id_regex = /^[a-z\d_+.-]{4,12}$/;

			var id_result = id_regex.exec($("#member_id").val());

			if (member_id == "") {
				alert("아이디를 입력해주세요");
				$("#member_id").focus();
				return;
			}
			else if (id_result == null) {
				alert("아이디 양식을 확인해주세요");
				$("#member_id").focus();
				return;
			} 
			else {
				$.ajax({
					type : "POST",
					url : "checkID",
					data : {
						"member_id" : member_id
					},
					success : function(data) {
						if (data == 0) {
							$("#member_id").attr("disabled", true);
							alert("사용 가능한 아이디입니다!");
							$(".member_id.regex").html("<span id='span_t'>사용 가능한 아이디 입니다</span>");
							checkID = true;
						} 
						else if (data != 0) {
							alert("이미 존재하는 아이디입니다!");
							$(".member_id.regex").html("<span id='span_f'>다른 아이디를 사용해 주세요</span>");
							checkID = false;
							$("#member_id").focus();
							return;
						} 
						else { 
							console.log('ERROR'); 
						}
					}
				});
			}
		});
		
		// 이메일 중복확인 유효성검사             
		$("#checkEmail").on("click", function() {
			var member_email = $("#member_email").val();
			var member_address = $("#member_address").val();
			
			var email_regex = /^[a-z][a-z\d_+.-]{2,15}$/;
			var email_result = email_regex.exec($("#member_email").val());
			
			var address_regex =/^([a-z0-9]+\.)+[a-z0-9]{2,4}$/;
			var address_result = address_regex.exec($("#member_address").val());
			
			if (member_email == "") {
				alert("이메일을 입력해주세요");
				$("#member_email").focus();
				return;
			}
			else if (email_result == null) {
				alert("이메일 양식을 확인해주세요");
				$("#member_email").focus();
				return;
			} 
			if (member_address == "") {
				alert("주소를 입력해주세요");
				$("#member_address").focus();
				return;
			}
			else if (address_result == null) {
				alert("주소 양식을 확인해주세요");
				$("#member_address").focus();
				return;
			} 
			else {
				var member_email = $("#member_email").val() + "@" + $("#member_address").val();
				$.ajax({
					type : "POST",
					url : "checkEmail",
					data : {
						"member_email" : member_email
					},
					success : function(data) {
						if (data == 0) {
							$("#member_email").attr("disabled", true);
							$("#member_address").attr("disabled", true);
							alert("사용 가능한 이메일입니다!");
							$(".member_email.regex").html("<span id='span_t'>사용 가능한 이메일 입니다</span>");
							checkEMAIL = true;
						} 
						else if (data != 0) {
							alert("이미 존재하는 이메일입니다!");
							$(".member_email.regex").html("<span id='span_f'>다른 이메일을 사용해 주세요</span>");
							checkEMAIL = false;
							$("#member_email").focus();
							return;
						} 
						else { 
							console.log('ERROR'); 
						}
					}
				});
			}
		});

		//비밀번호 유효성검사
		$("#member_pwd").on("input", function() {
			var password_regex = /^[A-Za-z\d]{8,16}$/;
			var password_result = password_regex.exec($("#member_pwd").val())

			if (password_result != null) {
				$(".member_pwd.regex").html("");
			} 
			else {
				$(".member_pwd.regex").html("<span id='span_f'>영어대소문자,숫자 8-11자리</span>");
			}
		});

		//비밀번호 확인    
		$("#repassword").on("keyup", function() {
			if ($("#member_pwd").val() == $("#repassword").val()) {
				$(".repassword.regex").html("<span id='span_t'>비밀번호가 일치합니다</span>");
			}
			else {
				$(".repassword.regex").html("<span id='span_f'>비밀번호가 일치하지않습니다</span>");
			}
		});

		//이름 유효성검사
		$("#member_name").on("input", function() {
			var name_regex = /[가-힣]{2,5}/;
			var name_result = name_regex.exec($("#member_name").val());

			if (name_result != null) {
				$(".member_name.regex").html("");
			}
			else {
				$(".member_name.regex").html("<span id='span_f'>한글만 입력 가능합니다! 2~5 자리</span>");
			}
		});

		//전화번호 유효성검사
		$("#member_phone1").on("input", function() {
			var phone_regex = /[0-9]{4}$/;
			var phone_result = phone_regex.exec($("#member_phone1").val());

			if (phone_result != null) {
				$(".member_phone.regex").html("");
			}
			else {
				$(".member_phone.regex").html("<span id='span_f'>올바른 번호를 작성해 주세요</span>");
			}
		});
		$("#member_phone2").on("input", function() {
			var phone_regex = /[0-9]{4}$/;
			var phone_result = phone_regex.exec($("#member_phone2").val());
			
			if (phone_result != null) {
				$(".member_phone.regex").html("");
			}
			else {
				$(".member_phone.regex").html("<span id='span_f'>올바른 번호를 작성해 주세요</span>");
			}
		});
		
		
		//회원가입 버튼 눌렀을 때, 다시 유효성 검사진행 실시 공백 확인 후 alert 처리   
		$("#signupbtn").on("click", function() {
			var member_id = $("#member_id").val();
			var member_email = $("#member_email").val();
			var member_address = $("#member_address").val();
			var member_pwd = $("#member_pwd").val();
			var member_name = $("#member_name").val();		
			var member_phone1 = $("#member_phone1").val();
			var member_phone2 = $("#member_phone2").val();

			var id_regex = /^[a-zA-Z\d_+.-]{4,12}$/;
			var email_regex = /^[a-zA-Z\d]{2,15}$/;
			var address_regex = /^([a-z0-9]+\.)+[a-z0-9]{2,4}$/;
			var pw_regex = /^[A-Za-z\d]{8,16}$/;
			var name_regex = /[가-힣]{2,5}/;
			var phone_regex = /[0-9]{4}$/;
			
			// 아이디 검사
			var id_regex = id_regex.exec(member_id);
			if (id_regex == null) {
				alert("아이디는 영어,숫자 포함 최소 두 자리 이상 입력해 주세요");
				$("#member_id").focus();
				return;
			}
			// 이메일 주소 검사
			var email_regex = email_regex.exec(member_email);
			var address_regex = address_regex.exec(member_address);
			if (email_regex == null) {
				alert("올바른 이메일을 입력해 주세요");
				$("#member_email").focus();
				return;
			}
			if (address_regex == null) {
				alert("올바른 주소를 입력해 주세요");
				$("#member_address").focus();
				return;
			}
			// 패스워드 검사
			var pw_regex = pw_regex.exec(member_pwd);
			if (pw_regex == null) {
				alert("비밀번호는 영어,숫자 포함 최소 8자리 이상 입력해 주세요");
				$("#member_pwd").focus();
				return;
			}
			// 이름 검사
			var name_regex = name_regex.exec(member_name);
			if (name_regex == null) {
				alert("이름은 한글로 최소 두 자리 이상 입력해 주세요");
				$("#member_name").focus();
				return;
			}
			// 핸드폰번호 검사
			var phone_regex1 = phone_regex.exec(member_phone1);
			var phone_regex2 = phone_regex.exec(member_phone2);
			if (phone_regex1 == null) {
				alert("핸드폰번호를 제대로 입력해 주세요");
				$("#member_phone1").focus();
				return;
			}
			if (phone_regex2 == null){
				alert("핸드폰번호를 제대로 입력해 주세요");
				$("#member_phone2").focus();
				return;
			}
	
			// 중복 확인 검사
			if (checkID == false) {
				alert("아이디 중복 확인을 해주세요!");
				return;
			}
			if (checkEMAIL == false) {
				alert("이메일 중복 확인을 해주세요.");
				return;
			}
			/*if (checkYEAR == false) {
				alert("출생년도를 확인해 주세요!");
				return;
			}*/
			// 유효성 검사 문제 없을 시 ajax로 Mapper url 요청 DB로 값 전송
			else{
				var member_id = $("#member_id").val();
				var member_pwd = $("#member_pwd").val();
				var member_email = $("#member_email").val() +"@" + $("#member_address").val();
				var member_name = $("#member_name").val();
				var member_year = $("#birth_year").val() + "-" + $("#birth_month").val() + "-" + $("#birth_day").val();
				var member_phone = $("#num_list").val()+ "-" + $("#member_phone1").val()+ "-" + $("#member_phone2").val();
				var member_zipcode = $("#member_zipcode").val();
				var member_faddr = $("#member_faddr").val();
				var member_laddr = $("#member_laddr").val();
				
				// MemberController 에서 RequestMapping 되면서 로그인 처리 
				$.ajax({
					type : "POST",
					url : "signUp",
					data : {
						"member_id" : member_id,
						"member_pwd" : member_pwd,
						"member_email" : member_email,
						"member_name" : member_name,
						"member_year" : member_year,
						"member_phone" : member_phone,
						"member_zipcode" : member_zipcode,
						"member_faddr" : member_faddr,
						"member_laddr" : member_laddr
					},
					success : function(data) {
						alert(" 회원가입을 축하드립니다.")
						window.location.href = "login";
					}
				});
			}
		});
	});