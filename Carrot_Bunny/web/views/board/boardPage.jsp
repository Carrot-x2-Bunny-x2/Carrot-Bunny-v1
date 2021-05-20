<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ page import="java.util.List,com.board.model.vo.Board"%>
<%
List<Board> list = (List<Board>) request.getAttribute("list");
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
	width: 100%;
	margin: 0 auto;
	border: 1px solid black;
	border-collapse: collapse;
}

table#tbl-notice th, table#tbl-notice td {
	border: 1px solid;
	padding: 5px 0;
	text-align: center;
}

input#btn-add {
	float: right;
	margin: 0 0 15px;
}

table#tbl-notice {
	width: 100%;
	margin: 0 auto;
	border: 1px solid black;
	border-collapse: collapse;
	clear: both;
}
</style>
<section id="notice-container">
	<h2>상품 게시판</h2>
	<input type="button" value="글쓰기" id="btn-add"
		onclick="fn_noticeWrite();">
	<table id="tbl-notice">
		<tr>

			<th>번호</th>
			<th>제목</th>
			<th>작성자</th>
			<th>첨부파일</th>
			<th>작성일</th>
		</tr>
		<%-- <%
		if (list.isEmpty()) {
		%> --%>
			<tr>
				<td colspan="5">조회된 공지사항이 없습니다.</td>
			</tr>
		<%-- <%
		} else {
			for (Board b : list) {
		%>
			<tr>
				<td><%=b.getBoardNumber()%></td>
				<td>
					<a href="<%=request.getContextPath()%>/board/boardView?boardNo=<%=b.getBoardNumber()%>">
					<%=b.getBoardTitle()%>
					</a>
				</td>
				<td><%=b.getBoardWriter()%></td>
				<td>
					<%if (b.getBoardFilePath() != null) {%> 
						<img src="<%=request.getContextPath()%>/images/file.png"
						width="16px" height="16px"> 
					<%} else { %> 
						첨부파일없음
					<%} %>
				</td>
				<td><%=b.getBoardDate()%></td>
			</tr>
		<%	}	
		} %> --%>
	</table>
	<div id="pageBar">
		<%=request.getAttribute("pageBar")%>
	</div>
</section>
<%@ include file="../common/footer.jsp"%>