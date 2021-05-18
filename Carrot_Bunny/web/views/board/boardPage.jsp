<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../common/header.jsp"%>

<style>
#wrap {
    width: 100%;
    min-height: 700px;
    /* position: relative; */
   
} 
.board .board-list {
	width: 81%;
	height: 80%;
	margin: auto;
	min-height : 900px;
}

.board-title {
	text-align: center;
	height: 50px;
	font-size: 22px;
	font-weight: bolder;
}

.board-title p {
	text-align: center;
	font-size: 12px;
	font-weight: lighter;
	margin: 5px 0 0 0;
	padding: 0;
}

.board-table {	
    width: 100%;
    margin-top:20px;
    line-height: 35px;
    text-align: center;
    font-size: 13px;
	border: 1px solid lightgray;
	border-collapse: collapse;
	background-color: white;
	border-radius: 5px;
}

.board-table th, td {
	border-bottom: 1px solid lightgray;
}

.board-write {
	margin-top : 10px;
	float : right;
}


</style>
<div id="wrap">
	
	<div class="board">
		<!-- 메인 코멘트 영역 -->
		<div class="board-title">
			공지사항
			<p>당근당근바니바니를 이용하기 전 꼭 읽어주세요!</p>
		</div>

	<div class="board-list">
		<table class="board-table">
			<tr>
				<th>제목</th>
				<th>작성일자</th>
			</tr>
		</table>
		<input class="board-write" type="button" value="상품 등록"
		onclick="location.assign('<%=request.getContextPath()%>/boardWrite')">

</div>
<%@ include file="../common/footer.jsp"%>