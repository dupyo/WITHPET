<%@page import="poly.dto.UserDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%-- <%if (session.getAttribute("uDTO") == null) {%>
<% UserDTO uDTO = new UserDTO(); %>
<%} else { %>
<% UserDTO uDTO = (UserDTO)session.getAttribute("uDTO"); %>
<%} %> --%>
<% UserDTO uDTO = (UserDTO)session.getAttribute("uDTO"); %>

<!-- bootstrap font -->
<style type="html/css">
@font-face {
 font-family: NANUMSQUAREB;
 src: url('/resources/fonts/NANUMSQUAREB.TTF') format('truetype');
}
</style>
	<!-- Navigation -->
	<nav class="navbar navbar-expand-lg navbar-dark fixed-top" id="mainNav">
		<div class="container">
			<a class="navbar-brand js-scroll-trigger" style="font-family: NANUMSQUAREB; font-weight: 300; font-size: 15px;" href="#page-top"><span class="caret">▲</span></a>
			<button class="navbar-toggler navbar-toggler-right" type="button" data-toggle="collapse" data-target="#navbarResponsive"
				aria-controls="navbarResponsive" aria-expanded="false"aria-label="Toggle navigation">Menu<i class="fas fa-bars"></i>
			</button>
					 <%if (uDTO != null) {%>
						<a style="font-family: NANUMSQUARER; font-weight: 300; font-size: 15px; color:red" ><%=uDTO.getUserName() %>님 환영합니다.</a>
					<%} %>
			<div class="collapse navbar-collapse" id="navbarResponsive">
				<ul class="navbar-nav text-uppercase ml-auto">
					<li class="nav-item"><a class="nav-link js-scroll-trigger" href="#mypage">MyPage</a></li>
					<li class="nav-item"><a class="nav-link js-scroll-trigger" href="#services">Search</a></li>
					<li class="nav-item"><a class="nav-link js-scroll-trigger" href="#board">Board</a></li>
					<li class="nav-item">
					 <%if (uDTO == null) {%>
						<a class="nav-link js-scroll-trigger" href="/user/userLogin.do">Sign in</a>
					 <%} else { %>
						<a class="nav-link js-scroll-trigger" href="/user/userLogoutProc.do">Sign out</a>
					<%} %>
					</li>
				</ul>
			</div>
		</div>
	</nav>