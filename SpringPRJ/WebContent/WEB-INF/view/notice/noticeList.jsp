<%@page import="poly.dto.BoardDTO"%>
<%@page import="java.util.List"%>
<%@page import="poly.dto.UserDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%-- <% UserDTO uDTO = (UserDTO)session.getAttribute("uDTO"); %> --%>
<% List<BoardDTO> nList = (List<BoardDTO>)request.getAttribute("nList"); %>
<html>
<head>
<title>WITHPET - 공지사항 리스트 페이지</title>
<!-- 부트스트랩 css -->
<%@include file="/WEB-INF/view/bootcss.jsp" %>
<!-- 부트스트랩 로그인 템플릿 css -->
<%@include file="/WEB-INF/view/bootlogincss.jsp" %>
</head>
<body>
	<!-- 부트스트랩 nav -->
	<%@include file="/WEB-INF/view/top.jsp" %>
<div class="container">

	<div style="height:150px"></div>
	
	<!-- 부트스트랩 회원가입 템플릿 -->
	<div class="d-flex justify-content-center">
		<table border="1">
			<tr>
				<th>회원이름</th>
				<th>제목</th>
				<th>내용</th>
				<th>작성일</th>
			</tr>
			<%for (int i=0; i < nList.size(); i++) { %>
			<tr>
				<td><%=nList.get(i).getUserName() %></td>
				<td><%=nList.get(i).getTitle() %></td>
				<td><%=nList.get(i).getContent() %></td>
				<td><%=nList.get(i).getRegDate() %></td>
			</tr>
			<%} %>
		</table>
	</div>
		<div style="height:50px;"></div>
		<div class="form-group" style="">
			<form action="/notice/insertNotice.do" method="post">
				<input type="button" value="write" class="btn float-right">
			</form>
		</div>
		
</div>

	<!-- 부트스트랩 mypage -->
	<%@include file="/WEB-INF/view/bootmypage.jsp" %>
	
	<!-- 부트스트랩 services -->
	<%@include file="/WEB-INF/view/bootsearch.jsp" %>
	
	<!-- 부트스트랩 board -->
	<%@include file="/WEB-INF/view/bootboard.jsp" %>
	
	<!-- 부트스트랩 js -->
	<%@include file="/WEB-INF/view/bootjs.jsp" %>
</body>
</html>