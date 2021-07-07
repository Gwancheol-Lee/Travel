<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page isErrorPage="true"%>
<%
	response.setStatus(200);
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
</head>
<body>
	<div align="center" style="margin: 70px;">
		<img src="resources/bs/assets/images/error.png"
			style="width: 180px; height: 168px;">
		<h2>죄송합니다. 요청하신 페이지를 찾을 수 없습니다.</h2>
		<p>방문하시려는 페이지의 주소가 잘못 입력되었거나</p>
		<p>페이지의 주소가 변경 혹은 삭제되어 요청하신 페이지를 찾을 수 없습니다.</p>
		<p>입력하신 주소가 정확한지 다시 한번 확인해 주시기 바랍니다.</p>
		<br> <a href="main">[메인 홈 바로가기]</a>
	</div>
</body>
