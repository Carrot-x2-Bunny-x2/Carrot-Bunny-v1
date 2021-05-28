<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.List,com.board.model.vo.Board"%>
<%
List<Board> list = (List<Board>) request.getAttribute("list");

String searchType = request.getParameter("searchType") == null ? "" : request.getParameter("searchType");
String keyword = request.getParameter("searchKeyword") == null ? "" : request.getParameter("searchKeyword");
/* out.print(searchType + " : " + keyword); */
%>
<%@ include file="/views/common/header.jsp"%>
<style>
#tbl-board {
	width: 90%;
	min-height: 300px;
	/* position: relative; */
}

.boardlist .aliveboardlist {
	width: 81%;
	height: 80%;
	margin: auto;
	min-height: 500px;
}

.boardtitle {
	text-align: center;
	height: 50px;
	font-size: 22px;
	font-weight: bolder;
}

.boardtitle p {
	text-align: center;
	font-size: 12px;
	font-weight: lighter;
	margin: 5px 0 0 0;
	padding: 0;
}

.boardtb {
	width: 100%;
	margin-top: 20px;
	line-height: 35px;
	text-align: center;
	font-size: 13px;
	border: 1px solid lightgray;
	border-collapse: collapse;
	background-color: white;
	border-radius: 5px;
}

div#search-container {
	margin: 0 0 10px 0;
	padding: 3px;
	text-align: center;
}

div#search-boardNameSell {
	display: inline-block;
}

div#search-boardNamesold {
	display: none;
}

div#numPerpage-container {
	float: left;
	margin-left : 50px;
}

form#numperPageFrm {
	display: inline;
}

div#pageBar>* {
	margin-right: 20px;
	text-decoration: none;
}
</style>
<section id="tbl-board">

	<div class="boardlist">
		<div class="boardtitle">
			게시글 조회
			<p>당근당근바니바니를 이용하는 회원들의 게시물 관리 해주세요!</p>
		</div>
		<div id="search-container">
			판매여부 :<form id="numPerFrm" action="">
				<select name="numPerpage" id="numPerpage">
					<option value="10"
						<%=request.getParameter("numPerpage")!=null&&request.getParameter("numPerpage").equals("10")?"selected":"" %>>판매중/판매완료</option>
					<option value="5"
						<%=request.getParameter("numPerpage")==null||request.getParameter("numPerpage").equals("5")?"selected":"" %>>판매중</option>
					<option value="3"
						<%=request.getParameter("numPerpage")!=null&&request.getParameter("numPerpage").equals("3")?"selected":"" %>>판매완료</option>
				</select>
			</form>
			<div id="search-boardName">
				<form action="<%=request.getContextPath()%>/searchBoardList">
					<input type="hidden" name="searchType" value="B_TITLE"> <input
						type="text" name="searchKeyword" size="25"
						placeholder="검색할 상품이름을 입력하세요"
						value='<%=searchType.equals("boardTitle")?keyword:"" %>'>
					<button type="submit">검색</button>
				</form>
			</div>
		</div>
		<div class="aliveboardlist">
			<table class="boardtb">
				<thead>
					<tr>
						<th>판매여부</th>
						<th>제목</th>
						<th>작성자</th>
						<th>작성일</th>
					</tr>
				</thead>
				<tbody>
					<%
					if (list.isEmpty()) {
					%>
					<tr>
						<td colspan="4" align="center">검색결과가 없습니다.</td>
					</tr>
					<%
					} else {
					%>
					<%
					for (Board b : list) {
					%>
					<tr>
						<%
						if (b.getBoardIsSell() == 1) {
						%>
						<td>판매중</td>
						<%
						} else {
						%>
						<td>판매완료</td>
						<%
						}
						%>
						<td><%=b.getBoardTitle()%></td>
						<td><%=b.getBoardWriter()%></td>
						<td><%=b.getBoardDate()%></td>
					</tr>
					<%
					}
					}
					%>
				</tbody>
			</table>

			<div id="pageBar" align="center" style="margin-top: 10px;">
				<%=request.getAttribute("pageBar")%>
				<!-- memberlistservlet에서 보낸 pagebar를 받아서 사용. -->
			</div>
		</div>
	</div>
</section>
<script>
	$("#searchType").change(e=>{
		location.assign('<%=request.getContextPath()%>/searchBoardList?searchType='+$(e.target).val());
	})
    	
</script>





<%@ include file="/views/common/footer.jsp"%>