<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	
<style>

</style>	
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

				<div class="col-md-6 hoverBoy" style="cursor:pointer" onclick="location.href='/user/userDetail.do';">
					<span class="fa-stack fa-4x">
					<i class="fas fa-circle fa-stack-2x text-primary"></i>
					<i class="fas fa-address-card fa-stack-1x fa-inverse"></i>
					</span>
					<h4 class="service-heading">Edit profile</h4>
					<p class="text-muted">You could edit your profile.</p>
				</div>
				
				<div class="col-md-6 hoverBoy" style="cursor:pointer" onclick="location.href='/user/myFvrCenter.do';">
					<span class="fa-stack fa-4x"> 
					<i class="fas fa-circle fa-stack-2x text-primary"></i> 
					<i class="fas fa-store fa-stack-1x fa-inverse"></i>
					</span>
					<h4 class="service-heading">My Favorite Center</h4>
					<p class="text-muted">My favorite center.</p>
				</div>
				
				
			</div>
		</div>
	</section>