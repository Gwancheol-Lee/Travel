<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<link rel="stylesheet" href="resources/css/menu_bar.css">


<section class="probootstrap-cover overflow-hidden relative"
	style="background-image: url('resources/bs/assets/images/tr1.jpg'); padding: 14em;"
	data-stellar-background-ratio="0.5" id="section-home">
	<div class="overlay"></div>
	<div class="container">
		<div class="row align-items-center text-center">
			<div class="col-md">
				
		<h2 class="heading mb-2 display-4 font-light probootstrap-animate">Travel
					is my Life!</h2>
				<p class="lead mb-5 probootstrap-animate">환영합니다 ! 원하는 여행지를 골라보세요</p>
				<form class="ml-3 my-auto w-50 d-inline-block order-1">
					<div class="input-group" style="margin-bottom:5em;"> 
						<input type="text" class="form-control border border-right-0"
							placeholder="검색어를 입력하세요" name="sPrd" id="sPrd"
							onkeypress="if(event.keyCode == 13) {searchPrd(); return;}">
						<span class="input-group-append">
							<button class="searchBtn btn-outline-light border border-left-0"
								type="button" onclick="searchPrd()" style="cursor: pointer"
								id="searchBtn">
								<i class="fa fa-search"></i>
							</button>
						</span>
					</div> 
					<ul class="nav nav-pills nav-fill">
						<li class="nav-item"><a class="nav-link"
							href="category?cate_id=CHE20180050">유럽</a></li>
						<li class="nav-item"><a class="nav-link" href="#">아시아</a></li>
						<li class="nav-item"><a class="nav-link" href="#">아프리카</a></li>
						<li class="nav-item"><a class="nav-link" href="#">미국</a></li>
					</ul>
				</form>
			</div>
		</div>
	</div>
</section>
<!-- END section -->
</html>