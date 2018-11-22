<%@page import="poly.dto.BoardDTO"%>
<%@page import="java.util.List"%>
<%@page import="poly.dto.UserDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%-- <% UserDTO uDTO = (UserDTO)session.getAttribute("uDTO"); %> --%>
<html>
<head>
<title>WITHPET - 게시물 작성 페이지</title>
<!-- 부트스트랩 css -->
<%@include file="/WEB-INF/view/bootcss.jsp" %>
<!-- 부트스트랩 로그인 템플릿 css -->
<%@include file="/WEB-INF/view/bootlogincss.jsp" %>
</head>
<body>
	<!-- 부트스트랩 nav -->
	<%@include file="/WEB-INF/view/top.jsp" %>
	
<div class="container" style="height: 120%;">

	<div style="height:150px"></div>
	
	<!-- 부트스트랩 회원가입 템플릿 -->
	<div class="d-flex justify-content-center form-group">
		<form action="/board/insertBoardProc.do" method="post">
			<table border="1">
				<tr><th>제목</th></tr>
				<tr><td><input type="text" name="title" value="" placeholder="title"/></td></tr>
				<tr><th>내용</th></tr>
				<tr><td><textarea name="content" rows="10" placeholder="content"></textarea></td></tr>
			</table>
			<div style="height:50px;"></div>
			<input type="submit" value="submit" class="btn float-right" onclick="location.href='/board/insertBoardProc.do';">
		</form>
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