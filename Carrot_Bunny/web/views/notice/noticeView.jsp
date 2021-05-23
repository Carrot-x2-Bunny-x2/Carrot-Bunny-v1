<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.List,com.notice.model.vo.Notice"%>
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
	min-height: 900px;
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

.notice {
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

.noticetb th, td {
	border-bottom: 1px solid lightgray;
}

.noticetb {
	margin-top: 10px;
	float: right;
}
</style>
<div id="wrap">

	<div class="notice">
		<!-- 공지사항 제일 윗 부분 -->
		<div class="noticetitle">
			공지사항 상세화면
			<p>공지사항을 꼼꼼하게 읽어주세요!</p>
		</div>
		<div class="noticewrite"
			style="padding-top: 30px; margin-left: 70px; background-color: #E0E0E0; width: 950px; height: 400px;">
			<input type="hidden" name="noticeNo" value="<%=n.getNoticeNo()%>">
			<table class="">
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
	<%if(loginMember!=null&&loginMember.getUserId().equals("admin")){ %>
	<div
		style="text-align: center; padding-bottom: 40px; padding-top: 10px;">
		
		<input type="submit" value="수정" style="width: 100px; height: 50px;" 
		onclick="location.assign('<%=request.getContextPath()%>/notice/noticeUpdate?no=<%=n.getNoticeNo()%>')">
		<input type="submit" value="삭제" style="width: 100px; height: 50px;"
		onclick="fn_delete_notice();">
		<input type="button" value="목록" style="width: 100px; height: 50px;"
			onclick="location.assign('<%=request.getContextPath()%>/noticePage')">
		<%} else{%>
		<input type="button" value="목록" style="width: 100px; height: 50px;"
			onclick="location.assign('<%=request.getContextPath()%>/noticePage')">
		<%} %>
	</div>
	
	<script>
	
	const fn_delete_notice=()=>{
		if(confirm("정말로 삭제하시겠습니까?")){
			location.replace("<%=request.getContextPath()%>/deleteNotice?no="+'<%=n.getNoticeNo()%>');
		}
	}
	</script>


</div>
<%@ include file="../common/footer.jsp"%>