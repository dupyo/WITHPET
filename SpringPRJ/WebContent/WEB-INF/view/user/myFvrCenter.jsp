<%@page import="poly.dto.UserDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%-- <% UserDTO uDTO = (UserDTO)session.getAttribute("uDTO"); %> --%>
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
	 	<form action="/user/updateUserInfoProc.do" id="f" method="post" class="form-group">
			<table border="1">
				<tr>
					<th>회원이름</th><td><input type="text" name="userName" value="<%=uDTO.getUserName() %>"/></td>
				</tr>
				<tr>
					<th>회원이메일</th><td><input type="text" name="userEmail" value="<%=uDTO.getUserEmail() %>"/></td>
				</tr>
				<tr>
					<th>회원연락처</th><td><input type="text" name="userTel" value="<%=uDTO.getUserTel() %>"/></td>
				</tr>
				<tr>
					<th>새 비밀번호</th><td><input type="password" name="password" id="password" value=""/></td>
				</tr>
				<tr>
					<th>새 비밀번호 확인</th><td><input type="password" name="password-confirm" value=""/></td>
				</tr>
				<tr>
					<th>가입일</th><td><%=uDTO.getRegDate() %></td>
				</tr>
				<tr>
					<th>생년월일</th><td><%=uDTO.getBirthGender() %></td>
				</tr>
				<tr>
					<th>성별</th><td><%=uDTO.getBirthGender() %></td>
				</tr>
			</table>
			<div style="height:50px;"></div>
			<div class="form-group" style="">
				<button type="button" id="valid" class="btn float-right" >correct</button>
				<input type="hidden" id="isUpd" value="0"/>
			</div>
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

<script>
		
		$('#valid').click(function() {
	
					var userName = $('input[name=userName]');
					var userEmail = $('input[name=userEmail]');
					var userTel = $('input[name=userTel]');
					var pwd = $('input[name=password]');
					if (userName.val() == "") {
						alert("name");
						userName.focus();
						
						return false;
					}
					if (userEmail.val() == "") {
						alert("email");
						userEmail.focus();
						
						return false;
					}
					if (userTel.val() == "") {
						alert("tel");
						userTel.focus();
						return false;
					}
					if (pwd.val() == "") {
						alert("pwd");
						pwd.focus();
						return false;
					}
			$.ajax({
				url:"/emailChk.do",
				method:"post",
				data:{
					"userEmail": userEmail.val()
				},success:function(data){
					console.log(data);
					if(data != 0){
						alert('1 == 아이디가 중복됨')
						//1이면 중복으로 업데이트 못함. upd value값을 0(거짓)으로 바꿔줌.
						$('#isUpd').val('0');
						userEmail.focus();
						return false;
						
					}else{
						alert('0 == 아이디가 사용가능')
						//1이면 업데이트 가능. upd value값을 1(참)으로 바꿔줌.
						$('#isUpd').val('1');
			$('#f').submit();
					}
					
					if($('#isUpd').val() == '0') {
						alert("false")
					} else {
						alert("true")
					}
					
				},error:function(){
					alert("failed Ajax~~!!");
				}
				
			})
			
		});
		
		
	
</script>
</body>
</html>
