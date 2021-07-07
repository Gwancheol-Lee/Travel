<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE HTML>
<html lang="ko">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1.0, user-scalable=no" />
<title>Main</title>
<style type="text/css">
.img_p {
	color: white;
}
</style>
</head>
<%@ include file="include/menu.jsp"%>
<%@ include file="include/center.jsp"%>
<body>


	<section class="probootstrap_section" id="section-city-guides">
		<div class="container">
			<div class="row text-center mb-5 probootstrap-animate">
				<div class="col-md-12">
					<h2 class="display-4 border-bottom probootstrap-section-heading">추천여행지</h2>
				</div>
			</div>
			<div class="row">
				<div class="col-lg-3 col-md-6 probootstrap-animate mb-3">
					<a onclick="location.href='productpage?prd_id=CHE01'"
						style="cursor: pointer" class="probootstrap-thumbnail"> <img
						src="resources/img/product/CHE20180050/CHE01.jpg"
						alt="Free Template by uicookies.com" class="img-fluid"
						style="height: 24em;">
						<div class="probootstrap-text">
							<h3>Szentháromság tér,</h3>
						</div>
					</a>
				</div>
				<div class="col-lg-3 col-md-6 probootstrap-animate mb-3">
					<a onclick="location.href='productpage?prd_id=CHE02'"
						style="cursor: pointer" class="probootstrap-thumbnail"> <img
						src="resources/img/product/CHE20180050/CHE02.jpg"
						alt="Free Template by uicookies.com" class="img-fluid"
						style="height: 24em;">
						<h3>Big Ben</h3>
					</a>
				</div>
				<div class="col-lg-3 col-md-6 probootstrap-animate mb-3">
					<a onclick="location.href='productpage?prd_id=CHE3'"
						style="cursor: pointer" class="probootstrap-thumbnail"> <img
						src="resources/img/product/CHE20180050/CHE03.jpg"
						alt="Free Template by uicookies.com" class="img-fluid">
						<h3>Budapest</h3>
					</a>
				</div>
				<div class="col-lg-3 col-md-6 probootstrap-animate mb-3">
					<a onclick="location.href='productpage?prd_id=CHE04'"
						style="cursor: pointer" class="probootstrap-thumbnail"> <img
						src="resources/img/product/CHE20180050/CHE04.jpg"
						alt="Free Template by uicookies.com" class="img-fluid">
						<h3>Italy</h3>
					</a>
				</div>
			</div>
		</div>
	</section>



	<section class="probootstrap_section">
		<div class="container">
			<div class="row text-center mb-5 probootstrap-animate">
				<div class="col-md-12">
					<h2 class="display-4 border-bottom probootstrap-section-heading">여행지
						미리보기</h2>
				</div>
			</div>
		</div>
	</section>


	<section class="probootstrap-section-half d-md-flex" id="section-about">
		<div class="probootstrap-image probootstrap-animate"
			data-animate-effect="fadeIn"
			style="background-image: url(resources/bs/assets/images/travel1.jpg)"></div>
		<div class="probootstrap-text">
			<div class="probootstrap-inner probootstrap-animate"
				data-animate-effect="fadeInRight">
				<div class="travel_m">
					<h2 class="heading mb-4">
						<i class="fas fa-map-marker-alt"></i> LA의 야경
					</h2>
				</div>
				<p>베벌리 힐스 로데오 드라이브와, 산타모니카 피어로 가는길. 다운타운부터 바닷가 끝까지 한 길 이름으로 연결
					되어있는 윌셔 길거리.</p>
				<p>세계에서 한이름으로 된 길중 가장 길다는데요 프리웨이가 아닌 윌셔길거리로 가면서 멋진 호텔, 건물, 길거리
					보면서 틈틈히 구경해요</p>
				<p class="img_p">
					<a onclick="location.href='productpage?prd_id=CHE04'"
						style="cursor: pointer" class="btn btn-primary">Lean More</a>
				</p>
			</div>
		</div>
	</section>


	<section class="probootstrap-section-half d-md-flex">
		<div class="probootstrap-image order-2 probootstrap-animate"
			data-animate-effect="fadeIn"
			style="background-image: url(resources/bs/assets/images/travel2.jpg)"></div>
		<div class="probootstrap-text order-1">
			<div class="probootstrap-inner probootstrap-animate"
				data-animate-effect="fadeInLeft">
				<div class="travel_m">
					<h2 class="heading mb-4">
						<i class="fas fa-map-marker-alt"></i> 산토리니에서 휴식을~
					</h2>
				</div>
				<p>눈부시게 아름다운 섬, 산토리니 누구나 한 번쯤 꿈꿔봤을 낭만적인 여행지 산토리니. 하얀색과 파란색. 이
					두가지 색 만으로도 충분히 설명이 가능한 곳입니다. 산토리니의 수도인 피라마을과 북쪽에 자리한 이아마을이 가장 대표적인
					명소.</p>
				<p>산토리니에서 가장 아름다운 풍경을 만날 수 있는 뷰포인트이기도 합니다. 검은 모래가 매력적인 페리사 비치,
					화산암 절벽과 붉은색의 모래가 오묘한 아름다움을 만들어내는 레드 비치는 산토리니에서 손꼽히는 해변이다. 새하얀 기암절벽을
					가진 화이트비치도 빼놓을 수 없죠!</p>
				<p class="img_p">
					<a onclick="location.href='productpage?prd_id=CHE04'"
						style="cursor: pointer" class="btn btn-primary">Learn More</a>
				</p>
			</div>
		</div>
	</section>
	<!-- END section -->
	<hr>
	<div style="height: 5em;"></div>
	<hr>
</body>
<%@ include file="include/csinfo.jsp"%>
<script src="resources/bs/assets/js/jquery.min.js"></script>
<script src="resources/bs/assets/js/popper.min.js"></script>
<script src="resources/bs/assets/js/bootstrap.min.js"></script>
<script src="resources/bs/assets/js/owl.carousel.min.js"></script>
<script src="resources/bs/assets/js/bootstrap-datepicker.js"></script>
<script src="resources/bs/assets/js/jquery.waypoints.min.js"></script>
<script src="resources/bs/assets/js/jquery.easing.1.3.js"></script>
<script src="resources/bs/assets/js/select2.min.js"></script>
<script src="resources/bs/assets/js/main.js"></script>
<script src="resources/bs/assets/js/findIdPwd.js"></script>
<script src="resources/bs/assets/js/myPage.js"></script>
</html>