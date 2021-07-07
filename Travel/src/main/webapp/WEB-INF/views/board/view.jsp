<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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
<link rel="stylesheet" type="text/css"
	href="resources/bs/assets/css/boardView.css">

<script>
	// 게시물 삭제 확인
	var board
	function deleteB() {
		swal({
			icon : "warning",
			text : "정말 게시글을 삭제하시겠습니까?",
			closeOnClickOutside : false,
			closeOnEsc : false,
			buttons : [ "돌아가기", "삭제하기" ],
		}).then(function(isConfirm) {
			if (isConfirm) {
				swal('삭제 완료!', '게시글을 삭제했습니다.', 'success').then(function(isConfirm) {
					location.href = 'delete?bno=' + ${board.bno};
				});
			}
		});
	}
</script>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" type="text/css"
	href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="stylesheet" href="resources/css/menu_bar.css">
<title>${board.title}</title>
<style>
#h3, #h5, #h6 {
	text-align: center;
	color: white;
}

#h5 {
	margin-top: 2em;
}

#h6 {
	font-size: 16px;
}
</style>
</head>
<%@ include file="../include/menu.jsp"%>
<body>

	<section class="probootstrap-cover2 overflow-hidden relative"
		data-stellar-background-ratio="0.5" id="section-home">
	<div class="overlay"></div>
	</section>
	<center>
		<div style="width: 900px;">

			<script>
				$("#list_btn").click(function() {
					self.location = "board?"
							+ "searchOption=${searchOption}&keyword=${keyword}"
							+ "&search=${search}&curPage=${curPage}";
				});
			</script>

			<br /> <br />
			<form>
				<!-- 수정,삭제에 필요한 글번호를 hidden 태그에 저장 -->
				<input type="hidden" name="bno" value="${board.bno}">
				<table class="box">
					<colgroup>
						<col width="15%" />
						<col width="35%" />
						<col width="15%" />
						<col width="35%" />
					</colgroup>
					<tr>
						<th scope="row">제목</th>
						<td>${board.title}</td>
						<th scope="row">조회수</th>
						<td>${board.viewcnt}</td>
					</tr>
					<tr>
						<th scope="row">작성자</th>
						<td>${board.writer}</td>
						<th>작성일</th>
						<td>${board.regdate}</td>
					</tr>
					<tr class="content">
						<td colspan="4">${board.content }</td>
					</tr>
				</table>
			</form>
			<div style="margin-top: 10px; margin-bottom: 20px;">
				<div align="center" style="float: left; margin-left: 3.6em;">
					<c:if test="${map.previousB != null}">
						<button class="previous"
							onClick="location.href='view?bno=${map.previousB.bno}&show=Y'">이전글</button>
					</c:if>
					<c:if test="${map.nextB != null}">
						<button class="next"
							onClick="location.href='view?bno=${map.nextB.bno}&show=Y'">다음글</button>
					</c:if>
				</div>

				<div style="float: right; margin-right: 3.6em;">
					<!-- 관리자만 공지 -->
					<c:if test="${member.member_id eq 'Administrator'}">
						<a href="write">글쓰기</a>&nbsp;&nbsp;&nbsp;
		</c:if>
					<!-- 본인만 수정,삭제 버튼 표시 -->
					<c:if test="${member.member_id == board.writer}">
						<a href="updateWrite">수정</a>&nbsp;&nbsp;&nbsp;
			<a href="#" onClick="deleteB()">삭제</a>&nbsp;&nbsp;&nbsp;
		</c:if>
					<button type="button" id="list_btn" onClick="location.href='board'">목록</button>
					
				</div>
			</div>
		</div>

		<br /> <br /> <br />
		<!-- 현재 글을 기준으로 이전글,다음글 리스트 -->
		<div align="center" style="margin-bottom: 50px;">
			<table class="simpleView" width="800px">
				<c:if test="${map.previousB != null}">
					<tr class="a">
						<td onClick="location.href='view?bno=${map.previousB.bno}&show=Y'"
							style="cursor: pointer; width: 100px; padding-left: 20px;">이전글</td>
						<td onClick="location.href='view?bno=${map.previousB.bno}&show=Y'"
							style="cursor: pointer; width: 400px;">${map.previousB.title}</td>
						<td class="tdS" style="width: 150px; text-align: center;">${map.previousB.writer}
						</td>
						<td class="tdS" style="width: 150px; text-align: center;">${map.previousB.regdate}</td>
					</tr>
				</c:if>
				<c:if test="${map.nextB != null}">
					<tr class="b">
						<td onClick="location.href='view?bno=${map.nextB.bno}&show=Y'"
							style="cursor: pointer">다음글</td>
						<td onClick="location.href='view?bno=${map.nextB.bno}&show=Y'"
							style="cursor: pointer; width: 400px;">${map.nextB.title}</td>
						<td class="tdS">${map.nextB.writer}</td>
						<td class="tdS">${map.nextB.regdate}</td>
					</tr>
				</c:if>
			</table>
		</div>
	</center>
	<%@ include file="../include/csinfo.jsp"%>
</body>
</html>