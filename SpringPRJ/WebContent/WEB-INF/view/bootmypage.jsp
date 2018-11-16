<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    
	<!-- mypage -->
	<section id="mypage">
		<div class="container">
			<div class="row">
				<div class="col-lg-12 text-center">
					<h2 class="section-heading text-uppercase">Mypage</h2>
					<h3 class="section-subheading text-muted">마이페이지입니다.</h3>
				</div>
			</div>
			
			<div class="row text-center">

<%-- 				<%if(uDTO != null) {%> --%>
				<div class="col-md-6" onclick="javascript:locaion.href='/board/boardList.do?userNo=<%-- <%=uDTO.getUserNO()%> --%>';">
					<span class="fa-stack fa-4x">
					<i class="fas fa-circle fa-stack-2x text-primary"></i>
					<i class="fas fa-user fa-stack-1x fa-inverse"></i>
					</span>
					<h4 class="service-heading">Edit profile</h4>
					<p class="text-muted">You could edit your profile.</p>
				</div>
				
				<div class="col-md-6">
					<span class="fa-stack fa-4x"> 
					<i class="fas fa-circle fa-stack-2x text-primary"></i> 
					<i class="fas fa-laptop fa-stack-1x fa-inverse"></i>
					</span>
					<h4 class="service-heading">My Favorite Center</h4>
					<p class="text-muted">Lorem ipsum dolor sit amet, consectetur adipisicing elit. Minima maxime quam architecto quo inventore harum ex magni, dicta impedit.</p>
				</div>
<%-- 				<%} else {%> --%>
<!-- 				<div class="col-md-6">
					<span class="fa-stack fa-4x"> 
					<i class="fas fa-circle fa-stack-2x text-primary"></i> 
					<i class="fas fa-laptop fa-stack-1x fa-inverse"></i>
					</span>
					<h4 class="service-heading">My Favorite Center</h4>
					<p class="text-muted">Lorem ipsum dolor sit amet, consectetur adipisicing elit. Minima maxime quam architecto quo inventore harum ex magni, dicta impedit.</p>
				</div> -->
				
<%-- 				<%} %> --%>
				
				
			</div>
		</div>
	</section>