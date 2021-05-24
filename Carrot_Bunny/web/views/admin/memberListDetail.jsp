<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.List"%>
<%
  Member m = (Member)request.getAttribute("member");
%>
<%@ include file="/views/common/header.jsp"%>
<style>
#tbl-member {
	width: 90%;
	min-height: 300px;
	/* position: relative; */
}

.members .memberlist {
	width: 81%;
	height: 80%;
	margin: auto;
	min-height: 500px;
}

.membertitle {
	text-align: center;
	height: 50px;
	font-size: 22px;
	font-weight: bolder;
}

.membertb p {
	text-align: center;
	font-size: 12px;
	font-weight: lighter;
	margin: 5px 0 0 0;
	padding: 0;
}

.membertb {
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
</style>

<div id="tbl-member">

	<div class="members">
		<div class="membertitle">회원상세</div>

		<!-- 회원 리스트 -->
		<div class="memberlist">
			<table class="membertb">
				<p align="center">관리자는 비매너 회원, 부적절한 게시물을 올린 회원을 삭제 할 수 있습니다.</p>
				<thead>
					<tr>
						<th>회원번호</th>
						<th>이름</th>
						<th>핸드폰번호</th>
						<th>가입일자</th>
					</tr>
				</thead>
				<tbody>
					<%
					if (m == null) {
					%>
					<tr>
						<td colspan="4" align="center">검색결과가 없습니다.</td>
					</tr>
					<%
					} else {
					%>
					<tr>
						<td><%=m.getmemberNum()%></td>
						<td><%=m.getUserName()%></td>
						<td><%=m.getPhone()%></td>
						<td><%=m.getenrollDate()%></td>
					</tr>
					<%}%>

				</tbody>
			</table>
		</div>
	</div>
</div>

<%@ include file="/views/common/footer.jsp"%>