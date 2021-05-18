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
<div id="wrap">
	
	<div class="board-write">
		<!-- 공지사항 제일 윗 부분 -->
		<div class="board-title">
			상품 등록
			<p>상품을 등록해주세요!</p>
		</div>
		<div class="board-write" style="padding-top:30px; margin-left:70px; background-color:#E0E0E0;  width: 950px; height:400px; "  >
			<table>
				<tr>
				<td >제목
				<input type="text" name="nwtitle" placeholder="제목을 입력해주세요"
							style="width: 250px; height: 30px; margin-left: 12px; ">
				</td>
				</tr>
				<tr>
				<td>내용
				<input type="text" name="nwcontent" placeholder="내용을 입력해주세요."
							style="width: 850px; height: 300px; margin-left: 12px;">
				</td>
				</tr>
			</table>
		</div>
		
	</div>
		<div style="text-align:center; padding-bottom: 40px; padding-top:10px;">
		<input type="button" value="등록" style="width: 100px; height :50px; "
		onclick="location.assign('<%=request.getContextPath()%>/boardPage)">
		<input type="button" value="목록"  style="width: 100px; height :50px; "
		onclick="location.assign('<%=request.getContextPath()%>/boardPage')">
		</div>
	
	
</div>




<%@ include file="../common/footer.jsp"%>