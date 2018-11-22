<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
	<script>
	$(function() {
		
		$('#valid').click(function() {
			var userName = $('input[name=userName]');
			var userEmail = $('input[name=userEmail]');
			var userTel = $('input[name=userTel]');
			var pwd = $('input[name=password]');
			
			if (userName.val() == "") {
				alert("no");
				userName.focus();
				return false;
			}
			if (userEmail.val() == "") {
				alert("no");
				userEmail.focus();
				return false;
			}
			if (userTel.val() == "") {
				alert("no");
				userTel.focus();
				return false;
			}
			if (pwd.val() == "") {
				alert("no");
				pwd.focus();
				return false;
			}
			
			//
			$.ajax({
				url:"/emailChk.do",
				method:"post",
				data:{
					"userEmail": userEmail.val()
				},
				success:function(data){
					console.log(data);
					
				},
				error:function(data){
					
				}
			})
			
		})
	}) 
</script>
</head>
<body>
	<table border="1">
				<tr>
					<th>회원이름</th><td><input type="text" name="userName" /></td>
				</tr>
				<tr>
					<th>회원이메일</th><td><input type="text" name="userEmail" /></td>
				</tr>
				<tr>
					<th>회원연락처</th><td><input type="text" name="userTel" /></td>
				</tr>
				<tr>
					<th>새 비밀번호</th><td><input type="password" name="password" id="password" /></td>
				</tr>
				<tr>
					<th>새 비밀번호 확인</th><td><input type="password" name="password-confirm" /></td>
				</tr>
			</table>
	<input type="button" id="valid" value="correct" class="btn float-right" />

</body>
</html>