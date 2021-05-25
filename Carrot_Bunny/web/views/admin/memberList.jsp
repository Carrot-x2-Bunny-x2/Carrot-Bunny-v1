<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.List"%>
<%
List<Member> list = (List<Member>) request.getAttribute("list");
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

.membertitle p {
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
div#search-container{margin:0 0 10px 0; padding : 3px; text-align:center;}

</style>

<div id="tbl-member">

	<div class="members">
		<div class="membertitle">
			회원조회
			<p>당근당근바니바니를 이용하는 회원들을 관리 해주세요!</p>
		</div>
		<div id = "search-container">
			검색타입 : <select id="searchType">
				<option value="userId">아이디</option>
				<option value="userName">회원이름</option>
			</select>
			<div id ="search-userId">
				<form action ="">
					<input type="hidden" name="searchType" value="userId">
					<input type="text" name="searchKeyword" size="20" placeholder="검색할 아이디를 입력하세요" value="">
					<button type="submit">검색</button>
				</form>
			</div>
			<div id ="search-userName">
				<form action="">
					<input type="hidden" name="searchType" value="userName">
					<input type="text" name="searchKeyword" size="20" placeholder="검색할 이름을 입력하세요" value="">
					<button type="submit">검색</button>
				</form>
			</div>
		</div>

		<!-- 회원 리스트 -->
		<div class="memberlist">
			<table class="membertb">
				<thead>
					<tr>
						<th>회원번호</th>
						<th>아이디</th>
						<th>이름</th>
					</tr>
				</thead>
				<tbody>
					<%
					if (list.isEmpty()) {
					%>
					<tr>
						<td colspan="3" align="center">검색결과가 없습니다.</td>
					</tr>
					<%
					} else {
					%>
					<%
					for (Member m : list) {
					%>
					<tr>
						<td><%=m.getmemberNum()%></td>
						<td><a
							href="<%=request.getContextPath()%>/memberlistDetail?memberNum=<%=m.getmemberNum()%>"><%=m.getUserId()%>
						</a></td>
						<td><%=m.getUserName()%></td>
					</tr>
					<%
					}
					}
					%>
				</tbody>

			</table>

			<div id="pageBar" style="text-align: center; margin-top: 20px;">
				<%=request.getAttribute("pageBar")%>
			</div>
		</div>
	</div>
</div>

<%@ include file="/views/common/footer.jsp"%>