<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="viewport"
	content="width=device-width, initial-scale=1.0, user-scalable=no" />
<script src="http://code.jquery.com/jquery-latest.js"></script>
<script type="text/javascript" src="resources/js/cart.js"
	charset="UTF-8"></script>
<script type="text/javascript" src="resources/js/product.js"
	charset="UTF-8"></script>
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
<link rel="stylesheet" type="text/css"
	href="resources/css/productpage.css">
<link rel="stylesheet" href="resources/css/menu_bar.css">

<link rel="stylesheet" type="text/css"
	href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
<!--  round ed -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="resources/css/menu_bar.css">
<title>상품</title>
</head>
<style>
.vl {
	border-left: 2px solid gray;
	height: 100px;
}
</style>
<%@ include file="../include/menu.jsp"%>

<body>
	<section class="probootstrap-cover overflow-hidden relative"
		style="background-image: url('resources/bs/assets/images/tr1.jpg'); padding: 3em;"
		data-stellar-background-ratio="0.5" id="section-home">
		<div class="overlay"></div>
		<div class="container">
			<div class="row align-items-center text-center">
				<div class="col-md">
					<form class="ml-3 my-auto w-50 d-inline-block order-1">
						<ul class="nav nav-pills nav-fill">
							<li class="nav-item"><a class="nav-link"
								href="category?cate_id=CHE20180050">유럽</a></li>
							<li class="nav-item"><a class="nav-link" href="#">아시아</a></li>
							<li class="nav-item"><a class="nav-link" href="#">아프리카</a></li>
							<li class="nav-item"><a class="nav-link" href="#">미국</a></li>
						</ul>
					</form>
				</div>
			</div>
		</div>
	</section>
	<script>
		$("#buy_quantity").keyup(function(e) {
			var regNumber = /^([0-9]{2})$/;
			var str = $(this).val();
			if (!regNumber.test(str)) {
				var res = str.substring(0, str.length - 1);
				$(this).val(res);
			}
		});
	</script>
	<%@ include file="../include/menu.jsp"%>
	<div class="clean" style="height: 5em;"></div>
	<hr>
	<p class="pci">Package Introduction</p>
	<hr>
	<div class="productdetail">
		<form>
			<img class="productLeft" src="${product.prd_img}">

			<div class="productRight">
				<p class="p2" align="left" style="visibility: hidden;">
					옵션: <select id="prd_opt">
						<c:forEach items="${fn:split(product.prd_option, ',')}" var="opt">
							<option value="${opt}">${opt}</option>
						</c:forEach>
					</select>
				</p>
				<p align="left" class="p1">
					<i class="fas fa-cube"> </i> &nbsp;&nbsp;&nbsp;상품명:
					${product.prd_name}
				</p>
				<p align="left" class="p1">
					<i class="fas fa-won-sign"></i> &nbsp;&nbsp;&nbsp;가격:
					<fmt:formatNumber value="${product.prd_price}" pattern="#,###" />
					원
				</p>
				<%-- <p align="left" class="p1">상품코드: ${product.prd_id}</p> --%>
				<p align="left" class="p2">
					<i class="fas fa-sort-amount-up"></i>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;패키지
					개수: <input type="number" id="buy_quantity" min="1" maxlength="2"
						max="99" value="1" oninput="mxNum(this)" />
				</p>
				<script>
					function mxNum(object) {
						if (object.value.length > object.maxLength) {
							object.value = object.value.slice(0,
									object.maxLength)
						}
					}
				</script>
				<!-- 	<p align="left">본 상품은 서울배송만 가능합니다.</p> -->
				<input type="hidden" name="prd_img" id="prd_img"
					value="${product.prd_img}" /> <input type="hidden"
					name="member_id" id="member_id" value="${member.member_id}" /> <input
					type="hidden" name="prd_id" id="prd_id" value="${product.prd_id}" />

				<!-- btn group -->
				<p align="left" class="p2">
					<input type="button" class="cart_btn" name="cart" id="cart"
						onclick="insertCart()" value="장바구니" /> <input type="hidden"
						name="hiddenbtn" id="hiddenbtn" value="prdpage" /> <input
						type="button" class="buy_btn" name="buy" id="buy"
						onclick="buyProduct()" value="구매하기" />
				</p>

				<%-- <p align="left" class="p1">총 결제 금액 : ${product.prd_price * #buy_quantity} 원<!--  --> --%>
				<!-- 	</p> -->


			</div>
		</form>
	</div>
	<!-- <div class="clean" style="height: 10em;"></div> -->
	<div>
		<hr>
		<p class="pci">Package Detail</p>
		<hr>
	</div>
	<div class="row">
		<div class="col">
			<p class="p_font_view_ex2" style="margin-left: 10em;">
				<a
					href="https://ko.wikipedia.org/wiki/%ED%95%A0%EC%8A%88%ED%83%80%ED%8A%B8"
					class="a_pack"> Hallstatt</a> <br> 상품 설명 => 할슈타트(독일어:
				Hallstatt)는 오스트리아 오버외스터라이히주의 마을이다. 할슈타트 호에 가까이 있으며 알프스 기슭의 호수 지역
				잘츠카머구트 지방의 가장 안쪽에 위치하는 경승지이다. 유네스코 세계유산으로 등재되어 있고 마을의 꼭대기에 위치한
				공동묘지에서 출토된 철기시대 유물들로 유럽의 초기 철기문화를 일컫는 "할슈타트 문화"가 이에서 유래되었다. 동화 속의
				호수마을과 같은 모습으로 알려져 있는 할슈타트는 오스트리아의 9개의 주 중에서 오버외스트라이히 주에 속하는 마을이다.
				지리적으로는 할슈타트 호의 남서쪽, 다흐슈타인 산맥의 서쪽에 위치하고 있어서, 산과 호수가 어우러진 자연 경관이 아름답다.
				할슈타트는 자연 경관 뿐 아니라 역사적 가치가 유명하다. BC 2000년부터 형성되었던 전 세계 최초의 소금광산으로
				유명하며, 이를 통해 얻은 경제적 풍요로움을 바탕으로 BC 1000년부터 BC 500년의 철기 문화가 나타났고, 할슈타트의
				분묘 유적에는 이러한 흔적들이 남아있다. 이러한 철기문화는 유럽 초기의 철기문화인 ‘할슈타트 문화’를 이루었다 이 아름다운
				풍경과 이 지역의 역사적인 가치를 인정 받아서, 할슈타트는 1997년도부터 ‘할슈타트-다흐슈타인 잘츠카머구트
				문화경관’이라는 이름으로 유네스코 문화유산에 등재되었다. 현재의 소금산업이 에벤호 지역으로 옮겨감에 따라서 관광산업이 주된
				할슈타트의 산업이 되었으며, 아름다운 호수와 산을 깎아서 집을 지어서 만들어진 마을로 관광객들을 모으고 있다.
			</p>
		</div>
		<div class="col" style="margin-right: 5em; margin-top: 8em;">
			<img src="resources/bs/assets/images/ch0.jpg"
				href="https://ko.wikipedia.org/wiki/%EC%8A%A4%ED%86%A4%ED%97%A8%EC%A7%80"
				class="rounded-circle">
		</div>
	</div>
	<div class="clean" style="height: 15em;"></div>
	<div class="row">

		<div class="col" style="margin-top: 8em; margin-left: 5em;">
			<img src="resources/bs/assets/images/au1.jpg"
				href="https://ko.wikipedia.org/wiki/%EC%8A%A4%ED%86%A4%ED%97%A8%EC%A7%80"
				class="rounded-circle">
		</div>
		<div class="col" style="margin-right: 3em;">

			<p class="p_font_view_ex2">
				<a
					href="https://ko.wikipedia.org/wiki/%EC%87%A4%EB%B8%8C%EB%A3%AC%EA%B6%81"
					class="a_pack">Schloss Schönbrunn</a><br> 상품 설명 => 오스트리아에서 가장
				큰 궁전이자 방문객이 가장 많은 유적지 중 하나이며, 문화적으로도 가장 뜻 깊은 곳 중 하나이다. 쇤브룬 궁전의 정원은 한
				시절 유럽을 호령했던 합스부르크 가문의 품격과 취향을 고스란히 보여주고 있다. 50만평에 이르는 그 대지와 궁궐은
				1996년 유네스코 세계 문화 유산으로 선정 되었으며 쇤브룬 공원 안에 있는 빈 동물원은 세계에서 가장 오래된 동물원이다.
				18세기 중엽 마리아 테레지아 여제의 여름 별장으로 지어진 쉰브룬궁은 1892년부터 빈 13구역 히칭에 위치해 있다. 이
				궁전의 이름은 1619년 마티아스 황제가 사냥하다가 샘터를 발견했을 때 'Welch’ schöner Brunn' (이
				얼마나 아름다운 샘인가!) 라고 외쳤다는 일화에서 유래되었다고 한다. 1638년부터 1648년까지 이 곳에는 먼저
				페르디난트 2세의 두번째 부인인 엘레노라 곤자가의 거처로서 궁전이 지어졌으나 이 첫 궁전은 1683년 오스만 튀르크의 제
				2차 빈 공방전으로 인해 심각하게 파괴되었다. 1687년 레오폴드 1세는 빈 성문에서 떨어진 그 곳에 그의 후계자 요제프
				1세를 위한 새 궁전을 짓고자 요한 베른하르트 피셔 폰 에어라흐에게 의뢰했다. 1743년 마리아 테레지아 여제 시대가
				되어서야 니콜라우스 폰 파카시와 요한 페르디난트 헤첸도르프 폰 호헨베르크에 의해 확장되어 오늘날의 궁전과 공원의 모습이
				되었다. 쇤브룬 궁전은 18세기 중엽부터 1918년까지 합스부르크 가문의 여름 별장으로 쓰였다. 황실의 여름 별장으로 쓰일
				동안에 이 궁전은 수백명의 궁중인들이 살던 합스부르크 제국의 문화적, 정치적 중심지가 되었다.
			</p>
		</div>
	</div>
	<div class="clean" style="height: 15em;"></div>
	<div class="row">
		<div class="col" style="margin-left: 10em;">
			<p class="p_font_view_ex2">
				<a
					href="https://ko.wikipedia.org/wiki/%EB%B9%88_%EA%B5%AD%EB%A6%BD_%EC%98%A4%ED%8E%98%EB%9D%BC_%EA%B7%B9%EC%9E%A5"
					class="a_pack"> Wien Staatsoper</a><br> 상품 설명 => 제2차 세계대전 이후
				10년에 걸쳐 정부, 시청, 시민들이 눈물겨운 협력을 한 보람으로 전쟁에서 재건되어 1955년 가을에 복구되어 개장하였다.
				궁정가극장의 후신인 이 극장을 사랑하는 빈 시민의 희망에 따라 외관은 옛모습대로 복원하였으며 외벽의 새로움을 피하기 위하여
				상당한 비용을 들여 고색창연한 옛모습의 아취를 살려 옛 도시다운 우아함을 보였다. 그러나 시설은 최신식이며 객석의 3배나
				되는 광대한 무대는 몇 개로 구분되어 짧은 시간에 자유롭게 움직여 장면 전환을 빨리 할 수 있도록 장치하였다. 객석은
				2,200여개로 1층 뒤쪽에 입석이 있고 천장 객석에는 열렬한 팬들을 위해 악보를 볼 수 있도록 배려가 되어 있다.
				예로부터 명지휘자와 많은 명가수가 이 곳에서 공연을 가졌으며 빈 필하모닉은 이 극장의 전속 관현악단이다. 또한 잘츠부르크
				음악제의 오페라도 이 관현악단이 중심이 되고 있다.
			</p>
		</div>
		<div class="col" style="margin-right: 5em;">
			<img src="resources/bs/assets/images/au2.jpg"
				href="https://ko.wikipedia.org/wiki/%EC%8A%A4%ED%86%A4%ED%97%A8%EC%A7%80"
				class="rounded-circle">
		</div>
	</div>



	<!-- 		<div class="detail"> -->
	<!-- 			<table style="width: 700px;"> -->
	<!-- 				<tr> -->
	<%-- 					<td>${product.prd_explain}</td> --%>
	<!-- 				</tr> -->
	<!-- 			</table> -->
	<!-- 		</div> -->
	<a href="javascript:location.href='category?cate_id=CHE20180050'">
		<button class="list_btn">목록으로</button>
	</a>
	<hr>
	<!-- <div class="danger">
		<table style="width: 700px; text-align: left;">
			<tr>
				<th>주의 사항</th>
			</tr>
			<tr>
				<td>&nbsp;&nbsp;13시 이전 결제 완료시 당일 배송</td>
			</tr>
			<tr>
				<td>&nbsp;&nbsp;반품 및 교환 요청은 배송비 고객 부담</td>
			</tr>
		</table>
	</div> -->
	<%@ include file="../include/csinfo.jsp"%>
</body>
</html>