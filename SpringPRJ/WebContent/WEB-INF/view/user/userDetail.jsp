<%@page import="poly.dto.UserDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%-- <% UserDTO uDTO = (UserDTO)session.getAttribute("uDTO"); %> --%>
<html>
<head>
<title>WITHPET - 회원정보 상세 페이지</title>
<!-- 부트스트랩 css -->
<%@include file="/WEB-INF/view/bootcss.jsp" %>

<script type="text/javascript">
	function delUserInfo() {
		location.href='/user/deleteUserProc.do';
	}
</script>	
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
					<th>회원이름</th><td><input type="text" name="userName" value="<%=uDTO.getUserName() %>"/></td>
				</tr>
				<tr>
					<th>회원이메일</th><td><input type="text" name="userEmail" value="<%=uDTO.getUserEmail() %>" readonly /></td>
				</tr>
				<tr>
					<th>회원연락처</th><td><input type="text" name="userTel" value="<%=uDTO.getUserTel() %>" readonly /></td>
				</tr>
				<tr>
					<th>새 비밀번호</th><td><input type="password" name="password" id="password" value="" placeholder="Password"/></td>
				</tr>
				<tr>
					<th>새 비밀번호 확인</th><td><input type="password" name="Confirm-password" value="" placeholder="Confirm-password"/></td>
				</tr>
				<tr>
					<th>가입일</th><td><input type="text" name="regDate" value="<%=uDTO.getRegDate() %>" readonly /></td>
				</tr>
				<tr>
					<th>생년월일</th><td><input type="text" name="idBirth" value="<%=uDTO.getBirthGender() %>" readonly /></td>
				</tr>
				<tr>
					<th>성별</th><td><input type="text" name="idGender" value="<%=uDTO.getBirthGender() %>" /></td>
				</tr>
			</table>
			<div style="height:50px;"></div>
			<div class="form-group" style="">
				<div style=""><!-- button 태그가 type="button"으로 설정되지 않고 form태그 안에 있으면 form태그의 action의 url을 타고 controller로 이동함. type="button"으로 설정되었을 경우 onclick을 탄다. -->
					<button type="button" class="btn float-right" onclick="delUserInfo()">delete</button>	<!-- modal 삭제 여부 모달 -->
				</div>
				<div style="">
					<button type="button" id="valid" class="btn float-right" style="">correct</button>
				</div>
				<input type="hidden" id="isUpd" value="0"/>
			</div>
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
	$('#valid').click(function() {
		//id="formToController"인 form에서 id="valid"인 버튼을 눌렀을 때  
		var userName = $('input[name=userName]');		//input타입에 name="usrName"으로 입력된 값을 받음.
		/* var userEmail = $('input[name=userEmail]');		//input타입에 name="userEmail"으로 입력된 값을 받음. */
		/* var userTel = $('input[name=userTel]');			//input타입에 name="userTel"으로 입력된 값을 받음. */
		var pwd = $('input[name=password]');			//input타입에 name="password"으로 입력된 값을 받음.
		var confirmPwd = $('input[name=Confirm-password]');			//input타입에 name="password"으로 입력된 값을 받음.
		if (userName.val() == "") {
			alert("name");
			userName.focus();
			
			return false;
		}
		/* if (userEmail.val() == "") {
			alert("email");
			userEmail.focus();
			
			return false;
		}
		if (userTel.val() == "") {
			alert("tel");
			userTel.focus();
			return false;
		} */
		if (pwd.val() == "") {
			alert("pwd");
			pwd.focus();
			return false;
		}
		if (confirmPwd.val() == "") {
			alert("Confirm-password");
			confirmPwd.focus();
			return false;
		}
		
		if(pwd.val() != confirmPwd.val()) {
			alert("invalid");
			confirmPwd.focus();
			return false;
		}
		
		$.ajax({
			url:"/mynameChk.do",
			method:"post",
			data:{
				"userName" : userName.val()
			},success:function(data){
				console.log(data);
				if(data != 0){
					alert('1 == 아이디가 중복됨')
					//1이면 DB에 겹치는 닉네임이 존재해서 중복으로 업데이트 못함. -> isUpd value값을 0(거짓==업데이트 불가)으로 바꿔줌.
					$('#isUpd').val('0');
					userName.focus();
					return false;
					
				}else{
					alert('0 == 아이디가 사용가능')
					//0이면 DB에 겹치는 닉네임이 없어서 업데이트 가능. -> isUpd valu값을 1(참==업데이트 가능)으로 바꿔줌.
					$('#isUpd').val('1');
					//form태그를 Controller로 submit함.
					$('#formToController').submit();
				}
				
				if('0'.equals($('#isUpd').val())) {
					alert("false")
				} else {
					alert("true")
				}
				
			},error:function(){
				alert("failed Ajax....");
			}
			
		})
		
	});
	
	
</script>
</body>
</html>
