<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.board.model.vo.Board" %>

 
<% 
	Board b=(Board)request.getAttribute("board");
	HttpSession sess = (HttpSession)request.getSession();
	
	Member m = (Member)sess.getAttribute("loginMember");
%>    
<%@ include file="../common/header.jsp"%>
<style>
    section#notice-container{width:600px; margin:0 auto; text-align:center;}
    section#notice-container h2{margin:10px 0;}
    table#tbl-notice{width:500px; margin:0 auto; border:1px solid black; border-collapse:collapse; clear:both; }
    table#tbl-notice th {width: 125px; border:1px solid; padding: 5px 0; text-align:center;} 
    table#tbl-notice td {border:1px solid; padding: 5px 0 5px 10px; text-align:left;}
</style>
<div id="notice-container">
	<h2>상품 상세보기</h2>
        <div>
        	<p>이미지 오는 곳</p>
        	<%if(b.getBoardFilePath()!=null) {%>
           			<a href="<%=request.getContextPath()%>/board/fileDownload?fname=<%=b.getBoardFilePath()%>"><img src="<%=request.getContextPath()%>/images/file.png" width="16px"></a>
           	<%} %>
        </div>
        <div>
        	<a>상품명: <%=b.getBoardTitle() %></a><br>
        	<br>
        	<a>가격: <%=b.getBoardPrice() %>원</a><br>
        	<br>
        	<a>수량: <%=b.getBoardAmount() %>개</a><br>
        	<br>
        	<a>
			<%if(b.getBoardIsSell() == 1) { %>
        		판매중
        	<%} else {%>
        		판매완료
        	<%} %>
			</a><br>
        	<br>
        	<a>내용: <%=b.getBoardContent() %></a><br>
        	<br>
        	<p>
        	<%if(b.getBoardIsNego() == 1) { %>
        		<input id="isNego" type="checkbox" checked>가격 협의 가능
        	<%} else {%>
        		<input id="isNego" type="checkbox">가격 협의 가능
        	<%} %>
        	</p>        	
        	<p><input id="isLike" type="checkbox" <%=b.getBoardLike().contains(m.getUserId())?"checked":"" %>>찜	</p>
        </div>
        
        <%if(loginMember!=null && loginMember.getUserId().equals("admin")){ %>
        	<input type="button" value="수정하기" onclick="location.assign('<%=request.getContextPath() %>/board/boardUpdate?no=<%=b.getBoardNumber()%>')">
            <input type="button" value="삭제하기" onclick="">
        <%} %>
</div>


<%@ include file="../common/footer.jsp"%>