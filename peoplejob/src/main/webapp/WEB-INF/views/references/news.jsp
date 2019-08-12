<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="../main/inc/top.jsp" %>
<!DOCTYPE html>
<html lang="en">
<head>
	<title>Blog List Sidebar v1</title>
	<meta charset="UTF-8">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="<c:url value='/resources/main/vendor/bootstrap/css/bootstrap.min.css'/>">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="<c:url value='/resources/main/fonts/fontawesome-5.0.8/css/fontawesome-all.min.css'/>">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="<c:url value='/resources/main/fonts/iconic/css/material-design-iconic-font.min.css'/>">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="<c:url value='/resources/main/vendor/animate/animate.css'/>">
<!--===============================================================================================-->	
	<link rel="stylesheet" type="text/css" href="<c:url value='/resources/main/vendor/css-hamburgers/hamburgers.min.css'/>">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="<c:url value='/resources/main/vendor/animsition/css/animsition.min.css'/>">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="<c:url value='/resources/main/css/util.min.css'/>">
<!--===============================================================================================-->	
	<link rel="stylesheet" type="text/css" href="<c:url value='/resources/main/css/main.css'/>">
<!--===============================================================================================-->
<link href="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<script src="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/js/bootstrap.min.js"></script>
<script src="//code.jquery.com/jquery-1.11.1.min.js"></script>
</head>
<body class="animsition">
	

	<!-- Page heading -->
	<div class="container p-t-4 p-b-40">
		<h2 class="f1-l-1 cl2">
			취업 뉴스
		</h2>
	</div>

	<!-- Post -->
	<section class="bg0 p-b-55">
		<div class="container">
			<div class="row justify-content-center">
				<div class="p-b-80">
					<div class="p-r-10 p-r-0-sr991">
						<div class="m-t--40 p-b-40">
						
						<!-- Item post -->
							<div class="flex-wr-sb-s p-t-40 p-b-15 how-bor2">
								<a href="<c:url value='/references/news_detail.do'/>" class="size-w-8 wrap-pic-w hov1 trans-03 w-full-sr575 m-b-25">
									<img src="<c:url value='/resources/main/images/news11.jpg'/>" alt="IMG">
								</a>

								<div class="size-w-9 w-full-sr575 m-b-25">
									<h5 class="p-b-12">
										<a href="<c:url value='/references/news_detail.do'/>" class="f1-l-1 cl2 hov-cl10 trans-03 respon2">
											인문계 '서비스직' vs 이공계 'IT.연구개발직'
										</a>
									</h5>

									<div class="cl8 p-b-18">
										<a href="#" class="f1-s-4 cl8 hov-cl10 trans-03">
											by PEOPLEJOB
										</a>

										<span class="f1-s-3 m-rl-3">
											-
										</span>

										<span class="f1-s-3">
											2019-05-13
										</span>
									</div>

									<p class="f1-s-1 cl6 p-b-24">
									전공별 취업희망 직무 달라, 구직자 취업희망 산업, 여성 '서비스업' vs 남성 '제조.생산업'
									</p>

									<a href="<c:url value='/references/news_detail.do'/>" class="f1-s-1 cl9 hov-cl10 trans-03">
										Read More
										<i class="m-l-2 fa fa-long-arrow-alt-right"></i>
									</a>
								</div>
							</div>
							<!-- Item post -->
							<div class="flex-wr-sb-s p-t-40 p-b-15 how-bor2">
								<a href="<c:url value='/references/news_detail.do'/>" class="size-w-8 wrap-pic-w hov1 trans-03 w-full-sr575 m-b-25">
									<img src="<c:url value='/resources/main/images/news1.jpg'/>" alt="뉴스이미지1">
								</a>

								<div class="size-w-9 w-full-sr575 m-b-25">
									<h5 class="p-b-12">
										<a href="<c:url value='/references/news_detail.do'/>" class="f1-l-1 cl2 hov-cl10 trans-03 respon2">
											평균 연봉 8위가 ‘삼성전자’, 1위 기업은 어디? 
										</a>
									</h5>

									<div class="cl8 p-b-18">
										<a href="#" class="f1-s-4 cl8 hov-cl10 trans-03">
											by PEOPLEJOB
										</a>

										<span class="f1-s-3 m-rl-3">
											-
										</span>

										<span class="f1-s-3">
											2019-07-01
										</span>
									</div>

									<p class="f1-s-1 cl6 p-b-24">
										취업뉴스1
									</p>

									<a href="<c:url value='/references/news_detail.do'/>" class="f1-s-1 cl9 hov-cl10 trans-03">
										Read More
										<i class="m-l-2 fa fa-long-arrow-alt-right"></i>
									</a>
								</div>
							</div>

							<!-- Item post -->
							<div class="flex-wr-sb-s p-t-40 p-b-15 how-bor2">
								<a href="<c:url value='/references/news_detail.do'/>" class="size-w-8 wrap-pic-w hov1 trans-03 w-full-sr575 m-b-25">
									<img src="<c:url value='/resources/main/images/news6.jpg'/>" alt="IMG">
								</a>

								<div class="size-w-9 w-full-sr575 m-b-25">
									<h5 class="p-b-12">
										<a href="<c:url value='/references/news_detail.do'/>" class="f1-l-1 cl2 hov-cl10 trans-03 respon2">
											상반기 채용 '서비스업종' 가장 많아
										</a>
									</h5>

									<div class="cl8 p-b-18">
										<a href="#" class="f1-s-4 cl8 hov-cl10 trans-03">
											by PEOPLEJOB
										</a>

										<span class="f1-s-3 m-rl-3">
											-
										</span>

										<span class="f1-s-3">
											2019-08-03
										</span>
									</div>

									<p class="f1-s-1 cl6 p-b-24">
										올 상반기 채용많은 직무, '영업/고객상담 - 경영.사무'순
									</p>

									<a href="<c:url value='/references/news_detail.do'/>" class="f1-s-1 cl9 hov-cl10 trans-03">
										Read More
										<i class="m-l-2 fa fa-long-arrow-alt-right"></i>
									</a>
								</div>
							</div>

							<!-- Item post -->
							<div class="flex-wr-sb-s p-t-40 p-b-15 how-bor2">
								<a href="blog-detail-02.html" class="size-w-8 wrap-pic-w hov1 trans-03 w-full-sr575 m-b-25">
									<img src="<c:url value='/resources/main/images/news7.jpg'/>" alt="뉴스이미지1">
								</a>

								<div class="size-w-9 w-full-sr575 m-b-25">
									<h5 class="p-b-12">
										<a href="<c:url value='/references/news_detail.do'/>" class="f1-l-1 cl2 hov-cl10 trans-03 respon2">
											직장인 2명중 1명 "자기개발 한다" 
										</a>
									</h5>

									<div class="cl8 p-b-18">
										<a href="#" class="f1-s-4 cl8 hov-cl10 trans-03">
											by PEOPLEJOB
										</a>

										<span class="f1-s-3 m-rl-3">
											-
										</span>

										<span class="f1-s-3">
											2019-07-01
										</span>
									</div>

									<p class="f1-s-1 cl6 p-b-24">
										자기개발 분야 1위, 20대는 '직무자격증' vs 30~40대는 '영어'
									</p>

									<a href="<c:url value='/references/news_detail.do'/>" class="f1-s-1 cl9 hov-cl10 trans-03">
										Read More
										<i class="m-l-2 fa fa-long-arrow-alt-right"></i>
									</a>
								</div>
							</div>

							<!-- Item post -->
							<div class="flex-wr-sb-s p-t-40 p-b-15 how-bor2">
								<a href="<c:url value='/references/news_detail.do'/>" class="size-w-8 wrap-pic-w hov1 trans-03 w-full-sr575 m-b-25">
									<img src="<c:url value='/resources/main/images/news4.jpg'/>" alt="IMG">
								</a>

								<div class="size-w-9 w-full-sr575 m-b-25">
									<h5 class="p-b-12">
										<a href="<c:url value='/references/news_detail.do'/>" class="f1-l-1 cl2 hov-cl10 trans-03 respon2">
											하반기 대기업 신입공채 언제 시작될까?
										</a>
									</h5>

									<div class="cl8 p-b-18">
										<a href="#" class="f1-s-4 cl8 hov-cl10 trans-03">
											by John Alvarado
										</a>

										<span class="f1-s-3 m-rl-3">
											-
										</span>

										<span class="f1-s-3">
											Feb 18
										</span>
									</div>

									<p class="f1-s-1 cl6 p-b-24">
										하반기 대기업 신입공채 51% '9월에 시작'
									</p>

									<a href="<c:url value='/references/news_detail.do'/>" class="f1-s-1 cl9 hov-cl10 trans-03">
										Read More
										<i class="m-l-2 fa fa-long-arrow-alt-right"></i>
									</a>
								</div>
							</div>

							<!-- Item post -->
							<div class="flex-wr-sb-s p-t-40 p-b-15 how-bor2">
								<a href="<c:url value='/references/news_detail.do'/>" class="size-w-8 wrap-pic-w hov1 trans-03 w-full-sr575 m-b-25">
									<img src="<c:url value='/resources/main/images/news8.jpg'/>" alt="IMG">
								</a>

								<div class="size-w-9 w-full-sr575 m-b-25">
									<h5 class="p-b-12">
										<a href="<c:url value='/references/news_detail.do'/>" class="f1-l-1 cl2 hov-cl10 trans-03 respon2">
											올해 상반기 직장인 10명중 3명 '이직'
										</a>
									</h5>

									<div class="cl8 p-b-18">
										<a href="#" class="f1-s-4 cl8 hov-cl10 trans-03">
											by PEOPLEJOB
										</a>

										<span class="f1-s-3 m-rl-3">
											-
										</span>

										<span class="f1-s-3">
											2019-06-15
										</span>
									</div>

									<p class="f1-s-1 cl6 p-b-24">
									이직한 직장인 연봉, '평균 310만원 올랐다'
									</p>

									<a href="<c:url value='/references/news_detail.do'/>" class="f1-s-1 cl9 hov-cl10 trans-03">
										Read More
										<i class="m-l-2 fa fa-long-arrow-alt-right"></i>
									</a>
								</div>
							</div>

							<!-- Item post -->
							<div class="flex-wr-sb-s p-t-40 p-b-15 how-bor2">
								<a href="blog-detail-02.html" class="size-w-8 wrap-pic-w hov1 trans-03 w-full-sr575 m-b-25">
									<img src="<c:url value='/resources/main/images/news9.jpg'/>" alt="IMG">
								</a>

								<div class="size-w-9 w-full-sr575 m-b-25">
									<h5 class="p-b-12">
										<a href="blog-detail-02.html" class="f1-l-1 cl2 hov-cl10 trans-03 respon2">
											취준생 취업 선호 게임회사 1위 '넥슨'
										</a>
									</h5>

									<div class="cl8 p-b-18">
										<a href="#" class="f1-s-4 cl8 hov-cl10 trans-03">
											by PEOPLEJOB
										</a>

										<span class="f1-s-3 m-rl-3">
											-
										</span>

										<span class="f1-s-3">
											2019-05-27
										</span>
									</div>

									<p class="f1-s-1 cl6 p-b-24">
									게임회사 취업 선호도 TOP 3, 넥슨, 카카오 게임즈, 넷마블
									</p>

									<a href="blog-detail-02.html" class="f1-s-1 cl9 hov-cl10 trans-03">
										Read More
										<i class="m-l-2 fa fa-long-arrow-alt-right"></i>
									</a>
								</div>
							</div>

							
						</div>

						<a href="#" class="flex-c-c size-a-13 bo-all-1 bocl11 f1-m-6 cl6 hov-btn1 trans-03">
							Load More
						</a>
					</div>
				</div>

				
				</div> 
			</div>
		</div>
	</section>

	

	<!-- Back to top -->
	<div class="btn-back-to-top" id="myBtn">
		<span class="symbol-btn-back-to-top">
			<span class="fas fa-angle-up"></span>
		</span>
	</div>


<!--===============================================================================================-->	
	<script src="<c:url value='/resources/main/vendor/jquery/jquery-3.2.1.min.js'/>"></script>
<!--===============================================================================================-->
	<script src="<c:url value='/resources/main/vendor/animsition/js/animsition.min.js'/>"></script>
<!--===============================================================================================-->
	<script src="<c:url value='/resources/main/vendor/bootstrap/js/popper.js'/>"></script>
	<script src="<c:url value='/resources/main/vendor/bootstrap/js/bootstrap.min.js'/>"></script>
<!--===============================================================================================-->
	<script src="<c:url value='/resources/main/js/main.js'/>"></script>
<%@include file="../main/inc/bottom.jsp" %>
