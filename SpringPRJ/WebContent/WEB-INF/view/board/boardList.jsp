<%@page import="poly.dto.BoardDTO"%>
<%@page import="java.util.List"%>
<%@page import="poly.dto.UserDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%-- <% UserDTO uDTO = (UserDTO)session.getAttribute("uDTO"); %> --%>
<% List<BoardDTO> bList = (List<BoardDTO>)request.getAttribute("bList"); %>
<html>
<head>
<title>WITHPET - 회원가입 페이지</title>
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
			<%for (int i=0; i < bList.size(); i++) { %>
			<tr>
				<td>
					<%=bList.get(i).getTitle() %>
					<%=bList.get(i).getUserName() %>
					<%=bList.get(i).getContent() %>
					<%=bList.get(i).getRegDate() %>
				</td>
			</tr>
			<%} %>
		</table>
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