<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../common/header.jsp"%>

<style>
/*공지사항 기본 style*/

#wrap {
    width: 100%;
} 

.noticewrite {
	width: 81%;
	height: 80%;
	margin: auto;
	min-height : 400px;
}

.nwtitle {
	text-align: center;
	height: 50px;
	font-size: 22px;
	font-weight: bolder;
	padding-bottom:20px;
}

.nwtitle p {
	text-align: center;
	font-size: 12px;
	font-weight: lighter;
	margin: 5px 0 0 0;
	padding: 0;
	

/*공지사항 등록 폼 스타일 */



</style>

<script>
</script>
<div id="wrap">
	
	<div class="noticewrite">
		<!-- 공지사항 제일 윗 부분 -->
		<div class="nwtitle">
			공지사항 등록
			<p>회원에게 보여줄 공지를 등록해주세요!</p>
		</div>
		<div class="nwwrite" style="padding-top:30px; margin-left:70px; background-color:#E0E0E0;  width: 950px; height:400px; "  >
			<form action="<%=request.getContextPath()%>/notice/noticeWriteEnd" method="post">
			<table>
				<tr>
				<th>제목</th>
				<td>
				<input type="text" name="n_title"  placeholder="제목을 입력해주세요"
							style="width: 250px; height: 30px; margin-left: 12px; ">
				</td>
				</tr>
				<tr>
				<th>내용</th>
				<td>
				<textarea type="text" name="n_content" placeholder="내용을 입력해주세요."
							style="width: 850px; height: 320px; margin-left: 12px;"></textarea>
				</td>
				</tr>
			</table>
			
		</div>
		
	</div>
		<div style="text-align:center; padding-bottom: 40px; padding-top:10px;">
		<input type="submit" value="등록" style="width: 100px; height :50px; ">
		<input type="button" value="목록"  style="width: 100px; height :50px; "
		onclick="location.assign('<%=request.getContextPath()%>/noticePage')">
		</div>
	</form>
	
</div>




<%@ include file="../common/footer.jsp"%>