package com.love.controller;

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
import com.love.model.service.LoveService;
import com.love.model.vo.Love;
import com.member.model.vo.Member;

/**
 * Servlet implementation class BoardPageLikeServlet
 */
@WebServlet("/love/lovePage")
public class LovePageServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public LovePageServlet() {
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
		
		List<Love> loveList=new LoveService().selectUserLoveList(cPage,numPerPage,loginMember);
		List<Board> boardList = new ArrayList<>();
		int totalData = 0;
		if (loveList != null) {
			for (Love lo : loveList) {
				Board b = new BoardService().selectBoard(lo.getBoardNumber());
				boardList.add(b);
				totalData += 1;
			}
		} else {
			boardList = null;
		}
		
		
		
		request.setAttribute("list", boardList); 
		
		int totalPage=(int)Math.ceil((double)totalData/numPerPage);
		
		int pageBarSize=5;
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
		request.getRequestDispatcher("/views/love/lovePage.jsp")
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
