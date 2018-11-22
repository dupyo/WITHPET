<%@page import="poly.dto.UserDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%-- <% UserDTO uDTO = (UserDTO)session.getAttribute("uDTO"); %> --%>
<html>
<head>
<title>WITHPET - 회원가입 페이지</title>
<!-- 부트스트랩 css -->
<%@include file="/WEB-INF/view/bootcss.jsp" %>
<!-- 부트스트랩 로그인 템플릿 css -->
<%@include file="/WEB-INF/view/bootlogincss.jsp" %>
</head>
<body id="page-top">
	<!-- 부트스트랩 nav -->
	<%@include file="/WEB-INF/view/top.jsp" %>
<div class="container">

	<div style="height:150px"></div>
	
	<!-- 부트스트랩 회원가입 템플릿 -->
	<div class="d-flex justify-content-center">
		<div class="card" style="height: 540px">
			<div class="card-header">
				<h3>Sign up</h3>
			</div>
			<div class="card-body">
				<form action="/user/userRegProc.do" method="post">
				
					<!-- 회원명 -->
					<div class="input-group form-group">
						<div class="input-group-prepend">
							<span class="input-group-text"><i class="fas fa-user"></i></span>
						</div>
						<input type="text" class="form-control" name="userName" placeholder="Username">
						
					</div>
					
					<!-- 이메일 -->
					<div class="input-group form-group">
						<div class="input-group-prepend">
							<span class="input-group-text"><i class="fas fa-user"></i></span>
						</div>
						<input type="text" class="form-control" name="userEmail" placeholder="Email address">
						
					</div>
					
					<!-- 회원연락처 -->
					<div class="input-group form-group">
						<div class="input-group-prepend">
							<span class="input-group-text"><i class="fas fa-phone"></i></span>
						</div>
						<input type="text" class="form-control" name="userTel" placeholder="Tel ex) 010-1234-5678">
						
					</div>

					<!-- 비밀번호 -->
					<div class="input-group form-group">
						<div class="input-group-prepend">
							<span class="input-group-text"><i class="fas fa-key"></i></span>
						</div>
						<input type="password" class="form-control" name="password" placeholder="Password">
					</div>

					<!-- 비밀번호 확인 -->
					<div class="input-group form-group">
						<div class="input-group-prepend">
							<span class="input-group-text"><i class="fas fa-key"></i></span>
						</div>
						<input type="password" class="form-control" name="retype-password" placeholder="Retype-password">
					</div>
					
					<!-- 생년월일과성별 -->
					<div class="input-group form-group">
						<div class="input-group-prepend">
							<span class="input-group-text"><i class="fas fa-user"></i></span>
						</div>
						<input type="text" class="form-control" name="idBirth" placeholder="ex) 990923">-<input type="text" class="form-control" name="idGender" placeholder="man:1, woman:2">
						
					</div>

					<div class="form-group">
						<input type="submit" value="Sign up" class="btn float-right login_btn">
					</div>
					
				</form>
				
			</div>
			
			<div class="card-footer">
				<div class="d-flex justify-content-center links">
					Do have your account?<a href="/user/userLogin.do">Sign in</a>
				</div>
				<div class="d-flex justify-content-center">
					<a href="#">Forgot your password?</a>
				</div>
			</div>
			
		</div>
	</div>
		
</div>

	<!-- 부트스트랩 mypage -->
	<%-- <%@include file="/WEB-INF/view/bootmypage.jsp" %> --%>
	
	<!-- 부트스트랩 services -->
	<%-- <%@include file="/WEB-INF/view/bootservices.jsp" %> --%>
	
	<!-- 부트스트랩 board -->
	<%-- <%@include file="/WEB-INF/view/bootboard.jsp" %> --%>
	
	<!-- 부트스트랩 js -->
	<%@include file="/WEB-INF/view/bootjs.jsp" %>
	
</body>
</html>