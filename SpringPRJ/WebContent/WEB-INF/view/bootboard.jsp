<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    
	<!-- Board -->
	<section id="board">
		<div class="container">
			<div class="row">
				<div class="col-lg-12 text-center">
					<h2 class="section-heading text-uppercase">Board</h2>
					<h3 class="section-subheading text-muted">게시판과 공지사항입니다.</h3>
				</div>
			</div>
			<div class="row text-center">
				
				<div class="col-md-6 hoverBoy" style="cursor:pointer" onclick="location.href='/board/boardList.do';">
					<span class="fa-stack fa-4x"> 
					<i class="fas fa-circle fa-stack-2x text-primary"></i>
					<i class="fas fa-comments fa-stack-1x fa-inverse"></i>
					</span>
					<h4 class="service-heading">Board</h4>
					<p class="text-muted">Board for communication with all users of Withpet.</p>
				</div>
				
				<div class="col-md-6 hoverBoy" style="cursor:pointer" onclick="location.href='/notice/noticeList.do';">
					<span class="fa-stack fa-4x"> 
					<i class="fas fa-circle fa-stack-2x text-primary"></i> 
					<i class="fas fa-list fa-stack-1x fa-inverse"></i>
					</span>
					<h4 class="service-heading">Notice</h4>
					<p class="text-muted">Notice that Manager informs.</p>
				</div>
				
			</div>
		</div>
	</section>