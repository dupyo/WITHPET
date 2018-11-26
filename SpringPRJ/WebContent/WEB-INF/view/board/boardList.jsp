<%@page import="poly.dto.BoardDTO"%>
<%@page import="java.util.List"%>
<%@page import="poly.dto.UserDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%-- <% UserDTO uDTO = (UserDTO)session.getAttribute("uDTO"); %> --%>
<% List<BoardDTO> bList = (List<BoardDTO>)request.getAttribute("bList"); %>
<html>
<head>
<title>WITHPET - 게시판 리스트 페이지</title>
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
		<table border="1">
			<tr>
				<th>회원이름</th>
				<th>제목</th>
				<th>내용</th>
				<th>작성일</th>
			</tr>
			<%for (int i=0; i < bList.size(); i++) { %>
			<tr class="hoverBoy" style="cursor:pointer" onclick="location.href='/board/boardDetail.do?boardNo=<%=bList.get(i).getBoardNo()%>';">
				<td><%=bList.get(i).getUserName() %></td>
				<td><%=bList.get(i).getTitle() %></td>
				<td><%=bList.get(i).getContent() %></td>
				<td><%=bList.get(i).getRegDate() %></td>
			</tr>
			<%} %>
		</table>
	</div>
		<div style="height:50px;"></div>
		<div class="form-group" style="">
			<button class="btn float-right" onclick="location.href='/board/insertBoard.do';">write</button>
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