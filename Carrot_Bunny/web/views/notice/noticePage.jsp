<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../common/header.jsp"%>

<style>
#wrap {
    width: 100%;
    min-height: 700px;
    /* position: relative; */
   
} 
.notice .noticeList {
	width: 81%;
	height: 80%;
	margin: auto;
	min-height : 900px;
}

.noticetitle {
	text-align: center;
	height: 50px;
	font-size: 22px;
	font-weight: bolder;
}

.noticetitle p {
	text-align: center;
	font-size: 12px;
	font-weight: lighter;
	margin: 5px 0 0 0;
	padding: 0;
}

.noticetb {	
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

.noticetb th, td {
	border-bottom: 1px solid lightgray;
}

.noticewrite {
	margin-top : 10px;
	float : right;
}


</style>
<div id="wrap">
	
	<div class="notice">
		<!-- 메인 코멘트 영역 -->
		<div class="noticetitle">
			공지사항
			<p>당근당근바니바니를 이용하기 전 꼭 읽어주세요!</p>
		</div>

	<div class="noticeList">
		<table class="noticetb">
			<tr>
				<th>제목</th>
				<th>작성일자</th>
			</tr>
		</table>
		<input class="noticewrite" type="button" value="공지사항 등록"
		onclick="location.assign('<%=request.getContextPath()%>/noticewrite')">

</div>
<%@ include file="../common/footer.jsp"%>