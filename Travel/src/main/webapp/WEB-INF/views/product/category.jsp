<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1.0, user-scalable=no" />
<title>패키지목록</title>
<script src="http://code.jquery.com/jquery-latest.js"></script>
<link rel="stylesheet" type="text/css" href="resources/css/product.css">
<link rel="stylesheet" type="text/css"
	href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="stylesheet" href="resources/css/menu_bar.css">
<script>
	function list(cate_id, page) {
		location.href = "category?cate_id=" + cate_id + "&curPage=" + page;
	}
</script>
<style>
.img_div {
	margin-right: 2em;
}
</style>
</head>
<%@ include file="../include/menu.jsp"%>
<body>
	<section class="probootstrap-cover overflow-hidden relative"
		style="background-image: url('resources/img/list.jpg'); padding: 5em;"
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
	<div class="col-md-12">
		<h2 class="display-4 border-bottom probootstrap-section-heading">
			패키지 목록</h2>
	</div>
	<div id="pdc" style="margin-right: 37em;">
		<table id="product">
			<c:if test="${(fn:length(map.list)) eq 0}">
					상품내역이 없습니다.
				</c:if>
			<c:forEach begin="0" end="${(fn:length(map.list) + 3) / 4 - 1}"
				var="row">
				<tr>
					<c:forEach begin="0" end="3" var="col">
						<c:set var="item" value="${map.list[row * 4 + col]}" />
						<c:if test="${not empty item}">
							<td>
								<div onclick="location.href='productpage?prd_id=${item.prd_id}'"
									style="cursor: pointer" class="img_div">
									<div>
										<img src="${item.prd_img}" style="width: 20em;">
									</div>
									<div>${item.prd_name}</div>
									<div>
										<fmt:formatNumber value="${item.prd_price}"
											pattern="#,###,###" />
										원
									</div>
								</div>
							</td>
						</c:if>
					</c:forEach>
				</tr>
			</c:forEach>
			<c:if test="${(fn:length(map.list)) ne 0}">
				<tr>
					<td colspan="4" align="center"><c:if
							test="${map.pager.curBlock > 1}">
							<a href="#" onclick="list('${map.cate_id}', '1')">[처음]</a>
						</c:if> <c:if test="${map.pager.curBlock > 1}">
							<a href="#"
								onclick="list('${map.cate_id}', '${map.pager.prevPage}')">[이전]</a>
						</c:if> <c:forEach var="num" begin="${map.pager.blockBegin}"
							end="${map.pager.blockEnd}">
							<br>
							<br>
							<c:choose>
								<c:when test="${num == map.pager.curPage}">
									<span style="color: #6BA1FD; margin-right: 1.7em;">${num}</span>
								</c:when>
								<c:otherwise>
									<a href="#" onclick="list('${map.cate_id}', '${num}')">${num}</a>
								</c:otherwise>
							</c:choose>
						</c:forEach> <c:if test="${map.pager.curBlock < map.pager.totBlock}">
							<a href="#"
								onclick="list('${map.cate_id}', '${map.pager.nextPage}')">[다음]</a>
						</c:if> <c:if test="${map.pager.curBlock < map.pager.totPage}">
							<a href="#"
								onclick="list('${map.cate_id}', '${map.pager.totPage}')">[끝]</a>
						</c:if></td>
				</tr>
			</c:if>
		</table>
	</div>
	<%@ include file="../include/csinfo.jsp"%>
</body>
</html>