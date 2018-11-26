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
				<form action="/user/userRegProc.do" id="valid" method="post">
				
					<!-- 회원명 -->
					<div class="input-group form-group">
						<div class="input-group-prepend">
							<span class="input-group-text"><i class="fas fa-user"></i></span>
						</div>
						<input type="text" class="form-control" name="userName" id="userName" placeholder="Username">
						
					</div>
					
					<!-- 유효성 검사 체크  -->
					<!-- 이메일 -->
					<div class="input-group form-group">
						<div class="input-group-prepend">
							<span class="input-group-text"><i class="fas fa-user"></i></span>
						</div>
						<input type="email" class="form-control" name="userEmail" id="userEmail" placeholder="Email address">
						
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
						<input type="password" class="form-control" name="Confirm-password" placeholder="Confirm-password">
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
	<%-- <%@include file="/WEB-INF/view/bootsearch.jsp" %> --%>
	
	<!-- 부트스트랩 board -->
	<%-- <%@include file="/WEB-INF/view/bootboard.jsp" %> --%>
	
	<!-- 부트스트랩 js -->
	<%@include file="/WEB-INF/view/bootjs.jsp" %>

<script>
	//유효성 검사
	$('#valid').click(function() {
				//id="formToController"인 form에서 id="valid"인 버튼을 눌렀을 때  
				var userName = $('input[name=userName]');		//input타입에 name="usrName"으로 입력된 값을 받음.
				var userEmail = $('input[name=userEmail]');		//input타입에 name="userEmail"으로 입력된 값을 받음.
				var userTel = $('input[name=userTel]');			//input타입에 name="userTel"으로 입력된 값을 받음.
				var pwd = $('input[name=password]');			//input타입에 name="password"으로 입력된 값을 받음.
				var confirmPwd = $('input[name=Confirm-password]');			//input타입에 name="Confirm-password"으로 입력된 값을 받음.
				var idBirth = $('input[name=idBirth]');			//input타입에 name="idBirth"으로 입력된 값을 받음.
				var idGender = $('input[name=idGender]');			//input타입에 name="idGender"으로 입력된 값을 받음.
				
				if (userName.val() == "") {
					alert("insert your name!");
					userName.focus();
					
					return false;
				}
				if (userEmail.val() == "") {
					alert("insert your email!");
					userEmail.focus();
					
					return false;
				}
				if (userTel.val() == "") {
					alert("insert your tel!");
					userTel.focus();
					return false;
				}
				if (pwd.val() == "") {
					alert("insert your pwd!");
					pwd.focus();
					return false;
				}
				if (confirmPwd.val() == "") {
					alert("insert your confirmPwd!");
					confirmPwd.focus();
					return false;
				}
				if (idBirth.val() == "") {
					alert("insert your idBirth!");
					idBirth.focus();
					return false;
				}
				if (idGender.val() == "") {
					alert("insert your idGender!");
					idGender.focus();
					return false;
				}
		//DB 회원명 유효성검사 ajax
		/* $.ajax({
			url:"/nameChk.do",
			method:"post",
			data:{
				"userName" : userName.val()
			},success:function(data){
				console.log(data);
				if(data != 0){
					alert('1 == 아이디가 중복됨')
					//1이면 DB에 겹치는 닉네임이 존재해서 중복으로 회원가입 못함. -> isUpd value값을 0(거짓==회원가입 불가)으로 바꿔줌.
					$('#isUpd').val('0');
					userName.focus();
					return false;
					
				}else{
					alert('0 == 아이디가 사용가능')
					//0이면 DB에 겹치는 닉네임이 없어서 회원가입 가능. -> isUpd valu값을 1(참==회원가입 가능)으로 바꿔줌.
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
				alert("failed Ajax");
			}
			
		}) */
		
	});
	
</script>
	
<script>	
	//userName과 userEmail DB 갔다오는 유효성 검사 ajax
	var userNameValid = false;
	var userEmailValid = false;
	
	$(document).ready(function(){
		/* $("#userName").blur(function(){
			alert();
			debugger;
			
			$.ajax({
				
				success: function(aaa,aa,aa){
					userNameValid = true;
				}
			});
			
		}); */
		
		$("#userName").change(function(a){
			
			var userName = $("#userName").val();
			
			$.ajax({
				
				url : "/nameChk.do",
				method : "post",
				data : {
					"userName" : userName
					
				}, success : function(data) {
					console.log(data + " == 닉네임 사용 가능");
					alert(data + " == 닉네임 사용 가능");
					
				}, error : function(e) {
					alert("nameAjax error");
					
				}
				
				
			})
			
			//debugger;
		});
		
		$("#userEmail").change(function(a){
			
			var userEmail = $("#userEmail").val();
			
			$.ajax({
				
				url : "/emailChk.do",
				method : "post",
				data : {
					"userEmail" : userEmail
					
				}, success : function(data) {
					console.log(data + " == 이메일 사용 가능");
					alert(data + " == 이메일 사용 가능");
					
				}, error : function(e) {
					alert("emailAjax error");
					
				}
				
				
			})
			
			//debugger;
		});
	});
	
	
</script>


</body>
</html>