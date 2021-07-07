<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE HTML>
<html lang="ko">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1.0, user-scalable=no" />
<title>상품등록</title>
<script src="http://code.jquery.com/jquery-latest.js"></script>
<script src="resources/js/product.js" charset="UTF-8"></script>
<script src="resources/ckeditor/ckeditor.js"></script>
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
<link rel="stylesheet" type="text/css"
	href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="stylesheet" href="resources/css/menu_bar.css">
<style>
table {
	width: 90%;
	margin-left: auto;
	margin-right: auto;
}

tr {
	margin-left: 20em;
}

#h2 {
	margin-top: 2em;
	border-bottom: 2px solid lightgray;
}

#insertProduct {
	border-radius: 20em;
	background-color: black;
	color: white;
}

#insertProduct:hover {
	background-color: gray;
	color: white;
}	
</style>
</head>
<%@ include file="../include/menu.jsp"%>
<body>
	<section class="probootstrap-cover overflow-hidden relative"
		style="background-image: url('resources/bs/assets/images/tr1.jpg'); padding: 8em;"
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
	<section>
		<h2 align="center" id="h2">상품등록</h2>
		<form id="fileForm" action="insertProduct" method="POST"
			enctype="multipart/form-data">
			<table style="margin-left: 5em; margin-bottom: 5em;">
				<tr>
					<th style="margin-right: 500px;">카테고리</th>
					<td><select name="cate_id" id="cate_id"
						style="width: 150px; height: 24px;">
							<option value="" selected>::선택::</option>
							<option value="CHE20180050">유럽</option>
							<option value="AWA20180060">아시아</option>
							<option value="ADF20180070">아프리카</option>
							<option value="PLA20180080">미국</option>
					</select></td>
				</tr>
				<tr>
					<th>품명</th>
					<td><input type="text" name="prd_name" id="prd_name" /></td>
				</tr>
				<tr>
					<th>물품번호</th>
					<td><input type="text" name="prd_id" id="prd_id" /> <input
						type="button" value="중복 확인" onclick="prdidChk()"
						id="insertProduct"><br /></td>
				</tr>
				<tr>
					<th>상품가격</th>
					<td><input type="text" name="prd_price" id="prd_price" /></td>
				</tr>
				<tr style="display: none;">
					<th>배송비</th>
					<td><input type="text" name="prd_delivery" id="prd_delivery" />
					</td>
				</tr>
				<tr style="display: none;">
					<th>재고</th>
					<td><input type="text" name="prd_stock" id="prd_stock" /></td>
				</tr>
				<tr style="display: none;">
					<th>상품옵션</th>
					<td><input type="text" name="prd_option" id="prd_option" /></td>
				</tr>
				<tr style="display: none;">
					<th>할인금액</th>
					<td><input type="text" name="prd_discount" id="prd_discount" />
					</td>
				</tr>
				<tr>
					<th>이미지</th>
					<td><input type="file" name="uploadFile" id="uploadFile" /></td>
				</tr>
				<tr>
					<th>상품 설명</th>
					<td><textarea name="prd_explain" id="prd_explain" cols="80"
							rows="75"></textarea> <script>
								CKEDITOR.replace('prd_explain', {});
							</script></td>
				</tr>
				<tr>
					<td colspan="2"><input type="button" value="물품등록"
						onclick="doInsertProduct()" style="float: right;"
						id="insertProduct" /></td>
				</tr>
			</table>
		</form>
	</section>
	<%@ include file="../include/csinfo.jsp"%>
</body>
</html>