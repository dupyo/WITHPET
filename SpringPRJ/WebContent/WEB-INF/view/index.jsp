<%@page import="poly.util.CmmUtil"%>
<%@page import="poly.dto.UserDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<html lang="">
<head>
<!-- 부트스트랩 css -->
<%@include file="bootcss.jsp" %>
<!-- 부트스트랩 로그인 css -->
<%-- <%@include file="bootlogincss.jsp" %> --%>
</head>

<body id="page-top">
<!-- 부트스트랩 nav -->
<%@include file="top.jsp" %>
	<!-- Header -->
	<header class="masthead">
		<div class="container">
			<div class="intro-text">
				<div class="intro-lead-in">Welcome To Withpet!</div>
				<div class="intro-heading text-uppercase">It's Nice To Meet You</div>
				<a class="btn btn-primary btn-xl text-uppercase js-scroll-trigger" href="#services">Tell Me More</a>
			</div>
		</div>
	</header>
<div class="container">
	

	<!-- 부트스트랩 mypage -->
	<%@include file="bootmypage.jsp" %>
	
	<!-- 부트스트랩 services -->
	<%@include file="bootservices.jsp" %>
	
	<!-- 부트스트랩 board -->
	<%@include file="bootboard.jsp" %>
</div>
	<!-- 부트스트랩 js -->
	<%@include file="bootjs.jsp" %>
</body>
</html>