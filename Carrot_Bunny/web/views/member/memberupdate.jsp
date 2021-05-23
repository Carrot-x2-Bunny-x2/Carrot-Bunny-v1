<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/views/common/header.jsp"%>
<%@ page import="com.member.model.vo.Member"%>
<!--멤버 가져오기-->

<style>

/* myinfo */
.myinfo-container {
	display: flex;
	justify-content: center;
	/* 	align-items: center; */
	min-height: 500px;
}

.myicon {
	display: center;
	height: 100px;
	width: 100px;
	margin-bottom: 0px;
	font-size: 12px;
}

.myinfo {
	text-align: center;
	height: 50px;
	font-size: 22px;
	font-weight: bolder;
}

.myinfotitle p{
	text-align: center;
	font-size: 12px;
	font-weight: lighter;
	margin: 5px 0 0 0;
	padding: 0;
}

</style>

<div class="myinfo-container">
	<div class="myinfo">
		<!-- 메인 코멘트 영역 -->
		<div class="myinfotitle">
			나의 정보
			<p>나의 정보를 확인해보세요</p>
		</div>

		<div>
			<img class="myicon"
				src="<%=request.getContextPath()%>/images/loginicon.png"></img>
			<p colspan="2" style="display: center; font-size: 12px;"><%=loginMember.getUserName()%> 님</p>
		</div>
		
		<form id="memberFrm" class="memberFrm"
		onsubmit="return fn_update_validate();"
		method="post">
			<table>
				<tr>
					<th>아이디</th>
					<td><input type="text" name="userId" id="userId_" placeholder="<%=loginMember.getUserId()%>"
						value="<%=loginMember.getUserId()%>" readonly></td>
				</tr>
				<tr>
					<th>이름</th>
					<td><input type="text"  name="userName" id="userName" placeholder="<%=loginMember.getUserName()%>"
					value="<%=loginMember.getUserName()%>" required><br>
					</td>
				</tr>
				<tr>
					<th>이메일</th>
					<td><input type="email" placeholder="<%=loginMember.getEmail()%>" name="email" id="email" value="<%=loginMember.getEmail()%>"><br>
					</td>
				</tr>
				<tr>
					<th>휴대폰</th>
					<td><input type="tel" placeholder="<%=loginMember.getPhone()%>"
						name="phone" id="phone" maxlength="11" value="<%=loginMember.getPhone() %>"><br></td>
				</tr>
			</table>
			<input type="button" value="정보수정" onclick="fn_update_member();"/>
			<button type="button" onclick="fn_password_update();">비밀번호변경</button>
			<input type="button" value="탈퇴" onclick="fn_delete_member();"/>
		</form>
		
	</div>
</div>

	<script>
		const fn_password_update=()=>{
			const url="<%=request.getContextPath()%>/updatePassword?userId=<%=loginMember.getUserId()%>";
			const status="left=500px,top=200px,width=400px,height=210px";
			open(url,"_blank",status);
		}
	
	
	
		const fn_delete_member=()=>{
			if(confirm("정말로 탈퇴하시겠습니까?")){
				//탈퇴로직 진행
				location.replace("<%=request.getContextPath()%>/deleteMember?userId=<%=loginMember.getUserId()%>");
				//location.replace("/06_HelloMVC/deleteMember?userId="+'user04')
			}
		}
	
	
	
		const fn_update_member=()=>{
			const frm=$("#memberFrm");
			console.log(frm);
			//form태그에 action속성이 설정되어있지 않아 설정하고 submit함수 호출하면 됨.
			//동적으로 form으로 전송되는 servlet을 변경할 수 있다. -> 동적요청
			frm.attr("action","<%=request.getContextPath()%>/memberupdateend.do");
			frm.submit();
		}
		const fn_update_validate=()=>{
			
			
			
			return true;
		}
		$("#password_2").blur((e)=>{
			const pw=$("#password_").val();
			const pwck=$(e.target).val();
			if(pw!=pwck){
				alert("비밀번호가 일치하지 않습니다.");
				$("#password_").focus();
			}
		});	
		
	</script>
	






<%@ include file="../common/footer.jsp"%>