<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import ="java.util.List,com.qna.model.vo.Qna" %>
<%
	Qna q =(Qna)request.getAttribute("qna");
%>
<%@ include file="../common/header.jsp"%>

<style>
section#notice-container{width:600px; margin:0 auto; text-align:center;}
    section#notice-container h2{margin:10px 0;}
    table#tbl-notice{width:500px; margin:0 auto; border:1px solid black; border-collapse:collapse; clear:both; }
    table#tbl-notice th {width: 125px; border:1px solid; padding: 5px 0; text-align:center;} 
    table#tbl-notice td {border:1px solid; padding: 5px 0 5px 10px; text-align:left;}
</style><div id="notice-container">
	<h2>1:1 문의 상세화면</h2>
        <table id="tbl-notice">
        <tr>
            <th>제 목</th>
            <td><%=q.getQnaTitle() %></td>
        </tr>
        <tr>
            <th>작성자</th>
            <td><%=q.getQnaWriter()%></td>
        </tr>
        <tr>
            <th>작성 날짜</th>
            <td><%=q.getQnaDate() %></td>
        </tr>
        <%if(loginMember!=null&&loginMember.getUserId().equals("admin")){ %>
        <tr>
            <th colspan="2">
                <input type="button" value="수정하기" onclick="location.assign('<%=request.getContextPath() %>/notice/noticeUpdate?no=<%=q.getQnaNo()%>')">
                <input type="button" value="삭제하기" onclick="">
            </th>
        </tr>
        <%} %>
    </table>
    </div>
	

<%@ include file="../common/footer.jsp"%>