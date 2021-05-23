<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="com.notice.model.vo.Notice"%>
<%
Notice n = (Notice) request.getAttribute("notice");
%>
<%@ include file="../common/header.jsp"%>

<style>
section#notice-container {
	width: 600px;
	margin: 0 auto;
	text-align: center;
}

section#notice-container h2 {
	margin: 10px 0;
}

table#tbl-notice {
	width: 500px;
	margin: 0 auto;
	border: 1px solid black;
	border-collapse: collapse;
	clear: both;
}

table#tbl-notice th {
	width: 125px;
	border: 1px solid;
	padding: 5px 0;
	text-align: center;
}

table#tbl-notice td {
	border: 1px solid;
	padding: 5px 0 5px 10px;
	text-align: left;
}
span#fname{
	position:absolute;
	left:80px;
	top:9px;
	width:290px;
	background-color:#F5F5F5;
}
</style>

<div id="notice-container">
	<form action="<%=request.getContextPath()%>/notice/noticeUpdateEnd" method="post" >
		<!-- update문에는 noticeno가 필요하다 -->
		<input type="hidden" name="noticeNo" value="<%=n.getNoticeNo()%>">
		<table id="tbl-notice">
			<tr>
				<th>제 목</th>
				<td><input type="text" name="n_title" id="noticeTitle"
					value ="<%=n.getNoticeTitle()%>" required></td>
			</tr>
			<tr>
				<th>내 용</th>
				<td><textarea rows="5" cols="50" name="n_content"><%=n.getNoticeContent()%></textarea></td>
			</tr>
			<tr>
				<th colspan="2"><input type="submit" value="등록하기" onclick="">
				</th>
			</tr>
		</table>
	</form>
</div>



	<%@ include file="../common/footer.jsp"%>