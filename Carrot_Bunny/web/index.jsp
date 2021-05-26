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

.products{
	display: flex;

}

.products > li {
	flex : 1;
	background : white;
	margin-top : 49px;
	height : 200px;
	margin-right : 20px;
	padding-left : 0px;
}

.products > li:not(:last-child){
	margin-right : 20px;
	
}


</style>
<section id="content" style="min-height: 400px;">

	<div class="mainproduct">
		<h1>판매상품</h1>
		<p>당근당근바니바니 판매상품을 확인해주세요.</p>
		
		<ul class="products">
			<li></li>
			<li></li>
			<li></li>
		</ul>
	</div>
	
	
	
	
	<div class="maincontainer">
		<h1>
			당근당근 바니바니 공사중입니다.<br> 공사야 끝나라~~!!!
		</h1>
		<a href="<%=request.getContextPath()%>/board/boardPage">임시 상품등록게시판</a>

	</div>



</section>

<%@ include file="views/common/footer.jsp"%>