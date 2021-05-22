<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import ="java.util.List,com.notice.model.vo.Notice" %>
<% 
	Notice n=(Notice)request.getAttribute("notice");
%>   
<%@ include file="../common/header.jsp"%>

<style>
#wrap {
    width: 100%;
    min-height: 700px;
    /* position: relative; */
   
} 
.notice .noticeList {
	width: 81%;
	height: 80%;
	margin: auto;
	min-height : 900px;
}

.noticetitle {
	text-align: center;
	height: 50px;
	font-size: 22px;
	font-weight: bolder;
}

.noticetitle p {
	text-align: center;
	font-size: 12px;
	font-weight: lighter;
	margin: 5px 0 0 0;
	padding: 0;
}

.noticetb {	
    width: 100%;
    margin-top:20px;
    line-height: 35px;
    text-align: center;
    font-size: 13px;
	border: 1px solid lightgray;
	border-collapse: collapse;
	background-color: white;
	border-radius: 5px;
}

.noticetb th, td {
	border-bottom: 1px solid lightgray;
}

.noticewrite {
	margin-top : 10px;
	float : right;
}


</style>
<div id="wrap">
	
	<div class="noticewrite">
		<!-- 공지사항 제일 윗 부분 -->
		<div class="nwtitle">
			공지사항 등록
			<p>회원에게 보여줄 공지를 등록해주세요!</p>
		</div>
		<div class="nwwrite" style="padding-top:30px; margin-left:70px; background-color:#E0E0E0;  width: 950px; height:400px; "  >
			<form action="<%=request.getContextPath()%>/notice/noticeWriteEnd" method="post">
			<table>
				<tr>
				<th>제목</th>
				<td><%=n.getNoticeTitle()%></td>
				</tr>
				<tr>
				<th>내용</th>
				<td><%=n.getNoticeContent()%></td>
				</tr>
			</table>
			
		</div>
		
	</div>
		<div style="text-align:center; padding-bottom: 40px; padding-top:10px;">
		<input type="submit" value="수정" style="width: 100px; height :50px; ">
		<input type="submit" value="삭제" style="width: 100px; height :50px; ">
		<input type="button" value="목록"  style="width: 100px; height :50px; "
		onclick="location.assign('<%=request.getContextPath()%>/noticePage')">
		</div>
	</form>
	
</div>
<%@ include file="../common/footer.jsp"%>