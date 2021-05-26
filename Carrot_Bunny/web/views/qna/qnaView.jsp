<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.List,com.qna.model.vo.Qna"%>
<%
Qna q = (Qna) request.getAttribute("qna");
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

textarea {
	width : 88%;
	height : auto;
}

.noticetitle {
	text-align: center;
	height: 50px;
	font-size: 22px;
	font-weight: bolder;
}
</style>

<%
if (loginMember != null && loginMember.getUserId().equals("admin")) {
%>
<div id="notice-container">
	<div class="noticetitle">
	<p>1:1 문의 상세화면</p>
	</div>
	<form name="qnaUpdate" action="<%=request.getContextPath()%>/qna/qnaUpdate"
			method="post">
	<table id="tbl-notice">
		<tr>
			<th>제 목</th>
			<td><%=q.getQnaTitle()%></td>
		</tr>
		<tr>
			<th>작성자</th>
			<td><%=q.getQnaWriter()%></td>
		</tr>
		<tr>
			<th>작성 날짜</th>
			<td><%=q.getQnaDate()%></td>
		</tr>
		<tr>
			<th>문의 내용</th>
			<td><textarea readonly="readonly"><%=q.getQnaContent()%>></textarea></td>
		</tr>
		<tr>
			<th>답변 내용</th>
			<%
			if (q.getQnaAnswer() == null) {
			%>
			<td>
			<input type="hidden" name="qnaNo" value="<%=q.getQnaNo()%>">
			<textarea placeholder="문의에 대한 답변이 아직 등록되지 않았습니다." name="answer" id="answer"></textarea><br>
			<input type="submit" value="등록하기">
			</td>
			<%
			} else {
			%>
			<td><input type="hidden" name="qnaNo" value="<%=q.getQnaNo()%>">
			<textarea placeholder="<%=q.getQnaAnswer()%>" name="answer" id="answer"></textarea><br>
			<input type="submit" value="수정하기"></td>
			<%
			}
			%>
		</tr>
		<tr>
			<th colspan="2">
			<input type="button" value="삭제하기" onclick="location.assign('<%=request.getContextPath()%>/qna/qnaDelete?qnaNo=<%=q.getQnaNo()%>')">
			</th>
		</tr>
	</table>
	</form>
</div>
<%
} else {
%>
<div id="notice-container">
	<div class="noticetitle">
	<p>1:1 문의 상세화면</p>
	</div>
	<table id="tbl-notice">
		<tr>
			<th>제 목</th>
			<td><%=q.getQnaTitle()%></td>
		</tr>
		<tr>
			<th>작성 날짜</th>
			<td><%=q.getQnaDate()%></td>
		</tr>
		<tr>
			<th>문의 내용</th>
			<td><textarea readonly="readonly"><%=q.getQnaContent()%>></textarea></td>
		</tr>
		<tr>
			<%
			if (q.getQnaAnswer() == null) {
			%>
			<th colspan="2"><p style="color: blue;">문의에 대한 답변이 아직 등록되지 않았습니다.<p></th>
			<%
			} else {
			%>
			<th>답변 내용</th>
			<td>
			<textarea readonly="readonly"><%=q.getQnaAnswer()%></textarea>
			</td>
			<%
			}
			%>
		</tr>
	</table>
</div>
<%
}
%>


<%@ include file="../common/footer.jsp"%>