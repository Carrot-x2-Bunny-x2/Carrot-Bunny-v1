<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../common/header.jsp"%>
<%@ page import="com.member.model.vo.Member" %> <!--멤버 가져오기-->
<style>
.login-container {
	display: flex;
	justify-content: center;
	align-items: center;
	min-height: 400px;
	margin-bottom: 30px;
	
}

.id-form {
	align-items: center;
	padding: 10px;
	font-size: 13px;
}

.pw-form {
	align-items: center;
	padding: 10px;
	font-size: 13px;
}

.login-page-logo {
	width: 30px;
	height: 30px;
}

h4 {
	margin: 0 auto;
}

.find-login {
	text-decoration: none;
	color: #646464;
	font-size: 12px;
}

h5 {
	margin: 0 auto;
	font-size: 10px;
	padding-top: 0;
}

.logintitle {
	text-align: center;
	height: 50px;
	font-size: 22px;
	font-weight: bolder;
	margin-bottom: 20px;
}

.logintitle p {
	text-align: center;
	font-size: 12px;
	font-weight: lighter;
	margin: 5px 0 0 0;
	padding: 0;
}

</style>

<div class="login-container">

	<%if(loginMember==null){ %>
	<form id="loginForm" action="<%=request.getContextPath() %>/login"
		method="post" onsubmit="return fn_login_validate();">
		<table>
			<div class="logintitle">
				로그인
				<p>로그인을 해주세요 뿌잉뿌잉~</p>
			</div>

			<tr>
				<td class="id-form">
					<h4>
						아이디
						<%-- <img class="login-page-logo" src="<%=request.getContextPath()%>/images/loginicon.png";></img>  --%>
						<input type="text" name="userId" placeholder="User Email"
							style="width: 150px; height: 30px; margin-left: 12px;">
					</h4>
				</td>
				<td></td>
			</tr>

			<tr>

				<td class="pw-form">
					<h4>
						비밀번호
						<%-- <img class="login-page-logo" src="<%=request.getContextPath()%>/images/key.png";></img>  --%>
						<input type="password" name="password" placeholder="Password"
							style="width: 150px; height: 30px;">
					</h4>
				</td>
				<td></td>
			</tr>
			<tr>
				<td colspan="2" >
				<input type="submit" value="로그인" style="width: 100px; height: 30px; margin-top:10px;"> 
				<input type="button" value="회원가입" onclick="location.replace('<%=request.getContextPath()%>/memberenroll.do')" style="width: 100px; height: 30px; margin-top:10px; ">
				</td>
			</tr>
		</table>
		<a href="javascript:alert('준비중입니다.ㅠ 보채지마세요.ㅜㅠ 관리자 홍서연 01053033196으로 연락주시면 알려드려요');" onfocus="this.blur()" class="find-login">아이디/비밀번호 찾기</a>
		<h5>*찾기 어려우실 경우 고객센터에 문의주세요.</h5>
	</form>
	<%} else{%>
	 	<!-- 분기처리 -->
		 	<% request.setAttribute("loc", "/views/myinfo/myinfo.jsp");%>
			<% 	RequestDispatcher rd=request.getRequestDispatcher("/views/common/loginmsg.jsp");%>
				<% rd.forward(request, response);%>
	<%} %>
</div>
</div>
<%@ include file="../common/footer.jsp"%>