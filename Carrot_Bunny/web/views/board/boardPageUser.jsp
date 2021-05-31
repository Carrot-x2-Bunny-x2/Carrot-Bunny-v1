<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ page import="java.util.List,com.board.model.vo.Board"%>
<%
List<Board> list = (List<Board>) request.getAttribute("list");

int selling = 0;
int sold = 0;
for (Board b : list) {
	if (b.getBoardIsSell() == 1) {
		selling += 1;
	} else {
		sold += 1;
	}
}
%>

<%@ include file="../common/header.jsp"%>
<style>


.wrapper {
	height : auto;
	min-height:70%;
	padding-bottom:60px;
}


section#notice-container {
	width: 600px;
	margin: 0 auto;
	margin-bottom:20px;
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
<div class="wrapper">
	<section id="notice-container">
		<h2>나의 판매상품</h2>
		<input type="button" value="글쓰기" id="btn-add"
			onclick="fn_noticeWrite();">
		<p>
			판매중
			<%=selling %>
			/ 판매완료
			<%=sold %></p>
		<table id="tbl-notice">
			<tr>
				<th>판매여부</th>
				<th>상품명</th>
				<th>수량</th>
				<th>상품가격</th>
			</tr>
			<%
			if (list.isEmpty()) {
			%>
			<tr>
				<td colspan="5">조회된 등록상품이 없습니다.</td>
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
				<td><a
					href="<%=request.getContextPath()%>/board/boardView?user=<%=request.getAttribute("user")%>&cPage=<%=request.getAttribute("cPage")%>&no=<%=b.getBoardNumber()%>">
						<%=b.getBoardTitle()%>
				</a></td>
				<td><%=b.getBoardAmount() %></td>
				<td><%=b.getBoardPrice() %></td>
			</tr>
			<%} 
				}	
			} %>
		</table>
		<div id="pageBar" align="center" style="margin-top: 10px;">
			<%=request.getAttribute("pageBar")%>
		</div>
	</section>
</div>
<script>
		const fn_noticeWrite=()=>{
			location.assign("<%=request.getContextPath()%>/board/boardWrite");			
		}
</script>

<%@ include file="../common/footer.jsp"%>