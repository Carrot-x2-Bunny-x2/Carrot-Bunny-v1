<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../common/header.jsp" %>
<style>
.admin-container {
	display: flex;
	justify-content: center;
/* 	align-items: center; */
	min-height: 500px;
}
.adminicon {
	display : center;
	height : 100px;
	width : 100px;
	margin-bottom : 0px;
	font-size : 12px;
}

.admininfo {
	text-align: center;
	height: 50px;
	font-size: 22px;
	font-weight: bolder;
}

.admintitle p {
	text-align: center;
	font-size: 12px;
	font-weight: lighter;
	margin: 5px 0 0 0;
	padding: 0;
}


</style>
<div class="admin-container">
	
		<div class="admininfo">
		<!-- 메인 코멘트 영역 -->
		<div class="admintitle">
			관리자 정보
			<p>회원관리 및 게시물 관리를 해보세요.</p>
		</div>
		
		<div>
			<img class="adminicon"
			src="<%=request.getContextPath()%>/images/loginicon.png" ></img>
			<p colspan="2" style="display:center;font-size : 12px;">관리자</p>
		</div>
		<table>
		<tr >
			<td><input type="button" value="회원 관리" style="width :200px; height: 100px;"
				onclick="location.assign('<%=request.getContextPath()%>/index.jsp')">
			</td>
			<td><input type="button" value="게시물 관리" style="width :200px; height: 100px;"
				onclick="location.assign('<%=request.getContextPath()%>/index.jsp')">
			</td>
			<tr>
			<td><input type="button" value="공지사항 관리" style="width :200px; height: 100px;"
				onclick="location.assign('<%=request.getContextPath()%>/noticePage')">
			</td>
			<td><input type="button" value="나의 1:1 문의관리" style="width :200px; height: 100px;"
				onclick="location.assign('<%=request.getContextPath()%>/index.jsp')">
			</td>
			</tr>
		</tr>
	</table>
</div>

</div>

<%@ include file="../common/footer.jsp"%>