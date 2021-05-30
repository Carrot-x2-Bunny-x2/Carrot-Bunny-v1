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

p#heart {
	margin: 0 auto;
	font-size: 100px;
}
</style>

<div class="wrapper">
	<section id="notice-container">
		<h2>나의 관심목록</h2>
		<p id="heart">❤</p>
		<table id="tbl-notice">
			<tr>
				<th>판매여부</th>
				<th>상품명</th>
			</tr>
			<%
			if (list.isEmpty()) {
			%>
				<tr>
					<td colspan="5">조회된 관심목록이 없습니다.</td>
				</tr>
			<%
			} else {
				for (Board b : list) {
					if (b.getBoardIsDelete() == 0) {
			%>
						<tr>
							<%if (b.getBoardIsSell() == 1) { %>
								<td>판매중</td>
							<%} else { %>
								<td>판매완료</td>
							<%} %>
							<td>
								<a href="<%=request.getContextPath()%>/board/boardView?no=<%=b.getBoardNumber()%>">
								<%=b.getBoardTitle()%>
								</a>
							</td>
						</tr>
				<%} 
				}	
			} %>
		</table>
		<div id="pageBar">
			<%=request.getAttribute("pageBar")%>
		</div>
	</section>
</div>
	
<%@ include file="../common/footer.jsp"%>