<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.List,
com.board.model.vo.Board,
com.love.model.vo.Love" %>

 
<% 
	Board b=(Board)request.getAttribute("board");
	
	Member m = (Member)session.getAttribute("loginMember");
	
	List<Love> loveList = (List<Love>) request.getAttribute("loveList");
	int check = 0;
	for (Love lo : loveList) {
		if (lo.getUserId().equals(m.getUserId()) && lo.getBoardNumber()==b.getBoardNumber()) {
			check = 1;
		}
	}
%>    
<%@ include file="../common/header.jsp"%>
<style>
    section#notice-container{width:600px; margin:0 auto; text-align:center;}
    section#notice-container h2{margin:10px 0;}
    table#tbl-notice{width:500px; margin:0 auto; border:1px solid black; border-collapse:collapse; clear:both; }
    table#tbl-notice th {width: 125px; border:1px solid; padding: 5px 0; text-align:center;} 
    table#tbl-notice td {border:1px solid; padding: 5px 0 5px 10px; text-align:left;}
    
    /* 하트 모양 style*/
    [id="isLike"] {
  		position: absolute;
  		left: -100vw;
	}

	[for="isLike"] {
  		color: #aab8c2;
  		cursor: pointer;
  		font-size: 6em;
  		align-self: center;  
  		transition: color 0.2s ease-in-out;
	}

	[for="isLike"]:hover {
	  color: grey;
	}
	
	[for="isLike"]::selection {
	  color: none;
	  background: transparent;
	}
	
	[for="isLike"]::moz-selection {
	  color: none;
	  background: transparent;
	}
	
	[id="isLike"]:checked + label {
	  color: #e2264d;
	  will-change: font-size;
	  animation: heart 1s cubic-bezier(.17, .89, .32, 1.49);
	}
	
</style>
<div id="notice-container">
	<h2>상품 상세보기</h2>
		<%if(loginMember!=null && (loginMember.getUserId().equals("admin") || loginMember.getUserId().equals(b.getBoardWriter()))) { 
        	if (loginMember.getUserId().equals(b.getBoardWriter())) { %>
        		<input type="button" value="수정하기" onclick="location.assign('<%=request.getContextPath() %>/board/boardUpdate?cPage=<%=request.getAttribute("cPage")%>&no=<%=b.getBoardNumber()%>')">
                <input type="button" value="판매완료" onclick="fn_sell_product();">
            <%} %>
            <input type="button" value="삭제하기" onclick="fn_delete_product();">
        <%} %>
        <div>
        	<%if(b.getBoardReFilePath()!=null) {%>
           			<a href=""><img src="<%=request.getContextPath()%>/upload/board/<%=b.getBoardReFilePath()%>" width="200px"></a>
           	<%} %>
        </div>
        <div>
        	<a>상품명: <%=b.getBoardTitle() %></a><br>
        	<br>
        	<a>가격: <%=b.getBoardPrice() %>원</a><br>
        	<br>
        	<a>수량: <%=b.getBoardAmount() %>개</a><br>
        	<br>
        	<a>
			<%if(b.getBoardIsSell() == 1) { %>
        		판매중
        	<%} else {%>
        		판매완료
        	<%} %>
			</a><br>
        	<br>
        	<a>내용: <%=b.getBoardContent() %></a><br>
        	<br>
        	<p>
        	<%if(b.getBoardIsNego() == 1) { %>
        		가격 협의 가능
        	<%} else {%>
        		가격 협의 불가능
        	<%} %>
        	</p>
        	<p>
        	<%if (check == 1) { %>   	
        		<input id="isLike" type="checkbox" checked onclick="location.assign('<%=request.getContextPath() %>/love/loveClick?cPage=<%=request.getAttribute("cPage")%>&no=<%=b.getBoardNumber()%>')"><label for="isLike">❤</label>
        	<%} else {%>
        		<input id="isLike" type="checkbox" onclick="location.assign('<%=request.getContextPath() %>/love/loveClick?cPage=<%=request.getAttribute("cPage")%>&no=<%=b.getBoardNumber()%>')"><label for="isLike">❤</label>
        	<%} %>
        	</p>
        </div>
        <input type="button" value="상품 목록" onclick="location.assign('<%=request.getContextPath() %>/board/boardPage?cPage=<%=request.getAttribute("cPage")%>')">
        
        
</div>
<script>
	const fn_sell_product=()=>{
		if(confirm("판매 완료 처리하시겠습니까?")){
			//판매완료 진행
			location.replace("<%=request.getContextPath() %>/board/boardSell?cPage=<%=request.getAttribute("cPage")%>&no=<%=b.getBoardNumber()%>");
		}
	}
	const fn_delete_product=()=>{
		if(confirm("글을 삭제하시겠습니까?")){
			//글 삭제 진행
			location.replace("<%=request.getContextPath() %>/board/boardDelete?cPage=<%=request.getAttribute("cPage")%>&no=<%=b.getBoardNumber()%>");
		}
	}
</script>

<%@ include file="../common/footer.jsp"%>