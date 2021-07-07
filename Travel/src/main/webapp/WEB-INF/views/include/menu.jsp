<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
<script src="http://code.jquery.com/jquery-latest.js"></script>
<link rel="stylesheet" type="text/css"
	href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
<link
	href="https://fonts.googleapis.com/css?family=Nanum+Myeongjo:400,700,800&amp;subset=korean"
	rel="stylesheet">
	<link rel="stylesheet" href="resources/bs/assets/css/reset.css">
<link rel="stylesheet"
	href="https://fonts.googleapis.com/css?family=Work+Sans:300,400,700">
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/css/bootstrap.min.css"
	integrity="sha384-TX8t27EcRE3e/ihU7zmQxVncDAy5uIKz4rEkgIXeMed4M0jlfIDPvg6uqKI2xXr2"
	crossorigin="anonymous">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css" />
<link rel="stylesheet"
	href="resources/bs/assets/css/bootstrap/bootstrap.css">
<link rel="stylesheet" href="resources/bs/assets/css/animate.css">
<link rel="stylesheet"
	href="resources/bs/assets/fonts/ionicons/css/ionicons.min.css">
<link rel="stylesheet" href="resources/bs/assets/css/owl.carousel.min.css">
<link rel="stylesheet"
	href="resources/bs/assets/fonts/flaticon/font/flaticon.css">
<link rel="stylesheet"
	href="resources/bs/assets/fonts/fontawesome/css/font-awesome.min.css">
<link rel="stylesheet"
	href="resources/bs/assets/css/bootstrap-datepicker.css">
<link rel="stylesheet" href="resources/bs/assets/css/select2.css">
<link rel="stylesheet" href="resources/bs/assets/css/helpers.css">
<link rel="stylesheet" href="resources/bs/assets/css/style.css">
<link rel="stylesheet" href="resources/bs/assets/css/payment.css">
<link rel="stylesheet" href="resources/bs/assets/css/login.css">
<link rel="stylesheet" href="resources/bs/assets/css/main.css">
<link rel="stylesheet" href="resources/bs/assets/css/join.css">
<link rel="stylesheet" href="resources/bs/assets/css/findIdPwd.css">
<link rel="stylesheet" href="resources/bs/assets/css/mypage.css">
<link rel="stylesheet" href="resources/bs/assets/css/help.css">
<nav class="navbar navbar-expand-lg navbar-dark probootstrap_navbar"
	id="probootstrap-navbar">
<div class="container">
	<a class="navbar-brand pointer" href="javascript:location.href='main'">PLACE </a>

	<button class="navbar-toggler" type="button" data-toggle="collapse"
		data-target="#probootstrap-menu" aria-controls="probootstrap-menu"
		aria-expanded="false" aria-label="Toggle navigation">
		<span> <i class="ion-navicon"></i>
		</span>
	</button>
	
	<!-- 관리자/비회원/회원 메뉴 처리 -->
	<form id="frm" name="frm">
	<input type="hidden" id="myp" value="${myp}" />

	<c:choose>
		<c:when test="${member.member_id eq 'Administrator'}">
			<div class="collapse navbar-collapse" id="probootstrap-menu">
				<ul class="navbar-nav ml-auto">
					<li class="nav-item">
						<a class="nav-link pointer" onclick="location.href='board'">공지사항</a></li>
					<li class="nav-item">
						<a class="nav-link pointer" onclick="location.href='qna'">고객센터</a></li>
					<li class="nav-item">
						<a class="nav-link pointer" onclick="location.href='prdinsert'">상품목록</a>
					</li>
					<!-- <li class="nav-item">
						<a class="nav-link" onclick="location.href='productList'">상품관리</a>
					</li> -->
					<li class="nav-item">
						<a class="nav-link pointer" onclick="location.href='logout'">로그아웃</a>
					</li>
				</ul>
			</div>
		</c:when>
		<c:when test="${member.member_id == null }">
			<div class="collapse navbar-collapse" id="probootstrap-menu">
				<ul class="navbar-nav ml-auto">
					<li class="nav-item">
						<a class="nav-link pointer" onclick="location.href='board'">공지사항</a>
					</li>
					<li class="nav-item">
						<a class="nav-link pointer" onclick="location.href='qna'">고객센터</a>
					</li>
					<li class="nav-item">
						<a class="nav-link pointer" onclick="location.href='category?cate_id=CHE20180050'">패키지상품</a>
					</li>
					<li class="nav-item">
						<a class="nav-link pointer" onclick="location.href='signUp'">회원가입</a>
					</li>
					<li class="nav-item">
						<a class="nav-link pointer" onclick="location.href='login'">로그인</a>
					</li>
				</ul>
			</div>
		</c:when>
		<c:otherwise>
			<input type="hidden" id="member_id" name="member_id" value="${member.member_id}" />
			<div class="collapse navbar-collapse" id="probootstrap-menu">
				<ul class="navbar-nav ml-auto">
					<li class="nav-item">
						<a class="nav-link pointer" onclick="location.href='board'">공지사항</a></li>
					<li class="nav-item">
						<a class="nav-link pointer" onclick="location.href='qna'">고객센터</a>
					</li>
					<li class="nav-item">
						<a class="nav-link pointer" onclick="location.href='category?cate_id=CHE20180050'">패키지상품</a>
					</li>
					<li class="nav-item">
						<a class="nav-link pointer" onclick="location.href='logout'">로그아웃</a>
					</li>
					<li class="nav-item">
						<a class="nav-link pointer" onclick="productCart()">장바구니</a>
					</li>
					<li class="nav-item">
						<a class="nav-link pointer" onClick="mypBtn()">마이페이지</a>
					</li>
				</ul>
			</div>
		</c:otherwise>
	</c:choose>
	</form>
	
</div>
</nav>






<script>
	// 마이페이지 클릭 이벤트
	function mypBtn() {
		var member_id = $("#member_id").val();
		var myp = $("#myp").val();
		$.ajax({
			type : "GET",
			url : "mypL",
			data : {
				"member_id" : member_id,
				"myp" : myp
			}, success : function(data) {
				window.location.href = "mypage?member_id=" + member_id + "&myp=" + myp;
			}
		});
	}
</script>

<script>
         function searchPrd() {
            var sea = $("#sPrd").val();
            self.location = "searchPrd?sPrd=" + sea;
         }
      </script>
<script src="resources/js/login.js" charset="UTF-8"></script>