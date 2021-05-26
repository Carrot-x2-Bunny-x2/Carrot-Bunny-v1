<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ page import="java.util.List,com.board.model.vo.Board"%>
<%
	List<Board> list = (List<Board>) request.getAttribute("list");

	String searchType=request.getParameter("searchType")==null?"":request.getParameter("searchType");
	String keyword=request.getParameter("searchKeyword")==null?"":request.getParameter("searchKeyword");
	out.print(searchType+" : "+keyword);%>

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
	<div id="search-container">
        	검색타입 : 
        	<select id="searchType">
        		<option value="userId" <%=searchType.equals("userId")?"selected":"" %>>아이디</option>
        		<option value="boardName" <%=searchType.equals("boardName")?"selected":"" %>>상품이름</option>
        	</select>
        	<div id="search-userId">
        		<form action="<%=request.getContextPath()%>/board/boardSearch">
        			<input type="hidden" name="searchType" value="B_WRITER" >
        			<input type="text" name="searchKeyword" size="25" 
        			placeholder="검색할 아이디를 입력하세요" value='<%=searchType.equals("userId")?keyword:"" %>'>
        			<button type="submit">검색</button>
        		</form>
        	</div>
        	<div id="search-boardName">
        		<form action="<%=request.getContextPath()%>/board/boardSearch">
        			<input type="hidden" name="searchType" value="B_TITLE">
        			<input type="text" name="searchKeyword" size="25" 
        			placeholder="검색할 상품이름을 입력하세요" value='<%=searchType.equals("boardTitle")?keyword:"" %>'>
        			<button type="submit">검색</button>
        		</form>
        	</div>
        </div>
	<input type="button" value="글쓰기" id="btn-add"
		onclick="fn_noticeWrite();">
	<table id="tbl-notice">
		<tr>

			<th>번호</th>
			<th>제목</th>
			<th>수량</th>
			<th>상품가격</th>
			<th>작성자</th>
			<th>작성일</th>
		</tr>
		<%
		if (list.isEmpty()) {
		%>
			<tr>
				<td colspan="5">조회된 공지사항이 없습니다.</td>
			</tr>
		<%
		} else {
			for (Board b : list) {
				if (b.getBoardIsDelete() == 0) {
		%>
					<tr>
						<td><%=b.getBoardNumber()%></td>
						<td>
							<a href="<%=request.getContextPath()%>/board/boardView?cPage=<%=request.getAttribute("cPage")%>&no=<%=b.getBoardNumber()%>">
							<%=b.getBoardTitle()%>
							</a>
						</td>
						<td><%=b.getBoardAmount() %></td>
						<td><%=b.getBoardPrice() %></td>
						<td><%=b.getBoardWriter()%></td>
						<td><%=b.getBoardDate()%></td>
					</tr>
			<%} 
			}	
		} %>
	</table>
	<div id="pageBar">
		<%=request.getAttribute("pageBar")%>
	</div>
</section>
<script>
		const fn_noticeWrite=()=>{
			location.assign("<%=request.getContextPath()%>/board/boardWrite");			
		}
		$("#searchType").change(e => {
    		const userId=$("#search-userId");
    		const boardName=$("#search-boardName");
    		const value=$(e.target).val();//userId OR userName OR gender
    		
    		userId.css("display","none");
    		boardName.css("display","none");
    		
    		$("#search-"+value).css("display","inline-block");
    		
    	});
    	$(function(){   		
    		$("#searchType").change();
    	})
    	
</script>
	
<%@ include file="../common/footer.jsp"%>