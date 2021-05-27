<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/views/common/header.jsp"%>
<%@ page import="com.member.model.vo.Member" %> <!--멤버 가져오기-->

<style>

/* myinfo */

.myinfo-container {
	display: flex;
	justify-content: center;
/* 	align-items: center; */
	min-height: 500px;
}
.myicon {
	display : center;
	height : 100px;
	width : 100px;
	margin-bottom : 0px;
	font-size : 12px;
}

.myinfo {
	text-align: center;
	height: 50px;
	font-size: 22px;
	font-weight: bolder;
}

.myinfotitle p {
	text-align: center;
	font-size: 12px;
	font-weight: lighter;
	margin: 5px 0 0 0;
	padding: 0;
}

/* admin */
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


</style>
	<%if(loginMember!=null){%>
	<div>
	<%if(loginMember.getUserId().equals("admin")) {%>

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
				onclick="location.assign('<%=request.getContextPath()%>/memberList')">
			</td>
			<td><input type="button" value="게시물 관리" style="width :200px; height: 100px;"
				onclick="location.assign('<%=request.getContextPath()%>/boardListPage')">
			</td>
			<tr>
			<td><input type="button" value="공지사항 관리" style="width :200px; height: 100px;"
				onclick="location.assign('<%=request.getContextPath()%>/noticePage')">
			</td>
			<td><input type="button" value="1:1 문의관리" style="width :200px; height: 100px;"
				onclick="location.assign('<%=request.getContextPath()%>/qna.do')">
			</td>
			</tr>
		</tr>
	</table>
</div>
<%}else{%>
</div>
		<div class="myinfo-container">	
		<div class="myinfo">
		<!-- 메인 코멘트 영역 -->
		<div class="myinfotitle">
			나의 정보
			<p>나의 정보를 확인해보세요</p>
		</div>
		
		<div>
			<img class="myicon"
			src="<%=request.getContextPath()%>/images/loginicon.png" ></img>
			<p colspan="2" style="display:center;font-size : 12px;"><%=loginMember.getUserName() %></p>
		</div>
		<table>
		<tr >
			<td><input type="button" value="회원 정보 수정 및 탈퇴" style="width :200px; height: 100px;"
				onclick="location.assign('<%=request.getContextPath()%>/memberUpdate.do')">
			</td>
			<td><input type="button" value="판매상품 조회‧삭제‧수정" style="width :200px; height: 100px;"
				onclick="location.assign('<%=request.getContextPath()%>/board/boardPageUser')">
			</td>
			<tr>
			<td><input type="button" value="관심목록 조회" style="width :200px; height: 100px;"
				onclick="location.assign('<%=request.getContextPath()%>/love/lovePage')">
			</td>
			<td><input type="button" value="나의 1:1 문의내역 조회" style="width :200px; height: 100px;"
				onclick="location.assign('<%=request.getContextPath()%>/qna.do')">
			</td>
			</tr>
		</tr>
	</table>
</div>

</div>
<%} %>
</div>
<%} %>
<%@ include file="../common/footer.jsp"%>