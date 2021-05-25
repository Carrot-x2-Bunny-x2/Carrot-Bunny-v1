package com.board.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.board.model.service.BoardService;
import com.board.model.vo.Board;
import com.member.model.vo.Member;

/**
 * Servlet implementation class BoardPageLikeServlet
 */
@WebServlet("/board/boardPageLove")
public class BoardPageLoveServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public BoardPageLoveServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		int cPage;
		int numPerPage;
		try {
			cPage=Integer.parseInt(request.getParameter("cPage"));
		}catch(NumberFormatException e) {
			cPage=1;
		}
		try {
			numPerPage=Integer.parseInt(request.getParameter("numPerPage"));
		}catch(NumberFormatException e) {
			numPerPage=10;
		}
		HttpSession session = request.getSession(false);
		Member loginMember = (Member)session.getAttribute("loginMember");
		
		List<Board> list=new BoardService().selectAliveBoardList(cPage,numPerPage);
		
		
		//board 에서 B_LIKE에 있는 문자열을 리스트로 저장한 후
		//다시 리스트에서 loginMember의 id가 있는 것을 찾는다. 이때 count도 계산한다.
		//해당 board를 새로운 resultBoardList에 add한다.
		int totalData = 0;
		List<Board> resultList = new ArrayList<Board>(); //빈깡통 
		String[] like; //빈리스트 
		for (Board b : list) { //삭제안된 리스트중에서 for문을 돌린다. 
			if (b.getBoardLike() != null) { //좋아요 목록이 있으면 
				like = b.getBoardLike().split(","); //split해서 들고와 like에 저장해준다. 
			} else {
				like = new String[0]; //아무것도 없으면 0 
			}
			for (String str : like) { //like안에 내 이름이 있는지 찾아야함. 
				if (str.equals(loginMember.getUserId())) { 
					totalData += 1; //찾으면 totaldata 하나씩 올린다. 
					resultList.add(b); //list에 저장 
				}
			}
		}
		request.setAttribute("list", resultList); //result에 저장한걸 넘겨준다. 
		
		int totalPage=(int)Math.ceil((double)totalData/numPerPage);
		
		int pageBarSize=10;
		int pageNo=((cPage-1)/pageBarSize)*pageBarSize+1;
		int pageEnd=pageNo+pageBarSize-1;
		String pageBar="";
		
		if(pageNo==1) {
			pageBar="<span>[이전]</span>";
		}else {
			pageBar="<a href='"+request.getContextPath()
			+"/board/boardPage?cPage="+(pageNo-1)+"'>[이전]</a>";
		}
	
		while(!(pageNo>pageEnd||pageNo>totalPage)) {
			if(pageNo==cPage) {
				pageBar+="<span>"+pageNo+"</span>";
			}else {
				pageBar+="<a href='"+request.getContextPath()
				+"/board/boardPage?cPage="+pageNo+"'>"+pageNo+"</a>";
			}
			pageNo++;
		}
		
		if(pageNo>totalPage) {
			pageBar+="<span>[다음]</span>";
		}
		else {
			pageBar+="<a href='"+request.getContextPath()
			+"/board/boardPage?cPage="+pageNo+"'>[다음]</a>";
		}
		request.setAttribute("pageBar",pageBar);
		request.getRequestDispatcher("/views/board/boardPageLike.jsp")
		.forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
