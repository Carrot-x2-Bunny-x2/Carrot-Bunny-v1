<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.List"%>
<%
	List<Member> list=(List<Member>)request.getAttribute("list");
%>
<%@ include file="/views/common/header.jsp"%>
<style>
#tbl-member {
	width: 100%;
	min-height: 700px;
	/* position: relative; */
}
.members .memberlist {
	width: 81%;
	height: 80%;
	margin: auto;
	min-height : 900px;
}

.membertitle{
	text-align: center;
	height: 50px;
	font-size: 22px;
	font-weight: bolder;
}

.membertitle p{
	text-align: center;
	font-size: 12px;
	font-weight: lighter;
	margin: 5px 0 0 0;
	padding: 0;
}

.membertb {	
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
</style>

<div id="tbl-member">

	<div class="members">
		<div class="membertitle">
			회원조회
			<p>당근당근바니바니를 이용하는 회원들을 관리 해주세요!</p>
		</div>
	
	<!-- 회원 리스트 -->
	<div class="memberlist">
	<table class="membertb">
		<thead>
			<tr>
				<th>아이디</th>
				<th>이름</th>
			</tr>
		</thead>
		<tbody>
			<%if(list.isEmpty()){%>
			<tr>
				<td colspan="2" align="center">검색결과가 없습니다.</td>
			</tr>
			<%}else{ %>
			<%for(Member m : list){ %>
			<tr>
				<td><%=m.getUserId() %></td>
				<td><%=m.getUserName() %></td>
			</tr>
			<%}
		}%>
		</tbody>

</table>
</div>
<div id="pageBar" style="margin-right:20px;"><%=request.getAttribute("pageBar") %>
</div>
</div>
<%@ include file="/views/common/footer.jsp"%>