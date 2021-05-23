<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>비밀번호수정</title>
</head>
<body>
	<style>
    div#updatePassword-container table {
        margin:0 auto;
        border-spacing: 13px;
    }
    div#updatePassword-container table tr:last-of-type td {
        text-align:center;
    }
    </style>

    <div id="updatePassword-container">
		<form name="updatePwdFrm" action="<%=request.getContextPath()%>/updatePasswordEnd" method="post" >
			<table>
				<tr>
					<th>현재 비밀번호</th>
					<td><input type="password" name="password" id="password" required></td>
				</tr>
				<tr>
					<th>변경할 비밀번호</th>
					<td>
						<input type="password" name="password_new" id="password_new" required>
					</td>
				</tr>
				<tr>
					<th>비밀번호 확인</th>
					<td>	
						<input type="password" id="password_chk" required><br>
					</td>
				</tr>
				<tr>
					<td colspan="2">
						<input type="submit" value="변경" />&nbsp;
						<input type="button" value="닫기" onclick="window.close();"/>						
					</td>
				</tr>
			</table>
			<input type="hidden" name="userId" value="<%=request.getParameter("userId") %>">
		</form>
	</div>
	
	<script>
		const pwck=document.getElementById("password_chk")
		pwck.addEventListener("blur",(e)=>{
			let pw=document.getElementById("password_new").value;
			let pwckVal=e.target.value;
			if(pw!=pwckVal){
				alert("비밀번호가 일치하지않습니다.");
				document.getElementById("password_new").focus();
			}
		});
				
	</script>
	
	
	
	
</body>
</html>