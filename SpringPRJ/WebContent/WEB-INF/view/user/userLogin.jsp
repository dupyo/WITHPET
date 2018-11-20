<%@page import="poly.dto.UserDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%-- <% UserDTO uDTO = (UserDTO)session.getAttribute("uDTO"); %> --%>
<html>
<head>
<title>WITHPET - 로그인 페이지</title>
<!-- 부트스트랩 css -->
<%@include file="/WEB-INF/view/bootcss.jsp" %>
<!-- 부트스트랩 로그인 css -->
<%@include file="/WEB-INF/view/bootlogincss.jsp" %>
</head>
<body id="page-top" style="background-color:default">
<!-- 부트스트랩 nav -->
<%@include file="/WEB-INF/view/top.jsp" %>
<div class="container" style="padding-top:10%; padding-bottom:35%">
		
	<div style="height:150px"></div>
	
	<!-- 부트스트랩 로그인 템플릿 -->
	<div class="d-flex justify-content-center">
		<div class="card" style="height: 370px">
			<div class="card-header">
				<h3>Sign in</h3>
			</div>
			<div class="card-body">
				<form action="/user/userLoginProc.do" method="post">
					<!-- 회원명 또는 이메일 -->
					<div class="input-group form-group">
						<div class="input-group-prepend">
							<span class="input-group-text"><i class="fas fa-user"></i></span>
						</div>
						<input type="text" class="form-control" name="userNameOrEmail" placeholder="Username or Email">
						
					</div>
					<!-- 비밀번호 -->
					<div class="input-group form-group">
						<div class="input-group-prepend">
							<span class="input-group-text"><i class="fas fa-key"></i></span>
						</div>
						<input type="password" class="form-control" name="password" placeholder="Password">
					</div>
					
					
					<div class="row align-items-center remember">
						<input type="checkbox">Remember Me
					</div>
					
					<div class="form-group">
						<input type="submit" value="Login" class="btn float-right login_btn">
					</div>
					
				</form>
				
			</div>
			
			<div class="card-footer">
				<div class="d-flex justify-content-center links">
					Don't have an account?<a href="/user/userReg.do">Sign Up</a>
				</div>
				<div class="d-flex justify-content-center">
					<a href="#">Forgot your password?</a>
				</div>
			</div>
			
		</div>
	</div>
		
</div>
		
	
	<!-- 부트스트랩 mypage -->
	<%@include file="/WEB-INF/view/bootmypage.jsp" %>
	
	<!-- 부트스트랩 services -->
	<%@include file="/WEB-INF/view/bootservices.jsp" %>
	
	<!-- 부트스트랩 board -->
	<%@include file="/WEB-INF/view/bootboard.jsp" %>
	
	<!-- 부트스트랩 js -->
	<%@include file="/WEB-INF/view/bootjs.jsp" %>
	
</body>
</html>