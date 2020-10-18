<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<link href="http://fonts.googleapis.com/css?family=Source+Sans+Pro:200,300,400,600,700,900" rel="stylesheet" />
	<link href="/res/css/template/mainTemplate.css" rel="stylesheet" type="text/css" media="all" />
	<link href="/res/css/template/mainTemplateFonts.css" rel="stylesheet" type="text/css" media="all" />
	<link href="/res/css/${css}.css" rel="stylesheet" type="text/css" media="all" />
	<title>PCria</title>
	</head>
<body>
<div id="container">
<div id="header-wrapper">
	<div id="header" class="container">
		<div id="logo">
			<h1><a href="/main/seat">🎮🕹PCria</a></h1>
		</div>
		<div id="menu">
			<ul>
				<li class="current_page_item"><a href="#" accesskey="1" title="">좌석 예약</a></li>
				<li><a href="#" accesskey="2" title="">시간 예약</a></li>
				<li><a href="#" accesskey="3" title="">메뉴 예약</a></li>
				<li><a href="#" accesskey="4" title="">내 정보</a></li>
				<li><a href="#" accesskey="5" title="">프로필</a></li>
			</ul>
		</div>
	</div>
</div>
<div id="section"><jsp:include page="/WEB-INF/views/${view}.jsp"/></div>
<div id="footer-wrapper">
	<div id="copyright" class="container">
	<p>© 2020 PCria Co., Ltd. All rights reserved.</p>
</div>
</div>
</div>
</body>
</html>
