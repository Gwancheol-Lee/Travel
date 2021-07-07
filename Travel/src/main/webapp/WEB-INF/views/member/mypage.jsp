<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description"
	content="Free Bootstrap 4 Theme by uicookies.com">
<meta name="keywords"
	content="free website templates, free bootstrap themes, free template, free bootstrap, free website template">
<script type="text/javascript"
	src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<title>마이페이지</title>
</head>
<%@include file="../include/menu.jsp"%>
<body>
	<section class="probootstrap-cover2 overflow-hidden relative"
		data-stellar-background-ratio="0.5" id="section-home">
		<div class="overlay"></div>
	</section>
	<!-- END section -->
	<div class="container">

		<div class="container main" align="center">
			<h1 class="my" style="margin-top:0.5em;">마이페이지</h1>
			<hr>
			<div align="right">
				<p class="my_p">
					<b style="color: #6BA1FD;">${member.member_name}</b>님의 마이페이지입니다
					&nbsp; 회원 가입일: ${member.member_date}
				</p>
				<p class="my_p">
					현재 주문 물품개수:<b style="color: #6BA1FD;"> &nbsp; ${map.count}
						&nbsp;</b>개
				</p>
			</div>
		</div>


		<div class="container main2">
			<br>
			<ul class="nav nav-tabs">
				<li class="nav-item"><a class="nav-link active"
					data-toggle="tab" href="#myinfo">내 정보</a></li>
				<li class="nav-item"><a class="nav-link s_icon"
					data-toggle="tab" href="#mypay">내 구매 목록</a></li>
			</ul>

			<!-- 내 정보 목록 -->
			<div class="tab-content">
				<div id="myinfo" class="container tab-pane active">
					<form name="f1rm" id="f1rm">
						<table class="table">
							<tr>
								<th>아이디</th>
								<td><label id="member_id" class="input" onFocus="">${member.member_id}</label>
									<label id="idchk"></label></td>
							</tr>
							<tr>
								<th>변경할 비밀번호</th>
								<td><input type="password" id="member_pwd" class="input"
									maxlength="20" /></td>
							</tr>
							<tr>
								<th>비밀번호 확인</th>
								<td><input type="password" id="chk_member_pwd"
									class="input" maxlength="20" /> <label id="checkPasswd"></label></td>
							</tr>
							<tr>
								<th>이름</th>
								<td><label id="member_name" class="input">${member.member_name}</label>
									<label id="chkname"></label></td>
							</tr>
							<tr>
								<th>생년월일</th>
								<td><fmt:parseDate value="${member.member_year}"
										pattern="yyyy-MM-ddHH:mm:ss" var="m_birth" /> <fmt:formatDate
										value="${m_birth}" pattern="yyyy-MM-dd" var="mbirth" /> <label
									id="member_year" class="input">${mbirth}</label></td>
							</tr>
							<tr>
								<th>이메일(선택)</th>
								<td>
									<!-- email split해서 값 넣어주기 --> <!-- c:set 셋팅 --> <c:set
										var="m_email" value="${member.member_email}" /> <c:set
										var="memail" value="${fn:split(m_email, '@') }" /> <!-- 배열 인덱스로 불러옴 -->
									<input type="text" size="15" id="email_id" class="input"
									value="${memail[0] }"> @ <input type="text" size="15"
									id="email_addr" class="input" value="${memail[1] }" disabled>
									<select id="email_select">
										<option value="" selected>::선택하세요::</option>
										<option value="naver.com">naver.com</option>
										<option value="gmail.com">gmail.com</option>
										<option value="hanmail.net">hanmail.net</option>
										<option value="nate.com">nate.com</option>
										<option value="1">직접입력</option>
								</select>
								</td>
							</tr>
							<tr>
								<th>연락처(선택)</th>
								<td>
									<!-- phone split해서 값 넣어주기 --> <!-- c:set 셋팅 --> <c:set
										var="m_phone" value="${member.member_phone}" /> <c:set
										var="mphone" value="${fn:split(m_phone, '-') }" /> <!-- 배열 인덱스로 불러옴 -->
									<select id="num_list">
										<option value="${mphone[0]}" selected>${mphone[0]}</option>
										<option value="010">010</option>
										<option value="011">011</option>
										<option value="016">016</option>
								</select> - <input type="text" id="member_phone1" class="input"
									maxlength="4" size="4" value="${mphone[1]}" /> - <input
									type="text" id="member_phone2" class="input" maxlength="4"
									size="4" value="${mphone[2]}" />
								</td>
							</tr>
							<tr>
								<th>주소</th>
								<td><input type="text" name="member_zipcode"
									id="member_zipcode" class="input" readonly size="10"
									value="${member.member_zipcode}"> <input type="button"
									onclick="searchPost()" style="cursor: pointer" value="우편번호 찾기">
									<input type="text" name="member_faddr" id="member_faddr"
									class="input" size="60" value="${member.member_faddr}" readonly>
								</td>
							</tr>
							<tr>
								<th id="a">상세주소</th>
								<td id="a"><input type="text" name="member_laddr"
									id="member_laddr" class="input" value="${member.member_laddr}"></td>
							</tr>
						</table>
					</form>
					<hr class="my-4">
					<div class="btn_box">
						<input type="button" class="m_button" onclick="myinfoUp()"
							value="수정하기" /> <input type="button" class="d_button"
							onclick="deleteMyinfo()" value="탈퇴하기" />
					</div>
				</div>
				<!-- 내가 구매한 글 목록 -->
				<div id="mypay" class="container tab-pane fade">
					<table class="table table-hover">
						<tr class="nav-item">
							<td>번호</td>
							<td>주문일자</td>
							<td>상품명</td>
							<td>결제금액</td>
							<td>사용여부</td>
							<!-- <td><i class="fas fa-trash-alt"></i></td> -->
						</tr>
						<!-- 마이페이지 "주문내역" -->
						<c:forEach begin="0" end="${(fn:length(map.mypL))}" var="i">
							<c:set var="row" value="${map.mypL[i]}" />
							<c:choose>
								<%-- 검색결과가 있을 때 --%>
								<c:when test="${not empty row}">
									<tr bgcolor="#fff" height="50">
										<td align="center">${row.payment_id}</td>
										<td>${row.payment_date}
										<td>${row.prd_name}</td>
										<%-- <fmt:formatNumber value="${row.prd_sum}" pattern="#,###"/> --%>
										<td><fmt:formatNumber value="${row.prd_sum}"
												pattern="#,###" />원</td>
										<td>${row.delivery}</td>
										<%-- <td><input type="checkbox" name="d_check" id="d_check"
											data-paymentNum="${row.payment_id}"></td> --%>
									</tr>
								</c:when>
								<%-- 검색결과가 없을 떄 --%>
								<c:when test="${map.count == 0}">
									<tr style="text-align: center;">
										<td colspan='5'><b>주문내역이 없습니다.</b></td>
									</tr>
								</c:when>
							</c:choose>
						</c:forEach>
					</table>
					<!-- 페이지 네비게이션 출력 -->
					<div align="center">
						<c:if test="${map.pager.curBlock > 1}">
							<a href="mypL?myp=1&member_id=${member_id}">[처음]</a>
						</c:if>
						<c:if test="${map.pager.curBlock > 1}">
							<a href="mypL?myp=${map.pager.prevPage}&member_id=${member_id}">[이전]</a>
						</c:if>
						<c:forEach var="num" begin="${map.pager.blockBegin}"
							end="${map.pager.blockEnd}">
							<c:choose>
								<c:when test="${num == map.pager.curPage}">
									<!-- 현재 페이지인 경우 하이퍼링크 제거 -->
									<span style="color: red;">${num}</span>
								</c:when>
								<c:otherwise>
									<a href="mypage?member_id=${member_id}&myp=${num}">${num}</a>
								</c:otherwise>
							</c:choose>
						</c:forEach>
						<c:if test="${map.pager.curBlock < map.pager.totBlock}">
							<a href="mypL?myp=${map.pager.nextPage}&member_id=${member_id}">[다음]</a>
						</c:if>
						<c:if
							test="${(map.pager.totPage > 5) && (map.pager.totPage != map.pager.curPage)}">
							<a href="mypL?myp=${map.pager.totPage}&member_id=${member_id}">[끝]</a>
						</c:if>
					</div>
					<hr class="my-4">
					<%-- <div class="btn_box">
						<button class="d_button" id="d_product"
							data-paymentNum="${row.payment_id}">삭제하기</button>
					</div> --%>
				</div>
			</div>
		</div>
	</div>
</body>
<%@include file="../include/csinfo.jsp"%>
</html>