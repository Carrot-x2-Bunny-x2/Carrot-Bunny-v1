<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.board.model.vo.Board" %>
<% 
	Board b=(Board)request.getAttribute("board");
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
	<h2>상품 게시판 목록</h2>
        <table id="tbl-notice">
        <tr>
            <th>제 목</th>
            <td><%=b.getBoardTitle() %></td>
        </tr>
        <tr>
            <th>작성자</th>
            <td><%=b.getBoardWriter() %></td>
        </tr>
        <tr>
            <th>첨부파일</th>
            <td>
           		<%if(b.getBoardFilePath()!=null) {%>
           			<a href="<%=request.getContextPath()%>/board/fileDownload?fname=<%=b.getBoardFilePath()%>"><img src="<%=request.getContextPath()%>/images/file.png" width="16px"></a>
           		<%} %>
            </td>
        </tr>
        <tr>
            <th>내 용</th>
            <td><%=b.getBoardContent() %></td>
        </tr>
        <%if(loginMember!=null && loginMember.getUserId().equals("admin")){ %>
        <tr>
            <th colspan="2">
                <input type="button" value="수정하기" onclick="location.assign('<%=request.getContextPath() %>/board/boardUpdate?no=<%=b.getBoardNumber()%>')">
                <input type="button" value="삭제하기" onclick="">
            </th>
        </tr>
        <%} %>
    </table>
    </div>


<%@ include file="../common/footer.jsp"%>