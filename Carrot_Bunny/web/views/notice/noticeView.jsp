<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.List,com.notice.model.vo.Notice"%>
<%
Notice n = (Notice) request.getAttribute("notice");
%>
<%@ include file="../common/header.jsp"%>

<style>
#wrap {
	width: 100%;
	min-height: 900px;
	/* position: relative; */
}

.notice .noticeList {
	width: 100%;
	height: 100%;
	margin: auto;
	min-height: 900px;
}

.noticetitle {
	text-align: center;
	height: 50px;
	font-size: 22px;
	font-weight: bolder;
	padding-bottom: 80px;
}

.noticetitle p {
	text-align: center;
	font-size: 12px;
	font-weight: lighter;
	margin: 15px 0 0 0;
	padding: 0;
}

.notice {
	/* 	width: 100%;
	margin-top: 20px;
	line-height: 35px;
	text-align: center; font-size : 13px;
	border: 1px solid lightgray;
	border-collapse: collapse;
	background-color: white;
	border-radius: 5px;
	font-size: 13px; */
	
}

.noticetb th, td {
	border-bottom: 1px solid lightgray;
}

.noticetb {
	margin-top: 20px;
	float: right;
}

input {
	width: 100px;
	height: 50px;
	border-radius: 10px;
	background-color: #ff9800;
	border: none;
	color: white;
}

.buttonbtn {
	padding-bottom: 20px;
	padding-top: 50px;
	display: flex;
	margin-left: 631px;
	
}

.btn1 {
	margin-right: 10px;
}

.btn2 {
	margin-right: 10px;
}

.btn3 {
	margin-right: 10px;
}

.noticewrite {
	text-align: center;
	font-size: 12px;
	font-weight: lighter;
	margin: 5px 0 0 0;
	padding: 0;
}

.noticewrite {
	margin-left: 410px;
	margin-top:30px;
}

.noticewrite tr{

font-size:13px;

}

.memberbtn{
	padding-bottom: 20px;
	padding-top: 50px;
	display: flex;
	margin-left: 740px;

}
</style>
<div id="wrap">

	<div class="notice">
		<!-- 공지사항 제일 윗 부분 -->
		<div class="noticetitle">
			공지사항 상세화면
			<p>공지사항을 꼼꼼하게 읽어주세요!</p>
		</div>



		<div class="noticewrite">

			<table>
				<tr>
					<th style="padding-right : 15px;  ">제목</th>
					<td
						style="width: 500px; height: 30px; margin-left: 15px; border-radius: 10px; margin-top: 10px; font-size:14px;"><%=n.getNoticeTitle()%></td>
				</tr>
				<tr>

					<th style="padding-right : 15px;">내용</th>
					<td
						style="width: 700px; height: 320px; margin-left: 15px; border-radius: 10px; margin-top: 20px; font-size:14px;"><%=n.getNoticeContent()%></td>
				</tr>
			</table>
		</div>

	</div>
	<%
	if (loginMember != null && loginMember.getUserId().equals("admin")) {
	%>

	<div class="buttonbtn">

		<input class="btn1" type="submit" value="수정"
			onclick="location.assign('<%=request.getContextPath()%>/notice/noticeUpdate?no=<%=n.getNoticeNo()%>')">
		<form action="<%=request.getContextPath()%>/deleteNotice?no="
			+'<%=n.getNoticeNo()%>" method="get">
			<input type="hidden" name="noticeNo" value="<%=n.getNoticeNo()%>">
			<input class="btn2" type="button" value="삭제"
				onclick="fn_delete_notice();">
		</form>
		<input class="btn3" type="button" value="목록"
			onclick="location.assign('<%=request.getContextPath()%>/noticePage')">

	</div>
	<%
	} else {
	%>
	<div class="memberbtn">
		<input class="btn4" type="button" value="목록"
			onclick="location.assign('<%=request.getContextPath()%>/noticePage')">
		<%
		}
		%>
	</div>


</div>



<script>
	
	const fn_delete_notice=()=>{
		if(confirm("정말로 삭제하시겠습니까?")){
			location.replace("<%=request.getContextPath()%>/deleteNotice?noticeNo="+'<%=n.getNoticeNo()%>');
		}
	}
	</script>

</div>
<%@ include file="../common/footer.jsp"%>