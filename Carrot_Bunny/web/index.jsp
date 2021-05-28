<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="views/common/header.jsp"%>
<style>
.maincontainer {
	text-align: center;
	margin: 200px;
}

.mainproduct {
	width: 100%;
	height: 400px;
	margin-top: 3%;
	margin-bottom: 100px;
	background: #f1f2f3;
}

.mainproduct>h1 {
	padding-top: 40px;
	text-align: center;
}

p {
	text-align: center;
	font-size: 12px;
	font-weight: lighter;
	margin: 5px 0 0 0;
}

.products {
	display: flex;
}

.products>li {
	flex: 1;
	background: white;
	margin-top: 49px;
	height: 200px;
	margin-right: 20px;
	padding-left: 0px;
}

.products>li:not(:last-child) {
	margin-right: 20px;
}

/* 메인 이미지 슬라이드  */
.main {
  font-family:Arial;
  height: 72%;
  width: 65%;
  display:block;
  margin:0 auto;
  background: #f1f2f3;
}

.slick-slider {
    margin-bottom: 30px;
    height: 85%;
}

h3 {
    background: #fff;
    color: #3498db;
    font-size: 36px;
    line-height: 100px;
    margin: 10px;
    padding: 2%;
    position: relative;
    text-align: center;
    height: 100%;
}
.action{
  display:block;
  margin:100px auto;
  width:100%;
  text-align:center;
}
.action a {
  display:inline-block;
  padding:5px 10px; 
  background:#f30;
  color:#fff;
  text-decoration:none;
}
.action a:hover{
  background:#000;
}

.slick-next:before, .slick-prev:before {
	color : black;
}

.slick-track {
	height : 100%
}

.slick-list {
    height: 100%;
    overflow: hidden;
    margin: 0;
    padding: 0;
}

</style>

<div class="wrapper">
<section id="content" style="min-height: 400px;">

	<div class="mainproduct">
		<h1>Now Selling</h1>
		<p>당근당근바니바니 판매상품을 확인해주세요.</p>
		
		<div class="main">
			<div class="slider slider-nav">
				<div>
					<h3>서</h3>
				</div>
				<div>
					<h3>연</h3>
				</div>
				<div>
					<h3>아</h3>
				</div>
				<div>
					<h3>응</h3>
				</div>
				<div>
					<h3>원</h3>
				</div>
				<div>
					<h3>해</h3>
				</div>
				<div>
					<h3>♥</h3>
				</div>
			</div>
		</div>
	</div>


	<%-- <div class="maincontainer">
		<h1>
			당근당근 바니바니 공사중입니다.<br> 공사야 끝나라~~!!!
		</h1>
		<a href="<%=request.getContextPath()%>/board/boardPage">임시 상품등록게시판</a>

	</div> --%>

</section>

</div>

<script>
	$('.slider-for').slick({
	   slidesToShow: 1,
	   slidesToScroll: 1,
	   arrows: false,
	   fade: true,
	   asNavFor: '.slider-nav'
	 });
	 $('.slider-nav').slick({
	   slidesToShow: 3,
	   slidesToScroll: 1,
	   asNavFor: '.slider-for',
	   dots: true,
	   focusOnSelect: true
	 });

	 $('a[data-slide]').click(function(e) {
	   e.preventDefault();
	   var slideno = $(this).data('slide');
	   $('.slider-nav').slick('slickGoTo', slideno - 1);
	 });
</script>



<%@ include file="views/common/footer.jsp"%>