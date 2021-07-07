<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script src="http://code.jquery.com/jquery-latest.js"></script>
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<link rel="stylesheet" type="text/css"
	href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="stylesheet" type="text/css" href="resources/css/payment.css">

<title>Decorating's</title>
</head>
<%@ include file="../include/menu.jsp"%>
<%@ include file="../include/payment.jsp"%>
<body>
	<div style="height: 10em;"></div>
	<hr>
	<h1>주문서 작성</h1>
	<hr>
	<table class="cart" align="center" style="width: 70%;">
		<tr>
			<th height="50">이미지</th>
			<th width="200">상품명</th>
			<!-- <th width="100">옵션</th> -->
			<th width="100">가격</th>
			<th width="70">수량</th>
			<!-- <th width="100">배송비</th> -->
			<th width="100">합계</th>
		</tr>
		<c:set var="priceSum" value="0" />
		<c:set var="deliverySum" value="0" />
		<c:set var="discountSum" value="0" />

		<c:choose>
			<c:when test="${map.hidden eq 'cartpage'}">
				<c:forEach items="${map.list}" var="pay">
					<input type="hidden" id="prd_id" value="${pay.prd_id}" />
					<input type="hidden" id="buy_quantity" value="${pay.buy_quantity}" />
					<input type="hidden" id="prd_opt" value="${pay.prd_opt}" />
					<input type="hidden" id="member_id" value="${member.member_id}" />

					<tr>
						<td><img src="${pay.prd_img}"
							style="width: 15em; height: 15em;"> <input type="hidden"
							name="chkbox"></td>
						<td class="tdright" style="display: none;">${pay.prd_id}</td>
						<td class="tdleft" >${pay.prd_name}</td>
						<td style="display: none;">${pay.prd_opt}</td>
						<td><fmt:formatNumber value="${pay.prd_price}"
								pattern="#,###" /></td>
						<td>${pay.buy_quantity}</td>
						<td style="display: none;"><fmt:formatNumber value="${pay.prd_delivery}"
								pattern="#,###" /></td>
						<c:set var="paySum" value="${pay.prd_price * pay.buy_quantity}" />
						<td><fmt:formatNumber value="${paySum}" pattern="#,###" /></td>
					</tr>
					<c:set var="discountSum"
						value="${discountSum + (pay.prd_discount * pay.buy_quantity)}" />
					<c:set var="priceSum" value="${priceSum + paySum}" />
					<c:set var="deliverySum" value="${deliverySum + pay.prd_delivery}" />
					<c:set var="total" value="${priceSum + deliverySum}" />
				</c:forEach>
			</c:when>
			<c:when test="${map.hidden eq 'prdpage'}">
				<c:forEach items="${map.list}" var="pay">
					<input type="hidden" id="prd_id" value="${pay.prd_id}" />
					<input type="hidden" id="buy_quantity" value="${map.buy_quantity}" />
					<input type="hidden" id="prd_opt" value="${map.prd_opt}" />

					<!-- id="tr" -->
					<tr>
						<td><img src="${pay.prd_img}"
							style="width: 15em; height: 15em;"> <input type="hidden"
							name="chkbox"></td>

						<td class="tdright" style="display: none;">${pay.prd_id}</td>
						<td class="tdleft">${pay.prd_name}</td>
						<td style="display: none;">${map.prd_opt}</td>
						<td><fmt:formatNumber value="${pay.prd_price}"
								pattern="#,###" /></td>
						<td>${map.buy_quantity}</td>
						<td style="display: none;"><fmt:formatNumber value="${pay.prd_delivery}"
								pattern="#,###" /></td>
						<c:set var="paySum" value="${pay.prd_price * map.buy_quantity}" />
						<td><fmt:formatNumber value="${paySum}" pattern="#,###" /></td>
					</tr>
					<c:set var="discountSum"
						value="${discountSum + (pay.prd_discount * map.buy_quantity)}" />
					<c:set var="priceSum" value="${priceSum + paySum}" />
					<c:set var="deliverySum" value="${deliverySum + pay.prd_delivery}" />
					<c:set var="total" value="${priceSum + deliverySum}" />
				</c:forEach>
			</c:when>
		</c:choose>


		<!-- 최종 결제 창-->
		<%-- <tr>
			<td colspan="8" align="left" id="ordersheet" height="30">
			상품 구매금액: <fmt:formatNumber value="${priceSum}" pattern="#,###" /> +
				배송비: <fmt:formatNumber value="${deliverySum}" pattern="#,###" /> =
				합계: <fmt:formatNumber value="${total}" pattern="#,###" />
			</td>
		</tr> --%>
		<!-- 최종 결제 창 mine  -->
		<!--  -->
	</table>

	<div class="container cart3" align="center" id="ordersheet">
		<span class="pay" style="font-size: 2em;">결제하실 총 금액은
			&nbsp;&nbsp;</span> <span id="prd_sum" class="pay"> <fmt:formatNumber
				value="${priceSum}" pattern="#,###" />원 입니다.
		</span>
	</div>
	<hr>

	<div style="height: 10em;"></div>

	<hr>
	<h1>주문자 정보</h1>
	<hr>
	<table id="oSI" class="pay_info" style="width: 40%; margin-left: 26%;">
		<tr>
			<th width="150" height="50" class="head">주문자 명</th>
			<td><label id="member_name" class="input" size="20">${member.member_name}</label>
				<input type="hidden" id="hidden_member_name"
				value="${member.member_name}"></td>
		</tr>
		<tr style="display: none;">
			<th width="150" height="50" bgcolor="#CCE1FF">우편번호</th>
			<td><label id="member_zipcode" class="input" size="10">${member.member_zipcode}</label><br>
				<input type="hidden" id="hidden_member_zipcode"
				value="${member.member_zipcode}"></td>
		</tr>
		<tr style="display: none;">
			<th width="150" height="50" bgcolor="#CCE1FF">주소</th>
			<td><label id="member_faddr" class="input" size="60">${member.member_faddr}</label>
				<input type="hidden" id="hidden_member_faddr"
				value="${member.member_faddr}"></td>
		</tr>
		<tr style="display: none;">
			<th width="50" height="50" bgcolor="#CCE1FF">상세주소</th>
			<td><label id="member_laddr" class="input" size="60">${member.member_laddr}</label>
				<input type="hidden" id="hidden_member_laddr"
				value="${member.member_laddr}"></td>
		</tr>
		<tr>
			<th height="50" bgcolor="#CCE1FF">핸드폰 번호</th>
			<td><label id="member_phone" class="input" size="16">${member.member_phone}</label>
				<input type="hidden" id="hidden_member_phone"
				value="${member.member_phone}"></td>
		</tr>
		<tr>
			<th height="50" bgcolor="#CCE1FF">이메일</th>
			<td><label id="member_email" class="input" size="30">${member.member_email}</label>
				<input type="hidden" id="hidden_member_email"
				value="${member.member_email}"></td>
		</tr>
	</table>
	<hr>
	<!-- <h1> 배송 정보</h1> -->



	<!-- <h3>결제 예정 금액</h3> -->
	<table id="oSP" style="visibility: hidden; height: 5em;">
		<tr>
			<th height="50" bgcolor="#CCE1FF" align="center">총 주문 금액</th>
			<th height="50" bgcolor="#CCE1FF" align="center">총 할인 금액</th>
			<th height="50" bgcolor="#CCE1FF" align="center">총 결제예정 금액</th>
		</tr>
		<tr>
			<td height="50" align="center"><fmt:formatNumber
					value="${total}" pattern="#,###" />원</td>
			<td height="50" align="center"><fmt:formatNumber
					value="${discountSum}" pattern="#,###" />원</td>
			<td height="50" align="center"><fmt:formatNumber
					value="${total - discountSum}" pattern="#,###" />원</td>
		</tr>
	</table>

	<!-- 이용약관 자리 삭제함 -->
	
	<div style="height: 10em;"></div>
	<hr>
	<h1>결제 수단</h1>
	<hr>
	<div class="container pay" align="center" id="pay">
		<input type="radio" name="chk_info" value="card" checked />카드 결제 <input
			type="radio" name="chk_info" value="transfer" disabled />계좌 이체 <input
			type="radio" name="chk_info" value="deposit" disabled />무통장 입금
		<div id="creditPay">
			카드번호: <input type="text" id="credit1" maxlength="4" size="4"
				onkeypress="onlyNumber()" /> - <input type="password" id="credit2"
				maxlength="4" size="4" onkeypress="onlyNumber()" /> - <input
				type="text" id="credit3" maxlength="4" size="4"
				onkeypress="onlyNumber()" /> - <input type="password" id="credit4"
				maxlength="4" size="4" onkeypress="onlyNumber()" />
		</div>

	</div>



	<!-- <div id="pay">
		<input type="radio" name="chk_info" value="card" checked />카드 결제 <input
			type="radio" name="chk_info" value="transfer" disabled />계좌 이체 <input
			type="radio" name="chk_info" value="deposit" disabled />무통장 입금

		<div id="creditPay">
			카드번호: <input type="text" id="credit1" maxlength="4" size="4"
				onkeypress="onlyNumber()" /> - <input type="password" id="credit2"
				maxlength="4" size="4" onkeypress="onlyNumber()" /> - <input
				type="text" id="credit3" maxlength="4" size="4"
				onkeypress="onlyNumber()" /> - <input type="password" id="credit4"
				maxlength="4" size="4" onkeypress="onlyNumber()" />
		</div>

	</div> -->
	<div style="height: 10em;"></div>
	<hr>
	<h1>최종 결제 금액</h1>
	<hr>
	<%-- 	<table id="paymoney">
		<tr>
			<td>결제금액: <fmt:formatNumber value="${priceSum}" pattern="#,###" /></td>
		</tr>

	</table>
 --%>

	<div class="container pay" align="center" id="paymoney">
		<span id="prd_sum" class="pay"> <fmt:formatNumber
				value="${priceSum}" pattern="#,###" />원
		</span>
		<button class="select" onClick="termChk()" value="결제 하기">결제하기</button>
	</div>

	<!-- <h1> 배송 정보</h1> -->
	<table id="oSD" style="visibility: hidden; height: 5em;">
		<tr>
			<th width="150" height="50" bgcolor="#CCE1FF">배송지 선택</th>
			<td><input type="radio" name="choice" id="sameaddr"
				value="sameaddr" checked />주문자 정보 동일 <input type="radio"
				name="choice" id="newaddr" value="newaddr" />새로운 배송지</td>
		</tr>
		<tr>
			<th height="50" bgcolor="#CCE1FF">받으시는 분</th>
			<td><input type="text" name="sn_member_name" class="input"
				size="20" placeholder="받는사람" value="${member.member_name}" readonly />
			</td>
		</tr>
		<tr>
			<th rowspan="2" width="150" height="50" bgcolor="#CCE1FF">주소</th>
			<td><input type="text" name="sn_member_zipcode" class="input"
				size="10" placeholder="우편번호" value="${member.member_zipcode}"
				readonly> <input type="button" name="nn_searchPost"
				onclick="searchPost()" value="우편번호 찾기" style="visibility: hidden"><br>
				<input type="text" name="sn_member_faddr" class="input" size="60"
				placeholder="우편주소" value="${member.member_faddr}" readonly>
			</td>
		</tr>
		<tr>
			<td><input type="text" name="sn_member_laddr" id="member_laddr"
				class="input" size="60" placeholder="상세주소"
				value="${member.member_laddr}" readonly></td>
		</tr>
		<tr>
			<th height="50" bgcolor="#CCE1FF">핸드폰 번호</th>
			<td><input type="text" name="sn_member_phone" class="input"
				size="16" placeholder="전화번호" value="${member.member_phone}" readonly /></td>
		</tr>
		<tr>
			<th height="70" bgcolor="#CCE1FF">배송 메세지</th>
			<td><textarea id="texta" rows="3" cols="60" maxlength="10"
					placeholder="배송시 요청메시지 입력(10자 내)"></textarea></td>
		</tr>
	</table>
	<!--  -->





	<script>
		$(document)
				.ready(
						function() { // 최상단 체크박스 클릭
							$("#checkAll").click(
									function() { // 클릭
										if ($("#checkAll").prop("checked")) { // input tag name="chk" checked=true
											$("input[name=chk]").prop(
													"checked", true);
										} else {
											$("input[name=chk]").prop(
													"checked", false);
										}
									})

							$("input[name=chk]")
									.click(
											function() {
												if ($("input[name=chk]").length == $("input[name=chk]:checkbox:checked").length) {
													$("#checkAll").prop(
															"checked", true);
												} else {
													$("#checkAll").prop(
															"checked", false);
												}
											})

							$("input[type=radio][name=choice]")
									.change(
											function() {
												if (this.value == "sameaddr") {
													$(
															"input[name=sn_member_name]")
															.val(
																	$(
																			"#hidden_member_name")
																			.val());
													$(
															"input[name=sn_member_name]")
															.attr("readonly",
																	true);
													$(
															"input[name=sn_member_zipcode]")
															.val(
																	$(
																			"#hidden_member_zipcode")
																			.val());
													$(
															"input[name=sn_member_zipcode]")
															.attr("readonly",
																	true);
													$(
															"input[name=sn_member_faddr]")
															.val(
																	$(
																			"#hidden_member_faddr")
																			.val());
													$(
															"input[name=sn_member_faddr]")
															.attr("readonly",
																	true);
													$(
															"input[name=sn_member_laddr]")
															.val(
																	$(
																			"#hidden_member_laddr")
																			.val());
													$(
															"input[name=sn_member_laddr]")
															.attr("readonly",
																	true);
													$(
															"input[name=sn_member_phone]")
															.val(
																	$(
																			"#hidden_member_phone")
																			.val());
													$(
															"input[name=sn_member_phone]")
															.attr("readonly",
																	true);
													$(
															"input[name=nn_searchPost]")
															.css("visibility",
																	"hidden");
												} else if (this.value == "newaddr") {
													$(
															"input[name=sn_member_name]")
															.val("");
													$(
															"input[name=sn_member_name]")
															.attr("readonly",
																	false);
													$(
															"input[name=sn_member_zipcode]")
															.val("");
													$(
															"input[name=sn_member_zipcode]")
															.attr("readonly",
																	true);
													$(
															"input[name=sn_member_faddr]")
															.val("");
													$(
															"input[name=sn_member_faddr]")
															.attr("readonly",
																	true);
													$(
															"input[name=sn_member_laddr]")
															.val("");
													$(
															"input[name=sn_member_laddr]")
															.attr("readonly",
																	false);
													$(
															"input[name=sn_member_phone]")
															.val("");
													$(
															"input[name=sn_member_phone]")
															.attr("readonly",
																	false);
													$(
															"input[name=nn_searchPost]")
															.css("visibility",
																	"visible");
												}
											});
						})

		function termChk() {
			var chk1 = $("#chk1").is(":checked");
			var chk2 = $("#chk2").is(":checked");
			var member_id = $("#member_id").val();
			var member_zipcode = $("input[name=sn_member_zipcode]").val();
			var member_faddr = $("input[name=sn_member_faddr]").val();
			var member_laddr = $("input[name=sn_member_laddr]").val();
			var member_phone = $("input[name=sn_member_phone]").val();
			var credit_number = $("#credit1").val() + "-" + $("#credit2").val()
					+ "-" + $("#credit3").val() + "-" + $("#credit4").val();
			var prd_list = new Array();
			var chkbox = $("input[name=chkbox]");
			jQuery.ajaxSettings.traditional = true;

			if ($("#credit1").val() != ""
					&& $("#credit2").val() != "" && $("#credit3").val() != ""
					&& $("#credit4").val() != "") {
				swal({
					icon : "info",
					text : "결제를 진행 하시겠습니까?",
					closeOnClickOutside : false,
					closeOnEsc : false,
					buttons : [ "취소", "결제" ],
				})
						.then(
								function(isConfirm) {
									if (isConfirm) {
										swal("결제 성공", "결제를 완료했습니다.", "success")
												.then(
														function(isConfirm) {
															chkbox
																	.each(function(
																			i) {
																		var tr = chkbox
																				.parent()
																				.parent()
																				.eq(
																						i)
																				.children();
																		var prd_id = tr
																				.eq(
																						1)
																				.text(); // prd_id
																		var prd_opt = tr
																				.eq(
																						3)
																				.text(); // prd_opt
																		var buy_quantity = tr
																				.eq(
																						5)
																				.text();
																		prd_list
																				.push(prd_id);
																		prd_list
																				.push(prd_opt);
																		prd_list
																				.push(buy_quantity);
																	});
															$
																	.ajax({
																		type : "POST",
																		url : "decopay",
																		data : {
																			"prd_list" : prd_list,
																			"member_id" : member_id,
																			"member_zipcode" : member_zipcode,
																			"member_faddr" : member_faddr,
																			"member_laddr" : member_laddr,
																			"member_phone" : member_phone,
																			"credit_number" : credit_number
																		},
																		success : function(
																				data) {
																			window.location.href = "main";
																		}
																	});
															console
																	.log(prd_list);
														});
									}
								});
			} else {
				swal("", "카드번호를 입력해주세요.", "info");
			}
		}

		// 카드번호 숫자입력
		function onlyNumber() {
			if ((event.keyCode < 48) || (event.keyCode > 57)) {
				event.returnValue = false;
			}
		}

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
							extraAddr += (extraAddr !== '' ? ', '
									+ data.buildingName : data.buildingName);
						}
						fullAddr += (extraAddr !== '' ? '(' + extraAddr + ')'
								: '');
					}
					$("input[name=sn_member_zipcode]").val(data.zonecode);
					console.log($("input[name=sn_member_zipcode]").val());
					// document.getElementById('sn_member_zipcode').value = data.zonecode;
					$("input[name=sn_member_faddr]").val(fullAddr);
					// document.getElementById('sn_member_faddr').value = fullAddr;
					$("input[name=sn_member_laddr]").focus();
					// document.getElementById('sn_member_laddr').focus();
				}
			}).open();
		}
	</script>
	<%@ include file="../include/csinfo_pay.jsp"%>
</body>
</html>