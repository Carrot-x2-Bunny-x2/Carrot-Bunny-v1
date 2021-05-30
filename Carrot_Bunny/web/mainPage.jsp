<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	
<%@ page import="java.util.List,com.board.model.vo.Board"%>
<%
List<Board> list = (List<Board>) request.getAttribute("list");
%>	
	
<%@ include file="views/common/header.jsp"%>
<style>
.maincontainer {
	text-align: center;
	margin: 200px;
}

.mainproduct {
	width: 100%;
	height: 400px;
	margin-bottom: 50px;
	background: #f1f2f3;
}

.mainproduct>h1 {
	padding-top: 40px;
	text-align: center;
    margin-bottom:10px;
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

.adbox {
	width: 100%;
    height: 250px;
    margin-top: 3%;
    background: #f1f2f3;
}

.adbox>h1 {
	padding-top: 20px;
	text-align: center;
	font-size: 1.5em;
	margin-block-start: 0.83em;
    margin-block-end: 0.83em;
    margin-bottom:5px;
}

</style>

<div class="wrapper">
<section id="content" style="min-height: 400px;">

	<div class="mainproduct">
		<h1>Now Selling</h1>
		<p>당근당근바니바니 판매상품을 확인해주세요.</p>
		<div class="main">
			<div class="slider slider-nav">
			<%
			if (list.isEmpty()) {
			%>
				<tr>
					<td colspan="5">조회된 상품이 없습니다.</td>
				</tr>
				<%} else {
				
				for (Board b : list) {
					if (b.getBoardIsDelete() == 0) {
						%>
				<div class="ex">
						<h3>
							<a href="<%=request.getContextPath()%>/board/boardView?cPage=<%=request.getAttribute("cPage")%>&no=<%=b.getBoardNumber()%>">
							<img class="new"
								src="<%=request.getContextPath()%>/upload/board/<%=b.getBoardReFilePath()%>" /></a>
						</h3>
						</div>
					<%}%>
				<%}%>
				<%} %>
			</div>
		</div>
	</div>

</section>
		<%if (loginMember == null) {%>
			<input type="hidden" id="loginCheck"></input>
		<%} else {%>
			<input type="hidden" id="loginCheck" value="1">
		<%}%>
		
		
	<div class="adbox">	
		<h1>Ad</h1>
		<p>당근당근바니바니가 추천하는 상품들</p>
		<div class="ad">
			<table>
				<tr>
					<td>
					<p>AESOP</p><br>
					<a href="https://www.aesop.com/kr/"><img class="" src="" /></a>
					</td>
					<td>
					<p>디지털 가전 광고</p><br>
					<a href=""><img class="" src="" /></a>
					</td>
					<td>
					<p>패션 광고</p><br>
					<a href=""><img class="" src="" /></a></td>
				</tr>
			</table>
		</div>
	</div>
		
</div>

<script>

	$(".ex").click(function() { 
		var bNum = document.getElementById("bNum").value;
		var log = document.getElementById("loginCheck").value;
		
		if(!log){
			alert("로그인 후 확인 가능합니다.");
			location.href="<%=request.getContextPath()%>/views/login/loginPage.jsp"; 
		}else {
			location.href="<%=request.getContextPath()%>/board/boardView?cPage=<%=request.getAttribute("cPage")%>&no=" + bNum; 
		}
	} );

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