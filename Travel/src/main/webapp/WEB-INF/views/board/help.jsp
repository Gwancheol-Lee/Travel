<jsp:useBean id="now" class="java.util.Date" />
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1.0, user-scalable=no" />
<script src="http://code.jquery.com/jquery-latest.js"></script>
<link rel="stylesheet" type="text/css"
	href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
<link href="resources/bs/assets/css/boardList.css" rel="stylesheet"
	type="text/css" />
<link rel="stylesheet" href="resources/css/menu_bar.css">
<title>고객센터</title>
</head>
<%@ include file="../include/menu.jsp"%>
<body>
	<section class="probootstrap-cover2 overflow-hidden relative"
		data-stellar-background-ratio="0.5" id="section-home">
	<div class="overlay"></div>
	</section>
	<!-- END section -->
	<section class="probootstrap_section bg-light" id="section-contact">
	<div class="container">

		<div class="row">
			<div class="container text-center">
				<div class="card card-signin my-5">
					<div class="card-body">
						<h4 class="card-title text-center">자주 묻는 질문</h4>
						<p class="card-title text-center">궁금하신 질문을 클릭하시면 그에 따른 답변을 바로
							확인하실 수 있습니다.</p>
						<span class="icon-pointingButton"> <i
							class="far fa-hand-point-down"></i>
						</span>

						<form class="form-signin">
							<div class="form-label-group1">
								<input class="btn btn-lg btn-primary btn-block text-uppercase"
									id="show" onclick="javascript:qnaShowhide1()" type="button"
									value="Q. 여행자 보험이란??">

								<div id="q_answer">
									<div>
										<p class="text-center" id="Qanswer1">
											<b>A.</b> 여행도중에 우연히 발생하게 되는 각종 사고 및 질병, 조난 시 구조비용, 휴대품의 도난 손해
											등의 보상을 목적으로 하는 보험. 해외여행자보험의 실손의료비는 여러 보험사에 중복 계약을 했더라도 중복보상이
											안되고 비례보상으로 처리된다. (단 , 사망보험금은 중복보상 가능) ( 휴대품 손해, 배상책임도 비례보상으로
											처리) 국내에서 상해 및 질병으로 치료 받는경우 발생한 실손의료비에 대해 100% 보상을 받을수 없다.
											자기부담금이 설정되어 있어 그만큼의 비용을 제외하고 보상을 받을수 있다. ※자세한 내용은 홈페이지의 보험
											약관을 참조하시기 바랍니다
										</p>
									</div>
								</div>
							</div>
							<div class="form-label-group1">
								<input class="btn btn-lg btn-primary btn-block text-uppercase"
									id="show" onclick="javascript:qnaShowhide2()" type="button"
									value="Q. 패키지여행이 끝나고 현지에서 돌아오는 날짜를 변경할수있나요?">

								<div id="q_answer">
									<div>
										<p class="text-center" id="Qanswer2">
											<b>A.</b> 일정이 모두 끝난 후 개별귀국을 원하실 경우는 출발전에 우선 돌아오실 날짜와 좌석가능여부를
											사전에 체크.예약과 발권을 완료 하셔야하며 한국에서 혹은 현지에서 돌아오실때 일정금액을 현지공항에서 지불하셔야
											하시면 됩니다. 노선에 따라서 또는 항공편에 따라서 리턴변경이 불가한 경우도 있으니, 출발전에 필히 가능여부를
											체크하시는 것이 중요합니다.
										</p>
									</div>
								</div>
							</div>
							<div class="form-label-group1">
								<input class="btn btn-lg btn-primary btn-block text-uppercase"
									id="show" onclick="javascript:qnaShowhide3()" type="button"
									value="Q. 패키지여행으로 예약하고 현지에서 일행끼리 관광이 되나요?">

								<div id="q_answer">
									<div>
										<p class="text-center" id="Qanswer3">
											<b>A.</b> 패키지여행은 기본적으로 그룹으로 움직이는 여행패턴으로 보시면 됩니다. 일행이 모두 함께 같은
											일정으로 움직이시기 때문에, 원래 해당일정 자체가 자유일정이 하루 또는 반나절 포함되어있는 경우가 아니라면,
											일행끼리의 개별행동은 원칙적으로 불가하십니다. 그럴 경우는 패키지상품보다는 에어텔 등의 개별여행패턴으로
											예약하시는것을 권장 합니다.
										</p>
									</div>
								</div>
							</div>
							<div class="form-label-group1">
								<input class="btn btn-lg btn-primary btn-block text-uppercase"
									id="show" onclick="javascript:qnaShowhide4()" type="button"
									value="Q. 세 명이 여행할 경우 함께 방을 쓸 수 있나요? 아니면 방을 두개 써야 하나요?">

								<div id="q_answer">
									<div>
										<p class="text-center" id="Qanswer4">
											<b>A.</b> 상품가격 형성시 기본조건이 성인 2인1실 기준입니다. 아동을 동반할경우가 아니라면 성인3명의
											경우 보통 한분은 싱글룸을 사용하시는것이 좋습니다. 이 경우 추가요금이 발생할 수 있습니다.
										</p>
									</div>
								</div>
							</div>
							<div class="form-label-group1">
								<input class="btn btn-lg btn-primary btn-block text-uppercase"
									id="show" onclick="javascript:qnaShowhide5()" type="button"
									value="Q. 패키지여행이란 무엇인가요?">

								<div id="q_answer">
									<div>
										<p class="text-center" id="Qanswer5">
											<b>A.</b> 여행사에서 미리 세팅해 놓은 항공권, 관광일정, 숙박, 식사, 교통 등을 이용하여 여행하 는
											것을 패키지 여행이라고 합니다. 보통 10명~15명이 한 팀이 되어 단체로 관광을 하기 때문에 개인적으로
											가시는 여행보다 저렴하게 여행하실 수 있습니다.
										</p>
									</div>
								</div>
							</div>
							<div class="form-label-group1">
								<input class="btn btn-lg btn-primary btn-block text-uppercase"
									id="show" onclick="javascript:qnaShowhide6()" type="button"
									value="Q. 여행중 환자가 발생했을때 어떻게 하나요?">

								<div id="q_answer">
									<div>
										<p class="text-center" id="Qanswer6">
											<b>A.</b> 1)병원 또는 의사를 불러서 진료 및 치료를 받도록 합니다. 2)의사 소견서 및 치료비
											영수증을 수령하여 귀국후 보험 처리할 수 있도록 합니다. 이때 치료비는 카드로 결재하시는 편이 보험처리하는데
											좋습니다. 이 경우 기왕증 또는 병력이 있었던 경우는 보험사의 면책사유가 성립됩니다. [보험청구시 준비서류]
											의사소견서 또는 병원 진단서, 치료비 영수증, 여권 카피본, 은행통장 사본, 전화번호, 사고내역서, 치료비
											명세서 등
										</p>
									</div>
								</div>
							</div>
							<div class="form-label-group1">
								<input class="btn btn-lg btn-primary btn-block text-uppercase"
									id="show" onclick="javascript:qnaShowhide7()" type="button"
									value="Q. 여행시기는 언제가 좋을까요?">

								<div id="q_answer">
									<div>
										<p class="text-center" id="Qanswer7">
											<b>A.</b> 언제 떠나야 하는지 쉽지않죠? 여행 시기는 개인의 사정, 여행지의 기후 등을 고려하여
											결정하면 됩니다. 특히, 여행 성수기인 여름과 겨울의 방학기간은 항공료등이 비싸기 때문에 피하는 것이 좋겠죠.
											비수기에 출발 날짜를 잡는 다면 경비가 절약되고, 우기등을 피해서 여행 시기를 잡는 것도 하나의 방법이 될 수
											있습니다.
										</p>
									</div>
								</div>
							</div>
							<div class="form-label-group1">
								<input class="btn btn-lg btn-primary btn-block text-uppercase"
									id="show" onclick="javascript:qnaShowhide8()" type="button"
									value="Q. 도둑 맞았을 때는 어떻게 대처 해야하나요?">

								<div id="q_answer">
									<div>
										<p class="text-center" id="Qanswer8">
											<b>A.</b>1)절도를 당한 즉시 가장 가까운 경찰서로 가서 반드시 POLICE REPORT를 받습니다.
											이때 신고는 본인이 직접 작성해야 하며 절도를 당한 여행객 인원수대로 별도작성해야 손해를 줄일 가능성이 더
											있습니다. 2)본국으로 귀국후 POLICE REPORT를 가지고 보험회사에 신고합니다. 보험사 제출시 필요서류
											: POLICE REPORT, 손상품 수리견적서(영수증 포함),여권사본, 통장사본 (본인의 통장이 아닐 경우
											관계를 나타낼 수 있는 서류) 보험처리가 안되는 것들 : 현금, 수표, 항공권 등등의 유가증권
										</p>
									</div>
								</div>
							</div>
							<br>
							<hr class="my-4">
							<p class="text-center">도움이 필요하신가요?</p>
							<a href="javascript:location.href='login'"> 1 대 1 문의하기</a>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>
	</section>
	<!-- END section -->
	<%@ include file="../include/csinfo.jsp"%>
</body>
</html>