<%@page import="poly.dto.BoardDTO"%>
<%@page import="poly.dto.UserDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%-- <% UserDTO uDTO = (UserDTO)session.getAttribute("uDTO"); %> --%>
<% BoardDTO bDTO = (BoardDTO)request.getAttribute("bDTO"); %>
<html>
<head>
<title>WITHPET - 게시물 상세 페이지</title>
<!-- 부트스트랩 css -->
<%@include file="/WEB-INF/view/bootcss.jsp" %>

<script type="text/javascript">
	function delBoardInfo(boardNo) {
		location.href='/board/deleteBoardProc.do?boardNo='+boardNo;
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
	 	<form action="/user/updateBoardProc.do" id="formToController" method="post" class="form-group">
			<table border="1">
				<tr>
					<%if (bDTO.getUserNo().equals(uDTO.getUserNo())) {%>
					<th>제목</th><td><input type="text" name="title" value="<%=bDTO.getTitle() %>" /></td>
					<%} else { %>
					<th>제목</th><td><input type="text" name="title" value="<%=bDTO.getTitle() %>" readonly/></td>
					<%} %>
				</tr>
				<tr>
					<th>작성자</th><td><input type="text" name="userName" value="<%=bDTO.getUserName() %>" readonly/></td>
				</tr>
				<tr>
					<th>조회수</th><td><input type="text" name="count" value="<%=bDTO.getCount() %>"/></td>
				</tr>
				<tr>
					<th>작성일</th><td><input type="text" name="regDate" value="<%=bDTO.getRegDate() %>" readonly /></td>
				</tr>
				<tr>
					<%if (bDTO.getUserNo().equals(uDTO.getUserNo())) {%>
					<th>내용</th><td><textarea name="content" id=""><%=bDTO.getContent() %></textarea></td>
					<%} else { %>
					<th>내용</th><td><textarea name="content" id="" readonly><%=bDTO.getContent() %></textarea></td>
					<%} %>
				</tr>
			</table>
			<div style="height:50px;"></div>
			<div class="form-group" style="">
				<div style=""><!-- button 태그가 type="button"으로 설정되지 않고 form태그 안에 있으면 form태그의 action의 url을 타고 controller로 이동함. type="button"으로 설정되었을 경우 onclick을 탄다. -->
					<button type="button" class="btn float-right" onclick="delBoardInfo('<%=bDTO.getBoardNo()%>')">delete</button>	<!-- modal 삭제 여부 모달 -->
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
		var title = $('input[name=title]');		//input타입에 name="title"으로 입력된 값을 받음.
		var content = $('input[name=content]');			//input타입에 name="content"으로 입력된 값을 받음.
		
		if (title.val() == "") {
			alert("title");
			title.focus();
			return false;
		}
		if (content.val() == "") {
			alert("content");
			content.focus();
			return false;
		}
		
		$('#formToController').submit();
		
		/* $.ajax({
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
			
		}) */
		
	});
	
	
</script>
</body>
</html>
