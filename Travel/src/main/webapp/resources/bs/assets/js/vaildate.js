$(function() {
		$("#id").on("input", function() {

			var regex = /^[a-z][a-z\d_+.-]{4,12}$/;
			var result = regex.exec($("#id").val());

			if (result != null) {
				$(".id.regex").html("");
			} else {
				$(".id.regex").html("<span id='span_f'>영어 소문자,숫자 4-12자리</span>");
			}
		})

		//id_email유효성 검사
		$("#id_email").on("input", function() {
			var regex = /^[a-z](\.[a-z]+){1,3}$/;
			var result = regex.exec($("#id_email").val());

			if (result != null) {
				$(".id_email.regex").html("");
			} else {
				$(".id_email.regex").html("<span id='span_f'>이메일 주소를 확인해주세요</span>");
			}
		})

		// 중복확인 유효성검사             
		$("#duplcheck").on("click",function() {
			var id = $("#id").val();
			var id_email = $("#id_email").val();
			
			var regex = /^[a-z][a-z\d]{4,12}$/;
			var regex = /.+@[a-z]+(\.[a-z]+){1,2}$/;
			
			var id_result = regex.exec($("#id").val());
			var id_email_result = regex.exec($("#email").val());
			
			if (id == "") {
				alert("아이디를 입력해주세요");
				$("#id").focus();
				return;
			}
			else if(id_result == null){
				alert("아이디 양식을 확인해주세요");
				$("#id").focus();
				return;
			}
			else{
				if (id_email == "") {
				alert("이메일 주소를 입력해주세요");
				$("#id_email").focus();
				return;
				}
				else if(id_email_result == null){
					alert("주소 양식을 확인해주세요");
					$("#id_email").focus();
					return;
				}
				else{
				window.open("idDuplCheck.jsp?id=" + id, "", "width=500px,height=300px,top=300px,left=200px");
				}
			}
		})
		//id 유효성 검사

		//비밀번호 유효성검사
		$("#pw").on("input", function() {
			var regex = /^[A-Za-z\d]{8,12}$/;
			var result = regex.exec($("#pw").val())

			if (result != null) {
				$(".pw.regex").html("");
			} else {
				$(".pw.regex").html("<span id='span_f'>영어대소문자,숫자 8-11자리</span>");
			}
		})

		//비밀번호 확인    
		$("#repw").on("keyup", function() {
			if ($("#pw").val() == $("#repw").val()) {
				$(".repw.regex").html("<span id='span_t'>비밀번호가 일치합니다</span>");
			}
			else {
				$(".repw.regex").html("<span id='span_f'>비밀번호가 일치하지않습니다</span>");
			}
		})

		//이름 유효성검사
		$("#name").on("input", function() {
			var regex = /[가-힣]{2,5}/;
			var result = regex.exec($("#name").val());

			if (result != null) {
				$(".name.regex").html("<span id='span_t'>멋진 이름이네요</span>");
			} else {
				$(".name.regex").html("<span id='span_f'>한글만 입력 가능합니다 2~5 자리</span>");
			}

		})

		//전화번호 유효성검사
		$("#phone").on("input", function() {
			var regex = /^01\d\d{3,4}\d{4}$/;
			var result = regex.exec($("#phone").val());

			if (result != null) {
				$(".phone.regex").html("<span id='span_t'>올바른 번호입니다</span>");
			}
			else {
				$(".phone.regex").html("<span id='span_f'>올바른 번호가 아닙니다</span>");
			}

		})
		
		//본인확인 유효성 검사
		$("#info_answer").on("input",function(){
            var regex = /[A-Za-z가-힣\d]/;
            var result = regex.exec($("#info_answer").val());
            
            if(result != null){
               $(".info_answer.regex").html("");  
            }else{
                $(".info_name.regex").html("<span id='span_f'>특수문자는 입력할 수 없습니다</span>");
            }
            
        })
		//회원가입 버튼 눌렀을 때, 빈칸 있으면 다시 유효성 검사진행    
		$("#signupbtn").on("click", function() {
			var id = $("#id").val();
			var id_email = $("#id_email").val();
			var pw = $("#pw").val();
			var name = $("#name").val();
			var phone = $("#phone").val();
			var info_answer = $("#info_answer").val();
			
			var idregex = /^[a-z][a-z\d]{4,11}$/;
			var id_emailregex = /^[a-z]+(\.[a-z]+){1,2}$/;
			var pwregex = /^[A-Za-z\d]{8,12}$/;
			var nameregex = /[가-힣]{2,5}/;
			var phoneregex = /^01\d\d{3,4}\d{4}$/;
			var info_answerrgex = /[A-Za-z가-힣\d]/;
			
			var idregex = idregex.exec(id);
			if (idregex == null) {
				alert("아이디 양식을 다시 확인해주세요");
				$("#id").focus();
				return;
			}
			var id_emailregex = id_emailregex.exec(email);
			if (id_emailregex == null) {
				alert("주소 양식을 다시 확인해주세요");
				$("#id_email").focus();
				retrun;
			}
			var pwregex = pwregex.exec(pw);
			if (pwregex == null) {
				alert("비밀번호 양식을 다시 확인해주세요");
				$("#pw").focus();
				retrun;
			}
			var nameregex = nameregex.exec(name);
			if (nameregex == null) {
				alert("이름 양식을 다시 확인해주세요");
				$("#name").focus();
				retrun;
			}
			var phoneregex = phoneregex.exec(phone);
			if (phoneregex == null) {
				alert("핸드폰번호 양식을 다시 확인해주세요");
				$("#phone").focus();
				retrun;
			}
			
			var info_answerregex = info_answerregex.exec(id);
			if (info_answerregex == null) {
				alert("본인확인답변 양식을 다시 확인해주세요");
				$("#info_answer").focus();
				return;
			}
			
			//빈칸 없을 때 제출.
			$("#signupform").submit();
		})
	})
