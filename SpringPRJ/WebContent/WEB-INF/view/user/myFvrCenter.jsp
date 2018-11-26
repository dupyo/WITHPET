<%@page import="poly.dto.UserDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%-- <% UserDTO uDTO = (UserDTO)session.getAttribute("uDTO"); %> --%>
<html>
<head>
<title>WITHPET - 게시판 리스트 페이지</title>
<!-- 부트스트랩 css -->
<%@include file="/WEB-INF/view/bootcss.jsp" %>
	

</head>
<body>
	<!-- 부트스트랩 nav -->
	<%@include file="/WEB-INF/view/top.jsp" %>
<div class="container" style="height: 120%;">

	<div style="height:150px"></div>
	
	<!-- 부트스트랩 회원가입 템플릿 -->
	<div class="d-flex justify-content-center form-group">
	 	<form action="/user/updateUserInfoProc.do" id="formToController" method="post" class="form-group">
			<table border="1">
				<tr>
					<th>센터/상정번호</th>
					<th>센터/상정명</th>
					<th>주소</th>
					<th>영업상태</th>
				</tr>
				<%-- <% for () {%>
				<tr>
					<td></td>
				</tr>
				<tr>
					<td>
					<div class="" style="">
						<a class="btn float-right" href="/center/deleteMyFvrCenterProc.do">삭제</a>
						<input type="hidden" id="isUpd" value="0"/>
					</div>
					</td>
				<tr>
				<%}%> --%>
			</table>
			<div style="height:50px;"></div>
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

<script>
	//유효성 검사
	/* $('#valid').click(function() {
				//id="formToController"인 form에서 id="valid"인 버튼을 눌렀을 때  
				var userName = $('input[name=userName]');		//input타입에 name="usrName"으로 입력된 값을 받음.
				var userEmail = $('input[name=userEmail]');		//input타입에 name="userEmail"으로 입력된 값을 받음.
				var userTel = $('input[name=userTel]');			//input타입에 name="userTel"으로 입력된 값을 받음.
				var pwd = $('input[name=password]');			//input타입에 name="password"으로 입력된 값을 받음.
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
			url:"/nameAndEmailChk.do",
			method:"post",
			data:{
				"userEmail" : userEmail.val(),
				"userName" : userName.val()
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
		$('#formToController').submit();
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
		
	}); */
		
		
	
</script>
</body>
</html>
